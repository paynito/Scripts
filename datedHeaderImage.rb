#/usr/bin/ruby
#author benyomin.cf
#this goes along with a multi-lingual jekyll template from
# https://www.sylvaindurand.org/making-jekyll-multilingual/
# the author asked that we use our own header images, not the map of paris
# the header images are labeled by the date
# this script aids in producing those images from a pre-cropped folder of several
# $mapsDir is prePopulated with cropped sections to use as headerimg
#gets date
#names cropped image with date
#moves cropped image to jekyll site folder.
require 'fileutils'
require 'date'
puts "hello"
name = Date.today.to_s
puts name
$file = name + ".jpg"
puts $file
$mapsDir = "~/scratch/cropMap/maps/"
$headersDir = "~/scratch/cropMap/headers/"
$sampleFile = "map1.png"
$fileArray = Dir.entries(File.expand_path($mapsDir)).reject{ |entry| entry == "." || entry == ".."}



def getRandomFile
  fileArrayLength = $fileArray.length - 1
  num = rand(0..fileArrayLength)
  file = $fileArray[num]
  return file
end

$randomMap = getRandomFile

def produceNewHeader
  mySource = File.expand_path($mapsDir)
  myDest = File.expand_path($headersDir)
  myOriginal = mySource+'/'+$randomMap
  myCopy = myDest+'/'+$file
  FileUtils.cp myOriginal,myCopy

end

produceNewHeader
