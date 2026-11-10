# FreeLLMAPI: lo comprobado (repo github.com/tashfeenahmed/freellmapi, commit 4c8c2f8, 10/11/2026)

- **Qué es:** un router de código abierto (MIT) que corre en tu ordenador y junta los planes gratis de muchos
  proveedores detrás de un solo endpoint compatible con OpenAI y con la API de mensajes de Anthropic (por eso vale para
  Claude Code). Claves de proveedores cifradas (AES-256-GCM) en una base SQLite local; fuera solo sale una clave
  unificada `freellmapi-…`.
- **Cifras del README:** ~7.400 millones de tokens al mes, 34 proveedores gratis, 635 endpoints de modelos gratis,
  474 familias de modelos. Es la suma de todos los planes gratis.
- **Proveedores destacados en el README:** Google, Groq, Cerebras, OpenCode Zen, Mistral, OpenRouter, Cloudflare,
  Cohere, Z.ai (Zhipu), NVIDIA, HuggingFace, ModelScope (Qwen3, DeepSeek V4, GLM-5) y 22 más. En sus limitaciones nombra
  Gemini, DeepSeek V4 y Kimi K2.6 como los mejores del catálogo.
- **Salto de modelo:** el router elige el mejor modelo disponible y, si da 429/5xx, enfría esa clave y prueba el
  siguiente de la cadena. Conversaciones «pegajosas» 30 min en el mismo modelo.
- **Nota de traspaso (Context Handoff):** opcional, `FREELLMAPI_CONTEXT_HANDOFF=on_model_switch`. Al cambiar de modelo
  a mitad de conversación añade un mensaje de sistema: «estás retomando la conversación de otro modelo… no empieces de
  cero» + resumen reciente. En memoria, 3 h, nada en disco.
- **Instalación:** app de escritorio (`.dmg` arm64/x64, macOS 12+, `.exe` en Windows; escucha en 127.0.0.1:31415,
  sin contraseña) o Docker con `curl -fsSL https://freellmapi.co/install.sh | bash` (panel en :3001).
- **Claude Code:**
  - `npx freellmapi launch --url <url>`: abre Claude Code con las credenciales inyectadas solo en ese proceso, sin
    escribir nada en disco. Pide la clave en un recuadro oculto si no se pasa.
  - `npx freellmapi setup-claude --url <url>`: escribe `ANTHROPIC_BASE_URL`, `ANTHROPIC_AUTH_TOKEN` y los modelos en
    `~/.claude/settings.json` (perfil por defecto) o en `~/.claude/profiles/<nombre>/settings.json` con `--profile`.
    Hace copia de seguridad con fecha y admite `--dry-run`. Requiere Node ≥ 20.18.
- **Limitaciones (las del propio proyecto):** sin SLA, latencia variable, los mejores modelos tienen el cupo diario más
  pequeño (la «inteligencia» baja a lo largo del día y vuelve a medianoche UTC), los planes gratis cambian sin avisar.
  «Para experimentar y aprender, no para producción». Solo para un usuario; no exponerlo a internet.
- **Condiciones de uso (revisión del proyecto, mayo 2026):** Cohere ❌ (prohíbe uso personal); Gemini, NVIDIA, Z.ai y
  Cloudflare ⚠️; Groq, Cerebras, Mistral, OpenRouter, Zhipu ✅ probable. Reglas: una cuenta por proveedor, no revender,
  no compartir el endpoint.
- **Catálogo:** se actualiza solo desde freellmapi.co. Gratis: foto mensual (un modelo nuevo llega 30 días tarde).
  De pago (19 $/año): el mismo día.
