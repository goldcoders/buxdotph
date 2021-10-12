 ## Bux Ph Dart SDK

 ## 3 New Apis
 - OAUTH API : Generate token to be used on other 2 new Api
 - REPORTS API: List All Orders
 - MULTI-walet Api (we will not use this)

## guide on packages
https://flutter.dev/docs/development/packages-and-plugins/developing-packages
 ## Usage Api
 Bux.checkout(params);
- https://github.com/goldcoders/bux.ph-checkout
 ```
 const apiURL = `${BUX_BASE_URL}/open/checkout`
 ```

- https://github.com/goldcoders/bux.ph-notification-url
 ```
 const apiURL = `${BUX_BASE_URL}/notification_url?req_id=${req_id}&client_id=${BUX_CLIENT_ID}&status=${status}&signature=${signature}`
 ```

- https://github.com/goldcoders/bux.ph-channel-codes
 ```
 const apiURL = `${BUX_BASE_URL}/channel_codes?client_id=${BUX_CLIENT_ID}`
 ```

 - https://github.com/goldcoders/bux.ph-check-code
 ```
 const apiURL = `${BUX_BASE_URL}/check_code?req_id=${req_id}&client_id=${BUX_CLIENT_ID}&mode=API`
 ```

 - https://github.com/goldcoders/bux.ph-generate-code
 ```
const apiURL = `${BUX_BASE_URL}/generate_code`
 ```

 Bux.direct(channel_code,params,notification_url,redirect_url);

 Bux.fetch(req_id);

 Bux.channels()

## env
```
BUX_API_KEY=
BUX_BASE_URL=
BUX_CLIENT_ID=
BUX_NOTIFY_URL
BUX_REDIRECT_URL
BUX_SITE_DOMAIN
```

## Batch Api
https://developers.bux.ph/#tag/Credentials
its possible to create a batch payment links
we can use this to create multiple payment links
links that we can use for inventory
maximum of 50...
