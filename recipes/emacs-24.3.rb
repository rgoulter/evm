recipe 'emacs-24.3' do
  tar_gz 'http://ftpmirror.gnu.org/emacs/emacs-24.3.tar.gz'

  osx do
    option '--with-ns'
    option '--without-x'
    option '--without-dbus'
  end

  linux do
    option '--prefix', installation_path
  end

  install do
    configure
    make 'bootstrap'
    make 'install'

    osx do
      copy build_path.join('nextstep', 'Emacs.app'), installation_path
    end
  end
end