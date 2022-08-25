import 'dart:html';

import 'package:coronavirus_rest_api_app/app/ui/endpoint_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @Override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _cases;
  @Override  
  void initState() {
    super.initState();
    _updateData();
  }


  Future<void> _updateData() async( 
    try{
    final dataRepository= Provider.of<DataRepository>(context, listen: false);
    final endpointsData= await dataRepository.getAllEndpointData(Endpoint.cases);
    setState(()=> _cases=cases);
    } on SocketExeption catch(_){
      showDialog( 
        context: context,
        title: 'Connection Error',
        content: 'Could not retrieve data.Plase try again',
        deafultActionText: 'OK',
      );
    }
  )
  @Override
  Widget build(BuildContext context) {
    final formatter= LastUpdatedDateFormatter( 
      lastUpdated: _endpointsData != null ? _endpointsData.values[Endpoint.cases].date : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(  
          children: <Widget>[
            LastUpdatedStatusText( 
              text:  _endpointsData != null ? _endpointsData.values[  Endpoint.cases].date.toString(): null,
            ),
            for(var endpoint in Endpoint.values)
          EndpointCard(
            endpoint: endpoint,
            value: _endpointsData != null ? _endpointsData.values[endpoint].value: null,
          ),
        ],
          
        )
        
      ),
    );
  }
}
