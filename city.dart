import 'dart:io';

Future<void> main()async{
  File txt = File('./city.txt');
  List cities = await txt.readAsLines();
  List all =[];
  cities.forEach((element) { 
    all.add({"value":'"$element"'});
  });
  print(all);

}