
import 'package:http/http.dart' as http;

class ApiService1 {



   void httpget() async
  {   var url = Uri.http('10.0.2.2:3000', '/api/auth');
    print(url);

  // Await the http get response, then decode the json-formatted response.

     try
         {
           var response = await http.get(url);

           if (response.statusCode == 200) {
             print('Number of books about http: .' + response.body);
           } else {
             print('Request failed with status: ${response.statusCode}.');
           }
         }catch (e )
    {
      print("dans le catch");
      print(e.toString());
    }
  }

}



