import 'package:finalproject/login.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
class datamodle{
  String imageurl;
  String titel;
  String describtion;
  datamodle({
    required this.imageurl,
    required this.titel,
    required this.describtion,
});
}
class onbording extends StatefulWidget {
  const onbording({super.key});

  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  List <datamodle> dataList=
  [datamodle(imageurl: "assets/image/Frame.png", titel: "Now reading books will be easier", describtion: " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."),
  datamodle(imageurl: "assets/image/frame2.png", titel: "Your Bookish Soulmate Awaits", describtion: "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience."),
  datamodle(imageurl: "assets/image/frame3.png", titel: "Start Your Adventure", describtion: "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!")];
 int curr=0;
 PageController control=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(

          style: ElevatedButton.styleFrom(alignment:Alignment.bottomCenter,backgroundColor: Colors.deepPurple,
              padding:const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          onPressed: (){
            if(curr<dataList.length-1){
        control.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);}
            else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
            }
      }, child: Text(curr!=2?"Continue":"Get Started",style: TextStyle(color: Colors.white,fontWeight: .bold),)),
     body: Column(
       children: [
         SizedBox(height: 300,
             child:PageView.builder(
               controller: control,
               onPageChanged: (value){
                 setState(() {
                   curr=value;
                 });
               },
                 itemCount:dataList.length,
                 itemBuilder: (context,index){
       final item= dataList[index];
       return Image.asset(item.imageurl);
     })),
        SizedBox(height: 20,),
        DotsIndicator(
        dotsCount: dataList.length,
        position: curr.toDouble(),
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),),
       SizedBox(height: 25,),
       Text(dataList[curr].titel,style: TextStyle(fontSize: 20,fontWeight: .bold),textAlign: .center,),
         SizedBox(height: 15,),
         Text(dataList[curr].describtion,style: TextStyle(fontSize: 14,fontWeight: .bold),textAlign: .center,),

       ],),
    );
  }
}
