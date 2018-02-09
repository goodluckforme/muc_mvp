<layout xmlns:android="http://schemas.android.com/apk/res/android">

    <data>

        <import type="${presenterPackageName}.${pageName}Presenter.${pageName}Model" />

        <variable
            name="${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Model"
            type="${pageName}Model" />
    </data>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

    </LinearLayout>
</layout>
