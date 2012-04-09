require 'rubygems'

desc 'watch coffee file'
task :watch do
  begin
    require 'coffee-script'
  rescue LoadError
    puts "coffee-script not found.\nInstall it by running 'gem install coffee-script'"
    exit
  end

  system 'coffee -w -c backbone.debug.coffee'
  system 'coffee -w -c spec/backbone.debug_spec.coffee'
end

desc 'build js file'
task :build do
  begin
    require 'coffee-script'
  rescue LoadError
    puts "coffee-script not found.\nInstall it by running 'gem install coffee-script'"
    exit
  end

  system 'coffee -c backbone.debug.coffee'
  system 'coffee -c spec/backbone.debug_spec.coffee'
end

desc 'build documentation'
task :docs do
  begin 
    require 'rocco'
  rescue LoadError
    puts "rocco not found.\nInstall it by running 'gem install rocco'"
    exit
  end

  system 'rocco backbone.debug.coffee'
end

desc 'create a new release'
task :realse do
  puts 'implement this task'
end
