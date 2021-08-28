# SI.login | 0 = ログインした直後, 1 = 死亡中⋁生存中, 2 = 生存中
# 進捗リセット
advancement revoke @s only shareinv:on_hand

# ログイン時には0にログインしている場合は1になる
scoreboard players add @s SI.PlayerState 0

# ログイン時は自分のインベントリを最寄りの生存中のプレイヤーからpull
execute if score @s SI.PlayerState matches 0 as @a[limit=1,scores={SI.PlayerState=2}] run function shareinv:core/on_hand_change

# ログイン時以外の場合は自分のインベントリをほかのプレイヤーにpush
execute if score @s SI.PlayerState matches 1..2 if entity @s[tag=!SI.tmp] run function shareinv:core/on_hand_change

# ログインしていないプレイヤー含め全スコアボードのリセット
scoreboard players set * SI.PlayerState 0

# ログインしているプレイヤーのみスコアを1に
scoreboard players set @a SI.PlayerState 1

# 生きているプレイヤーのスコアを2に
scoreboard players set @e[type=player] SI.PlayerState 2