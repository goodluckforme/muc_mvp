package ${presenterPackageName};


import android.content.Context;
import javax.inject.Inject;
import ${apipackageName}.AppApi;
import ${baseContractPackageName}.RxPresenter;
import ${contractPackageName}.${pageName}Contract;
import ${dataBindingPackageName}.<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding;

public class ${pageName}Presenter extends RxPresenter<${pageName}Contract.View> implements ${pageName}Contract.Presenter{

    private AppApi appApi ;
    private Context context ;
	private <#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding binding ;
    
    public void toInit() {
       binding.set${pageName}Model(new ${pageName}Model());
    }

    @Inject
    public ${pageName}Presenter (AppApi appApi , Context context ,<#if needActivity>Activity<#else>Fragment</#if>${pageName}Binding binding ) {
        super();
        this.appApi = appApi;
        this.context = context;	
        this.binding = binding;
    }

    public class ${pageName}Model {

    }

}
