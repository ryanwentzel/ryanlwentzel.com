# adapted from https://github.com/kemayo/davidlynch.org

require 'fileutils'

task :default => :build

desc 'Clean up generated site'
task :clean do
  cleanup
end

desc 'Test site output for Liquid template errors'
task :test => :build do
  errors = `grep --exclude Rakefile -R 'Liquid error:' _site`
  if errors.nil? || errors.empty?
    puts "No errors"
  else
    puts "Errors:"
    puts errors.inspect
    exit 1
  end
end

desc 'Build site with Jekyll'
task :build => :clean do
  submodule('update')
  jekyll #('--lsi')
end

desc 'Start server with --auto'
task :server => :clean do
  jekyll('--server --auto')
end

desc 'Build and deploy'
task :deploy => :build do
  user = 'kemayo'
  host = 'kemayo.webfactional.com'
  directory = '~/webapps/davidlynch'
  sh "rsync -rtzh --progress --delete _site/ #{user}@#{host}:#{directory}"
end

desc 'Make a new post'
task :post, [:name] do |t, args|
  if args.name then
    template(args.name, "_posts")
  else
    puts "Name required"
  end
end

desc 'Make a new draft'
task :draft, [:name] do |t, args|
  if args.name then
    template(args.name, "_drafts")
  else
    puts "Name required"
  end
end

def template(name, dir_name)
  create_dir(dir_name)
  t = Time.now
  contents = "" # otherwise using it below will be badly scoped
  File.open("_templates/yyyy-mm-dd-template.md", "rb") do |f|
    contents = f.read
  end
  contents = contents.sub("%date%", t.strftime("%Y-%m-%d %H:%M:%S %z")).sub("%title%", name)
  filename = dir_name + "/" + t.strftime("%Y-%m-%d-") + name.downcase.gsub( /[^a-zA-Z0-9_\.]/, '-') + '.md'
  if File.exists? filename then
    puts "Post already exists: #{filename}"
    return
  end
  File.open(filename, "wb") do |f|
    f.write contents
  end
  puts "created #{filename}"
end

def create_dir(name)
  unless File.directory?(name)
    FileUtils.mkdir_p(name)
  end
end

def cleanup
  sh 'rm -rf _site'
end

def jekyll(opts = '')
  sh 'jekyll ' + opts
end

def submodule(opts = '')
  sh 'git submodule ' + opts
end

