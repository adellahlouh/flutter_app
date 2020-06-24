import 'package:flutterapp/util/Res.dart';

class Section {
  String title;
  String imagePath;
  String url;
  String descriptionSection;
  String blogPathFile;

  SectionType type;
  List<Section> listSection;

  Section(
      {this.title,
      this.imagePath,
      this.type,
      this.url,
      this.listSection,
      this.descriptionSection,
      this.blogPathFile});
}

enum SectionType { Pdf, Page, WebView, Blog }

List<Section> mainSectionList = [
  Section(
      title: "سمكة لا تجيد السباحة",
      imagePath: ImageHelper.FISH_PNG,
      type: SectionType.Pdf),
  Section(
      title: "فيديوهاتي",
      imagePath: ImageHelper.VIDEO,
      type: SectionType.WebView,
      url:
          "https://www.youtube.com/channel/UCFqNz-9E20GV5sStKbEv96A?view_as=subscriber"),
  Section(
      title: "هدفي،ثقتي،وقتي",
      imagePath: ImageHelper.GOAL,
      type: SectionType.Page,
      listSection: myGoals),
  Section(
      title: "تتعلم انجليزي ؟",
      imagePath: ImageHelper.ENGLISH,
      type: SectionType.Page,
      listSection: learnEnglish,
      descriptionSection:
          "من أكتر الطرق فعالية في تعلم اللغة الإنجليزية هي حفظ الجمل، لأنه فكرة إنك تحفظ كلمة كلمة فكرة قديمة ومش فعالة ..\n"

          "ميزة الجمل على بعضها إنها بتعطيك مجال لتخمين المعنى ، وكمان بتعلمك أكثر من كلمة مرة واحدة.. يعني يالله نيجي للمفيد :\n"
"\n"
          "1- بأكد كالعادة على تطبيق memrise و Doulingo العظيمين ، وموقع voscreen الرهيب ..\n"
          "2- بأكد كالعادة على مسلسل Friends الكوميدي الغني عن التعريف ، استفدت منه بالانجليزي أكثر من 4 سنوات جامعة ، نصيحتي : احضره مرتين ، أول مرة بترجمة وثاني مرة بدون ترجمة .."),
  Section(
      title: "مش عارف ادرس!",
      imagePath: ImageHelper.NOT_STUDY,
      type: SectionType.Page,
      listSection: notStudy),
  Section(
      title: "بدي أشتغل عالنت",
      imagePath: ImageHelper.WORK_ONLINE,
      blogPathFile: "assets/res/blog_work_internet.txt",
      type: SectionType.Blog),
  Section(
      title: "تعلم وانت ببيتك",
      imagePath: ImageHelper.LEARN_HOME,
      type: SectionType.Blog,
      blogPathFile: "assets/res/learn_in_home.txt"),
  Section(
      title: "اقرأ اقرأ",
      imagePath: ImageHelper.BOOK,
      type: SectionType.Blog,
      blogPathFile: "assets/res/blog_read_read.txt"),
  Section(title: "حساباتي ومواقعي", imagePath: ImageHelper.WEB, type: SectionType.Page,listSection: myAccount),

  Section(title: "لماذا هذا التطبيق؟", imagePath: ImageHelper.WHY_APP,
      type: SectionType.Blog,
      blogPathFile: "assets/res/blog_about_app.txt"),
];
List<Section> myGoals = [
  Section(
      title: "كيفية إيجاد شغفك",
      url: "http://hasanalhalaby.com/ahdaf1",
      type: SectionType.WebView),
  Section(
      title: "كيفية تحديد الأهداف",
      url: "http://hasanalhalaby.com/ahdaf1",
      type: SectionType.WebView),
  Section(
      title: "كيفية كتابة الأهداف الشخصية",
      url: "http://hasanalhalaby.com/ahdaf3",
      type: SectionType.WebView),
  Section(
      title: "كيفية تحقيق اصعب اهدافك",
      url: "http://hasanalhalaby.com/ahdaf4",
      type: SectionType.WebView),
  Section(
      title: "كيفية ترتيب الأولويات",
      url: "http://hasanalhalaby.com/awlawiat",
      type: SectionType.WebView),
  Section(
      title: "كيفية إدارة الوقت",
      url: "http://hasanalhalaby.com/waqt",
      type: SectionType.WebView),
  Section(
      title: "كيفية تنظيم يومك",
      url: "http://hasanalhalaby.com/tantheem",
      type: SectionType.WebView),
  Section(
      title: "كيفية تغيير نفسك",
      url: "http://hasanalhalaby.com/tagheer",
      type: SectionType.WebView),
  Section(
      title: "كيفية مواجهة الضغوط",
      url: "http://hasanalhalaby.com/doghot",
      type: SectionType.WebView),
  Section(
      title: "كيفية الشعور بالثقة",
      url: "http://hasanalhalaby.com/theqa1",
      type: SectionType.WebView),
  Section(
      title: "كيفية تحسين ثقتك بنفسك الان",
      url: "http://hasanalhalaby.com/theqa2",
      type: SectionType.WebView),
  Section(
      title: "كيفية التحلي بالثقة",
      url: "http://hasanalhalaby.com/theqa3",
      type: SectionType.WebView),
  Section(
      title: "كيفية أن تصبح أكثر ثقة بالنفس",
      url: "http://hasanalhalaby.com/theqa4",
      type: SectionType.WebView),
  Section(
      title: "كيفية استرداد الثقة بالنفس",
      url: "http://hasanalhalaby.com/theqa5",
      type: SectionType.WebView),
  Section(
      title: "كيفية اكتساب الثقة بالنفس",
      url: "http://hasanalhalaby.com/theqa6",
      type: SectionType.WebView),
];

