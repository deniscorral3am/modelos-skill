# Cómo meter cientos de modelos gratis en tu Claude Code (con FreeLLMAPI)

Por Denís Corral · @deniscorralvillarraso en Instagram · [Sell Your AI](https://sellyourai.io)

FreeLLMAPI es un proyecto de código abierto (github.com/tashfeenahmed/freellmapi) que junta los planes gratis de unos
34 proveedores de IA (Gemini, Mistral, GLM, Kimi, DeepSeek, Qwen…) detrás de una sola clave. Según su web: 635 modelos
gratis y unos 7.400 millones de tokens al mes si te registras en todos. Cuando un modelo se queda sin cupo, salta al
siguiente, y puede dejarle una nota al nuevo para que no empiece de cero.

Así, cuando se te acaba Claude, abres Claude Code con esos modelos y sigues trabajando.

## Antes de pegarlo, lee esto

- **Con esto ya no piensa Claude.** Claude Code sigue siendo la herramienta, pero responde otro modelo gratis. Para
  tareas sencillas va bien; para lo importante, Claude es mejor.
- **No le pases datos privados** (clientes, contraseñas, contratos, salud, banco). Lo que mandas va a planes gratis y
  muchos pueden usarlo para mejorar sus modelos.
- **Es para uso personal y para probar**, no para dar servicio a clientes encima.
- **No salta solo desde tu Claude:** cuando se te acaba, abres tú la sesión con los gratis (es un comando).

Pega en Claude Code todo lo que hay dentro del recuadro. ¿Prefieres la versión completa? Instala la skill:
`git clone https://github.com/deniscorral3am/modelos-skill ~/.claude/skills/modelos` y escribe `/modelos`.

---

```
Quiero usar modelos gratis dentro de Claude Code con FreeLLMAPI (github.com/tashfeenahmed/freellmapi). Guíame paso a
paso, en español, corto y sin tecnicismos, una sola cosa cada vez. Nunca me pidas claves por el chat: las pego yo en el
panel de FreeLLMAPI o en un recuadro oculto. No inventes comandos: si dudas, lee el README y docs/en del repo.

ANTES DE EMPEZAR
- Recuérdame en dos líneas que con esto ya no piensa Claude sino otros modelos gratis, y que no debo pasarles datos
  privados. Que te diga «vale» antes de seguir.

1 · COMPRUEBA EL ORDENADOR
- Node 20 o superior (node -v) y Claude Code. Dime si tengo Docker (no hace falta en Mac o Windows).

2 · INSTALA FREELLMAPI
- En Mac o Windows: dime que descargue la app de escritorio de github.com/tashfeenahmed/freellmapi/releases/latest
  (en Mac, arm64 si tiene chip de Apple, x64 si es Intel). Queda en la barra de menú y escucha en
  http://127.0.0.1:31415, sin contraseña.
- En Linux o servidor: con Docker, curl -fsSL https://freellmapi.co/install.sh | bash (panel en http://localhost:3001).
- Comprueba con curl que responde y guarda esa dirección.

3 · MIS CLAVES GRATIS
- Dime que abra el panel (icono de la barra → Open Dashboard) → Keys, y que añada las claves gratis de 3-4 proveedores
  (por ejemplo Google AI Studio para Gemini, Groq, Cerebras, Mistral, OpenRouter). Dime dónde sacar cada una.
- Avísame de que Cohere prohíbe el uso personal (mejor no) y de que Gemini, NVIDIA y Z.ai tienen condiciones a revisar.
- Que copie la clave unificada (freellmapi-…): icono → Copy Key. No me la pidas.
- Que pruebe en el Playground del panel.

4 · CLAUDE CODE CON LOS MODELOS GRATIS, SIN ROMPER MI CLAUDE
- La forma segura: npx freellmapi launch --url <la dirección>. Me pide la clave en un recuadro oculto y abre Claude Code
  con los gratis solo para esa sesión. Esto es lo que hago cuando se me acaba Claude.
- NO ejecutes npx freellmapi setup-claude sin --profile: cambiaría mi ~/.claude/settings.json y todas mis sesiones irían
  a los modelos gratis. Si quiero un acceso fijo: setup-claude --url <dirección> --profile gratis (primero con
  --dry-run) y luego CLAUDE_CONFIG_DIR=~/.claude/profiles/gratis claude.
- Dentro de la sesión, /model para ver qué modelo responde.

5 · LA NOTA AL SIGUIENTE MODELO
- Explícame que, cuando el router cambia de modelo a mitad de conversación, puede dejarle una nota al nuevo para que no
  empiece de cero (Context Handoff). Viene apagada: en la instalación con Docker se enciende con
  FREELLMAPI_CONTEXT_HANDOFF=on_model_switch en ~/freellmapi/.env y reiniciando. Funciona entre los modelos gratis, no
  desde mi sesión de Claude.

6 · CÓMO USARLO
- Claude para lo importante; los gratis para resumir, clasificar, borradores, buscar en archivos y pruebas.
- Sesiones cortas: tienen menos memoria que Claude. Los mejores tienen poco cupo diario y a lo largo del día baja la
  calidad; se recupera a medianoche UTC.

Empieza por «antes de empezar».
```

---

FreeLLMAPI es un proyecto independiente de código abierto (MIT) de Tashfeen Ahmed. Las cifras de modelos y tokens son
las de su web y su README, sumando todos los planes gratis. Los planes gratis cambian sin avisar.
