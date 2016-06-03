User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

users = [
  {username: "Alice", email: "alice@alice.com", password: "0000"},
  {username: "Ena", email: "ena@ena.com", password: "0000"},
  {username: "David", email: "david@david.com", password: "0000"},
  {username: "Joe", email: "joe@joe.com", password: "0000"},
  # {username: "Homer", email: "homer@homer.com", password: "0000"},
  # {username: "Marge", email: "marge@marge.com", password: "0000"},
  # {username: "Lisa", email: "lisa@lisa.com", password: "0000"}
]

User.create!(users)


questions = [
{title: "What should I pack?", body: "I dont know what to pack.", user: User.first},
{title: "Going on a cruise", body: "What should I take on a cruise?.", user: User.first},
{title: "Moving", body: "How should I pack my kitchen stuff when I move?", user: User.first},
{title: "Camping in the rain", body: "I am going camping in the rain, what should I bring?", user: User.second},
{title: "Packing for cold weather", body: "Moving to Siberia, what kind of coat should I bring?", user: User.third},
{title: "Running away forever", body: "Any tips on what to pack for life on the road?", user: User.fourth}
]

Question.create!(questions)

answers = [
{body: "This question is great.", is_best: false, user: User.first, question: Question.first},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.first},
{body: "In giant tupperware.", is_best: true, user: User.third, question: Question.first},
{body: "Money and bear repelent.", is_best: false, user: User.fourth, question: Question.first},

{body: "This question is great.", is_best: true, user: User.first, question: Question.second},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.second},
{body: "In giant tupperware.", is_best: false, user: User.third, question: Question.second},
{body: "Money and bear repelent.", is_best: false, user: User.fourth, question: Question.second},

{body: "This question is great.", is_best: false, user: User.first, question: Question.third},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.third},
{body: "In giant tupperware.", is_best: true, user: User.third, question: Question.third},
{body: "Money and bear repelent.", is_best: false, user: User.fourth, question: Question.third},

{body: "This question is great.", is_best: true, user: User.first, question: Question.fourth},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.fourth},
{body: "In giant tupperware.", is_best: false, user: User.third, question: Question.fourth},
{body: "Money and bear repelent.", is_best: false, user: User.fourth, question: Question.fourth},

{body: "This question is great.", is_best: true, user: User.first, question: Question.fifth},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.fifth},
{body: "In giant tupperware.", is_best: false, user: User.third, question: Question.fifth},
{body: "Money and bear repelent.", is_best: false, user: User.fourth, question: Question.fifth},

{body: "This question is great.", is_best: false, user: User.first, question: Question.last},
{body: "Do not pack anything.", is_best: false, user: User.second, question: Question.last},
{body: "In giant tupperware.", is_best: false, user: User.third, question: Question.last},
{body: "Money and bear repelent.", is_best: true, user: User.fourth, question: Question.last},

]

Answer.create!(answers)


# comments = [
# {body: "This is a horrible question.", user: user.first},
# {body: "This answer is irrelevant.", user: user.first},
# {body: "Great question.", user: user.first},
# {body: "I like packing.", user: user.first}

# ]

# Comment.create!(comments)


Question.all.each do |question|
  5.times do
    user_index = rand(4)
    comment = question.comments.build(
     body: Faker::Hipster.sentence,
     # comment_count: rand(1000),
     user: User.all[user_index],
     created_at: Time.now - rand(20000))
    comment.save
    # vote_count = rand(100)
    # vote_count.times do
      # comment.votes.build(value: 1)

    # end
  end
end

Answer.all.each do |question|
  5.times do
    user_index = rand(4)
    comment = question.comments.build(
     body: Faker::Hipster.sentence,
     # comment_count: rand(1000),
     user: User.all[user_index],
     created_at: Time.now - rand(20000))
    comment.save
    # vote_count = rand(100)
    # vote_count.times do
      # comment.votes.build(value: 1)

    # end
  end
end


# comment1 = answer1.comments.build(body: "I hate toothbrushes", user: user1)