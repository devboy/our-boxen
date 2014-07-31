class projects::wooga_jellysplash {

  package { 'imagemagick':
    ensure => present
  }

  package { "apktool":
  	ensure => present,
  }

  boxen::project { 'wooga_jellysplash':
    dir           => "/Users/${::luser}/Development/wooga/jelly-splash",
    ruby          => '2.1.2',
    source        => 'wooga/puzzle-lines-ios'
  }

}
