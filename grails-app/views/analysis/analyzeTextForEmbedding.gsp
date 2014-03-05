
<!-- start internal part: we tokenize on the server side, and this is where the Javascript will extract the token from: -->
<ul id="${params.elementId.encodeAsHTML()}" style="display: none">
    <g:each in="${analyzedSentences}" var="sentence">
        <g:each in="${sentence.getTokensWithoutWhitespace()}" var="token" status="i">
            <li>${token.getToken().encodeAsHTML()}</li>
        </g:each>
    </g:each>
</ul>
<!-- end internal part -->

<a href="#" onclick="toggle('#wrongSentenceEvaluation')">Show Analysis</a>
<div id="wrongSentenceEvaluation" style="background-color: #eee; padding: 5px; display:none">
<g:each in="${analyzedSentences}" var="sentence">
    <g:if test="${sentence.getAnnotations().trim() == 'Disambiguator log:'}">
        <pre class="disambiguatorLog">Disambiguator log: (no disambiguations)</pre>
    </g:if>
    <g:else>
        <pre class="disambiguatorLog">${sentence.getAnnotations().encodeAsHTML().replace("\n\n", "\n")}</pre>
    </g:else>
    <table style="margin-top: 4px; margin-bottom: 15px; border-style: none">
        <tr>
            <td style="font-weight: bold">Token</td>
            <g:each in="${sentence.getTokensWithoutWhitespace()}" var="token" status="i">
                <td>${token.getToken().encodeAsHTML()}</td>
            </g:each>
        </tr>
        <tr>
            <td style="font-weight: bold">Lemma</td>
            <g:each in="${sentence.getTokensWithoutWhitespace()}" var="token" status="i">
                <td>
                    <g:set var="prevLemma" value=""/>
                    <span class="pos">
                        <g:each in="${token.getReadings()}" var="reading">
                            <g:if test="${reading.getLemma() != prevLemma}">
                                <g:if test="${reading.getLemma()}">
                                    ${reading.getLemma().encodeAsHTML()}
                                </g:if>
                                <g:else>
                                    -
                                </g:else>
                            </g:if>
                            <g:set var="prevLemma" value="${reading.getLemma()}"/>
                        </g:each>
                    </span>
                </td>
            </g:each>
        </tr>
        <tr>
            <td style="font-weight: bold">POS</td>
            <g:each in="${sentence.getTokensWithoutWhitespace()}" var="token" status="i">
                <td>
                    <span class="pos">
                        <g:each in="${token.getReadings()}" var="reading">
                            <g:if test="${reading.getPOSTag()}">
                                ${reading.getPOSTag().encodeAsHTML()}
                            </g:if>
                            <g:else>
                                -
                            </g:else>
                        </g:each>
                    </span>
                </td>
            </g:each>
        </tr>
        <tr>
            <td style="font-weight: bold">Chunk</td>
            <g:each in="${sentence.getTokensWithoutWhitespace()}" var="token" status="i">
                <td>
                    <span class="pos">
                        <g:each in="${token.getChunkTags()}" var="chunk">
                            <span class="chunk">${chunk.encodeAsHTML()}</span><br/>
                        </g:each>
                    </span>
                </td>
            </g:each>
        </tr>
    </table>
</g:each>
</div>
