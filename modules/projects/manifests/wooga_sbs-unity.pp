class projects::wooga_sbs-unity {

  boxen::project { 'wooga_wooga_sbs-unity':
    dir           => "/Users/${::luser}/Development/wooga/sbs-unity",
    ruby          => '2.1.2',
    source        => 'wooga/sbs-unity'
  }
}
