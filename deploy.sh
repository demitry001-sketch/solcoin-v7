#!/bin/bash
# ═══════════════════════════════════════════════════════
# SOLCOIN V7 — Deploy Script (GitHub + Vercel)
# Uso: bash deploy.sh
# ═══════════════════════════════════════════════════════

set -e

# ── COLORES ──────────────────────────────────────────────
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "  ╔═══════════════════════════════════════╗"
echo "  ║    🌐 SOLCOIN V7 — DEPLOY SCRIPT     ║"
echo "  ╚═══════════════════════════════════════╝"
echo -e "${NC}"

# ── STEP 1: Git init ─────────────────────────────────────
echo -e "${YELLOW}[1/5] Inicializando repositorio Git...${NC}"
if [ ! -d ".git" ]; then
  git init
  echo -e "${GREEN}✅ Git inicializado${NC}"
else
  echo -e "${GREEN}✅ Git ya existe${NC}"
fi

# ── STEP 2: Git config check ──────────────────────────────
echo -e "${YELLOW}[2/5] Verificando configuración Git...${NC}"
if [ -z "$(git config user.email)" ]; then
  echo -e "${RED}⚠  Configura tu email:${NC}"
  read -p "  Email Git: " GIT_EMAIL
  git config user.email "$GIT_EMAIL"
fi
if [ -z "$(git config user.name)" ]; then
  read -p "  Nombre Git: " GIT_NAME
  git config user.name "$GIT_NAME"
fi
echo -e "${GREEN}✅ Git configurado${NC}"

# ── STEP 3: Commit ────────────────────────────────────────
echo -e "${YELLOW}[3/5] Creando commit...${NC}"
git add .
git commit -m "🚀 SOLCOIN V7 — Sistema Biológico Completo + Animaciones 3D

Nuevos sistemas implementados:
- 🌍 Animaciones de ataques en globo Three.js (arcos + explosiones)
- 🔬 6 Investigaciones biológicas desbloqueables
- ⚓ 3 Ataques marítimos (Portaaviones, Submarino, Acorazado)
- 🏖 5 Habilidades especiales de Puerto
- 🌍 5 Eventos pandémicos aleatorios
- 🧫 4 Etapas de cadenas biológicas + 4 mutaciones
- 🤝 5 Tipos de alianzas defensivas
- 🏖️ Puerto Biológico + Crucero Infeccioso
- 💉 Vacunación Paciente 0 + 🧟 Paciente Cero
- 🏙 Ciudades 3D integradas
- 🎰 SOLCOIN CASINO con animación neón
- 📱 Mobile-responsive con módulos colapsables

Total: 28+ nuevos elementos estratégicos"

echo -e "${GREEN}✅ Commit creado${NC}"

# ── STEP 4: GitHub push ───────────────────────────────────
echo -e "${YELLOW}[4/5] Subiendo a GitHub...${NC}"
echo ""
echo -e "${CYAN}  📋 Instrucciones:${NC}"
echo "  1. Ve a https://github.com/new"
echo "  2. Nombre del repo: solcoin-v7"
echo "  3. Selecciona 'Private' o 'Public'"
echo "  4. NO inicialices con README (ya tienes uno)"
echo "  5. Copia la URL del repo"
echo ""
read -p "  Pega la URL del repo GitHub (ej: https://github.com/usuario/solcoin-v7): " GITHUB_URL

if [ -n "$GITHUB_URL" ]; then
  git branch -M main
  git remote add origin "$GITHUB_URL" 2>/dev/null || git remote set-url origin "$GITHUB_URL"
  git push -u origin main
  echo -e "${GREEN}✅ Subido a GitHub: $GITHUB_URL${NC}"
else
  echo -e "${RED}⚠  URL vacía — saltando GitHub push${NC}"
fi

# ── STEP 5: Vercel deploy ─────────────────────────────────
echo ""
echo -e "${YELLOW}[5/5] Deploy a Vercel...${NC}"

if command -v vercel &> /dev/null; then
  echo -e "${GREEN}✅ Vercel CLI encontrado${NC}"
  echo ""
  echo "  Iniciando deploy..."
  vercel --prod
else
  echo -e "${YELLOW}  Vercel CLI no instalado. Instalando...${NC}"
  npm install -g vercel
  vercel --prod
fi

echo ""
echo -e "${CYAN}"
echo "  ╔═══════════════════════════════════════════╗"
echo "  ║  ✅ SOLCOIN V7 DEPLOYADO EXITOSAMENTE    ║"
echo "  ║                                           ║"
echo "  ║  🐙 GitHub : $GITHUB_URL"
echo "  ║  🌐 Vercel : ver output arriba            ║"
echo "  ╚═══════════════════════════════════════════╝"
echo -e "${NC}"
