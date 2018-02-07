package ${ativityPackageName};


import ${packageName}.mvp.ui.base.BaseActivity;
import javax.inject.Inject;
import ${packageName}.mvp.presenter.${pageName}Presenter;
import ${packageName}.mvp.contract.${pageName}Contract;
import ${componentPackageName}.AppComponent;
import ${componentPackageName}.DaggerActivityComponent;
import ${packageName}.R;



public class ${pageName}Activity extends BaseActivity implements ${pageName}Contract.View {

    public @Inject ${pageName}Presenter ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter;

    @Override
    public void setActivityComponent(AppComponent appComponent) {
        DaggerActivityComponent //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .build()
                .inject(this);
    }


    @Override
    public void initView() {
        super.initView();
        
    }


    @Override
    public void initData() {

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter.detachView();
    }

    @Override
    public int getLayoutRes() {
        return R.layout.${activityLayoutName};
    }

    @Override
    public void complete(String msg) {

    }

    @Override
    public void showError(String msg) {
        
    }
}
