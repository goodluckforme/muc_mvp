<?xml version="1.0"?>
<recipe>
<#if needActivity>
    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
</#if>

<#if needActivity && generateActivityLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
</#if>

<#if needActivity>
    <#if generateKotlin>
    <instantiate from="root/src/app_package/MuchActivity.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.kt" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.kt" />
    <#else>
    <instantiate from="root/src/app_package/MuchActivity.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
    </#if>
</#if>

<#if needFragment && generateFragmentLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
</#if>

<#if needFragment>
  <#if generateKotlin>
    <instantiate from="root/src/app_package/MuchFragment.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.kt" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.kt" />
    <#else>
    <instantiate from="root/src/app_package/MuchFragment.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
    </#if>
</#if>

<#if needPresenter>
    <instantiate from="root/src/app_package/MuchPresenter.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(presenterPackageName)}/${pageName}Presenter.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(presenterPackageName)}/${pageName}Presenter.java" />
</#if>

<#if needContract>
    <instantiate from="root/src/app_package/MuchContract.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(contractPackageName)}/${pageName}Contract.java" />
</#if>

<#if needInintBase>

<instantiate from="root/src/app_package/MuchApp.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/App.kt" />

<instantiate from="root/src/app_package/MuchAppApi.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(apipackageName)}/AppApi.kt" />

<instantiate from="root/src/app_package/MuchAppService.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(apipackageName)}/AppService.kt" />

<instantiate from="root/src/app_package/MuchBaseObserver.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(apipackageName)}/BaseObserver.kt" />

<instantiate from="root/src/app_package/HttpResult.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(dataPackageName)}/HttpResult.kt" />

<instantiate from="root/src/app_package/MuchBaseActivity.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/ui/base/BaseActivity.kt" />

<instantiate from="root/src/app_package/MuchBaseFragment.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(packageName)}/mvp/ui/base/BaseFragment.kt" />

<instantiate from="root/src/app_package/MuchComponent.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(componentPackageName)}/AppComponent.java" />

<instantiate from="root/src/app_package/MuchBaseContract.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(baseContractPackageName)}/BaseContract.kt" />

<instantiate from="root/src/app_package/MuchRxPresenterModule.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(baseContractPackageName)}/RxPresenter.java" />
                   
<instantiate from="root/src/app_package/MuchApiModule.kt.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(apiMoudlePackageName)}/ApiModule.kt" />

<instantiate from="root/src/app_package/MuchAppModule.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(apiMoudlePackageName)}/AppModule.java" />
                   
<instantiate from="root/src/app_package/MuchSharedPreferencesUtil.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(utilsPackageName)}/SharedPreferencesUtil.java" />

<mkdir at="${muchAppOut}" />                  
<instantiate from="root/build.gradle.ftl"
                   to="${muchAppOut}/build_.gradle" />

<instantiate from="root/project_build.gradle.ftl"
                   to="${escapeXmlAttribute(topOut)}/build_.gradle" />

</#if>

<#if needcomponent>
  <instantiate from="root/src/app_package/MuchActivityComponent.java.ftl"
               to="${projectOut}/src/main/java/${slashedPackageName(componentPackageName)}/ActivityComponent.java"/>
</#if>

</recipe>
