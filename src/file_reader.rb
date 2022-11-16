require "json"

class FileReader
  def initialize(filename, path: './data/')
    @data = path + filename
  end

  def read
    file_content = []
    if File.exist?(@data)
      JSON.parse(File.read(@data)).each do |line|
        file_content << line
      end
    end
    file_content
  end
end