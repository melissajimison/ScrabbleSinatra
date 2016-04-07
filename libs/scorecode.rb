class Scoring
  BONUS = 50
  SCORES = {
    A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D: 2, G: 2,
    B: 3, C: 3, M: 3, P: 3, F: 4, H: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8,
    Q: 10, Z: 10
  }

  def self.letter_by_letter(word)
    if word.length > 7
      raise ArgumentError.new
    end

    word = word.upcase.split(//) # change letters of word to uppercase to match keys
    # => [M,E,L,I,S,S,A]
    score = word.map { |letter| SCORES[letter.to_sym] }

    word.zip score
    # =>[["M", 3], ["E", 1], ["L", 1], ["I", 1], ["S", 1], ["S", 1], ["A", 1]]
  end

  def self.letter_by_letter_many(array_of_words)
    # ["melissa", "david",  "cris"]
    final = {}
    points = array_of_words.map do |one_word|
      final[one_word] = self.letter_by_letter(one_word)
    end

    return final
  # => {
      # "meli"=>[["M", 3], ["E", 1], ["L", 1], ["I", 1]],
      # "dav"=>[["D", 2], ["A", 1], ["V", 4]]
    # }
  end


  def self.score(word)
    if word.length > 7
      raise ArgumentError.new
    end

    word = word.upcase.split(//) # change letters of word to uppercase to match keys
    points = 0  # points start at 0
    points += BONUS if word.length == 7

    word.each do |letter|
      points += SCORES[letter.to_sym]
    end
    return points
  end


  def self.score_many(array_of_words)
    # => array_of_words = ["melissa", "cat"]
    all_scores = array_of_words.map { |one_word| self.score(one_word) }
    # => all_scores = [59, 59, 4, 6]

    all_scores.zip(array_of_words)
    # example: [[59, "pull"], [43, "cat"], [59, "yes"], [3, "andrea"], [7, "carlos"]]
  end
end
