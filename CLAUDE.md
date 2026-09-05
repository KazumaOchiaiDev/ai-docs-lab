# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリは何か

「AI駆動開発時代のドキュメント論」の**個人研究プロジェクト**。コードではなく研究文書のリポジトリであり、ビルド・テストコマンドは存在しない（資料 lint や QA ハーネスは ROADMAP の M3 で施策とセットで導入予定。先回りして導入しない）。

最終ゴール: 研究成果を Zenn 記事シリーズ化（転職ポートフォリオ）+ 実務の AWS 設計書への適用。期限なしの**マイルストーン型**で管理し、進行状態と次のアクションはすべて `ROADMAP.md` が正典。**作業再開時はまず ROADMAP.md を読む**（experiments/ ができた後は、その最後のファイルも読む）。

## 構成と各文書の役割

- `ROADMAP.md` — マスタープラン。M0（完了）→ M1 公開リポジトリ基盤 → M2 ベースライン測定 → M3 実験サイクル×N → M4 体系v1
- `research/2026-08-25_先行調査_*.md` — 問題意識8つと既存手法の対応マップ。**他文書から「§8」等で参照される節番号はこの文書の節**を指す
- `research/2026-08-25_評価設計_*.md` — 効果測定の3層構造（静的メトリクス / AIハーネス / 実務アウトカム）。実験は「ベースライン先行・1回に1施策」
- `research/2026-08-25_設計_ClaudeCode実装レイヤー.md` — rules / skills / subagents / hooks / MCP / CI の設計仕様。M1 以降に実装するものの正典
- `research/2026-08-25_文献マップ_*.md` — 記事執筆時の引用元となる学術論文カタログ（約90本）

このリポジトリは M1 で `ai-docs-lab`（仮）として GitHub 公開され、canon.md / conventions/ / templates/ / experiments/ / harness/ / sample-project/ が加わる予定。

## 書くときの規律（このプロジェクト自身の研究成果を自分に適用する）

1. **会社由来の情報は一切書かない**: 社名・実構成・実パラメータ・人名・議事録内容。公開実験はすべて架空のサンプル AWS 構成で行う。これは絶対規律
2. **技術的主張には一次情報の出典リンクを付ける**: 研究文書は自らの出典規約（先行調査 §8）の実践例でもある
3. **研究文書は追記型**: 大幅な書き換えではなく日付付き追記で更新する（例: 「2026-08-25 追記」）。実験ログ・ADR も同様の追記型
4. **実験は記事のネタ元（1対1は強制しない）、失敗した施策も成功と同価値で記録する**: 「効かなかった」という結果を消したり美化したりしない
5. ファイル命名: `research/` は `YYYY-MM-DD_種別_タイトル.md`。文書は日本語 + Mermaid 図

## 作業の回し方

すべての作成・修正は `conventions/authoring-process.md` の一周ループ（Issue → ブランチ → 作成・修正ループ → PR → Agent チェック → 人間レビュー → squash マージ）で回す。main への直接 push はしない。ブランチ命名は `conventions/branching.md`、Issue / PR の書式は `conventions/issue-pr-format.md` に従う。

## 中核原則

「**規約は機構が守らせる**」——規約を導入するときは必ず enforcement（rules / skill / hook / subagent / CI）をセットで実装する。機構のない規約はまだ願望。この CLAUDE.md 自体も設計仕様の「薄い constitution（50行以内）」規律に従う。詳細規約は将来 `.claude/rules/` に path-scoped で置く。
