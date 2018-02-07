package ${apipackageName}

import android.content.Context
import ${dataPackageName}.HttpResult
import ${utilsPackageName}.SharedPreferencesUtil
import rx.Observer

/**
 * Created by MaQi on 2018/1/2.
 */
abstract class BaseObserver<T>(val context: Context) : Observer<HttpResult<T>> {

    companion object {
        val SUCCESS = 200
        val FAILLOGIN = 210
        val USERINFO = ""
    }


    override fun onNext(result: HttpResult<T>?) {
        when {
            result == null -> onRequestFail()
            result.result == SUCCESS -> onNetSuccess(result.datas)
            result.result == FAILLOGIN ->{
                SharedPreferencesUtil.getInstance().remove(USERINFO)
                onRequestFail(Throwable("$FAILLOGIN"))
            }
            else -> onRequestFail(Throwable(result.msg))
        }
    }

    override fun onError(e: Throwable?) = onRequestFail()
    override fun onCompleted() = onNetCompleted()

    protected fun onNetCompleted() {}

    abstract fun onRequestFail(e: Throwable = Throwable("服务器异常,请稍后重试"))
    abstract fun onNetSuccess(datas: T)
}