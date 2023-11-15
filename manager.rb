require 'json'

class Manager
    def initialize(filename)
        @filename = filename
    end

    def load_data
        if File.exist?(@filename)
        file = File.read(@filename)
        JSON.parse(file, object_class: OpenStruct)
        else
        puts "The file '#{@filename}' does not exist. Creating..."
        File.open(@filename, 'w') do |f| 
            f.write('[]')
        end
        []
        end

    def save_data(data)
        File.open(@filename, 'w') do |f| 
        f.write(JSON.pretty_generate(data.map(&:to_json))) 
        end
    end
end