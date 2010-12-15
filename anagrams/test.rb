require 'anagram'
require 'pp'

words = []

File.open('ospd.txt') do |infile|
  while (line = infile.gets)
    words << line.chomp!
  end
end

pp Anagram.new(words).find_all_anagrams
