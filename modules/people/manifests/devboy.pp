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

  exec { "defrac":
    command   => "curl https://install.defrac.com/ | /bin/sh",
    creates   => "/Users/${::boxen_user}/.defrac"
  }

  package { 'Inky':
    provider  => appdmg,
    source    => 'http://inky.com/mail/InkyInstall.dmg',
    ensure    => present
  }

  package { 'AppCode':
    provider  => appdmg,
    source    => 'http://download.jetbrains.com/objc/AppCode-3.0.3.dmg',
    ensure    => present
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

  # FONTS:

  include fonts

  # PROJECTS:
  include projects::apportable_apportable

  include projects::devboy_defracgettingstarted

  include projects::wooga_apportable
  include projects::wooga_jellysplash
  include projects::wooga_entitas
  include projects::wooga_ads

  # APPS:

  include virtualbox
  include chrome
  include dropbox
  include iterm2::dev
  include vlc
  include onepassword
  include skype
  # include spotify
  include atom
  include transmission
  include steam
  include charles
  include slate

  class { 'intellij':
    edition => 'ultimate',
    version => '13.1.4'
  }

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
