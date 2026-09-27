# 毎tick実行される処理
# 「target_player」タグを持つプレイヤーの死亡をチェックし、全員をキル

# タグを持つプレイヤーが死亡したら全員キル
execute as @a[tag=target_player] if score @s deaths matches 1.. run function kill_on_death:kill_all
