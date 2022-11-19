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
        'https://res.cloudinary.com/dtdhnrtir/video/upload/v1668323007/video/STAYC_%EC%8A%A4%ED%85%8C%EC%9D%B4%EC%94%A8_ASAP_MV_olqai5.mp4',
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
