#!/bin/bash
#
#  0) Create backupMediaScan folder on ~/Desktop
#      a. cd ~/Desktop/backupMediaScan/
#      b. prompt user for location and store in $location variable
# 
#  1) Read files from connected drive
#    a. List connected devices
#    b. If only one connected device, select that, if more than one, prompt user to select
#    c. Copy folder(s) /DCIM/851ND600 ("DSC_0001.JPG" is the image filename) to ~/Desktop/backupMediaScan/
#        i. there can be multiple XYZND*00 folders within DCIM
#
#  2) Loop through all files within available folders
#    a. if next file is portrait, 
#      i. open image immediately after portrait in preview, store path to file in $first_image_for_current_trip
#      ii. extract date and time from $first_image_for_current_trip and store in $first_image_for_current_trip_date and $first_image_for_current_trip_time respectively
#        - if < 1200, $am_or_pm = "AM"
#        - otherwise, $am_or_pm = "PM"
#      iii. prompt user for outfitter, store user input in $current_outfitter variable
#      iv. use "$first_image_for_current_trip_date + $current_outfitter + $location + $am_or_pm + $first_image_for_current_trip_time" for folder name, store in $folder_name variable
#
#    b. if next file is landscape, 
#      i. copy file to the newly created folder $folder_name
