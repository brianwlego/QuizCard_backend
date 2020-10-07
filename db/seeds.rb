# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Quiz.delete_all
Question.delete_all
Choice.delete_all



quiz = Quiz.create(category: "Geography", title: "US States")

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





