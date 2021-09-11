desc 'create a new post'
task :post do
  title = ENV['TITLE']
  slug = "#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/[^\w]+/, '-')}"

  file = File.join(
    File.dirname(__FILE__),
    'collections/_posts',
    slug + '.md'
  )

  File.open(file, "w") do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    title: #{title}
    date: #{Time.now.strftime("%F %T %:z")}
    excerpt: 
    featured_image: "https://d1yo597syf8yny.cloudfront.net/images/featured/FILENAME.jpg"
    ---

    EOS
  end

  system ("code #{file}")
end

desc 'create new micropost'
task :micro do
  title = ENV['TITLE']
  slug = "#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/[^\w]+/, '-')}"

  file = File.join(
    File.dirname(__FILE__),
    'collections/_microposts',
    slug + '.md'
  )

  File.open(file, "w") do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    title: #{title}
    date: #{Time.now.strftime("%F %T %:z")}
    excerpt: 
    ---

    EOS
  end

  system ("code #{file}")
end

desc 'serve up site locally'
task :serve do
    jekyll('serve')
end

# launch jekyll
def jekyll(directives = '')
    sh 'bundle exec jekyll ' + directives
  end
