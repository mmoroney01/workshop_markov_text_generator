class MarkovGenerator
  def self.from_file file
    from_text File.read(file)
  end

  def self.from_text text
    freq_hash = Hash.new {|hash, key| hash[key] = [] }

    #put spaces before ending punctuation to count them as words.
    text.gsub!(".", "\s.")
    text.gsub!("!", "\s!")
    text.gsub!("?", "\s?")

    text.split.each_cons(2) do |word, following_word|
      freq_hash[word] << following_word
    end


    require 'pp'
    pp freq_hash
    current_word = freq_hash.keys.sample
    sentence = [current_word]

    20.times do
      p current_word
      current_word = freq_hash[current_word].sample
      sentence << current_word
    end

    sentence.join(" ")
  end



  def self.from_file_two file
    from_text_two File.read(file)
  end

  def self.from_text_two text
    freq_hash = Hash.new {|hash, key| hash[key] = [] }

    #put spaces before ending punctuation to count them as words.
    text.gsub!(".", "\s.")
    text.gsub!("!", "\s!")
    text.gsub!("?", "\s?")

    text.split.each_cons(3) do |word1, word2, following_word|
      arr = [word1, word2]
      freq_hash[arr] << following_word
    end


    require 'pp'
    pp freq_hash
    current_words = freq_hash.keys.sample
    sentence = current_words[0] + " " + current_words[1]

    20.times do
      next_word_first = current_words[1]
      next_word = freq_hash[current_words].sample
      sentence << " " + next_word
      current_words = [current_words[1], next_word]
    end

    sentence
  end
end
