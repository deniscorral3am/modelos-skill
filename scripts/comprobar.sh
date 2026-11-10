#!/usr/bin/env bash
# Comprueba lo que necesita /modelos: Node 20+, Claude Code y FreeLLMAPI funcionando (app o Docker).
# Solo lee: no instala ni cambia nada.
ok(){ printf '  ✓ %s\n' "$1"; }; ko(){ printf '  ✗ %s\n' "$1"; }; av(){ printf '  · %s\n' "$1"; }
echo "Comprobando el ordenador…"
echo "  Sistema: $(uname -s) $(uname -m)"

if command -v node >/dev/null 2>&1; then
  V=$(node -v | sed 's/^v//'); M=${V%%.*}
  if [ "$M" -ge 20 ] 2>/dev/null; then ok "Node $V"; else ko "Node $V es antiguo: hace falta 20 o superior (nodejs.org)"; fi
else ko "Falta Node 20 o superior (nodejs.org o brew install node)"; fi

if command -v claude >/dev/null 2>&1; then ok "Claude Code $(claude --version 2>/dev/null | head -1)"
else ko "No veo Claude Code (claude.com/claude-code)"; fi

if [ -d "/Applications/FreeLLMAPI.app" ]; then ok "App FreeLLMAPI instalada"; else av "No veo la app FreeLLMAPI en Aplicaciones"; fi
if command -v docker >/dev/null 2>&1; then ok "Docker disponible (opción servidor)"; else av "Sin Docker (no hace falta con la app de escritorio)"; fi

ENC=""
for U in http://127.0.0.1:31415 http://localhost:3001; do
  C=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 "$U" 2>/dev/null)
  if [ -n "$C" ] && [ "$C" != "000" ]; then ok "FreeLLMAPI responde en $U"; ENC=$U; fi
done
[ -z "$ENC" ] && av "FreeLLMAPI no responde todavía (ni en :31415 de la app ni en :3001 de Docker)"

if [ -f "$HOME/.claude/settings.json" ] && grep -q "ANTHROPIC_BASE_URL" "$HOME/.claude/settings.json" 2>/dev/null; then
  av "Ojo: ~/.claude/settings.json ya cambia la dirección de Claude (ANTHROPIC_BASE_URL). Revísalo antes de seguir"
fi
