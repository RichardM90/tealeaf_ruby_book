require 'nokogiri'


# Expecting string in the format of "Revenue (£m)"
# This method will return the following hash 
#   label: "Revenue"
#   currency: "£"
#   units: "m"
def split_heading(heading)
  a = heading.split
  label = a[0]
  b = a[1].scan(/\(([^\)]+)\)/)
  currency = b[0].join[0]
  units = b[0].join[1]
  hash = { label: label, currency: currency, units: units }
  return hash
end



page = Nokogiri::HTML(open("digitallook.html"))
# The following extracts two tables; the first being the Key Fundamentals and
# the second is the Forecast
tables = page.css('table.table-responsive')
#tables.superclass
# The following extracts the table headers for Key Fundamentals
headers = tables[0].css('th')
# The following outputs each columns header text
headings = []
tables[0].css('th').each do |node|
  headings.push(node.text)
end
p headings

# The Key Fundamentals table has the following columns:
# "Year Ending", "Revenue (£m)", "Pre-tax (£m)", "EPS", "P/E", "PEG", "EPS Grth.", "Div", "Yield"
result = {}
tables[0].css('tr').map do |row|
  data_row = {}
  year_ending_date, revenue, eps = ''
  row.css('td').each_with_index do |cell, index|
    case index
      when 0
        key = cell.text
        year_ending_date = cell.text
        data_row = { year_ending_date: cell.text }
      when 1
        hash = split_heading(headings[index])
        revenue_hash = { value: cell.text, currency: hash.fetch(:currency), units: hash.fetch(:units) }
        data_row.merge!({ revenue: revenue_hash })
      when 3
        eps = cell.text
        data_row.merge!({ eps: cell.text })
    end
  end
  p data_row
  if !data_row.empty?
    #result[key] = data_row
  end
end

result
p result





