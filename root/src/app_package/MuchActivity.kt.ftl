package ${ativityPackageName}


import ${packageName}.mvp.ui.base.BaseActivity
import javax.inject.Inject
import ${packageName}.mvp.presenter.${pageName}Presenter
import ${packageName}.mvp.contract.${pageName}Contract
import ${componentPackageName}.AppComponent
import ${componentPackageName}.DaggerActivityComponent
import ${packageName}.R


class ${pageName}Activity:BaseActivity(),${pageName}Contract.View {

    @Inject lateinit var ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter:${pageName}Presenter

    override fun setActivityComponent(appComponent: AppComponent) {
        DaggerActivityComponent //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .build()
                .inject(this)
    }


    public override fun initView() {
        super.initView()

    }

    public override fun initData() {

    }

    override fun onDestroy() {
        super.onDestroy()
        ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter.detachView()
    }


    override fun getLayoutRes(): Int= R.layout.${activityLayoutName}
   

    override fun complete(msg: String) {

    }

    override fun showError(msg: String) {

    }
}
