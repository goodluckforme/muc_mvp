package ${presenterPackageName}


import android.content.Context
import javax.inject.Inject
import ${apipackageName}.AppApi
import ${baseContractPackageName}.RxPresenter
//import ${dataBindingPackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding
import ${contractPackageName}.${pageName}Contract

class ${pageName}Presenter @Inject constructor(private val appApi: AppApi, private val  context: Context 
//,private val binding: Activity${pageName}Binding
) : RxPresenter<${pageName}Contract.View>(), ${pageName}Contract.Presenter {
	
	fun toInit() {
      // binding.set${pageName}Model(${pageName}Model())
    }
    
    inner class ${pageName}Model

}
