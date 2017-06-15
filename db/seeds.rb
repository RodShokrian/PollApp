# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(name: 'Jack')
  user2 = User.create(name: 'Rod')
  user3 = User.create(name: 'Kelly')

  Poll.destroy_all
  poll1 = Poll.create(author_id: user1.id, title: "the best jolly rancher flavor")
  poll2 = Poll.create(author_id: user2.id, title: "best TA")
  poll3 = Poll.create(author_id: user2.id, title: "what is a poll")

  Question.destroy_all
  question1 = Question.create(content: "what in your humble opnion is THE BEST jolly rancher flavor", poll_id: poll1.id)
  question2 = Question.create(content: "who is the best programmer out of all the TAs in AA", poll_id: poll2.id)
  question3 = Question.create(content: "yeah really, what is a poll", poll_id: poll3.id)

  AnswerChoice.destroy_all
  answerchoice1 = AnswerChoice.create(question_id: question1.id, answer: "watermelon")
  answerchoice2 = AnswerChoice.create(question_id: question1.id, answer: "sour apple")
  answerchoice3 = AnswerChoice.create(question_id: question1.id, answer: "grape")
  answerchoice4 = AnswerChoice.create(question_id: question2.id, answer: "Jules")
  answerchoice5 = AnswerChoice.create(question_id: question2.id, answer: "Louis")
  answerchoice6 = AnswerChoice.create(question_id: question2.id, answer: "Elliot")
  answerchoice7 = AnswerChoice.create(question_id: question3.id, answer: "a collection of data")
  answerchoice8 = AnswerChoice.create(question_id: question3.id, answer: "waste of time")
  answerchoice9 = AnswerChoice.create(question_id: question3.id, answer: "expensive guess")

  Response.destroy_all
  response1 = Response.create(answer_choice_id: answerchoice1.id, responder_id: user2.id)
  response2 = Response.create(answer_choice_id: answerchoice5.id, responder_id: user1.id)
  response3 = Response.create(answer_choice_id: answerchoice9.id, responder_id: user3.id)
  response4 = Response.create!(answer_choice_id: answerchoice2.id, responder_id: user1.id)
  response5 = Response.create!(answer_choice_id: answerchoice1.id, responder_id: user3.id)
  # response6 = Response.create!(answer_choice_id: answerchoice3.id, responder_id: user2.id)

end