List<Section> learnEnglish = [
  Section(
      title:
          "هذا أفضل كورس على اليوتيوب بيعلم الانجليزي بهاي الطريقة، شباب عرب استنبطوا جمل كاملة من الأفلام ، واستخدموها في تعلم الانجليزية .. الكورس مجاناً من هون :",
      url: "http://goo.gl/GbdKqp",
      type: SectionType.WebView),
  Section(
      title:
          " إسمع مقاطع فيديو كتير بالترجمة الإنجليزية فقط إلها ، هاي قائمة كاملة من اليوتيوب للتعلم بهاي الطريقة : ",
      url: "http://goo.gl/C8OQmN ",
      type: SectionType.WebView),
  Section(
      title:
          "هذا أفضل كورس محادثة على اليوتيوب ، والحلقة 7 دقايق فقط (عشان ما تزهقش) ",
      url: "http://goo.gl/Sen996",
      type: SectionType.WebView),
  Section(
      title: "اقرأ هالنصائح المهمة في كيفية تعلم أي لغة في 3 شهور",
      url: "http://goo.gl/2y6DzX",
      type: SectionType.WebView),
];

List<Section> notStudy = [
  Section(
      title: "كيفية التركيز في دراستك",
      url: "http://hasanalhalaby.com/tarkeez1",
      type: SectionType.WebView),
  Section(
      title: "كيفية تنظيم جدول للدراسة",
      url: "http://hasanalhalaby.com/jadwal",
      type: SectionType.WebView),
  Section(
      title: "كيفية النجاح في الدراسة",
      url: "http://hasanalhalaby.com/najah",
      type: SectionType.WebView),
  Section(
      title: "كيفية الاجتهاد في الدراسة",
      url: "http://hasanalhalaby.com/ejtehad",
      type: SectionType.WebView),
  Section(
      title: "كيفية التركيز في الدراسة",
      url: "http://hasanalhalaby.com/tarkeez2",
      type: SectionType.WebView),
  Section(
      title: "كيفية المذاكرة",
      url: "http://hasanalhalaby.com/mozakra",
      type: SectionType.WebView),
];

List<Section> myAccount = [
  Section(
      title: "The h2 Academy",
      url: "https://www.theh2academy.com/",
      type: SectionType.WebView),
  Section(
      title: "موقعي الشخصي",
      url: "https://hasanalhalaby.com/",
      type: SectionType.WebView),
  Section(
      title: "موقع زوّد لخدمات السوشال ميديا",
      url: "https://zawwd.com/",
      type: SectionType.WebView),
  Section(
      title: "حسابي في فيسبوك",
      url: "https://www.facebook.com/hasanhalaby2012",
      type: SectionType.WebView),

  Section(
      title: " حسابي في انستقرام",
      url: "https://www.instagram.com/hasanalhalaby/",
      type: SectionType.WebView),


];
