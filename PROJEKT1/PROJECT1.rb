require 'csv'
require 'json'

class DataReader
  def reader_csv_or_json(file)
    if file.end_with?('.csv')
      @data = CSV.read(file, col_sep: ';', encoding: 'UTF-8', headers: true)
    elsif file.end_with?('.json')
      @data = JSON.parse(File.read(file))
    else
      puts "Incorrect file"
    end
  end

  def validate
    #======READING=====
    @data.each do |row|
      value = row["VALUE"].to_i

      if value >= 0
        puts "Day #{row['DATE']}: sensor #{row['SENSOR TYPE']} show value #{row['VALUE']}"
      else
        puts "Day #{row['DATE']}: negative value #{row['VALUE']}. Error read"
      end
    end
  end
end

Reader1 = DataReader.new
Reader1.reader_csv_or_json("DATE.csv")
Reader1.validate