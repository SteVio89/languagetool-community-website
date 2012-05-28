<table style="border: 0px">
<tr>
    <td width="150">Error Message</td>
    <td><g:textField id="message"
            onkeypress="return handleReturnForXmlCreation(event);"
            onfocus="\$('message').setStyle({color: 'black'})"
            onchange="\$('messageBackup').value = \$('message').value"
            class="preFilledField" type="text" name="message"
            value="${messagePreset ? messagePreset.encodeAsHTML() : 'Did you mean \'bad\'?'}"/>
        <!--<br/>
        <span class="metaInfo">Example: Did you mean 'bad'?</span>-->
    </td>
</tr>
<tr>
    <td>Rule Name<br/>
        <span class="metaInfo">optional</span>
    </td>
    <td><g:textField id="name"
            onkeypress="return handleReturnForXmlCreation(event);"
            onfocus="\$('name').setStyle({color: 'black'})"
            onchange="\$('nameBackup').value = \$('name').value"
            class="preFilledField" type="text" name="name"
            value="${namePreset ? namePreset.encodeAsHTML() : 'confusion of bed/bad'}"/>
        <!--<br/>
        <span class="metaInfo">Example: confusion of bed/bad</span>-->
    </td>
</tr>
<tr>
    <td></td>
    <td>
        <g:submitToRemote name="createXmlButton" onLoading="startLoad('createXmlSpinner')" onComplete="stopLoad('createXmlSpinner')" action="createXml" update="xml" value="Create XML"/>
        <img id="createXmlSpinner" style="display: none" src="${resource(dir:'images', file:'spinner.gif')}" alt="wait symbol"/>
    </td>
</tr>
</table>

<script type="text/javascript">
    document.ruleForm.message.select();
</script>

<div id="xml"></div>
