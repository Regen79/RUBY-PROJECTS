require 'sqlite3'
require 'csv'
require 'json'
require 'yaml'
#====================================DATABASE========================
$db = SQLite3::Database.new "SENSOR_DATA.db"
$db.execute("
  CREATE TABLE IF NOT EXISTS Measurements(
    numbers INTEGER PRIMARY KEY,
    date TEXT,
    sensor_type TEXT,
    value REAL
  )")
# ==================================CSV==============================
class CsvReader 
  attr_accessor :data
  def initialize(file)
    @file=file
  end
  def read
    data = CSV.read(@file, col_sep: ';', encoding: 'UTF-8', headers: true)
    puts "==============================CSV=============================="
    data.each do |row|
      value = row["VALUE"].to_f
      if value >= 0
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: sensor #{row['SENSOR TYPE']} show value #{value}"
        $db.execute("INSERT INTO measurements (date, sensor_type,value ) VALUES (?, ?, ?)", 
                    [row['DATE'], row['SENSOR TYPE'], row['VALUE']]
                   )
      else
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: negative value #{value}. Error read"
      end
    end
  end
end

# ==================================JSON========================
class JsonReader 
  attr_accessor :data
  def initialize(file)
    @file=file
  end
  def read
    data = JSON.parse(File.read(@file))
    puts "==============================JSON============================="
    data.each do |row|
      value = row["VALUE"].to_f
      if value >= 0
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: sensor #{row['SENSOR TYPE']} show value #{value}"
        $db.execute("INSERT INTO measurements (date, sensor_type,value ) VALUES (?, ?, ?)", 
                    [row['DATE'], row['SENSOR TYPE'], row['VALUE']]
                   )
      else
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: negative value #{value}. Error read"
      end
    end
  end
end

# ===================================YAML====================
class YamlReader 
  attr_accessor :data
  def initialize(file)
    @file=file
  end
  def read
    data = YAML.load_file(@file)
    puts "==============================YAML============================="
    data.each do |row|
      value = row["VALUE"].to_f
      if value >= 0
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: sensor #{row['SENSOR TYPE']} show value #{value}"
        $db.execute("INSERT INTO measurements (date, sensor_type,value ) VALUES (?, ?, ?)", 
                    [row['DATE'], row['SENSOR TYPE'], row['VALUE']]
                   )
      else
        puts "Number: #{row["NUMBER"]}, Day #{row['DATE']}: negative value #{value}. Error read"
      end
    end
  end
end

# =================================READER FACTORY=======================
class DataReaderFactory
  def create_reader(file,option={}) 
    if file.end_with?('.csv')
      return CsvReader.new(file)
    elsif file.end_with?('.json')
      return JsonReader.new(file)
    elsif file.end_with?('.yaml')
      return YamlReader.new(file)
    else
      raise "Incorrect file"
    end  
  end
end
# =================================FILE PATH====================
if ARGV[0]
  file= File.expand_path(ARGV[0])
else
  puts "Please provide path to file: "
  file=gets.chomp
  file= File.expand_path(file)
end

# =================================INSTANCE=====================
factory = DataReaderFactory.new
reader=factory.create_reader(file)
reader.read



