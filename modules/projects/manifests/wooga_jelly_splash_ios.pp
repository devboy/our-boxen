class projects::wooga_jelly_splash_ios {
  # include icu4c
  # include phantomjs

  boxen::project { 'wooga_jelly_splash_ios':
    dir           => "/Users/${::luser}/Development/droid/wooga/jelly-splash-ios",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'wooga/puzzle-lines-ios'
  }
}