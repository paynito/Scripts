#first made a list of .png files in ~/Pictures   with
# >cd ~/Pictures
# >ls *.png > my.txt
# puts "This is org header junk"
# File.foreach('my.txt').with_index do |line, line_num|
#   n = line.chomp
#   puts "[[file:#{n}][#{n}]]"
# end
# puts "This is stuff after the file list."
output = File.open("my.org","r+")
output << "* a list of links to pics\n"

File.foreach('my.txt').with_index do |line, line_num|
  Pic = line.chomp
  output << "[[file:#{Pic}][#{Pic}]]\n"
end

output << "\n that is a list"
output.close



#line_num=0
#File.open('my.txt').each do |line|
 # |line|.chomp
  #print "[[file:#{line}][#{line}]]"
#end
## [[file:10.tiff][10.tiff]]
