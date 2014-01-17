class projects::wooga_jelly_splash_droid {
  # include icu4c
  # include phantomjs

  boxen::project { 'wooga_jelly_splash_droid':
    dir           => "/Users/${::luser}/Development/droid/wooga/jelly-splash-droid",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'wooga/jellysplash-apportable'
  }
}