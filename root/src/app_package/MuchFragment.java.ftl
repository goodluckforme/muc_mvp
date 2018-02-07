package ${fragmentPackageName};

import javax.inject.Inject;
import ${packageName}.mvp.presenter.${pageName}Presenter;
import ${packageName}.mvp.contract.${pageName}Contract;
import ${componentPackageName}.AppComponent;
import ${componentPackageName}.DaggerActivityComponent;
import ${packageName}.mvp.ui.base.BaseFragment;
import ${packageName}.R;


public class ${pageName}Fragment extends BaseFragment implements ${pageName}Contract.View {

    public @Inject ${pageName}Presenter ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter;

    public static ${pageName}Fragment newInstance() {
        ${pageName}Fragment fragment = new ${pageName}Fragment();
        return fragment;
    }

    @Override
    public void setFragmentComponent(AppComponent appComponent) {
         DaggerActivityComponent //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .build()
                .inject(this);
    }


    @Override
    public void attachView() {

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
        ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter.detachView();
    }

}
