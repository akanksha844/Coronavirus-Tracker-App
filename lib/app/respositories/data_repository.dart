import 'package:coronavirus_rest_api_app/app/respositories/endpoints_data.dart';
import 'package:coronavirus_rest_api_app/app/services/api.dart';
import 'package:coronavirus_rest_api_app/app/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({@required this.apiService});
  final APIService apiService;
  String _accessToken;
  Future<EndpointData> getEndpointData(Endpoint endpoint) aync => 
  await _getDataRefreshingToken<EndpointData>( 
    onGetData : () => apiService.getEndpointsData()
  ),
  );
    
    return await apiService.getEndpointData( 
      accessToken: accessToken, endpoint : endpoint
     }on Response catch(response){
      if(response.statusCode == 401){
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData( 
          accessToken: _accessToken, endpoint: endpoint);
        
 
      }
      rethrow;
     } 
  } 

  Future<EndpointsData> getEndpointData() aync{
    try{
      if(_accessToken == null){
        _accessToken = await apiService.getAccessToken();
      }
    
    return await apiService.getEndpointData( 
      accessToken: accessToken, endpoint : endpoint
     }on Response catch(response){
      if(response.statusCode == 401){
        _accessToken = await apiService.getAccessToken();
        return await _getAllEndpointsData();
        

      }
      rethrow;
     } 
  }

  Future<T> _getDataRefreshingToken<T>({Future<T> Function()onGetData}) aync{
    try{
      if(_accessToken == null){
        _accessToken = await apiService.getAccessToken();
      }
    
    return await apiService.getEndpointData( 
      accessToken: accessToken, endpoint : endpoint
     }on Response catch(response){
      if(response.statusCode == 401){
        _accessToken = await apiService.getAccessToken();
        return await onGetData();
        

      }
      rethrow;
     } 
  }


  Future<EndpointsData> _getAllEndpointsData() async{ 
    await Future.wait([ 
      apiService.getEndpointsData( 
        accessToken: _accessToken, endpoint: Endpoint.cases
      ), 
      apiService.getEndpointsData( 
        accessToken: _accessToken, endpoint: Endpoint.casesSuspected
      ),
      apiService.getEndpointsData( 
        accessToken: _accessToken, endpoint: Endpoint.casesConfirmed
      ),
      apiService.getEndpointsData( 
        accessToken: _accessToken, endpoint: Endpoint.deaths
      ),
      apiService.getEndpointsData( 
        accessToken: _accessToken, endpoint: Endpoint.recovered
      ),

    ]);
    return EndpointsData( 
      values : { 
        Endpoint.cases: values[0],
        Endpoint.casesSuspected: values[1],
        Endpoint.casesConfirmed: values[2],
        Endpoint.deaths: values[3],
        Endpoint.recovered: values[4],
      }
    )
     
  }
}
