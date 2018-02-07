package ${apipackageName}


import ${baseContractPackageName}.*
import ${dataPackageName}.*
import okhttp3.MultipartBody
import okhttp3.RequestBody
import retrofit2.http.*
import rx.Observable
import java.util.*

/**
 * Created by MaQi on 2017/12/21.
 */
interface AppService {

    @POST("LOGIN")
    @FormUrlEncoded
    fun login(
            @Field("username") username: String,
            @Field("password") password: String,
            @Field("client") client: String = "android"
    ): Observable<HttpResult<Any>>


    @POST("REGISTER")
    @FormUrlEncoded
    fun register(
            @Field("mobile") mobile: String,
            @Field("password") password: String,
            @Field("inviter") inviter: String,
            @Field("type") type: Int,
            @Field("mobilecode") mobilecode: String,
            @Field("client") client: String
    ): Observable<HttpResult<Any>>

    @POST("SENDCODE")
    @FormUrlEncoded
    fun sendCode(
            @Field("mobile") mobile: String,
            @Field("timeStamp") timeStamp: String = ""+(Calendar.getInstance().timeInMillis / 1000)
    ): Observable<HttpResult<Any>>

    @POST("FINDPWD")
    @FormUrlEncoded
    fun findPwd(
            @Field("mobile") mobile: String,
            @Field("mobilecode") mobilecode: String,
            @Field("password") password: String,
            @Field("client") client: String
    ): Observable<HttpResult<Any>>

    @Multipart
    @POST("UPLOADPIC")
    fun uploadPic(
            @Part("key") path: RequestBody,
            @Part file: MultipartBody.Part,
            @Part("client") client: RequestBody
    ): Observable<HttpResult<Any>>

    @Multipart
    @POST("ADDIMG")
    fun addImg(
            @Part("key") path: RequestBody,
            @Part file: MultipartBody.Part,
            @Part("client") client: RequestBody
    ): Observable<HttpResult<Any>>

    @Multipart
    @POST("AVATAR")
    fun upload(
            @Part("key") path: RequestBody,
            @Part file: MultipartBody.Part,
            @Part("client") client: RequestBody
    ): Observable<HttpResult<Any>>

    @GET("GETFAVORITE")
    fun getFavorite(
            @Query("key") key: String,
            @Query("coordinate") coordinate: String,
            @Query("curpage") curpage: Int,
            @Query("page") page: Int,
            @Query("client") client: String = "android"
    ): Observable<HttpResult<Any>>
}
