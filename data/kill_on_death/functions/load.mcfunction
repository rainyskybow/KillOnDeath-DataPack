# 初期化処理
# スコアボード「deaths」を作成（死亡回数を記録）
scoreboard objectives add deaths deathCount

# ロード完了メッセージ
tellraw @a {"text":"[Kill on Death] データパックが読み込まれました","color":"green"}
tellraw @a {"text":"特定プレイヤーが死亡すると全員がキルされます","color":"yellow"}
