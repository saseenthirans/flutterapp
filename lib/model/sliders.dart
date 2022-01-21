class SliderInfo{
  String title="";
  String image="";
  SliderInfo(String image,String title){
   
    // ignore: prefer_initializing_formals
    this.title=title;
    // ignore: prefer_initializing_formals
    this.image=image;
  }
  SliderInfo.fromJson(Map json)
      :title=json['title'],
        image=json['image'];
}