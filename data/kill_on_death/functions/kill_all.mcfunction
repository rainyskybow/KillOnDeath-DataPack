# 全プレイヤーをキルし、死亡カウントをリセット

# 警告メッセージ
tellraw @a [{"selector":"@s","color":"red"},{"text":" が死亡しました！全員が道連れです...","color":"red"}]

# 全プレイヤーをキル
kill @a

# 実行者の死亡カウントをリセット
scoreboard players set @s deaths 0
