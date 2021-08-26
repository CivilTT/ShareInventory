# ログインor復活したプレイヤーがいたら中身を生存中のプレイヤーのインベントリと同期させる
execute if entity @a[limit=1,scores={SI.login=0..1}] as @a[limit=1,scores={SI.login=2}] run function shareinv:core/on_hand_change

# ログインしていないプレイヤー含め全スコアボードのリセット
scoreboard players set * SI.login 0

# ログインしているプレイヤーのみスコアを1に
scoreboard players set @a SI.login 1

# 生きているプレイヤーのスコアを2に
scoreboard players set @e[type=player] SI.login 2