import 'package:get/get.dart';
import 'package:luk_to_learn/model/video.demo.dart';

class VideoController extends GetxController{
  
RxString video = ''.obs;



  void getCourseVideo(String courseName){
     var newList = videoDemo.where(
      (element) => element.c_id == courseName,
    );


  }
  



}