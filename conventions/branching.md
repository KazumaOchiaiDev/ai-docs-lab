# ブランチ規約（branching）v0.1

| 項目 | 内容 |
|---|---|
| 作成日 | 2026-08-26（作成過程規約 v0.4 から責務分離で切り出し） |
| 位置づけ | ブランチの命名・種別とマージ方式の規約。作業の流れ自体は作成過程規約（conventions/authoring-process.md）が定める |

## 命名

`<type>/<issue番号>-<slug>` で main から切る。例: `docs/1-canon`、`feature/3-mechanism-skeleton`、`exp/5-baseline`

## type

| type | 用途 |
|---|---|
| `docs` | 資料・規約・research の追加/変更 |
| `feature` | 機構（rules / skills / hooks / subagents / CI / テンプレート）の追加 |
| `fix` | 誤りの修正 |
| `exp` | 実験の実施と記録（experiments/） |
| `chore` | 設定・整理などその他 |

## マージ方式

- squash マージのみ。main の履歴を「1 Issue = 1 コミット」に保ち、マージ後のブランチは自動削除する
- main への直接 push はしない。すべて PR を経由する

## enforcement（規約は機構が守らせる）

- 導入済み: リポジトリ設定で squash 以外のマージを無効化、マージ後ブランチの自動削除
- 未導入（願望段階）: ブランチ命名の機械検査、main への直接 push のブロック（branch protection）
