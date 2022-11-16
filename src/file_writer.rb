require 'json'

class FileWriter
  def initialize(file_content, filename, path: './Json/')
    @file_content = file_content
    @data = path + filename
  end

  def write
    File.open(@data, 'w+') { |f| f.puts JSON.pretty_generate(@file_content) }
  end
end
