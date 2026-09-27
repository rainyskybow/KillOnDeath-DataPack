# 監視対象をクリア（全員から解除）
# 使い方: /function kill_on_death:clear_target

# 全員からタグを削除
tag @a remove target_player

# メッセージ表示
tellraw @a {"text":"[Kill on Death] 監視対象がクリアされました","color":"green"}
