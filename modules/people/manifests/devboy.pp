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
  include projects::wooga_jellysplash
  include projects::wooga_entitas

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
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::hide_indicator_lights
  include osx::dock::dim_hidden_apps
  class { 'osx::dock::icon_size':
    size => 36
  }
  class { 'osx::dock::position':
    position => 'bottom'
  }

  include osx::finder::unhide_library
  include osx::finder::show_hidden_files

  include osx::global::enable_keyboard_control_access
  include osx::global::enable_standard_function_keys
  class { 'osx::global::key_repeat_rate':
    rate => 0.01
  }

  class { 'osx::global::key_repeat_delay':
    delay => 10
  }

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

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

  boxen::osx_defaults { 'Disable the warning when changing a file extenstion':
    ensure => present,
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => false,
    type   => bool,
    user   => $::boxen_user;
  }

}
