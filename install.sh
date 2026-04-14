#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  Termux Toolkit — 一鍵安裝腳本
#  用法：bash <(curl -fsSL https://raw.githubusercontent.com/wengchengchan/termux-toolkit/main/install.sh)
# ============================================================

REPO="https://raw.githubusercontent.com/wengchengchan/termux-toolkit/main"
BIN_DIR="$HOME/bin"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'; BOLD='\033[1m'

ok()   { echo -e "${GREEN}[✅]${NC} $1"; }
info() { echo -e "${YELLOW}[→]${NC} $1"; }
err()  { echo -e "${RED}[❌]${NC} $1"; }

echo -e "\n${BOLD}Termux Toolkit 安裝程式${NC}\n"

# ── 修復套件依賴問題（新機常見） ─────────────────────────────
info "檢查套件依賴..."
apt --fix-broken install -y 2>&1 | grep -E "newly installed|already|Error" | head -3

# ── 確保 curl 已安裝 ─────────────────────────────────────────
if ! command -v curl >/dev/null 2>&1; then
    info "安裝 curl..."
    pkg install curl -y 2>&1 | tail -3
fi

# ── 確保 ~/bin 目錄存在 ──────────────────────────────────────
mkdir -p "$BIN_DIR"

# ── 下載 tm-backup ───────────────────────────────────────────
info "下載 tm-backup..."
curl -fsSL "$REPO/tm-backup" -o "$BIN_DIR/tm-backup"
if [ $? -eq 0 ]; then
    chmod +x "$BIN_DIR/tm-backup"
    ok "tm-backup 安裝完成：$BIN_DIR/tm-backup"
else
    err "下載失敗，請確認網路連線"
    exit 1
fi

# ── 確認 ~/bin 在 PATH ───────────────────────────────────────
if ! grep -q 'PATH.*home/bin\|home/bin.*PATH' "$HOME/.bashrc" 2>/dev/null; then
    info "將 ~/bin 加入 PATH..."
    echo 'export PATH=/data/data/com.termux/files/home/bin:$PATH' >> "$HOME/.bashrc"
fi

# ── 完成 ─────────────────────────────────────────────────────
echo ""
ok "安裝完成！"
echo ""
echo -e "  立即執行：${BOLD}source ~/.bashrc && tm-backup${NC}"
echo ""
