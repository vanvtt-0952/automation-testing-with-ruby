def content_type(file)
  file = File.basename(file)
  if file.include? ".jpg"
    "image/jpeg"
  elsif file.include? ".pdf"
    "application/pdf"
  else
    raise "Unknown file type"
  end
end
