package ${ativityPackageName};

import ${apiMoudlePackageName}.Activity${pageName}BindingModule;
import ${packageName}.mvp.ui.base.BaseActivity;
import ${presenterPackageName}.${pageName}Presenter;
import ${contractPackageName}.${pageName}Contract;
import ${componentPackageName}.AppComponent;
import ${componentPackageName}.Dagger${pageName}Component;
import ${dataBindingPackageName}.Activity${pageName}Binding;
import ${packageName}.R;
import android.databinding.DataBindingUtil;

public class ${pageName}Activity extends BaseActivity<${pageName}Presenter, ${pageName}Contract.View> implements ${pageName}Contract.View {

    @Override
    public void setActivityComponent(AppComponent appComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .activity${pageName}BindingModule(new Activity${pageName}BindingModule(DataBindingUtil.<Activity${pageName}Binding>setContentView(this,R.layout.activity_${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)})))
                .build()
                .inject(this);
    }


    @Override
    public void initView() {
        super.initView();
        
    }


    @Override
    public void initData() {
        super.initData();
    }

    @Override
    public void complete(String msg) {

    }

    @Override
    public void showError(String msg) {
        
    }
}
