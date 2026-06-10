<#--
    tables.ftl — data table macros.

    <@renderClinicalTable headers=[…] rows=[[…],[…]]/>
        Renders a `.clinical-table` (header row + data rows). Cells are
        emitted RAW so HTML in cells (links, code spans) renders. Callers
        are responsible for HTML-escaping plain-text cells when needed.
        All current callers author static Asymm-controlled strings; if a
        cell ever sources from user input, escape with ?html at the call site.

    Data shape:
        headers : sequence of strings (column titles, plain text or HTML)
        rows    : sequence of sequences; each inner sequence has one entry
                  per column, matching headers length.

    Caller pattern:
        <#assign tableHeaders = ["Platform", "Architecture", "Format"]>
        <#assign tableRows = [
            ["Linux",   "x64",    "tar.gz"],
            ["Linux",   "aarch64","tar.gz"]
        ]>
        <@renderClinicalTable headers=tableHeaders rows=tableRows />
-->

<#macro renderClinicalTable headers rows>
<table class="clinical-table">
    <thead>
        <tr>
            <#list headers as h><th>${h}</th></#list>
        </tr>
    </thead>
    <tbody>
        <#list rows as row>
        <tr>
            <#list row as cell><td>${cell}</td></#list>
        </tr>
        </#list>
    </tbody>
</table>
</#macro>
