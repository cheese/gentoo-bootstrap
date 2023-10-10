kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p %{install-root}%{bindir}

    install -m 755 -D ac-wrapper.sh %{install-root}%{libdir}/misc/ac-wrapper.sh
    for x in auto{conf,header,m4te,reconf,scan,update} ifnames ; do
        ln -s ../%{lib}/misc/ac-wrapper.sh %{install-root}%{bindir}/$x
    done

    install -m 755 -D am-wrapper.sh %{install-root}%{libdir}/misc/am-wrapper.sh
    for x in automake aclocal ; do
        ln -s ../%{lib}/misc/am-wrapper.sh %{install-root}%{bindir}/$x
    done

sources:
- kind: git_repo
  url: github:gentoo/autotools-wrappers.git
  track: 'at-*'
  ref: at-20221207-0-gafe80def609c91d72df73837ce2c51fed8b69f28
