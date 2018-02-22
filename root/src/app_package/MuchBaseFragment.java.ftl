package ${packageName}.mvp.ui.base;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import ${packageName}.App;
import ${componentPackageName}.AppComponent;
import ${baseContractPackageName}.BaseContract;
import ${baseContractPackageName}.RxPresenter;
import javax.inject.Inject;

public abstract class BaseFragment<T extends RxPresenter<V>, V extends BaseContract.BaseView> extends Fragment implements BaseContract.BaseView {

    public boolean isViewPrepared;
    public boolean hasFetchData;
    @Inject
    public T mPresenter;
    protected View rootView;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        if (null == rootView) {
            rootView = View.inflate(getActivity(), getLayoutRes(), null);
        }
        return rootView;
    }

    protected abstract int getLayoutRes();


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Log.i("test", "=============onViewCreated=============" + this);
        super.onViewCreated(view, savedInstanceState);
        setFragmentComponent(App.instance.getAppComponent());
        attachView();
        isViewPrepared = true;
        lazyFetchDataIfPrepared();
    }

    protected abstract void attachView();

    protected abstract void detachView();

    protected abstract void setFragmentComponent(AppComponent appComponent);

    @Override
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser) {
            lazyFetchDataIfPrepared();
        }
    }

    private void lazyFetchDataIfPrepared() {
        // 用户可见fragment && 没有加载过数据 && 视图已经准备完毕
        Log.i("test", "userVisibleHint=============" + getUserVisibleHint()
                + "======hasFetchData======" + hasFetchData + "======" + "isViewPrepared=============" + isViewPrepared + this);
        if (getUserVisibleHint() && !hasFetchData && isViewPrepared) {
            hasFetchData = true;
            initData();
        }
    }

    /**
     * 初始化方法
     */
    protected void initData() {
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        detachView();
//        hasFetchData = false
//        isViewPrepared = false
    }

    /**
     * 只有show 和 hide 才会调用
     */
    @Override
    public void onHiddenChanged(boolean hidden) {
        super.onHiddenChanged(hidden);
        Log.i("onHiddenChanged", "onHiddenChanged========" + this + hidden);
    }
}