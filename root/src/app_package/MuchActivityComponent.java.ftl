package ${componentPackageName};

<#if needActivity && needFragment>
import ${ativityPackageName}.${pageName}Activity;
import ${fragmentPackageName}.${pageName}Fragment;
<#elseif needActivity>
import ${ativityPackageName}.${pageName}Activity;   
<#elseif needFragment>
import ${fragmentPackageName}.${pageName}Fragment;
</#if>

import ${apiMoudlePackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}BindingModule;

import dagger.Component;
@Component(dependencies = AppComponent.class,modules = {<#if needActivity>Activity<#else>Fragment</#if>${pageName}BindingModule.class})
public interface ${pageName}Component {
  <#if needActivity && needFragment>
	void inject(${pageName}Activity activity);
	void inject(${pageName}Fragment fragment);
  <#elseif needActivity || needFragment>
    void inject(<#if needFragment>${pageName}Fragment fragment<#else>${pageName}Activity activity</#if>);
  </#if>
}