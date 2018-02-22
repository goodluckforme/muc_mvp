package ${fragmentPackageName}

import ${presenterPackageName}.${pageName}Presenter
import ${contractPackageName}.${pageName}Contract
import ${componentPackageName}.AppComponent
import ${componentPackageName}.Dagger${pageName}Component
import ${packageName}.mvp.ui.base.BaseFragment
import ${packageName}.R
import ${dataBindingPackageName}.Fragment${pageName}Binding

class ${pageName}Fragment:BaseFragment<${pageName}Presenter, ${pageName}Contract.View, Fragment${pageName}Binding>(),${pageName}Contract.View {

    companion object {
        fun newInstance():${pageName}Fragment {
            return  ${pageName}Fragment()
        }
    }

    override fun setFragmentComponent(appComponent: AppComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .build()
                .inject(this)
    }


    override fun attachView() {
        mPresenter.attachView(this)
        mPresenter.getLayoutRes(mDataBinding ?: return)
    }


    override fun initData() {
        mPresenter.toInit()
    }

    override fun getLayoutRes(): Int= R.layout.${fragmentLayoutName}
   

    override fun complete(msg: String) {

    }

    override fun showError(msg: String) {

    }

    override fun detachView() {
        mPresenter.detachView()
    }
}
