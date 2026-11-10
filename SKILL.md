---
name: modelos
description: Instala FreeLLMAPI (código abierto, MIT) y lo deja listo para Claude Code - un router en tu ordenador que junta los planes gratis de unos 34 proveedores de IA (Gemini, Mistral, GLM, Kimi, DeepSeek, Qwen…, 635 modelos según su web) detrás de una sola clave, salta al siguiente cuando uno se queda sin cupo y puede dejarle una nota de traspaso al siguiente modelo. Te guía para instalar la app de Mac (o Docker), sacar las claves gratis, abrir Claude Code con los modelos gratis cuando se te acaba Claude, sin tocar tu configuración normal, y te avisa de lo que pierdes (ya no piensa Claude) y de qué no pasarle (datos privados). Úsala cuando digan /modelos, «comenta MODELOS», «FreeLLMAPI», «modelos gratis en Claude Code», «se me acaba Claude», «tokens gratis» o «usar Gemini/Kimi/GLM en Claude Code».
---

# /modelos: modelos gratis dentro de Claude Code con FreeLLMAPI

Al terminar, el usuario tiene FreeLLMAPI funcionando en su ordenador con sus claves gratis, sabe abrir Claude Code con
esos modelos gratis cuando se le acaba Claude (sin romper su Claude normal) y sabe qué no debe mandarles.

Habla en español, cercano, corto y sin tecnicismos. Una pregunta cada vez. Ejecuta tú los comandos que se puedan
ejecutar; las claves las pega la persona en la web de FreeLLMAPI o en un recuadro oculto, **nunca en el chat**.
Detalle verificado del proyecto en `ref/freellmapi.md`. `<skill>` = la carpeta de esta skill.

## Antes de nada: díselo claro (y que lo confirme)

1. **Con esto ya no piensa Claude.** Claude Code sigue siendo la herramienta, pero quien responde es otro modelo
   gratis (Gemini, DeepSeek, Kimi, GLM, Mistral…). Para tareas fáciles va bien; para cosas finas (código delicado,
   textos de venta, decisiones), Claude sigue siendo mejor. Los mejores modelos gratis tienen poco cupo diario: según
   avanza el día, el router baja a modelos más flojos y se recupera a medianoche (hora UTC).
2. **No le pases datos privados.** Lo que mandas va a proveedores con plan gratis, y muchos planes gratis pueden usar lo
   que les mandas para mejorar sus modelos. Nada de datos de clientes, contraseñas, contratos, datos de salud o
   bancarios. Si el proyecto los tiene, no lo abras con los modelos gratis.
3. **Es para uso personal y para probar**, no para montar un servicio a clientes encima: lo dice el propio proyecto.
   Una cuenta por proveedor, no revender, no compartir tu endpoint.
4. **No salta solo desde Claude.** FreeLLMAPI salta de un modelo gratis a otro cuando uno se queda sin cupo. Cuando se
   te acaba Claude, eres tú quien abre la sesión con los modelos gratis (paso 4): es un comando.

## Paso 0. Comprobar el ordenador

```bash
bash <skill>/scripts/comprobar.sh
```

Hace falta **Node 20 o superior** (para el comando `npx freellmapi`) y una de estas dos:
- **Mac o Windows:** la app de escritorio (lo más fácil, sin Docker).
- **Linux o servidor:** Docker.

## Paso 1. Instalar FreeLLMAPI

- **App de Mac (recomendado):** descarga el `.dmg` de github.com/tashfeenahmed/freellmapi/releases/latest
  (`arm64` si su Mac tiene chip de Apple, `x64` si es Intel; macOS 12 o superior). Ábrela: queda un icono en la barra
  de menú. Sin usuario ni contraseña. Escucha solo en su ordenador, en `http://127.0.0.1:31415`.
- **Con Docker:** `curl -fsSL https://freellmapi.co/install.sh | bash` (antes, si quiere, que lea el script en esa
  misma dirección). Panel en `http://localhost:3001`.

Comprueba que responde: `curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:31415` (o `:3001`).
Apunta en una variable la dirección que use: `URL=http://127.0.0.1:31415` (app) o `URL=http://localhost:3001` (Docker).

## Paso 2. Las claves gratis de los proveedores

