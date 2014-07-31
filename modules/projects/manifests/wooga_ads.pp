class projects::wooga_ads {

  boxen::project { 'wooga_ads':
    dir           => "/Users/${::luser}/Development/wooga/WGAds",
    ruby          => '2.1.2',
    source        => 'wooga/mops.whatads.ios.ya'
  }
}
