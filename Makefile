
ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/")
TMP_CATALYST=tmp/catalyst
TMP_RELENG=tmp/releng
ETC_CATALYST=tmp/etc/catalyst
CATALYST_DOCKER_TAR=tmp/catalyst.tar
BUILDSTREAM_CACHE=$(HOME)/.cache/buildstream2
BUILDSTREAM_IMAGE=registry.gitlab.com/freedesktop-sdk/infrastructure/freedesktop-sdk-docker-images/bst2:c21575d6181701ab2d4e52edf166ea4c5874491f
BST=podman run --rm -i -t --privileged --device /dev/fuse --log-driver none --volume /etc/localtime:/etc/localtime --volume $(BUILDSTREAM_CACHE):/root/.cache/buildstream --volume $(HOME)/.config:/root/.config  --volume $(PWD):/src --workdir /src $(BUILDSTREAM_IMAGE) bst
CATALYST_IMAGE=github.com/cheese/catalyst:latest
CATALYST=sudo podman run --privileged -ti --volume /etc/localtime:/etc/localtime -v $(PWD)/$(ETC_CATALYST):/etc/catalyst -v $(PWD)/$(TMP_RELENG):/var/tmp/releng -v $(PWD)/specs:/var/tmp/specs -v $(PWD)/$(TMP_CATALYST):/var/tmp/catalyst -v $(PWD)/tmp/cache/distfiles:/var/cache/distfiles --rm $(CATALYST_IMAGE) catalyst
GENTOO_SQFS=tmp/catalyst/snapshots/gentoo-current.xz.sqfs

.PHONY: stage1
stage1: $(TMP_CATALYST)/builds/fsdk/stage1-amd64-systemd-mergedusr.tar.gz

$(TMP_CATALYST)/builds/fsdk/stage1-amd64-systemd-mergedusr.tar.gz:
	$(BST) build stage1-image.bst
	mkdir -p $(TMP_CATALYST)/builds/fsdk ||:
	$(BST) artifact checkout --integrate --compression gz --tar $(TMP_CATALYST)/builds/fsdk/stage1-amd64-systemd-mergedusr.tar.gz stage1-image.bst

$(TMP_CATALYST)/builds/mergedusr/stage1-amd64-systemd-mergedusr-stage2.tar.xz: $(TMP_CATALYST)/builds/fsdk/stage1-amd64-systemd-mergedusr.tar.gz $(CATALYST_DOCKER_TAR) $(GENTOO_SQFS) $(TMP_RELENG)/README.md $(ETC_CATALYST)/catalyst.conf
	$(CATALYST) -f /var/tmp/specs/amd64/nomultilib/stage1-systemd-mu.spec

.PHONY: stage2
stage2: $(TMP_CATALYST)/builds/mergedusr/stage1-amd64-systemd-mergedusr-stage2.tar.xz

#.PHONY: stage3
stage3: $(TMP_CATALYST)/builds/mergedusr/stage3-amd64-systemd-mergedusr-stage3.tar.xz

$(TMP_CATALYST)/builds/mergedusr/stage3-amd64-systemd-mergedusr-stage3.tar.xz: $(TMP_CATALYST)/builds/mergedusr/stage1-amd64-systemd-mergedusr-stage2.tar.xz
	$(CATALYST) -f /var/tmp/specs/amd64/nomultilib/stage3-systemd-mu.spec

$(TMP_RELENG)/README.md:
	git clone https://anongit.gentoo.org/git/proj/releng.git $(TMP_RELENG)

$(GENTOO_SQFS):
	mkdir -p tmp/catalyst/snapshots ||:
	curl -o $(GENTOO_SQFS) https://distfiles.gentoo.org/snapshots/squashfs/gentoo-current.xz.sqfs

$(ETC_CATALYST)/catalyst.conf: $(CATALYST_DOCKER_TAR)
	$(BST) artifact checkout --deps none --directory tmp/catalyst-code components/catalyst.bst
	mkdir -p $(ETC_CATALYST) ||:
	mv tmp/catalyst-code/etc/catalyst/* $(ETC_CATALYST)
	rm -fr tmp/catalyst-code

$(CATALYST_DOCKER_TAR):
	$(BST) build catalyst-docker.bst
	mkdir -p tmp ||:
	$(BST) artifact checkout --tar $(CATALYST_DOCKER_TAR)  catalyst-docker.bst
	sudo podman load -i $(CATALYST_DOCKER_TAR)
	mkdir -p tmp/cache/distfiles ||:
