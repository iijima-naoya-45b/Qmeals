user_id = User.first.id

FavoriteWisdom.create(
  user_id:,
  wisdom_board_id: 1
)

FavoriteWisdom.create(
  user_id:,
  wisdom_board_id: 2
)
