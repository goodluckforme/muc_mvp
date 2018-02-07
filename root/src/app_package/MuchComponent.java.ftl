package ${componentPackageName};

import ${apiMoudlePackageName}.AppModule;
import ${apiMoudlePackageName}.ApiModule;
import dagger.Component;
import android.content.Context;
import ${apipackageName}.AppApi;

@Component(modules = {AppModule.class, ApiModule.class})
public interface AppComponent {
   Context getContext();
   AppApi getShopApi();
}