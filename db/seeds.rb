def give_username
  username = ""
  2.times do
    choice = rand(5)
    case choice
    when 0
      add = Faker::Ancient.god
    when 1
      add = Faker::Ancient.primordial
    when 2
      add = Faker::Ancient.titan
    when 3
      add = Faker::Hacker.noun.capitalize
    when 4
      add = Faker::Hacker.verb.capitalize
    end
    username << add
  end
  username
end

100.times do
  # TODO: change hashed_password to password
  User.create(username: give_username, email: Faker::Internet.safe_email, hashed_password: 'password')
end

100.times do
  question = Question.create(title: Faker::TwinPeaks.quote, body: Faker::Hipster.paragraph, author: User.all.sample)
  rand(10).times do
    question.votes.create(value: [1, -1].sample, voter: User.all.sample)
  end
  comment = Comment.create(body: Faker::Hipster.sentence, commentable: question, commenter: User.all.sample)
  rand(10).times do
    comment.votes.create(value: [1, -1].sample, voter: User.all.sample)
  end
end

100.times do
  answer = Answer.create(body: Faker::Hacker.say_something_smart, responder: User.all.sample, question: Question.all.sample)
  rand(10).times do
    answer.votes.create(value: [1, -1].sample, voter: User.all.sample)
  end
  comment = Comment.create(body: Faker::Hipster.sentence, commentable: answer, commenter: User.all.sample)
  rand(10).times do
    comment.votes.create(value: [1, -1].sample, voter: User.all.sample)
  end
end


