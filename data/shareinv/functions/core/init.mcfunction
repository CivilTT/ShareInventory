# 初回ログイン時に起動し初期化
execute if data storage si: {version:1} run scoreboard objectives add SI.login dummy
execute if data storage si: {version:1} run data modify storage si: version set value 1