En el panel (icono de la barra → **Open Dashboard**) → página **Keys**. Que añada las claves gratis de los
proveedores que quiera, de una en una: cada una se saca en la web del proveedor con su cuenta (Google AI Studio para
Gemini, Groq, Cerebras, Mistral, OpenRouter…). Empieza por 3-4; no hace falta registrarse en los 34. Algunos no piden
clave.

- Las claves se pegan **en el panel**, no en el chat. Se guardan cifradas en su ordenador.
- Avisa de la nota del propio proyecto sobre condiciones: Cohere prohíbe el uso personal (mejor no añadirlo) y Gemini,
  NVIDIA y Z.ai tienen cláusulas a revisar.

Cuando tenga claves, que copie su **clave unificada** (`freellmapi-…`): icono de la barra → **Copy Key**, o la
cabecera de la página Keys. Esa clave tampoco va al chat.

## Paso 3. Probarlo

En la página **Models** del panel ve los modelos disponibles y el cupo del mes. Que haga una prueba en el
**Playground** del panel. Si da errores 429, es que ese proveedor está sin cupo: el router salta al siguiente solo.

## Paso 4. Claude Code con los modelos gratis (sin romper tu Claude)

**La forma segura** es abrir una sesión aparte, sin escribir nada en su configuración:

```bash
npx freellmapi launch --url "$URL"
```

Pide la clave unificada en un recuadro oculto y abre Claude Code con los modelos gratis solo para esa sesión. Al
cerrarla, su Claude Code normal sigue igual. Esto es lo que hace cuando se le acaba Claude: abre otra terminal y lanza
este comando.

**No uses `npx freellmapi setup-claude` sin `--profile`:** escribe en `~/.claude/settings.json` y entonces **todas**
sus sesiones de Claude Code irían a los modelos gratis. Si quiere un acceso fijo, con perfil aparte:

```bash
npx freellmapi setup-claude --url "$URL" --profile gratis --dry-run   # enseña el cambio, no escribe
npx freellmapi setup-claude --url "$URL" --profile gratis             # pide la clave o usa FREELLMAPI_API_KEY
CLAUDE_CONFIG_DIR=~/.claude/profiles/gratis claude                    # abrir Claude Code con los gratis
```

Ojo: con perfil, la clave unificada queda guardada en ese archivo de su ordenador. Por eso preferimos `launch`.

Comprueba dentro de la sesión con `/model` qué modelo está usando.

## Paso 5. La nota al siguiente modelo (traspaso de contexto)

Cuando el router cambia de modelo a mitad de conversación (porque uno se queda sin cupo), puede añadir una nota corta
para el nuevo: «estás retomando la tarea de otro modelo, no empieces de cero» y un resumen de lo último. Viene
**apagada**. Se enciende con `FREELLMAPI_CONTEXT_HANDOFF=on_model_switch` en el `.env` de la instalación con Docker
(`~/freellmapi/.env`) y reiniciando. Funciona entre los modelos gratis (no le pasa la conversación que tuviera con
Claude: esa sesión es otra). En la app de escritorio no hemos encontrado cómo activarla; dilo así si lo pregunta.

## Paso 6. Uso recomendado

- Claude para lo importante; los gratis para lo repetitivo y barato: resumir, clasificar, borradores, buscar en
  archivos, pruebas.
- Una sesión por tarea y cortita: los modelos gratis tienen menos contexto que Claude.
- Si una respuesta es rara, repítela o vuelve a Claude.

## Al terminar

Resumen corto: dónde está instalado, qué proveedores tiene, el comando para abrir Claude Code con los gratis y las
dos advertencias (ya no piensa Claude, nada de datos privados).

## Reglas

- **Ninguna clave en el chat**, en archivos que se suban a ningún sitio ni en commits.
- No toques `~/.claude/settings.json` del usuario. Si ya ejecutó `setup-claude` sin perfil y quiere volver a Claude,
  el generador dejó una copia de seguridad con fecha junto al archivo: restáurala.
- No digas cifras que no salgan del proyecto. Las que da su README: unos 7.400 millones de tokens al mes en total,
  34 proveedores, 635 endpoints de modelos (474 familias). Son la suma de todos los planes gratis si te registras en
  todos; con 3-4 claves tendrás bastante menos.
- No expongas FreeLLMAPI a internet: es para un solo usuario en su ordenador.
- Si algo de FreeLLMAPI no funciona como dice aquí, dilo y mira su documentación (docs/en en el repo); no te inventes
  comandos.
