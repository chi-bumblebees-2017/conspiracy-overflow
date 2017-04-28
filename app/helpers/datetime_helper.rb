def timestamp_to_date(dateable)
  dateable.created_at.to_date.to_formatted_s(:long_ordinal)
end
