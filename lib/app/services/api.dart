import 'package:flutter/foundation.dart';
import 'package:coronavirus_rest_api_app/app/services/api.dart';

enum Endpoint{
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}
class API{
 
  API{{@required this.apiKey}};
  final String apiKey;
  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);
  static final String host = 'https://ncov2019-admin.firebaseapp.com';
  Uri tokenUri() => Uri( 
    scheme : 'https',
    host : host,
    path : 'token',
    queryParameters: {'grant_type': 'client_credentials'},
  );
Uri endpointUri(Endpoint endpoint) => Uri( 
  scheme: 'https',
  host : host,
  port: port,
  path: '$basePath/${_paths[endpoint]}',
); 

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspsected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  }

} 
