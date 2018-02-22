package ${componentPackageName}

<#if needActivity && needFragment>
import ${ativityPackageName}.${pageName}Activity
import ${fragmentPackageName}.${pageName}Fragment
<#elseif needActivity>
import ${ativityPackageName}.${pageName}Activity   
<#elseif needFragment>
import ${fragmentPackageName}.${pageName}Fragment
</#if>

//import ${apiMoudlePackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}BindingModule

import dagger.Component
@Component(dependencies = [(AppComponent::class)])
interface ${pageName}Component {
  <#if needActivity && needFragment>
	fun inject(activity:${pageName}Activity )
	fun inject(fragment:${pageName}Fragment)
  <#elseif needActivity || needFragment>
    fun inject(<#if needFragment>fragment:${pageName}Fragment <#else>activity:${pageName}Activity</#if>)
  </#if>
}