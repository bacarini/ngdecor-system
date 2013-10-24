class Import
  include ActiveModel::Model

  attr_accessor :file
  
  def initialize(attributes = {})
    attributes.each { |name, value| send( "#{name}=", value) }
  end

  def save
    if imported_suppliers.map(&:valid?).all?
      imported_suppliers.each(&:save!)
      true
    else
      imported_suppliers.each_with_index do |supplier, index|
        supplier.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_suppliers
    @imported ||= load_imported_suppliers
  end

  def load_imported_suppliers
    binding.pry
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      supplier = find_by_id(row["id"]) || new
      supplier.attributes = row.to_hash.slice(*accessible_attributes)
      supplier.save!
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
