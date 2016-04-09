class Scoring

  def self.letter_by_letter(word)
    if word.length > 7
      raise ArgumentError.new
    end

    word = word.upcase.split(//) # change letters of word to uppercase to match keys
    score = word.map { |letter| SCORES[letter.to_sym] }
    word.zip score
  end

  def self.letter_by_letter_many(array_of_words)
    final = {}
    points = array_of_words.map do |one_word|
      final[one_word] = self.letter_by_letter(one_word)
    end
    return final

  end

  def self.score(word)
    if word.length > 7
      raise ArgumentError.new
    end

    word = word.upcase.split(//)
    points = 0
    word.each { |letter| points += SCORES[letter.to_sym] }

    return points
  end

  def self.score_many(array_of_words)
    all_scores = array_of_words.map { |one_word| self.score(one_word) }
    all_scores.zip(array_of_words)
  end

end
