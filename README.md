# Kill on Death データパック

Minecraft Java Edition用のデータパックです。
特定プレイヤーが死亡すると、全プレイヤーがキルされるデータパックです。

## 構造
```
KillOnDeath-DataPack
├── pack.mcmeta
├── data/
│   ├── kill_on_death/
│   │   └── functions/
│   │       ├── load.mcfunction        # 初期化
│   │       ├── tick.mcfunction        # 毎tick監視
│   │       └── kill_all.mcfunction    # 全員キル処理
│   └── minecraft/
│       └── tags/
│           └── functions/
│               ├── load.json          # ロード時自動実行
│               └── tick.json          # 毎tick自動実行
```

## 使い方

### 1. データパックのインストール
1. `KillOnDeath-DataPack` フォルダを、ワールドの `datapacks` フォルダにコピー
   - 場所: `.minecraft/saves/[ワールド名]/datapacks/`
2. ゲーム内で `/reload` コマンドを実行

### 2. 監視対象プレイヤーの設定（3つの方法）

#### 方法A: 自分を監視対象にする（推奨）
```
/function kill_on_death:set_target
```
実行したプレイヤーが監視対象になります。

#### 方法B: プレイヤー名で指定
```
/tag Player123 add target_player
```
`Player123` の部分を監視したいプレイヤー名に変更してください。

#### 方法C: ファイル編集で指定
`set_target_name.mcfunction` を編集してプレイヤー名を指定し、
```
/function kill_on_death:set_target_name
```
を実行します。

### 3. その他の便利コマンド

#### 現在の監視対象を確認
```
/function kill_on_death:check_target
```

#### 監視対象を解除
```
/function kill_on_death:clear_target
```

### 4. 動作確認
- 監視対象プレイヤーが死亡すると、全プレイヤーが即座にキルされます
- チャットに警告メッセージが表示されます

## 仕組み

1. **タグシステム**: `target_player` タグを持つプレイヤーを監視
2. **スコアボード作成**: `deaths` (deathCount型) で死亡回数を追跡
3. **毎tick監視**: タグ付きプレイヤーの `deaths` が1以上になったら発動
4. **全員キル**: `/kill @a` で全プレイヤーをキル
5. **リセット**: 監視対象プレイヤーの死亡カウントを0にリセット

## 注意事項
- **コマンドで動的に変更可能**: ゲーム中にいつでも監視対象を変更できます
- **1人のみ監視**: 複数人にタグを付けると全員が監視対象になります
- Java Edition 1.20.5以降対応（pack_format: 48）
- 監視対象がいない場合は何も起こりません

## カスタマイズ
- **メッセージ変更**: `kill_all.mcfunction` の `tellraw` コマンドを編集
- **キル対象変更**: `kill @a` を `kill @a[team=...]` など条件付きに変更可能
- **タグ名変更**: `target_player` を別の名前に変更可能（全ファイルで統一する必要あり）

## 応用例

### 複数人を同時に監視
```
/tag Player1 add target_player
/tag Player2 add target_player
```
どちらかが死んだら全員キルされます。

### チーム単位で監視
`tick.mcfunction` を編集:
```mcfunction
execute as @a[team=red,tag=target_player] if score @s deaths matches 1.. run function kill_on_death:kill_all
```
## ライセンス
MIT LICENSE
