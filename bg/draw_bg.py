from PIL import Image, ImageDraw, ImageFont

# create an image
W = 3840
H = 2160
color = (38, 58, 64)
# (24, 24, 33)
out = Image.new("RGB", (3840, 2160), color)
# get a font
# fnt = ImageFont.truetype("/usr/share/fonts/adobe-source-code-pro/SourceCodePro-Regular.otf", 200)
fnt = ImageFont.truetype("/usr/share/fonts/TTF/Roboto Mono Thin Nerd Font Complete Mono.ttf", 200)

# get a drawing context
d = ImageDraw.Draw(out)

# draw multiline text
text = 'well'
_, _,w, h = fnt.getmask(text).getbbox()

# color = (0, 209, 21)
color_text = (219, 202, 204)
d.text((int((W - w)/2), int((H-h)/2)), text, font=fnt, fill=color_text)
file_name = './bg/tasks.jpg'
out.save(file_name)
print('saved to %s' % file_name)

