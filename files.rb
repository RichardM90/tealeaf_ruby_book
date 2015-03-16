
# opening and closing a file
# w+ mode = read and write access, truncates existing file
def example1
  my_file = File.new("simple_file.txt", "w+") 
  my_file.close
end
#example1


# open file, output content, auto close file
# w mode = write only, overwrites existing contents
# write method does not output a line break, puts does
def example2
  File.open("simple_file.txt", "w") { |file| file.write("adding first line of text") }
end
#example2


# appending to a file
# mode a+ = read and write, append to existing text
def example3
  my_file = File.open("simple_file.txt", "w+")
  my_file.puts "another example of writing to a file."
  my_file.close
  File.open("simple_file.txt", "a+") do |file|
      file << "Here we are with a new line of text"
  end
  File.readlines("simple_file.txt").each do |line|
      puts line
  end
end
#example3


# listing file contents
def example4
  File.open("simple_file.txt", "w+") do |file|
    file.puts "another example of writing to a file."
  end
  File.open("simple_file.txt", "a+") do |file|
    file.write "Writing to files in Ruby is simple."
  end
  File.readlines("simple_file.txt").each_with_index do |line, line_num|
    puts "#{line_num}: #{line}"
  end
end
#example4


# deleting a file
def example5
  File.new("dummy_file.txt", "w+")
  File.delete("dummy_file.txt")
end
#example5


# exercise 1
# copy the contents of one file to another file
def exercise1

  source_file = File.open("source_file.txt", "w+")
  source_file.puts "Another example of writing to a file."
  source_file.puts "Here we are with a new line of text."
  source_file.puts "Writing to files in Ruby is simple."
  source_file.close

  source_file = File.read("source_file.txt")
  target_file = File.new("target_file.txt", "w+")
  File.open(target_file, "a") do |file|
    file.puts source_file
  end
  
  puts File.read(target_file)
end
#exercise1


# exercise 2
# list .txt files in the current directory
def exercise2
  puts "Exercise 2:"
  d = Dir.new(".")
  
  while file = d.read do
    puts "#{file} has extension .txt" if File.extname(file) == ".txt"
  end
  
  # now using pathname
  require 'pathname'
  pn = Pathname.new(".")
  pn.entries.each { |f| puts "#{f} has extension .txt" if f.extname == ".txt" }
  
end
#exercise2


# exercise 3
# wget -O feedzilla.json http://api.feedzilla.com/v1/categories/8/articles.json
# wget -O slashdot.xml http://rss.slashdot.org/Slashdot/slashdot
def exercise3
  require 'json'
  require 'nokogiri'
  require 'axlsx'
  require 'csv'
  
  slashdot_articles = []
  File.open("slashdot.xml", "r") do |f|
    doc = Nokogiri::XML(f)
    slashdot_articles = doc.css('item').map { |i|
      {
        title: i.at_css('title').content,
        link: i.at_css('link').content,
        summary: i.at_css('description').content
      }
    }
  end

  feedzilla_articles =[]
  File.open("feedzilla.json", "r") do |f|
    items = JSON.parse(f.read)
    feedzilla_articles= items['articles'].map { |a|
      {
        title: a['title'],
        link: a['url'],
        summary: a['summary']
      }
    }
  end
  
  sorted_articles =  (feedzilla_articles + slashdot_articles).sort_by {|a| a[:title]}
  
  
  CSV.open("article.csv", "wb") do |csv|
    sorted_articles.each { |a| csv << [ a[:title], a[:link], a[:summary] ]  }
  end
  
  pkg = Axlsx::Package.new
  pkg.workbook.add_worksheet(:name => "Articles") do |sheet|
   sorted_articles.each { |a| sheet.add_row [a[:title], a[:link], a[:summary]] }
  end
  pkg.serialize("articles.xlsx")
  
end
exercise3  


# exercise 4
# wget -O digitallook.html http://www.digitallook.com/cgi-bin/dlmedia/security.cgi?csi=10248
def exercise4
  require 'nokogiri'
  dl_page = []
  File.open("digitallook.html", "r") do |f|
    doc = Nokogiri::XML(f)
    dl_page = doc.css('item').map { |i|
      {
        title: i.at_css('title').content,
        link: i.at_css('link').content,
        summary: i.at_css('description').content
      }
    }
  end
  
end

