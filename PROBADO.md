# Qué está comprobado

- 10/11/2026, leyendo el repo github.com/tashfeenahmed/freellmapi (commit 4c8c2f8): README, docs/en (instalación,
  clientes, arquitectura, condiciones de uso) y el código del comando `npx freellmapi` (cli/src). Las cifras, los
  comandos y lo que escribe cada uno salen de ahí (resumen en `ref/freellmapi.md`).
- `setup-claude` sin `--profile` escribe en `~/.claude/settings.json`; con `--profile` en
  `~/.claude/profiles/<nombre>/settings.json`. `launch` no escribe nada en disco (código de cli/src/tools.ts e index.ts).
- La nota de traspaso es `FREELLMAPI_CONTEXT_HANDOFF=on_model_switch` (server/src/services/context-handoff.ts).
- `scripts/comprobar.sh` probado en macOS.

## Sin probar todavía

- La instalación real (app de escritorio o Docker) y una sesión de Claude Code contra FreeLLMAPI: no se ha instalado en
  el Mac donde se escribió la skill.
- Cómo encender la nota de traspaso en la app de escritorio (la documentación solo lo explica con `.env`).
- Qué modelos gratis concretos funcionan bien con las herramientas de Claude Code (leer y editar archivos): depende del
  modelo y del día.
