require_relative '../source'
require_relative '../file_writer'
require_relative '../file_reader'

def write_sources(sources)
  data = []
  sources.each do |source|
    data << { name: source.name }
  end
  file_writer = FileWriter.new(data, 'sources.json')
  file_writer.write
end

def read_sources
  file_reader = FileReader.new('sources.json')
  content = file_reader.read
  content.map do |source|
    Source.new(source['name'])
  end
end
