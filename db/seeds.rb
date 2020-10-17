# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Choice.delete_all
Question.delete_all
FavQuiz.delete_all
Quiz.delete_all
Card.delete_all
FavDeck.delete_all
Deck.delete_all

20.times  do |i|
  response = Unirest.get("https://opentdb.com/api.php?amount=10&category=13&type=multiple")
  hash = response.body
  length = hash["results"].length
  q = Quiz.create(category: hash["results"][0]["category"], title: "#{hash["results"][0]["category"]} #{i+1}", user_created_id: 1)
  count = 0
  while count < length
    qq_1 = Question.create(content: hash["results"][count]["question"], quiz_id: q.id)
    cc_1 = Choice.create(content: hash["results"][count]["correct_answer"], answer: true, question_id: qq_1.id)
    cc_2 = Choice.create(content: hash["results"][count]["incorrect_answers"][0], answer: false, question_id: qq_1.id )
    cc_3 = Choice.create(content: hash["results"][count]["incorrect_answers"][1], answer: false, question_id: qq_1.id )
    cc_4 = Choice.create(content: hash["results"][count]["incorrect_answers"][2], answer: false, question_id: qq_1.id )
    count += 1
  end
end


#### QUIZ DATA ####

quiz = Quiz.create(category: "Geography", title: "US States", user_created_id: 1)

q_1 = Question.create(content: "What is the largest state in the US?", quiz_id: quiz.id)

Choice.create(content: "Texas", answer: false, question_id: q_1.id)
Choice.create(content: "New York", answer: false, question_id: q_1.id)
Choice.create(content: "Alaska", answer: true, question_id: q_1.id)
Choice.create(content: "California", answer: false, question_id: q_1.id)


q_2 = Question.create(content: "What is the smallest state in the US?", quiz_id: quiz.id)

Choice.create(content: "Hawaii", answer: false, question_id: q_2.id)
Choice.create(content: "Rhode Island", answer: true, question_id: q_2.id)
Choice.create(content: "Conecticut", answer: false, question_id: q_2.id)
Choice.create(content: "Delaware", answer: false, question_id: q_2.id)


q_3 = Question.create(content: "What is the wealthiest state in the US?", quiz_id: quiz.id)

Choice.create(content: "California", answer: true, question_id: q_3.id)
Choice.create(content: "New York", answer: false, question_id: q_3.id)
Choice.create(content: "Texas", answer: false, question_id: q_3.id)
Choice.create(content: "Florida", answer: false, question_id: q_3.id)



############# FLASH CARD DATA ###############

d = Deck.create(category: "Ruby", title: "RegEx", img_url:"", user_created_id: 1)

Card.create(front: ".", back: "Match any character", deck_id: d.id)
Card.create(front: "\\", back: "Escape regex special characters", deck_id: d.id)
Card.create(front: "character class delimiter", back: "[]  ex. Would look to match any 1 of the set [aeiou] [A-Z] [a-z]", deck_id: d.id)
Card.create(front: "create a range within a character class", back: "-  ex. [a-z] [A-Z] [0-9]", deck_id: d.id)
Card.create(front: "invert the set of characters in a class, i.e. 'not'", back: "^  ex. [^0-9] [^a-z]", deck_id: d.id)
Card.create(front: "anchor that matches the position before the first character of the line", back: "\A or ^  ex. In ruby \A matches the start of the entire string, compared to ^ which will match the start of any line", deck_id: d.id)
Card.create(front: "Anchor that matches the position after the last character of the string", back: "\z or $  ex. In ruby \z matches the end of the entire string, compared to $ which will match the end of any line", deck_id: d.id)
Card.create(front: "Anchor that ensures that the following characters match `pattern`, but doesn't include those characters in the matched text", back: "(?=pattern)  ex. positive lookahead", deck_id: d.id)
Card.create(front: "Anchor that ensures that the preceding characters match `pattern`, but does not include those characters in the matched text", back: "(?<=pattern)  ex. positive lookbehind", deck_id: d.id)
Card.create(front: "Anchor that ensures that the following characters do not match `pattern` but doesn't include them in the matched text", back: "(?!pattern)  ex. negative lookahead", deck_id: d.id)


d2 = Deck.create(category: "Ruby", title: "Enumerables", img_url: "", user_created_id: 1)

Card.create(front: "all? { |obj| block } => true or false", back: "Returns true if the block never returns false or nil", deck_id: d2.id)
Card.create(front: "any? { |obj| block } => true or false", back: "Returns true if the block ever returns a value other than false or nil", deck_id: d2.id)
Card.create(front: "map { |obj| block } => array", back: "Returns a new array with the results of running block once for every element in enum", deck_id: d2.id)
Card.create(front: "count { |obj| block } => int", back: "Returns true if the block never returns false or nil", deck_id: d2.id)
Card.create(front: "find(ifnone = nil) { |obj| block } => obj or nil", back: "returns the first for which block is not false", deck_id: d2.id)
Card.create(front: "find_all { |obj| block } => array", back: "alias for `select`", deck_id: d2.id)
Card.create(front: "include?(obj) => true or false", back: "returns true if any member of enum equals obj", deck_id: d2.id)
Card.create(front: "none? { |obj| block } => true or false", back: "returns true if the block never returns true for all elements", deck_id: d2.id)

d3 = Deck.create(category: "Ruby", title: "General Ruby", img_url: "", user_created_id: 1)

Card.create(front: "Check whether a value would be included in a given range", back: "cover?(obj) => true or false  ex.(0..100).cover? 50 #=> true  (0..100).cover? 50.5 #=> true", deck_id: d3.id)
Card.create(front: "Quotes used with string interpolation", back: "\" double quote", deck_id: d3.id)
Card.create(front: "Ternary syntax", back: "expression ? true_value : false_value", deck_id: d3.id)
Card.create(front: "Nameless methods that are passed to methods as a parameter", back: "blocks", deck_id: d3.id)

