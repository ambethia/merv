MRuby::Build.new do |conf|
  toolchain :gcc
  
  # conf.gem :core => 'mruby-bin-mirb'
  conf.gem :core => 'mruby-bin-mruby'
  conf.gem :core => 'mruby-print'
  conf.gem :core => 'mruby-sprintf'
  conf.gem :core => 'mruby-time'
  
  conf.gem :git => 'https://github.com/iij/mruby-io.git'  
  conf.gem :git => 'https://github.com/iij/mruby-mtest.git'
end
