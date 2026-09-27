# 監視対象プレイヤーを設定
# 使い方: /function kill_on_death:set_target
# 実行者を監視対象に設定します

# 全員からタグを削除
tag @a remove target_player

# 実行者にタグを付与
tag @s add target_player

# メッセージ表示
tellraw @a [{"text":"[Kill on Death] ","color":"gold"},{"selector":"@s","color":"yellow"},{"text":" が監視対象に設定されました","color":"green"}]
tellraw @s {"text":"あなたが死亡すると全員が道連れになります！","color":"red","bold":true}
