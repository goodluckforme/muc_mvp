/**
 * Copyright 2016 JustWayward Team
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ${baseContractPackageName};


import android.databinding.ViewDataBinding

import rx.Subscription
import rx.subscriptions.CompositeSubscription

/**
 * Created by lfh on 2016/9/11.
 * 基于Rx的Presenter封装,控制订阅的生命周期
 * unsubscribe() 这个方法很重要，
 * 因为在 subscribe() 之后， Observable 会持有 Subscriber 的引用，
 * 这个引用如果不能及时被释放，将有内存泄露的风险。
 */

open class RxPresenter<T : BaseContract.BaseView, M : ViewDataBinding> : BaseContract.BasePresenter<T, M> {

    protected lateinit var mView: T
    protected lateinit var mContentView: M
    protected val mCompositeSubscription: CompositeSubscription by lazy {
        CompositeSubscription()
    }

    protected fun unSubscribe() {
        mCompositeSubscription.unsubscribe()
    }

    protected fun addSubscrebe(subscription: Subscription) {
        mCompositeSubscription.add(subscription)
    }

    override fun attachView(view: T) {
        this.mView = view
    }
    
    override fun getLayoutRes(contentView: M) {
        this.mContentView = contentView
    }
    
    override fun detachView() {
        unSubscribe()
    }
}