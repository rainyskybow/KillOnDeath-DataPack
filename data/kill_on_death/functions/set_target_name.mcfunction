# 特定のプレイヤー名で監視対象を設定
# 使い方: 
#   1. このファイルの最後の行のプレイヤー名を編集
#   2. /function kill_on_death:set_target_name を実行

# 全員からタグを削除
tag @a remove target_player

# ★ここにプレイヤー名を指定してください★
# 例: tag Player123 add target_player

# デフォルト例（使用時は下記をコメントアウトして上記を有効化）
tellraw @a {"text":"[Kill on Death] エラー: プレイヤー名が指定されていません","color":"red"}
tellraw @a {"text":"set_target_name.mcfunction を編集してプレイヤー名を指定してください","color":"yellow"}
