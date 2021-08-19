
#!/bin/bash
#
#  0) Create backupMediaScan folder on ~/Desktop
cd ~/Desktop
#      a. cd ~/Desktop/backupMediaScan/
mkdir backupMediaScan

#      b. prompt user for location and store in $location variable
read -p "Location: " location
echo "Location is $location"

#
#

drive_root = "/Volumes/"
#  1) Read files from connected drive
#    a. List connected devices
disk0=$drive_root"$(df -h | grep NIKON | cut -d "/" -f 5)"\/DCIM
cd "$disk0"
#
#
# Below is the start of the logic for if more than one drive is connected
#read -r disk0 disk1 disk2 <<< $drive_root"$(df -h | grep NIKON | cut -d "/" -f 5)"
#    b. If only one connected device, select that, if more than one, prompt user to select
#    c. Copy folder(s) /DCIM/851ND600 ("DSC_0001.JPG" is the image filename) to ~/Desktop/backupMediaScan/
#        i. there can be multiple XYZND*00 folders within DCIM
#image_folder0="$(ls | awk '/[0-9]{3}ND[0-9]{1}00/{print $0}')"
folders=()
IFS=$'\n' folders=$(ls -1)
#read -r image_folder0 image_folder1 image_folder2 <<< "$(ls | awk '/[0-9]{3}ND[0-9]{1}00/{print $0}')"
#
#
#
for i in "${folders[@]}" ; do cp "$i" ~/Desktop/backupMediaScan/; done
#
cd ~/Desktop/backupMediaScan/
#
#
# 2) Loop through all files within available folders
for f in *
do
  ORIENTATION=$(identify -format %[orientation] "$f")> /dev/null
#   a. if next file is portrait,
  if [[ "$ORIENTATION" == "LeftBottom" ]]
  then
#     mv "$f" /path/to/portraits   <-- came with the code snippet
#
#     i. open image immediately after portrait in preview, store path to file in $first_image_for_current_trip

#     ii. extract date and time from $first_image_for_current_trip and store in $first_image_for_current_trip_date and $first_image_for_current_trip_time respectively
#       - if < 1200, $am_or_pm = "AM"
#       - otherwise, $am_or_pm = "PM"
#     iii. prompt user for outfitter, store user input in $current_outfitter variable
#     iv. use "$first_image_for_current_trip_date + $current_outfitter + $location + $am_or_pm + $first_image_for_current_trip_time" for folder name, store in $folder_name variable
  else
#      mv "$f" /path/to/landscapes  <-- came with the code snippet
#   b. if next file is landscape,
#     i. copy file to the newly created folder $folder_name
  fi
done
