MRuby::Build.new do |conf|
  toolchain :gcc
  
  # conf.gem :core => 'mruby-bin-mirb'
  # conf.gem :core => 'mruby-bin-mruby'
  conf.gem :core => 'mruby-print'
end
