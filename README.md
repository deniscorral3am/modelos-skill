# Modelos · cientos de modelos gratis dentro de Claude Code

Cuando se te acaba Claude, abres Claude Code con modelos gratis (Gemini, Mistral, GLM, Kimi, DeepSeek, Qwen…) y sigues
trabajando. Esta skill instala y configura [FreeLLMAPI](https://github.com/tashfeenahmed/freellmapi), un router de
código abierto que junta los planes gratis de unos 34 proveedores detrás de una sola clave, salta al siguiente modelo
cuando uno se queda sin cupo y puede dejarle una nota de traspaso al siguiente.

| Paso | Qué hace |
|---|---|
| 0 | Te avisa de lo que pierdes (ya no piensa Claude) y de qué no pasarle (datos privados) |
| 1 | Comprueba tu ordenador e instala FreeLLMAPI (app de Mac/Windows o Docker) |
| 2-3 | Te guía para sacar las claves gratis y probarlo (las claves nunca pasan por el chat) |
| 4 | Abre Claude Code con los modelos gratis sin tocar tu configuración normal |
| 5 | Te explica la nota de traspaso entre modelos y cómo encenderla |

Hecha por Denís Corral · [@deniscorralvillarraso](https://instagram.com/deniscorralvillarraso) · [Sell Your AI](https://sellyourai.io)

## Instalación

```bash
git clone https://github.com/deniscorral3am/modelos-skill ~/.claude/skills/modelos
```

Abre Claude Code y escribe `/modelos`.

¿Sin instalar nada? Copia el recuadro de [`PROMPT.md`](PROMPT.md) y pégalo en Claude Code.

## Bueno saber

- **Con esto ya no piensa Claude**: responde otro modelo gratis. Para lo importante, Claude sigue siendo mejor.
- **No le pases datos privados**: los planes gratis pueden usar lo que les mandas.
- Las cifras (unos 7.400 millones de tokens al mes, 635 modelos, 34 proveedores) son las de FreeLLMAPI sumando todos los
  planes gratis; con 3-4 claves tendrás bastante menos.
- Los mejores modelos gratis tienen poco cupo diario: la calidad baja a lo largo del día y vuelve a medianoche (UTC).
- Es para uso personal y para probar, no para dar servicio a clientes.

FreeLLMAPI es de Tashfeen Ahmed (MIT). Claude es de Anthropic.

## Licencia

MIT
