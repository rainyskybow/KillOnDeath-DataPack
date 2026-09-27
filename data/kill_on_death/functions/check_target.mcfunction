# 現在の監視対象を確認
# 使い方: /function kill_on_death:check_target

# 監視対象がいる場合
execute if entity @a[tag=target_player] run tellraw @s [{"text":"[Kill on Death] 現在の監視対象: ","color":"gold"},{"selector":"@a[tag=target_player]","color":"yellow"}]

# 監視対象がいない場合
execute unless entity @a[tag=target_player] run tellraw @s {"text":"[Kill on Death] 現在監視対象はいません","color":"gray"}
