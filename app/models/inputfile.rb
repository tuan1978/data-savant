class Inputfile < ActiveRecord::Base
  attr_accessible :contents, :filename, :title
  has_many :input_columns

  def content_to_hash
    rows.map do |row|
      result = {}
      input_columns.each_with_index.map do |column, i|
        result[column[:name].to_sym] = column[:type] == "numeric" ? row.split(",")[i].to_f : row.split(",")[i].to_s
      end
      result
    end
  end

  def data_array
    contents.split("\n").last(contents.split("\n").size - 1).map{|c| c.split(",")}
  end

  def all_rows
    contents.split("\n")
  end

  def rows
    all_rows - [column_row]
  end

  def column_names
    column_row.split(",")
  end

  def column_row
    all_rows.first
  end

  def input_columns
    column_names.each_with_index.map do |c, i|
      {name: c, type: determine_type(data_array.transpose[i])}
    end
  end

  def determine_type(column)
    column.reject{|v| is_numeric? v}.blank? ? "numeric" : "string"
  end

  def is_numeric?(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

end
