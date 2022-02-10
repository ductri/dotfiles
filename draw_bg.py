from PIL import Image, ImageDraw, ImageFont

# create an image
W = 3840
H = 2160
out = Image.new("RGB", (3840, 2160), (24, 24, 33))
# get a font
fnt = ImageFont.truetype("/usr/share/fonts/adobe-source-code-pro/SourceCodePro-Regular.otf", 200)
# get a drawing context
d = ImageDraw.Draw(out)

# draw multiline text
text = '"Low rank vs function?"'
_, _,w, h = fnt.getmask(text).getbbox()

d.text((int((W - w)/2), int((H-h)/2)), text, font=fnt, fill=(2, 153, 42))
out.save('./bg/bg_text.jpg')

