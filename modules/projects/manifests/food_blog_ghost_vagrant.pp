class projects::food_blog_ghost_vagrant {
  # include icu4c
  # include phantomjs
  include vagrant
  include virtualbox

  boxen::project { 'food_blog_ghost_vagrant':
    dir           => "/Users/${::luser}/Development/ghost/food-blog-ghost-vagrant",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'git@bitbucket.org:devboy/food-blog-ghost-vagrant.git';	
  }
}