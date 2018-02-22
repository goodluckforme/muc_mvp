package ${packageName}.mvp.ui.base

import android.os.Bundle
import android.content.pm.ActivityInfo
import android.support.v7.app.AppCompatActivity
import ${packageName}.App
import ${componentPackageName}.AppComponent
import ${baseContractPackageName}.BaseContract
import ${baseContractPackageName}.RxPresenter
import javax.inject.Inject
import android.databinding.ViewDataBinding

abstract class BaseActivity<T : RxPresenter<V,M>, V : BaseContract.BaseView,M:ViewDataBinding> : AppCompatActivity(),BaseContract.BaseView  {
    var isFirst: Boolean = false
     @Inject lateinit var mPresenter: T
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //QMUIStatusBarHelper.translucent(this, Color.parseColor("#ffffff"))
        //竖屏设置
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        setActivityComponent(App.instance.appComponent)
        initView()
    }

   
    abstract fun setActivityComponent(appComponent: AppComponent)

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (hasFocus && !isFirst) {
            isFirst = true
            initData()
        }
    }

    protected open fun initView() {

    }

    protected open fun initData() {
    }


    override fun onDestroy() {
        super.onDestroy()
        mPresenter.detachView()
    }
   
}