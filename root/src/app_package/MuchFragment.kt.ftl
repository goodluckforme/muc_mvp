package ${fragmentPackageName}

import javax.inject.Inject
import ${packageName}.mvp.presenter.${pageName}Presenter
import ${packageName}.mvp.contract.${pageName}Contract
import ${componentPackageName}.AppComponent
import ${componentPackageName}.DaggerActivityComponent
import ${packageName}.mvp.ui.base.BaseFragment
import ${packageName}.R

class ${pageName}Fragment:BaseFragment(),${pageName}Contract.View {

    @Inject lateinit var ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter:${pageName}Presenter

    companion object {
        fun newInstance():  ${pageName}Fragment {
            return  ${pageName}Fragment()
        }
    }

    override fun setFragmentComponent(appComponent: AppComponent) {
        DaggerActivityComponent //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .build()
                .inject(this)
    }


    override fun attachView() {

    }


    public override fun initData() {

    }

    override fun getLayoutRes(): Int= R.layout.${fragmentLayoutName}
   

    override fun complete(msg: String) {

    }

    override fun showError(msg: String) {

    }

    override fun detachView() {
        ${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Presenter.detachView()
    }
}
