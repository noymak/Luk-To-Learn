class VideoDemo {
  String? c_id, titleName, fileUrl;
  VideoDemo(
      {required this.c_id, required this.titleName, required this.fileUrl});
}

List<VideoDemo> videoDemo = [
  VideoDemo(
    c_id: 'art',
    titleName: 'video 1',
    fileUrl:
        "https://firebasestorage.googleapis.com/v0/b/luktolearn-fd692.appspot.com/o/videotest%2FSTAYC(%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8)%20'ASAP'%20MV.mp4?alt=media&token=7e123232-eb9f-45d4-8bc6-6ef4cc9d6777",
  ),
   VideoDemo(
    c_id: 'manybath',
    titleName: 'video 2',
    fileUrl:
        'https://res.cloudinary.com/dtdhnrtir/video/upload/v1659454145/video/y2mate.com_-_STAYC%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_BEAUTIFUL_MONSTER_Dance_Practice_1080p_rskuzt.mp4',
  ),
  VideoDemo(
    c_id: 'manybath',
    titleName: 'video 3',
    fileUrl:
        'https://res.cloudinary.com/dtdhnrtir/video/upload/v1668840405/video/STAYC_%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_SO_BAD_MV_yj3xyf.mp4',
  ),
];
