class Kitty
  def display_image(@image_path : String, @type : String = "f")
    rows = `tput lines`.to_i
    cols = `tput cols`.to_i
    puts "\e_Gf=100,t=#{type},a=T,c=#{cols},r=#{rows - 3};#{Base64.encode(image_path).chomp}\e\\"
  end
end
