package ${presenterPackageName}


import android.content.Context
import javax.inject.Inject
import ${apipackageName}.AppApi
import ${baseContractPackageName}.RxPresenter
import ${dataBindingPackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding
import ${contractPackageName}.${pageName}Contract

class ${pageName}Presenter @Inject constructor(private val appApi: AppApi, private val  context: Context) : 
RxPresenter<${pageName}Contract.View,<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding>(), ${pageName}Contract.Presenter {
	
	fun toInit() {
       mContentView.set${pageName}Model(${pageName}Model())
    }
    
    inner class ${pageName}Model

}
