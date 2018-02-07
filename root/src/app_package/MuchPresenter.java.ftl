package ${presenterPackageName};


import android.content.Context;
import javax.inject.Inject;
import ${apipackageName}.AppApi;
import ${packageName}.common.RxPresenter;
import ${packageName}.mvp.contract.${pageName}Contract;

public class ${pageName}Presenter extends RxPresenter<${pageName}Contract.View> implements ${pageName}Contract.Presenter{
    
    private AppApi appApi ;
    private Context context ;

    @Inject
    public ${pageName}Presenter (AppApi appApi , Context context ) {
        super();
        this.appApi = appApi;
        this.context = context;
    }

}
