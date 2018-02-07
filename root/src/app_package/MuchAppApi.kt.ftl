package ${apipackageName}

import okhttp3.MediaType
import okhttp3.MultipartBody
import okhttp3.OkHttpClient
import okhttp3.RequestBody
import retrofit2.Retrofit
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import rx.Observable
import rx.Observer
import rx.Subscription
import rx.android.schedulers.AndroidSchedulers
import rx.schedulers.Schedulers
import java.io.File
import java.util.concurrent.TimeUnit

/**
 * Created by MaQi on 2017/12/21.
 */
class AppApi private constructor() {
    private object Holder {
        val INSTANCE = AppApi()
    }

    companion object {
        val instance: AppApi by lazy {
            Holder.INSTANCE
        }
    }

    private val appService: AppService

    init {
        val okHttpClient = OkHttpClient.Builder()
                .connectTimeout((20 * 1000).toLong(), TimeUnit.MILLISECONDS)
                .readTimeout((20 * 1000).toLong(), TimeUnit.MILLISECONDS)
                .retryOnConnectionFailure(true) // 失败重发
                .build()
        val retrofit = Retrofit.Builder()
                .baseUrl("https://www.baidu.com")
                .addCallAdapterFactory(RxJavaCallAdapterFactory.create()) // 添加Rx适配器
                .addConverterFactory(GsonConverterFactory.create()) // 添加Gson转换器
                .client(okHttpClient)
                .build()
        appService = retrofit.create(AppService::class.java)
    }

    private fun <T> observer(observer: Observer<T>, observable: Observable<T>): Subscription? {
        return observable.subscribeOn(Schedulers.io())
                .unsubscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(observer)
    }

    fun upload(key: String, file: File, observer: BaseObserver<Any>): Subscription? {
        val requestFile = RequestBody.create(MediaType.parse("multipart/form-data"), file)
        val data = MultipartBody.Part.createFormData("avatar", file.name, requestFile)
        val key = RequestBody.create(MediaType.parse("multipart/form-data"), key)
        val client = RequestBody.create(MediaType.parse("multipart/form-data"), "android")
        return observer(observer, appService.upload(
                key,
                data,
                client
        ))
    }
}