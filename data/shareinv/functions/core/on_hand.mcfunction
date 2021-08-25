# 進捗リセット
advancement revoke @s only shareinv:on_hand

# ログイン時には0にログインしている場合は1になる
scoreboard players add @s SI.login 0

# ログイン時は自分のインベントリを最寄りのログイン済みのプレイヤーからpull
execute if score @s SI.login matches 0 as @a[limit=1,scores={SI.login=1}] run function shareinv:core/on_hand_change

# ログイン時以外の場合は自分のインベントリをほかのプレイヤーにpush
execute if score @s SI.login matches 1 if entity @s[tag=!SI.tmp] run function shareinv:core/on_hand_change

# ログインしていないプレイヤー含め全スコアボードのリセット
scoreboard players reset * SI.login

# ログインしているプレイヤーのみスコアを1に
scoreboard players set @a SI.login 1
