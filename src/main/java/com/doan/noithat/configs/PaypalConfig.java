package com.doan.noithat.configs;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

@Configuration
public class PaypalConfig {

	@Value("AYD7i2FInxHWf4QCbvGBn2GTZCkUDqhA9wVCm8O4mFed8mMtVW-QldKM6CietAjr6Slzd5t-m5Ru8AcX")
    private String clientId;
	@Value("ENqq0Kv_IGG4GA156WYv64Q_LrBMyS1G8I1HI9LFV0wI6ncrbjLC-y1VsUgr51LuOIyguoUzBFJ26Oym")
    private String clientSecret;
	@Value("sandbox")
    private String mode;
    
	@Bean
	public Map<String, String> paypalSdkConfig(){
		Map<String, String> sdkConfig = new HashMap<>();
		sdkConfig.put("mode", mode);
		return sdkConfig;
	}
	
	@Bean
	public OAuthTokenCredential authTokenCredential(){
		return new OAuthTokenCredential(clientId, clientSecret, paypalSdkConfig());
	}
	
	@Bean
	public APIContext apiContext() throws PayPalRESTException{
		APIContext apiContext = new APIContext(authTokenCredential().getAccessToken());
		apiContext.setConfigurationMap(paypalSdkConfig());
		return apiContext;
	}
}