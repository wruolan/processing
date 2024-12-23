import os
import datetime

# Specify the folder containing the images
folder_path = '/Users/jadef/OneDrive - University of Southern California/OneDrive/Wu Ruolan/school/sophomore/fall/iml288_introtocreativecoding/weekeleven/ruolan_wu_array/data'

# Get all files in the folder
files = [f for f in os.listdir(folder_path) if f.endswith('.JPEG')]

# Sort files by modification date
files.sort(key=lambda x: os.path.getmtime(os.path.join(folder_path, x)), reverse=True)

# Rename each file
for i, file in enumerate(files, start=0):
    old_file_path = os.path.join(folder_path, file)
    new_file_name = f"test{i}.JPEG"
    new_file_path = os.path.join(folder_path, new_file_name)

    # Rename the file
    os.rename(old_file_path, new_file_path)
    print("Renamed:", file, "to", new_file_name)