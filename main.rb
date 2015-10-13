require 'sinatra'

class Affine < Sinatra::Base
  MULTIPLICATION_VALUES = [3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25]
  ALPHABET = (?A..?Z).to_a
  dictionary = {}
  File.open("../enable1.txt", "r") do |file|
    file.each_line do |line|
      dictionary[line.chomp] = 1
    end
  end

  def affine(character, multiply, add)
    if ALPHABET.include? character # only shift if the character is a letter
      # This next line is pretty complicated so I'm going to break it down
      # It takes the character and gets the human-readable index
      # (e.g. a => 1, b => 2, etc)
      # Then it multiplies by multiply
      # Then it adds by add
      # Then it gives the least positive residue in mod 26
      # Then it converts to the array index
      # Then it returns the letter at that array index
      ALPHABET[(((ALPHABET.index(character) + 1) * multiply + add) % 26) - 1]
    else
      character
    end
  end

  def score (result, dictionary)
    score = 0.0
    words = result.split.map { |word| word.gsub(/[^a-z]/i, '') } # only letters
    words.each do |word|
      score += 1 if dictionary[word]
    end
    score /= words.length
    score
  end
  
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

  get '/' do
    erb :index
  end

  post '/' do
    message = params[:message].upcase
    @results = []
    (1..25).each do |add|
      MULTIPLICATION_VALUES.each do |multiply|
        @results << message.split("").map { |letter| affine(letter, multiply, add) }.join.downcase
      end
    end
    @results = @results.sort_by { |result| score(result, dictionary) }.reverse
    erb :results
  end
end
