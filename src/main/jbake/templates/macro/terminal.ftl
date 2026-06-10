<#--
    terminal.ftl — terminal-styled command boxes.

    <@renderInlineTerminal command="…" copyable=true max_width="600px"/>
        Click-to-copy command box. Set copyable=false for non-interactive
        echoes (e.g. shell output, version strings).

    <@renderTerminalPanel prompt="…">…<pre>…</pre>…</@renderTerminalPanel>
        Larger panel with a terminal prompt and a <pre> block of formatted
        output (use .term-ok / .term-pending / .term-dim spans inside).
-->

<#macro renderInlineTerminal command copyable=true max_width="600px">
    <#if copyable>
<button type="button" class="inline-terminal" style="max-width: ${max_width};"
    onclick="navigator.clipboard.writeText('${command?js_string}'); const btn = this.querySelector('.copy-btn'); const orig = btn.innerText; btn.innerText = 'Copied!'; setTimeout(() => btn.innerText = orig, 2000);"
    aria-label="Copy command: ${command}">
    <code>${command}</code>
    <span class="copy-btn" aria-hidden="true">Copy</span>
</button>
    <#else>
<div class="inline-terminal inline-terminal--static" style="max-width: ${max_width};">
    <code>${command}</code>
</div>
    </#if>
</#macro>

<#macro renderTerminalPanel prompt>
<div class="eliya-terminal-panel">
    <span class="terminal-prompt">${prompt}</span>
    <#nested>
</div>
</#macro>
