# Coronavirus_Tracker_App
Realtime flutter app to check  Cases, Suspected Cases, Confirmed Cases, Deaths and Recovered Cases from Coronavirus. 


Flutter App which is a single page widget has following features: 

       ( Outside world Layer )
1.  Talk to web server to make requests from nCov_2019_REST_API     
2.  Will not use REST client as it's flutter app , Dart_http_package will make HTTP requests directly in Dart and process incoming       responses so that extracted data can be shown on screen
 
       ( Domain Layer )
3. Api_Service class gives Domain specific Api which will be use further in app.

     APIService class (which contains token and endpoint data)  will be  :
    a)  pure (holds no state)
    b) but we need state to hold the access_token in order to call remaining endpoint

      ( Presentation and Logic Layer ) 
 4.  Data_Repository class will keep track of access token and refresh access token when needed.
     a) nCov_2019_REST_API gives data for five different endpoints : Cases, Suspected Cases, Confirmed Cases, Deaths and Recovered 
  
 5. Data Repository class combines these five endpoints asynchronous responses and make updated data available at once.
 
      (  UI Layer)
 6. DashBoard using reusable widget classes with smaller specialised widgets. Also composed them together.
 
 
 7. Implemented features to look after Error Handling and Data Caching.
  
