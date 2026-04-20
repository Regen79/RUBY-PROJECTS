require 'csv'
require 'json'
require 'yaml'

# ==================================INITIALIZE======================
class DataInitialize
  attr_accessor :data
  def initialize
    @data=[]
  end
end

# ==================================CSV==============================
class Csv < DataInitialize
  def read(file)
    @data = CSV.read(file, col_sep: ';', encoding: 'UTF-8', headers: true)
    puts "==============================CSV=============================="
  end
end

# ==================================JSON========================
class Json < DataInitialize
  def read(file)
    @data = JSON.parse(File.read(file))
    puts "==============================JSON============================="
  end
end

# ===================================YAML====================
class Yaml < DataInitialize
  def read(file)
    @data = YAML.load_file(file)
    puts "==============================YAML============================="
  end
end

# ==================================VALIDATE==========================
class Validate
  def self.validate_data(data)
    
    data.each do |row|
      value = row["VALUE"].to_i
      

      if value >= 0
        puts "Day #{row['DATE']}: sensor #{row['SENSOR TYPE']} show value #{row['VALUE']}"
      else
        puts "Day #{row['DATE']}: negative value #{row['VALUE']}. Error read"
      end
    end
  end
end

# =================================READER FACTORY=======================
class DataReaderFactory
  def reader(file,option={}) 
    if file.end_with?('.csv')
      reader_instance=Csv.new
    elsif file.end_with?('.json')
      reader_instance = Json.new
    elsif file.end_with?('.yaml')
      reader_instance = Yaml.new
    else
      puts "Incorrect file"
      return
    end
    reader_instance.read(file)
    Validate.validate_data(reader_instance.data)
    
  end
end

# =================================INSTANCE=====================
factory1 = DataReaderFactory.new

# =================================FILE PATH====================
if ARGV[0]
  file= File.expand_path(ARGV[0])
else
  puts "Please provide path to file: "
  file=gets.chomp
  file= File.expand_path(file)
end
factory1.reader(file)
