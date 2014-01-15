class people::devboy {
  include sparrow
  include java
  include chrome
  include dropbox
  include iterm2::dev
  include vlc
  include onepassword
  include skype
  include slack
  include git

  git::config::global { 'user.email':
    value  => 'dominic.graefen@gmail.com'
  }
  
  include sublime_text_3
  include sublime_text_3::package_control

  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  include fish

  # class { 'intellij':
  #   edition => 'ultimate',
  #   version => '12.1.4'
  # }
  include appcode2

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
