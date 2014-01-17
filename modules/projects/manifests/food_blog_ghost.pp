class projects::food_blog_ghost {
  # include icu4c
  # include phantomjs

  boxen::project { 'food_blog_ghost':
    dir           => "/Users/${::luser}/Development/ghost/food-blog-ghost",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'git@bitbucket.org:devboy/food-blog-ghost.git',
    nodejs 		  => 'v0.10.21'	
  }
}