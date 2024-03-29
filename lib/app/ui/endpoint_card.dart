import 'package:flutter/cupertino.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value})
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardsData = 
{
  Endpoints.cases: 
  EndpointCardData('Cases', 'assets/count.png', Color(0xFFFFF492)),
  Endpoint.casesSuspected: EndpointsCardData( 
    'Suspected cases', 'assets/suspect.png', Color(0xFFEEDA28)),
  Endpoints.casesConfirmed: EndpointsCardData( 
  'Confirmed cases', 'assets/fever.png',Color(0xFFEE99600) ),
  Endpoint.deaths: EndpointsCardData('Deaths', 'assets/death.png', Color(0xFFE40000)),
  Endpoints.recovered: EndpointsCardData('Recovered', 'assets/patient.png', Color(0xFF0A901)),

};
String get formattedValue{
  if(value == null){
    return '';
  }
  return NumberFormat('#,###,###,###').format(value);
}

  @Override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding( 
      padding:const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), 
      child: Card(  
        child: Padding( 
          padding: const EdgeInsets.all(8.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,  
            children: <Widget>[ 
              Text( 
            cardData.title,
            style: Theme.of(context).textTheme.headLine,
          ), 
          SizedBox[height : 4],
          SizedBox(
            height : 52,
          
            
        
          child:  Row ( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
          Image.asset(cardData.assetName),
          
          Text(  
           formattedValue,
            style: Theme.of(context).textTheme.display1.copyWith( 
              color: cardData.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    
        ),
        ),
      ),
      
    );
  }
}
