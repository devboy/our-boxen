class people::devboy {
  # DEFAULTS:
  include fish
  include git
  include java
  git::config::global { 'user.email':
    value  => 'dominic.graefen@gmail.com'
  }

  # RUBY:

  include ruby
  $GLOBAL_RUBY = "1.9.3-p448"
  class { 'ruby::global':
    version => $GLOBAL_RUBY
  }

  # ruby::plugin { 'gem-rehash':
  #   version => 'v1.0.0',
  #   source  => 'sstephenson/rbenv-gem-rehash'
  # }

  ruby::gem { "dotty for ${GLOBAL_RUBY}":
    gem     => 'dotty',
    ruby    => $GLOBAL_RUBY,
    version => '~> 0.0.3'
  }

  class dotty($ruby_version='system') {
    $dotfiles_dir = "/Users/${::luser}/.dotty/default/dotfiles"
    $ds_store_file = "${dotfiles_dir}/dotfiles/.DS_Store"
    if file_exists($ds_store_file) {
      exec { "rm ${ds_store_file}":
        cwd => "/Users/${luser}",
        logoutput => on_failure,
        provider => 'shell'; 
      }
    }
    exec { "env -i HOME=\$HOME SSH_AUTH_SOCK=\$SSH_AUTH_SOCK RBENV_VERSION=${ruby_version} sh -c 'source /opt/boxen/env.sh && dotty add dotfiles git@bitbucket.org:devboy/dotfiles.git'":
     cwd => "/Users/${luser}",
     logoutput => on_failure,
     provider => 'shell',
     creates => $dotfiles_dir,
     require => [ Class['ruby::global'], 
                  Ruby::Gem["bundler for ${ruby_version}"], 
                  Ruby::Gem["dotty for ${ruby_version}"] ];
    }

    exec { "env -i HOME=\$HOME SSH_AUTH_SOCK=\$SSH_AUTH_SOCK RBENV_VERSION=${ruby_version} sh -c 'source /opt/boxen/env.sh && dotty update && dotty bootstrap'":
     cwd => "/Users/${luser}",
     logoutput => on_failure,
     provider => 'shell',
     require => [ Class['ruby::global'], 
                  Ruby::Gem["bundler for ${ruby_version}"], 
                  Ruby::Gem["dotty for ${ruby_version}"] ];
    }

  }
  class { "dotty":
    ruby_version => $GLOBAL_RUBY
  }

  # APPS:

  include sparrow
  include chrome
  include dropbox
  include iterm2::dev
  include vlc
  include onepassword
  include onepassword::chrome
  include skype
  include slack
  include spotify
  include sublime_text_3
  include sublime_text_3::package_control
  sublime_text_3::package { 'Theme - itg.flat':
    source => 'itsthatguy/theme-itg-flat'
  }
  sublime_text_3::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet'
  }
  sublime_text_3::package { 'GitGutter':
    source => 'jisaacks/GitGutter'
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    ensure => 'link',
    target => "/Users/${::luser}/.config/sublimetext3/Preferences.sublime-settings",
    require => Class['dotty'];
  }

  class { 'intellij':
    edition => 'ultimate',
    version => '12.1.4'
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
