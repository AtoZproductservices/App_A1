import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //home se hamara display design start hota hai
      home: Scaffold(
        //appBar me title design hota hai
        appBar: AppBar(title: Text('SeedhaSaach')),
        //body me hm logo ko main content dikhta hai title ke below hoti hai
        body: Center(
          //Column me verticle list of widget assign hoti hai
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //yh raha boxShadow jis image me shadow use hui hai
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(3, 2),
                    ),
                  ],
                ),
                //image ko circular radius dene ke liye
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    //AsserImage me local image load hoti hai jo hm file path se extract krte hai
                    image: AssetImage('assets/logo.png'),
                    height: 250,
                    width: 200,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image(
                //NetworkImage me hm image ko globally internet browser se le skte hai
                image: NetworkImage('https://picsum.photos/512'),
                width: 250,
                height: 200,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                loadingBuilder:
                    //loadingBuilder jb image load ho rahi hai to progress tk kya dikhega hm yha bata skte hai
                    (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                errorBuilder:
                    //errorBuilder me image load nahi hoti hai agr kisi karan se network issue ya wrong link to user ko kya display hoga hm yha design kr skte hai or bata skte hai
                    (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        color: Colors.orange,
                        child: Text('Loading Error'),
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
