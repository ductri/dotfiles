from PIL import Image, ImageDraw, ImageFont

# create an image
W = 3840
H = 2160
out = Image.new("RGB", (3840, 2160), (24, 24, 33))
# get a font
# fnt = ImageFont.truetype("/usr/share/fonts/adobe-source-code-pro/SourceCodePro-Regular.otf", 200)
fnt = ImageFont.truetype("/usr/share/fonts/TTF/Roboto Mono Thin Nerd Font Complete Mono.ttf", 200)

# get a drawing context
d = ImageDraw.Draw(out)

# draw multiline text
text = '"Hello world"'
_, _,w, h = fnt.getmask(text).getbbox()

d.text((int((W - w)/2), int((H-h)/2)), text, font=fnt, fill=(0, 209, 21))
out.save('./bg/bg_text.jpg')

