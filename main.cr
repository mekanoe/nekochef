require "./config"
require "./kitty"
require "pluto"
require "pluto/format/jpeg"
require "pluto/format/png"
require "pluto/format/webp"

random = Random.new
kitty = Kitty.new

tmp_path = File.open("/home/noe/Downloads/78qL2Rosw.jpg") do |file|
  image = Pluto::ImageRGBA.from_jpeg(file)
  # generate a random filename
  path = "/tmp/#{random.hex}.png"

  File.open(path, "w") do |png_file|
    image.to_png(png_file)
  end

  path
end

kitty.display_image(tmp_path, "t")
