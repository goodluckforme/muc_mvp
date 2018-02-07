package ${packageName}.mvp.ui.base

import android.os.Bundle
import android.content.pm.ActivityInfo
import android.support.v7.app.AppCompatActivity
import ${packageName}.App
import ${componentPackageName}.AppComponent
import org.jetbrains.anko.sdk25.coroutines.onClick



abstract class BaseActivity : AppCompatActivity() {
    var isFirst: Boolean = false
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(getLayoutRes())
        //QMUIStatusBarHelper.translucent(this, Color.parseColor("#ffffff"))
        //竖屏设置
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        setActivityComponent(App.instance.appComponent)
        initView()
    }

    /**
     * 设置标题
     *
     * @param title
     */
    fun setTitleId(stringId: Int) {
       
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


    abstract fun getLayoutRes(): Int

    override fun onDestroy() {
        super.onDestroy()
    }
   
}