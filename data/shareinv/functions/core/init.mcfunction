# 初回ログイン時に起動し初期化
execute unless data storage si: {version:2} run scoreboard objectives add SI.PlayerState dummy
execute unless data storage si: {version:2} run data modify storage si: version set value 2

# scoreboard objectives add death dummy