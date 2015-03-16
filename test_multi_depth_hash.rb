
rows = [ { date: "01/01/2010", revenue: 123.45, eps: 10.5 }, 
          { date: "01/01/2011", revenue: 145.67, eps: 12.5 }, 
          { date: "01/01/2012", revenue: 155.66, eps: 11.5 } ]

result = {}
rows.each do |row| 
  key = row.fetch(:date)
  if result.has_key?(key)
    result[key].push(row)
  else
    result[key] = row
  end
end

p result
