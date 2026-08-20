from PIL import Image

# Open the original image
img = Image.open('/home/chevv/Downloads/bu_mimin.jpeg')
width, height = img.size

# We want to crop the inner rectangle.
# The user's image is a square (1000x1000 or similar).
# The inner portrait starts around 25% from left, 5% from top, 
# and ends 75% right, 80% bottom.
left = int(width * 0.28)
top = int(height * 0.05)
right = int(width * 0.72)
bottom = int(height * 0.78)

# Let's make it a square crop for the layout since it's `w-20 h-20 rounded-full`
# The face is usually in the upper half.
# Current cropped width: 44%, height: 73%
# To make a square, we can use the top part of the cropped area.
crop_width = right - left
crop_height = crop_width # square

# Face is at the top of the cropped box, so we'll start a bit below the top edge
# to get a nice centered portrait.
top = int(height * 0.05)
bottom = top + crop_height

img_cropped = img.crop((left, top, right, bottom))
img_cropped.save('/home/chevv/xii_rpl/images/bu_mimin_cropped.jpg')
print("Image cropped successfully to /home/chevv/xii_rpl/images/bu_mimin_cropped.jpg")
