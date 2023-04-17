#!/bin/bash
  

date="$(date +"%m-%d-%Y")"

echo "Date is ${date}"

touch test_file_${date}


vi test_file_${date}

# Copy the script file to the Docker container
docker cp test_file_${date} be8754c2801a:/home/

# Run the script inside the Docker container
docker exec be8754c2801a /bin/bash -c "chmod +x /home/test_file_${date} && /home/test_file_${date}" > output.txt

# Display the output of the script on the terminal
cat output.txt

