class projects::wooga_jellysplash {

  package { 'imagemagick':
    ensure => present
  }

  package { "apktool":
  	ensure => present,
  }

  boxen::project { 'wooga_jellysplash':
    dir           => "/Users/${::luser}/Development/wooga/jelly-splash",
    ruby          => '1.9.3-p448',
    source        => 'wooga/puzzle-lines-ios'
  }

}
