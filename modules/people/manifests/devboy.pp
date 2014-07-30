class people::devboy {
  # DEFAULTS:
  include fish
  include git
  include java
  include vagrant

  git::config::global { 'user.email':
    value  => 'dominic.graefen@gmail.com'
  }

  # RUBY:

  include ruby
  $GLOBAL_RUBY = "1.9.3-p448"
  class { 'ruby::global':
    version => $GLOBAL_RUBY
  }

  class inky {
    package { 'Inky':
      provider  => 'pkgdmg',
      source    => 'http://inky.com/mail/InkyInstall.dmg'
    }
  }

  package { 'tree':
    ensure => present
  }

  package { 'git-flow':
    ensure => present
  }

  package { 'watch':
    ensure => present
  }

  package { 'leiningen':
    ensure => present
  }

  package { 'scons':
    ensure => present
  }

  package { 'mackup':
    ensure => present
  }

  package { 'CocosBuilder2':
    provider => 'compressed_app',
    source   => "http://www.cocosbuilder.com/downloads/CocosBuilder-2.1.zip",
  }

  # PROJECTS:
  include projects::apportable_apportable
  include projects::wooga_apportable
  include projects::wooga_jelly_splash_droid
  include projects::wooga_jelly_splash_ios
  include projects::food_blog_ghost
  include projects::news_blog_ghost
  # include projects::wooga_entitas

  # APPS:

  include virtualbox
  include chrome
  include dropbox
  include iterm2::dev
  include vlc
  include onepassword
  include skype
  include spotify
  include atom
  include transmission
  include steam
  include charles
  include slate

  class { 'intellij':
    edition => 'ultimate',
    version => '13.1.4'
  }
  include appcode2

  # OSX:

  include osx::global::enable_keyboard_control_access
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::hide_indicator_lights
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::disable_app_quarantine

  class { 'osx::dock::icon_size':
    size => 36
  }

  boxen::osx_defaults { 'Revert back to normal scrolling':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.swipescrolldirection',
    value  => false,
    type   => boolean,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Disable menu bar transparency':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMenuBarTransparency',
    value  => false,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Show all file-extensions in finder':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowAllExtensions',
    value  => true,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Set a blazingly fast keyboard repeat rate':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => 0.01,
    type   => int,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Set a blazingly fast initial keyboard repeat rate':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'InitialKeyRepeat',
    value  => 10,
    type   => int,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Disable the warning when changing a file extenstion':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => false,
    type   => bool,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Enable function keys':
    ensure  => present,
    domain  => 'NSGlobalDomain',
    key     => 'com.apple.keyboard.fnState',
    value   => true,
    type    => boolean,
    user    => $::boxen_suer;
  }

}
