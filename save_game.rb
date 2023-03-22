
def save_data(file_name, curr_data)

  # Check if the file exists
  if File.exist?(file_name)
    # Read the existing JSON data from the file and parse it into a Ruby array
    json_data = File.read(file_name)
    saved_data = JSON.parse(json_data)

  else
    # If the file does not exist, create an empty array
    saved_data = []
    # prev_len = 0
  end

  # Append the new data to the array if it's not already present
  curr_data.each do |obj|
    saved_data << obj unless saved_data.include?(obj)
  end

  # Write the updated array back to the file as JSON data
  File.write(file_name, JSON.generate(saved_data))
end