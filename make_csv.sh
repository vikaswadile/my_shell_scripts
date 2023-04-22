#!/bin/bash
  
# Enter path of csv file
csv_file="/home/vikas/testing/test2.csv"

# ask the user to enter the row number they want to update
echo "Enter the row number you want to update (or enter "New" to add a new row):"
read row_number

# If the user entered New, add a new row
if [[ $row_number == "New" ]]; then
    echo "Enter the values for the new row:"
    read -p "Name: " col1
    read -p "Address: " col2
    # we can add multiple columns as above

    # Append the newly added row to the CSV file
    echo "$col1,$col2" >> $csv_file

    echo "New row has been added successfully!"
else
    # Display the current values for the selected row
    current_row=$(sed "${row_number}q;d" $csv_file)
    echo "Current values for row $row_number:"
    echo $current_row

    # ask the user to confirm if they want to update the row
    read -p "Do you want to update this row? (y/n) " confirm

    if [[ $confirm == "y" ]]; then
        # ask the user to enter new values for each column
        echo "Enter the new values for the row (leave blank to keep current value):"
        read -p "Name ($col1): " new_col1
        read -p "Address ($col2): " new_col2
        # we can add multiple columns as above

        # Use sed to replace the current row with the updated values
        new_row="$new_col1,$new_col2"
        sed -i "${row_number}s/.*/$new_row/" $csv_file

        echo "Row $row_number has been updated successfully!"
    else
        echo "Row $row_number is not updated."
    fi
fi

