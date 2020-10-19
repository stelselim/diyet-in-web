import 'package:diyetinweb/components/general/appBar.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "Diyet-in", context: context),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 800,
            color: Colors.blueGrey.shade50,
            child: ListView(
              physics: ScrollPhysics(),
              children: <Widget>[
                /// Blog Yazıları
                ///
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Image.asset(
                            "assets/AboutUs/team.jpeg",
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: Container(
                                child: Text(
                              "Peki \nBiz \nKimiz?",
                              style: TextStyle(
                                //fontSize: 14,
                                color: Colors.blueGrey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                              textScaleFactor: 4.5,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 15.0,
                //     horizontal: 45,
                //   ),
                //   child: Container(
                //       child: Text(
                //     "Peki biz kimiz?",
                //     style: TextStyle(
                //         //fontSize: 14,
                //         color: Colors.blueGrey.shade800,
                //         fontWeight: FontWeight.w600),
                //     textScaleFactor: 1.55,
                //   )),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 45,
                  ),
                  child: Container(
                      child: Text(
                    "Herkese merhaba, Teknolojinin bu derece ilerlediği bir dönemde her konuda olduğu gibi beslenme hakkında da birçok bilgi hemen elimizin altında oluyor. Peki bunca bilgi arasında hangisi doğru ya da sağlımız için tercih edilebilir? Bunu ayırt etmek zor değil mi?  Biz de 3 mühendis ve 5 diyetisyen olarak bunca bilgi kirliliği arasında sağlıklı beslenmeyi doğru bir şekilde sizlere aktarmak için yola çıktık. Bu uzun yolculukta önceliğimiz her zaman doğru bilgileri ve sağlıklı lezzetleri sizlere ulaştırmak olacak. Beslenme ile ilgili merak ettikleriniz, gündemde olanlar, uzun zamandır tartışılanlar, hızla hazırlamak zorunda kaldığınız öğünler için alternatifler, hem sağlıklı hem düşük kalorili fit tatlar, sağlıklı kilo almak için yüksek kalorili tarifler, dengeli tabak örnekleri ve daha fazlası için bizi takipte kalın.",
                    style: TextStyle(
                        //fontSize: 14,
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w500),
                    textScaleFactor: 1.25,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    child: Text(
                      "Sorumluluk Reddi",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: 500,
                                  child: Wrap(
                                    children: <Widget>[
                                      Text(
                                        "Diyetin uygulaması, tıbbi beslenme tavsiyeleri vermek niyetinde olmayıp, amacı sizlere sadece sağlıklı beslenme ile ilgili aradıklarınızı alakalı içeriklerimiz ile ilgili konuyu daha kolay anlamanızı sağlayacak şekilde bilgi vermektir. Vermiş olduğumuz tüm bilgiler kaynakları ile beraber yer almakta olup bu bilgilerde belirtilmiş veya ima edilmiş her türlü hata, eksiklik ya da uyuşmazlık konusunda herhangi bir sorumluluğu ve bunlardan kaynaklanabilecek doğrudan ya da dolaylı zarar veya kayıpların sorumluluğunu reddetmekteyiz.  Özel tıbbi beslenme tavsiyeleri sitemiz ve uygulamamız üzerinden verilmemekte olup, kişisel beslenme ve sağlık sorunlarınız için ilgili doktor ve diyetisyene başvurmanız önerilmektedir.",
                                        textScaleFactor: 1,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: RaisedButton(
                                          child: Text("Kapat"),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
