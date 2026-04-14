# Termux Toolkit

Termux 環境備份、還原、新機安裝的互動式選單工具。

## 一鍵安裝（新機或重裝後使用）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/wengchengchan/termux-toolkit/main/install.sh)
```

安裝完成後執行：

```bash
source ~/.bashrc
tm-backup
```

## 功能選單

```
╔══════════════════════════════════════╗
║     Termux 備份 & 還原 管理工具      ║
╚══════════════════════════════════════╝

  1. 快速備份（必備項目）
  2. 完整備份（含 ClawTeam、bin）
  3. 從備份還原設定檔
  4. 新機安裝設定精靈
  5. 查看系統狀態
  6. 刪除舊備份
  0. 離開
```

| 選項 | 說明 |
|------|------|
| **1 快速備份** | 打包 `.bashrc` `.hermes` `.claude` `claude-mem`，存到 `/sdcard/Download/termux-backup-日期/` |
| **2 完整備份** | 同上 + `bin/` `ClawTeam-OpenClaw/` |
| **3 從備份還原** | 列出所有備份，選擇解壓縮還原 |
| **4 新機安裝精靈** | 全自動安裝：套件 → proot ubuntu → Bun → symlink → claude-mem → Hermes |
| **5 系統狀態** | tmux、worker、記憶體、磁碟、備份清單 |
| **6 刪除備份** | 選擇刪除（有確認步驟），自動保留最近 5 份 |

## 新機換機 SOP（快速版）

1. 安裝 Termux（從 F-Droid，不要用 Play Store）
2. 執行一鍵安裝指令（見上方）
3. 開啟 `tm-backup`，選 **4. 新機安裝設定精靈**
4. 等精靈跑完後，選 **3. 從備份還原**（還原舊設定）
5. `source ~/.bashrc` 重新載入環境

## 備份位置

```
/sdcard/Download/termux-backup-YYYYMMDD_HHMM/
├── bashrc.tar.gz
├── hermes.tar.gz
├── claude.tar.gz
├── claude-mem.tar.gz
├── bin.tar.gz          # 完整備份才有
├── clawteam.tar.gz     # 完整備份才有
└── backup.info
```

## 環境需求

- Android 7+
- Termux（F-Droid 版本）
- 網路連線（首次安裝時需下載套件）
