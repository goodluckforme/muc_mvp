package ${fragmentPackageName};

import ${packageName}.mvp.presenter.${pageName}Presenter;
import ${packageName}.mvp.contract.${pageName}Contract;
import ${componentPackageName}.AppComponent;
import ${componentPackageName}.Dagger${pageName}Component;
import ${packageName}.mvp.ui.base.BaseFragment;
import ${packageName}.R;
import ${componentPackageName}.AppComponent;
import ${dataBindingPackageName}.Fragment${pageName}Binding;
import android.databinding.DataBindingUtil;
import ${presenterPackageName}.${pageName}Presenter;
import ${contractPackageName}.${pageName}Contract;
import ${apiMoudlePackageName}.Fragment${pageName}BindingModule;

public class ${pageName}Fragment extends BaseFragment<${pageName}Presenter, ${pageName}Contract.View>  implements ${pageName}Contract.View {

    public static ${pageName}Fragment newInstance() {
        ${pageName}Fragment fragment = new ${pageName}Fragment();
        return fragment;
    }

    @Override
    public void setFragmentComponent(AppComponent appComponent) {
         Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .fragment${pageName}BindingModule(new Fragment${pageName}BindingModule(DataBindingUtil.<Fragment${pageName}Binding>bind(rootView)))
                .build()
                .inject(this);
    }


    @Override
    public void attachView() {
        mPresenter.attachView(this);
        mPresenter.toInit();
    }


    @Override
    public void initData() {

    }


    @Override
    public int getLayoutRes() {
        return R.layout.${fragmentLayoutName};
    }

    @Override
    public void complete(String msg) {

    }

    @Override
    public void showError(String msg) {
        
    }

    
    @Override
    public void detachView() {
        mPresenter.detachView();
    }

}
