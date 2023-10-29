user_id = User.first.id

Recipe.create(
  user_id:,
  title: '美味しいカレーライス',
  content: 'あのカレーが短時間でできる！？',
  cooking_time: 10
)

user_id = User.second.id
Recipe.create(
  user_id:,
  title: 'たこわさ',
  content: 'ビールのお供に！！',
  cooking_time: 5
)
