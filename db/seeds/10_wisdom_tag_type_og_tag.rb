wisdom_board_id = WisdomBoard.first.id

WisdomTypeOfTag.create(
  wisdom_board_id:,
  wisdom_tag_id: 1
)

WisdomTypeOfTag.create(
  wisdom_board_id:,
  wisdom_tag_id: 2
)
