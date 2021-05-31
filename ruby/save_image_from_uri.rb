# uri에서 이미지 저장
require 'open-uri'
uri1 = 'https://cdnimg.melon.co.kr/cm/artistcrop/images/002/25/993/225993_500.jpg?db00dfee5f1b108c9eacbc818d50b940/melon/resize/416/quality/80/optimize'
open(uri1) {|f| File.open("f1.jpg","wb") { |file| file.puts f.read } }

# file 열기
file1 = File.open('f1.jpg', 'r')

