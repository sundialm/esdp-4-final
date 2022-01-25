<#import "base.ftlh" as base >
<@base.layout>

<#assign lastComment= "">

    <#if tasks?size<10&&tasks?size!<5>
        <#assign mainCount=10>
        <p>${mainCount}</p>
    <#elseif tasks?size<5>
        <#assign mainCount=5>
        <p>${mainCount}</p>
        <#else>
        <#assign mainCount=((tasks?size/5)?floor)*5>
        <p>${mainCount}</p>
    </#if>

    <#assign count=0>
    <div class="accordion" id="q">
<#list tasks?sort_by("defaultComment") as t>
    <#if lastComment !=t.defaultComment>
        <div class="accordion-item" >
            <div class="accordion-header" id="panelsStayOpen-heading-${count}">
                <#assign innerCount=0>
                <#list tasks as innerTask>
                    <#if t.defaultComment==innerTask.defaultComment>
                        <#assign innerCount=innerCount+1>
                    </#if>
                </#list>
                <button class="accordion-button graph_outer" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapse-${count}" aria-expanded="true" aria-controls="panelsStayOpen-collapse-${count}">
                <div><b>${innerCount}:${t.defaultComment}</b></div>

                <div class="graph" style="width: ${innerCount*100/mainCount}%" ></div>

                </button>
            </div>
            <div id="panelsStayOpen-collapse-${count}" class="accordion-collapse collapse hidden" aria-labelledby="panelsStayOpen-heading-${count}">
                <div class="accordion-body" >
                    <#list tasks as innerTask>
                        <#if t.defaultComment==innerTask.defaultComment>
                        <p>name: ${t.name}, comment: ${t.comment}, date: ${t.finishDate}</p>
                        </#if>
                    </#list>
                </div>
            </div>
        </div>
        <#assign count=count+1>
    </#if>

    <#assign lastComment =t.defaultComment>
</#list>
        <div class="scale_container">

            <div class="line_lower_graph_scale">
            </div>
            <div class="scale_values_container">
            <#assign scale=mainCount/5>
            <#list 0..scale as x>
                <#if x==0>
                    <div class="scale_value start_value"> ${x*5}</div>
                    <#elseif x=scale>
                        <div class="scale_value end_value"> ${x*5}</div>
                    <#else >
                    <div class="scale_value"> ${x*5}</div>
                </#if>
            </#list>
            </div>
        </div>

    </div>
</@base.layout>