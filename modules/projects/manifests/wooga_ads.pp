class projects::wooga_ads {

  boxen::project { 'wooga_ads':
    dir           => "/Users/${::luser}/Development/wooga/WGAds",
    source        => 'wooga/mops.whatads.ios.ya'
  }
}
