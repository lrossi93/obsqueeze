#!/bin/bash

################################################################################
# This script sequentially compresses video files with 'ffmpeg' and deletes the 
# original files. It also uses 'spd-say' for notifying the end of the process
# and 'zenity' for a final visual notification.
################################################################################

# The absolute path where the video files to be compressed are.
# Change it with the path to the directory containing the files you want to 
# compress.
vidpath=/your/videos/directory/path/here

# Variables
welcome='Welcome to VID-Squeeze!'
sqzd='sqzd'
mp4ext='mp4'

echo $welcome;
echo -e "Squeezing all files in $vidpath..."

# Move to directory $vidpath
cd $vidpath

# Track starting time
start=$(date +%H:%M)

# For each file name in $vidpath
for file in *
do
	# If $filename does not contain substring "sqzd"
	if [[ $file != *$sqzd* ]]; 
	then
		# Prepare output filename
		ext="${file##*.}"; 
		filename="${file%.*}"; 
		squeezing="Squeezing $file..."

		# Then compress file
		echo -e $squeezing;
		
		# Use the following line if you want to keep the original file extension
		# ffmpeg -i $file -vcodec libx265 -crf 28 "${filename}-$sqzd.${ext}" &
		
		# I personally only need .mp4 output
		ffmpeg -i $file -vcodec libx265 -crf 28 "${filename}-${sqzd}.${mp4ext}"
		
		echo -e "File ${filename}-${sqzd}.${mp4ext} successfully created.";
		echo -e "Deleting ${file}...\n";		
				
		# Then the original file is deleted
		echo -e "Removing ${file}...";
		rm $file
		echo -e "File ${file} has been deleted.\n";

	else
		skip="Skipping $file (already squeezed)..."
		
		echo -e $skip;
	fi
done

echo -e "All files in $vidpath have been squeezed successfully.\n"

# Audio warning
spd-say "vidsqueeze terminated"

# Track finish time
finish=$(date +%H:%M)

# Show dialog on screen
zenity --info --text "VID-Squeeze started at ${start} and terminated at ${finish}."
