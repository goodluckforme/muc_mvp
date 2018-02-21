package ${ativityPackageName}

import ${apiMoudlePackageName}.Activity${pageName}BindingModule
import ${packageName}.mvp.ui.base.BaseActivity
import ${presenterPackageName}.${pageName}Presenter
import ${contractPackageName}.${pageName}Contract
import ${componentPackageName}.AppComponent
import ${componentPackageName}.Dagger${pageName}Component
import ${dataBindingPackageName}.Activity${pageName}Binding
import ${packageName}.R
import android.databinding.DataBindingUtil

class ${pageName}Activity:BaseActivity<${pageName}Presenter, ${pageName}Contract.View>(),${pageName}Contract.View {

    override fun setActivityComponent(appComponent: AppComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
              //.activity${pageName}BindingModule(
              //          Activity${pageName}BindingModule()
              //                  .apply {
              //                      viewDataBinding = DataBindingUtil
              //                              .setContentView(this@${pageName}Activity, R.layout.activity_${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)})
              //                  })
                .build()
                .inject(this)
        DataBindingUtil.setContentView<Activity${pageName}Binding>(this@${pageName}Activity, R.layout.activity_${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)})
    }

    public override fun initView() {
        super.initView()
    }

    public override fun initData() {
        super.initData()
        mPresenter.attachView(this)
        mPresenter.toInit()
    }

    override fun complete(msg: String) {

    }

    override fun showError(msg: String) {

    }
}
