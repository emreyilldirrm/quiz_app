import 'package:quiz_app/Flags.dart';
import 'package:quiz_app/VeritabaniYardimcisi.dart';

class Flags_D_A_O {

    Future<List<Flags>> Randomly_fetch_5_data() async{

      var db = await VeritabaniYardimcisi.veritabaniErisim();

      List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

      return List.generate(maps.length, (i) {
        var satir = maps[i];

        return Flags(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
      });
}

    Future<List<Flags>> randomly_fetch_3_wrong_data(int bayrak_id) async{

      var db = await VeritabaniYardimcisi.veritabaniErisim();

      List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar  WHERE bayrak_id != 3 ORDER BY RANDOM() LIMIT 3");

      return List.generate(maps.length, (i) {
        var satir = maps[i];

        return Flags(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
      });
    }
}