package ${packageName}.mvp.ui.base;

import android.os.Bundle;
import android.content.pm.ActivityInfo;
import android.support.v7.app.AppCompatActivity;
import ${packageName}.App;
import ${componentPackageName}.AppComponent;
import ${baseContractPackageName}.BaseContract;
import ${baseContractPackageName}.RxPresenter;
import javax.inject.Inject;
import android.support.annotation.Nullable;

public abstract class BaseActivity<T extends RxPresenter<V>, V extends BaseContract.BaseView> extends AppCompatActivity implements BaseContract.BaseView {
    public Boolean isFirst;
    public @Inject
    T mPresenter;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //QMUIStatusBarHelper.translucent(this, Color.parseColor("#ffffff"))
        //竖屏设置
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        setActivityComponent(App.instance.getAppComponent());
        initView();
    }

    protected abstract void setActivityComponent(AppComponent activityComponent);

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus && !isFirst) {
            isFirst = true;
            initData();
        }
    }


    protected void initView() {

    }

    protected void initData() {
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mPresenter.detachView();
    }
}