import 'package:ieeewie/core/helpers/app_images.dart';

class AboutUs {
  final String? image;
  final String? title;
  final String? description;
  final List<String>? points;

  AboutUs({
    this.image,
    this.title,
    this.description,
    this.points,
  });

  static final IEEEWIE = AboutUs(
    description:
        "IEEE Women in Engineering (WIE) is one of the largest international"
        " professional organizations dedicated to promoting women engineers,"
        " scientists, and inspiring girls around the world to follow their academic interests"
        " in a career in engineering. The mission of IEEE WIE is to facilitate the recruitment and retention of women"
        " in technical disciplines globally.",
    image: AppImages.ieeeWie,
  );

  static final IEEE = AboutUs(
    image: AppImages.ieeeLogo,
    description:
        "Institute of Electrical and Electronics Engineers (IEEE) is the world’s largest technical professional organization"
        " dedicated to advancing technology for the benefit of humanity. IEEE and its members inspire a global community"
        " through their highly cited publications, conferences, technology standards, and professional and educational activities.",
  );

  static final iEEEEgypt = AboutUs(
    image: AppImages.logo,
    description:
        "IEEE WIE Egypt Section aims to empower Egyptian woman to establish her self-realization in the society and focuses on the Egyptian women needs by facilitating exchange and sharing experience in different fields. ",
  );

  static final IEEEAim = AboutUs(
    description:
        "IEEE WIE Egypt Section aims to empower Egyptian woman to establish her self-realization in the society"
        " and focuses on the Egyptian women needs by facilitating exchange and sharing experience in different fields.",
  );

  static final mission = AboutUs(
    points: [
      "Introduce the motivation and activities of Egypt WIE to a large sector of people involving universities, academic staff, young professionals, market-place agents, women, senior and junior youth … etc.",
      "Establish a large networking (regionally and internationally), provide local forums, and empower women and youth to discuss and exchange their ideas in many innovative development directions",
      "Improve the value of IEEE membership by increasing services and benefits and Foster community awareness of IEEE WIE activities and existing benefits",
      "Empower women and young youth to participate in national and international events including conferences, regional International Leadership Summits, competitions and other events",
      "Career advising for women in the profession: Held events and webinars to empower women, and invite pioneer representatives and invited speakers to give positive passion",
      "Organizing Professional Training Sessions for Free, in cooperation with industry",
      "Highlight the role model women that do significant contribution and encourage awarding scenarios. Encourage the recognition of the outstanding achievements of women in engineering through IEEE Awards nominations",
      "Encourage co-sponsoring events, conferences, forums, competitions that promote the female development and engagement role and gender diversity.",
      "Encourage Cooperations with IEEE Societies, Chapters and Affinity Groups."
    ],
  );

  static final vision = AboutUs(
    points: [
      "Promoting women engineers and scientists, and inspiring girls and youth in Egypt to follow their academic and practical interests and leadership in a career in engineering and encouraging the link with community services",
      "Envision a vibrant community of IEEE women and men collectively encouraging creativity, innovation and great added contribution to regional and international community, humanity and market place",
      "Connects members to advance women in technology at all points in their life and career and advocate women in leadership roles",
      "Bridge the gap between Academic life, marketplace and community services",
      "Promoting international cooperation",
      "Search Partenership with Marketplace"
    ],
  );
}
