package ${contractPackageName}

import  ${packageName}.common.BaseContract

import ${dataBindingPackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding

interface ${pageName}Contract {
    interface View : BaseContract.BaseView

    interface Presenter : BaseContract.BasePresenter<View, <#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding>
}
