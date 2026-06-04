import 'package:flutter/material.dart';
import '../models/destination_model.dart';
import '../models/category_model.dart';

class DestinationController {
  // -----------------------------------------------------------------------
  // All Jordan destinations data (10 places, rich historical content)
  // -----------------------------------------------------------------------
  static final List<DestinationModel> _destinations = [
    // 1. PETRA
    DestinationModel(
      id: 1,
      name: 'Petra',
      city: 'Ma\'an Governorate',
      category: 'Historical',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/e8/Al_Deir_Petra.JPG',
      assetImage: 'assets/images/petra.jpg',
      shortDescription:
          'The rose-red city carved into sandstone cliffs — one of the Seven Wonders of the World.',
      fullDescription:
          'Petra is Jordan\'s most iconic archaeological treasure and one of the most remarkable ancient cities on Earth. Founded by the Nabataeans around the 4th century BC, the city was carved directly into the rose-red sandstone cliffs of the Wadi Musa valley. At its peak, Petra was a thriving capital of the Nabataean Kingdom and a vital crossroads of ancient trade routes connecting Arabia, Egypt, and the Mediterranean world.\n\nThe city stretches across more than 264 square kilometres and contains hundreds of elaborate tombs, temples, and civic buildings all cut from the living rock. The most famous structure, Al-Khazneh (The Treasury), stands 43 metres tall and is adorned with intricate Hellenistic carvings that have survived over two millennia. The Monastery (Al-Deir), perched high on the mountain, is even larger and equally breathtaking.\n\nPetra was later conquered by the Romans in 106 AD and absorbed into the Roman Empire as part of the province of Arabia Petraea. The city flourished briefly under Roman rule before a series of earthquakes and shifting trade routes led to its gradual abandonment. It remained largely unknown to the Western world until Swiss explorer Johann Ludwig Burckhardt rediscovered it in 1812.\n\nToday, Petra is a UNESCO World Heritage Site and has been named one of the New Seven Wonders of the World. Walking through the narrow Siq canyon, with its towering walls pressing in from either side, before emerging suddenly before the magnificent Treasury is one of the most dramatic experiences in all of travel.',
      ticketPrice: '50 JOD (adults) / 25 JOD (children)',
      bestTimeToVisit: 'March to May, September to November',
      activities: [
        'Walk through the Siq canyon to the Treasury',
        'Hike up to the Monastery (Al-Deir)',
        'Visit the Royal Tombs complex',
        'Explore the Colonnaded Street and Byzantine Church',
        'Petra by Night candlelit experience (Mon, Wed, Thu)',
        'Hike the High Place of Sacrifice trail',
      ],
      tips: [
        'Arrive at opening time (6:00 AM) to beat the crowds',
        'Wear comfortable walking shoes — you will walk 5–10 km',
        'Carry at least 2 litres of water per person',
        'The Monastery hike takes about 45 minutes but is very rewarding',
        'A 2-day ticket gives far better value than a single day',
        'Hire a local guide to understand the history deeply',
      ],
      mapsUrl: 'https://maps.app.goo.gl/petra',
      isFeatured: true,
    ),

    // 2. JERASH
    DestinationModel(
      id: 2,
      name: 'Jerash',
      city: 'Jerash Governorate',
      category: 'Historical',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/be/Jerash_City.jpg',
      assetImage: 'assets/images/jerash.jpg',
      shortDescription:
          'One of the best-preserved Roman provincial cities in the world, with 6,500 years of continuous history.',
      fullDescription:
          'Jerash — ancient Gerasa — is among the finest and most complete examples of a Roman provincial city in the world. Its history stretches back over 6,500 years, with evidence of Neolithic settlements, but it was under Greek and then Roman rule that the city reached its greatest splendour. Alexander the Great\'s successors founded the Hellenistic city, but it was the Romans who transformed it into a grand metropolis.\n\nAt its height in the 1st and 2nd centuries AD, Gerasa was a wealthy city of the Decapolis league, its streets alive with the commerce of the ancient world. The city was lavishly rebuilt after a royal visit by Emperor Hadrian in 129 AD, and today the triumphal Hadrian\'s Arch still marks the southern entrance.\n\nWhat makes Jerash extraordinary is the astonishing completeness of its ancient fabric. You can walk the entire Cardo Maximus — the colonnaded main street — with its original paving stones worn smooth by chariot wheels. The oval forum, an unusual elliptical plaza surrounded by 160 Ionic columns, has no parallel in the Roman world. Two theatres, the South and North, could seat thousands and still host performances today during the Jerash Festival of Culture and Arts.\n\nThe city\'s temples — including the Temple of Artemis, patron goddess of Gerasa, whose soaring columns still stand against the sky — give a powerful sense of the city\'s divine ambitions. Byzantine churches with mosaic floors were later built over pagan sites, layering faith upon faith across the centuries.\n\nJerash was damaged by a major earthquake in 749 AD and gradually abandoned, but its distance from later settlement meant its ruins remained largely intact, buried under centuries of soil until systematic excavations began in the 20th century.',
      ticketPrice: '10 JOD (adults) / 1 JOD (children)',
      bestTimeToVisit: 'October to April',
      activities: [
        'Walk the full length of the Cardo Maximus colonnaded street',
        'Visit the unique oval Forum (Oval Plaza)',
        'Explore the South and North theatres',
        'See the Temple of Artemis',
        'Attend the Jerash Festival of Culture and Arts (July)',
        'Watch the Roman Army and Chariot Experience show',
      ],
      tips: [
        'Allow at least 3 hours to see the main sites properly',
        'The Roman Army show runs at 11:00 AM and 2:00 PM',
        'Hire a guide at the entrance for a richer experience',
        'The site is hilly — wear good shoes',
        'Morning visits offer the best light for photography',
      ],
      mapsUrl: 'https://maps.app.goo.gl/jerash',
      isFeatured: true,
    ),

    // 3. AMMAN CITADEL
    DestinationModel(
      id: 3,
      name: 'Amman Citadel',
      city: 'Amman',
      category: 'Historical',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/6e/Amman_Citadel.jpg',
      assetImage: 'assets/images/amman_citadel.jpg',
      shortDescription:
          'Jebel al-Qal\'a — 7,000 years of layered history towering above the modern capital.',
      fullDescription:
          'The Amman Citadel, known in Arabic as Jebel al-Qal\'a (Hill of the Citadel), rises 850 metres above sea level and has been continuously occupied for at least 7,000 years — making it one of the longest-inhabited places on the planet. Its commanding position on the highest of Amman\'s seven original hills gave every civilisation that ruled here — Bronze Age Canaanites, Ammonites, Assyrians, Hellenistic Ptolemies, Romans, Byzantines, and Umayyad Arabs — both a strategic fortress and a sacred high place.\n\nThe Biblical city of Rabbath Ammon stood here; it was this city that King David captured and where he famously arranged the death of Uriah the Hittite. The Ammonites built their capital on this rock, and their heritage is preserved in the name "Amman" itself.\n\nThe citadel\'s most striking feature is the Temple of Hercules, built during the reign of Emperor Marcus Aurelius (161–180 AD). Its enormous columns are among the largest Corinthian columns in the world, and a pair of massive stone hands — believed to belong to a colossal statue of Hercules — lie dramatically in the dust nearby.\n\nNearby stands the Umayyad Palace, built in the 8th century AD when the Umayyad Caliphate ruled the Islamic world from Damascus. The palace\'s distinctive domed audience hall — modelled on Byzantine architecture — and its elaborate water system reveal the sophistication of early Islamic civil engineering.\n\nThe Jordan Archaeological Museum, located within the citadel, houses thousands of artefacts spanning the entire span of human civilisation in Jordan, from prehistoric tools to the famous Dead Sea Scrolls fragments.',
      ticketPrice: '3 JOD (adults)',
      bestTimeToVisit: 'October to April',
      activities: [
        'Explore the Temple of Hercules and see the giant stone hands',
        'Tour the Umayyad Palace and its domed audience hall',
        'Visit the Jordan Archaeological Museum',
        'Enjoy panoramic views over downtown Amman',
        'See the Byzantine church remains',
      ],
      tips: [
        'Combine with a visit to the Roman Theatre below the hill',
        'Best visited in the morning before tour groups arrive',
        'The views at sunset over Amman are spectacular',
        'The museum is included in the entry ticket price',
        'Wear layers — the hilltop can be windy even in summer',
      ],
      mapsUrl: 'https://maps.app.goo.gl/amman-citadel',
      isFeatured: true,
    ),

    // 4. AS-SALT
    DestinationModel(
      id: 4,
      name: 'As-Salt',
      city: 'Balqa Governorate',
      category: 'Historical',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/ed/AS-SALT_2.png',
      assetImage: 'assets/images/salt.jpg',
      shortDescription:
          'A UNESCO World Heritage city of 19th-century Ottoman architecture and multicultural coexistence.',
      fullDescription:
          'As-Salt (also written Al-Salt) is one of Jordan\'s most historically significant and visually distinctive cities, and in 2021 it was inscribed on the UNESCO World Heritage List for its outstanding example of Ottoman-era urban planning and its legacy of multicultural coexistence.\n\nNestled among the hills of the Balqa region, Salt was the most important administrative and commercial centre of the eastern Jordan region during the 19th and early 20th centuries, when it served as the seat of the Ottoman district of Balqa. The city prospered through trade with Bedouin tribes and the export of grain and olive oil, and wealthy merchant families — Muslim, Christian, and Circassian — built the impressive sandstone mansions that still define the city\'s character today.\n\nSalt\'s architecture is extraordinary. The "Saltine Yellow" limestone mansions, built in a distinctive style that blends Ottoman, European, and local vernacular influences, line the winding hillside streets. Arched windows framed by ornate stonework, decorative iron railings, and internal courtyards create townhouses of genuine elegance. Over 650 historic buildings survive, making Salt one of the best-preserved Ottoman urban landscapes in the Levant.\n\nThe city was actually proposed as the capital of the newly created Emirate of Transjordan in 1921, but Amman was ultimately chosen. Had history gone slightly differently, Salt would be Jordan\'s capital today.\n\nThe old markets (souk) of Salt are still active, selling spices, handmade goods, and local produce. The Salt Museum, housed in a beautifully restored Ottoman mansion, tells the story of the city and its people across the centuries.',
      ticketPrice: 'Free (museum: 2 JOD)',
      bestTimeToVisit: 'October to April',
      activities: [
        'Wander the old city streets and admire the limestone mansions',
        'Visit the Salt Museum in a restored Ottoman building',
        'Explore the traditional souk (market)',
        'See the Abu Jaber Mansion, the most ornate in the city',
        'Visit the Grand Mosque and surrounding historic quarter',
        'Try local knafeh and traditional sweets',
      ],
      tips: [
        'Salt is only 30 km from Amman — easy half-day trip',
        'Hire a local guide to access restored mansion interiors',
        'Friday mornings the market is most lively',
        'The city is a UNESCO site — treat the buildings with respect',
        'Ask locals about the stories behind each mansion family',
      ],
      mapsUrl: 'https://maps.app.goo.gl/as-salt',
      isFeatured: false,
    ),

    // 5. WADI RUM
    DestinationModel(
      id: 5,
      name: 'Wadi Rum',
      city: 'Aqaba Governorate',
      category: 'Desert',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/5/56/Mountain_in_Wadi_Rum%2C_Jordan.jpg',
      assetImage: 'assets/images/wadi_rum.jpg',
      shortDescription:
          'The Valley of the Moon — a vast, otherworldly desert of red sand and towering sandstone mountains.',
      fullDescription:
          'Wadi Rum — the Valley of the Moon — is the largest wadi (valley) in Jordan and one of the most spectacular desert landscapes on Earth. A UNESCO World Heritage Site, its vast expanse of red and orange sand dunes, towering granite and sandstone mountains, and ancient rock inscriptions create a landscape of such alien beauty that it has been used as the setting for films set on Mars, including The Martian and Rogue One.\n\nThe desert covers an area of over 700 square kilometres and contains mountains that rise up to 1,800 metres from the valley floor. The rock formations were sculpted over millions of years by wind, water, and geological forces into extraordinary shapes — natural arches, mushroom rocks, narrow gorges, and towering buttresses that glow red and gold at sunrise and sunset.\n\nWadi Rum is home to the Zalabia and Zwaideh Bedouin tribes, who have lived in this desert for centuries. Their traditions, knowledge of the desert, and warm hospitality are as much a part of the Wadi Rum experience as the landscape itself. Lawrence of Arabia camped in Wadi Rum during the Arab Revolt of 1917–18, and the red column of rock he described as the "vast, echoing" mountain remains known as the Seven Pillars of Wisdom.\n\nThe desert\'s rock faces are covered with Thamudic, Nabataean, and early Arabic inscriptions and rock art, some dating back 12,000 years, making it a living archive of human presence in the Arabian desert.',
      ticketPrice: '5 JOD (entry to protected area)',
      bestTimeToVisit: 'October to April',
      activities: [
        'Jeep tour of the main attractions and rock formations',
        'Camel trek through the red sand dunes',
        'Overnight in a Bedouin camp under the stars',
        'Rock climbing on the sandstone mountains',
        'Hot air balloon ride at sunrise',
        'Stargazing — some of the darkest skies in the Middle East',
      ],
      tips: [
        'Book a reputable Bedouin-run camp in advance',
        'A minimum 2-day visit allows you to see sunrise and sunset',
        'Temperatures drop sharply at night even in summer',
        'Negotiate jeep tour prices directly with drivers in the village',
        'The best sand dunes for photography are at Umm Ishrin',
      ],
      mapsUrl: 'https://maps.app.goo.gl/wadi-rum',
      isFeatured: true,
    ),

    // 6. DEAD SEA
    DestinationModel(
      id: 6,
      name: 'Dead Sea',
      city: 'Balqa / Madaba Governorate',
      category: 'Nature',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/6/6f/Dead_Sea_beach_00.JPG',
      assetImage: 'assets/images/dead_sea.jpg',
      shortDescription:
          'The lowest point on Earth — float effortlessly in the world\'s saltiest lake and heal your skin with mineral mud.',
      fullDescription:
          'The Dead Sea is one of the world\'s most extraordinary natural phenomena and a place of genuine geological wonder. Sitting at 430 metres below sea level, it is the lowest point on the surface of the Earth. The lake is so dense with salt — about 34% salinity, nearly ten times saltier than the ocean — that the human body floats effortlessly on the surface without any effort to swim, a surreal and unforgettable sensation.\n\nThe Dead Sea has been visited for thousands of years for its therapeutic properties. Ancient Egyptians imported Dead Sea bitumen for use in the mummification process. King Herod the Great built one of his palaces on the Jordanian shore. The Greek geographer Strabo wrote about the lake\'s extraordinary properties in the 1st century BC. Cleopatra reportedly prized the mineral-rich mud for its skin benefits.\n\nThe minerals dissolved in the water — magnesium, calcium, potassium, bromine, and dozens of others — are believed to have significant therapeutic benefits for skin conditions including psoriasis, eczema, and arthritis. The low altitude means the atmosphere above the Dead Sea has a higher oxygen concentration and is naturally filtered of ultraviolet rays, allowing visitors to sunbathe for longer without burning.\n\nThe Jordan side of the Dead Sea offers a quieter, more natural experience than the Israeli side. Several luxury resort hotels and public beaches line the Jordanian shore, and the scenery — looking across the shimmering water to the hills of the West Bank — is hauntingly beautiful. The Dead Sea is shrinking at a rate of about one metre per year due to water diversion from the Jordan River, making it all the more precious.',
      ticketPrice: 'Free (public beach) / 20–25 JOD (resort day access)',
      bestTimeToVisit: 'October to April',
      activities: [
        'Float in the hypersaline water (no swimming required)',
        'Apply Dead Sea black mineral mud to your skin',
        'Enjoy spa treatments at one of the luxury resorts',
        'Watch the sunset over the West Bank mountains',
        'Visit the Baptism Site of Jesus (Bethany Beyond the Jordan)',
      ],
      tips: [
        'Do NOT shave or wax for 2 days before — the salt burns cuts badly',
        'Wear old swimwear — the minerals stain and damage fabric',
        'Rinse off quickly in fresh water after leaving the water',
        'Keep water away from your eyes and mouth at all times',
        'The public beach at Amman Beach is the most affordable option',
        'Sunset is a magical time to float as the light turns golden',
      ],
      mapsUrl: 'https://maps.app.goo.gl/dead-sea-jordan',
      isFeatured: true,
    ),

    // 7. HAMMAM AL-MA\'EEN (Hammamat Ma\'in)
    DestinationModel(
      id: 7,
      name: 'Hammam Al-Ma\'een',
      city: 'Madaba Governorate',
      category: 'Nature',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/88/Ma%27in_Hot_Springs2.JPG',
      assetImage: 'assets/images/hammam_maaeen.jpg',
      shortDescription:
          'Dramatic thermal waterfalls cascading into natural hot spring pools among volcanic mountains.',
      fullDescription:
          'Hammam Al-Ma\'een, officially known as the Ma\'in Hot Springs or Hammamat Ma\'in, is one of Jordan\'s most spectacular and unique natural attractions. Set in a dramatic volcanic landscape of black basalt mountains, a series of thermal mineral waterfalls cascade down the rugged cliffside, with water temperatures ranging from a comfortably warm 40°C to a scalding 63°C, depending on the source and time of year.\n\nThe hot springs are fed by a complex network of underground thermal aquifers that flow through the volcanic rock of the region, picking up an extraordinary array of dissolved minerals — sodium, magnesium, calcium, potassium, lithium, and sulphur — before emerging at the surface in a rush of steaming, mineral-rich water. The dramatic sight of hot water streaming down the black lava rock face, wreathed in steam against the clear blue sky, is unlike anything else in Jordan.\n\nThe springs have been known and valued since ancient times. King Herod the Great is said to have visited them for therapeutic purposes, and they have been a destination for healing for at least two millennia. Today, the site is managed as a therapeutic spa resort by the Evason Ma\'In Hot Springs Hotel, which is built directly alongside the falls.\n\nVisitors can soak in the public outdoor pools fed by the thermal water, swim under the waterfall (where the force and heat of the water act as a natural Jacuzzi and hydrotherapy treatment), and access dedicated spa pools and treatment centres. The water\'s mineral content is believed to benefit skin conditions, joint pain, and respiratory problems.\n\nHammam Al-Ma\'een is located just 264 metres below sea level, close to the Dead Sea, and can be easily combined with a visit to the Dead Sea, Madaba, and Mount Nebo for a full-day circuit.',
      ticketPrice: '15 JOD (day access to hot springs)',
      bestTimeToVisit: 'November to March (cooler air makes hot water more pleasant)',
      activities: [
        'Soak in the natural thermal pools and mineral baths',
        'Stand under the hot waterfall for natural hydrotherapy',
        'Book spa treatments at the Evason resort',
        'Walk along the wadi and admire the volcanic landscape',
        'Combine with a visit to the nearby Dead Sea',
      ],
      tips: [
        'The water is very hot in some pools — test before stepping in',
        'Bring old swimwear — mineral water can discolour fabric',
        'Weekdays are much quieter than weekends',
        'Combine with Dead Sea and Madaba for a perfect day trip',
        'Book the resort spa in advance for treatment packages',
        'Do not visit with open wounds or skin infections',
      ],
      mapsUrl: 'https://maps.app.goo.gl/hammam-maaeen',
      isFeatured: true,
    ),

    // 8. MOUNT NEBO
    DestinationModel(
      id: 8,
      name: 'Mount Nebo',
      city: 'Madaba Governorate',
      category: 'Religious',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/07/Mount_Nebo_BW_6.JPG',
      assetImage: 'assets/images/mount_nebo.jpg',
      shortDescription:
          'The biblical mountaintop where Moses saw the Promised Land — and a place of profound serenity.',
      fullDescription:
          'Mount Nebo is one of the most sacred sites in the entire Abrahamic religious tradition and one of the most spiritually moving places in Jordan. According to the Book of Deuteronomy, this is the mountain to which Moses climbed at the end of his life, at God\'s command, to look out over the Promised Land of Canaan before he died — allowed to see but not to enter the land he had spent 40 years leading his people toward.\n\nThe view from the summit of Mount Nebo — at 817 metres above sea level — is genuinely extraordinary. On a clear day you can see the entire Jordan Valley stretched below, the Dead Sea shimmering in its basin, the rooftops of Jerusalem on the far horizon, the hills of Bethlehem and Jericho, and the distant glint of the Mediterranean Sea. It is a panorama of biblical geography that makes the scripture feel suddenly, powerfully real.\n\nThe site has been venerated by Christian pilgrims since at least the 4th century AD. Egeria, a Spanish nun who visited in 383 AD, wrote one of the earliest travel accounts in history describing her pilgrimage here. The Byzantine church built on the summit — the Memorial Church of Moses — contains some of the most beautiful and complete mosaic floors in the Holy Land, dating from the 5th and 6th centuries. The mosaics depict hunting and pastoral scenes with remarkable artistry.\n\nThe distinctive bronze serpentine cross sculpture at the summit — the Brazen Serpent Monument, designed by Italian artist Giovanni Fantoni — represents the bronze serpent that Moses raised in the wilderness to heal the Israelites, as described in Numbers 21, and is also associated with the cross of the crucifixion.\n\nMount Nebo is managed by the Franciscan Archaeological Institute, which has conducted excavations here since 1933. Pope John Paul II, Pope Benedict XVI, and Pope Francis have all visited.',
      ticketPrice: '3 JOD (adults)',
      bestTimeToVisit: 'Year-round (clearest views in winter)',
      activities: [
        'View the panorama of the Holy Land from the summit',
        'Visit the Moses Memorial Church and its Byzantine mosaics',
        'See the Brazen Serpent Monument bronze sculpture',
        'Walk the archaeological gardens surrounding the church',
        'Combine with Madaba (15 km) to see the famous mosaic map',
      ],
      tips: [
        'Winter and spring offer the clearest views to Jerusalem',
        'The mosaics inside the church are genuinely world-class — spend time with them',
        'Madaba is only 15 minutes away — always combine the two',
        'Modest dress is required inside the church',
        'Sunrise visits offer golden light and almost no crowds',
        'The site is well maintained — allow 1–2 hours minimum',
      ],
      mapsUrl: 'https://maps.app.goo.gl/mount-nebo',
      isFeatured: false,
    ),

    // 9. KING ABDULLAH I MOSQUE
    DestinationModel(
      id: 9,
      name: 'King Abdullah I Mosque',
      city: 'Amman',
      category: 'Religious',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/e/e9/King_Abdullah_I_Mosque%2C_Amman.jpg',
      assetImage: 'assets/images/king_abdullah_mosque.jpg',
      shortDescription:
          'The iconic blue-domed landmark of Amman, welcoming visitors to experience Islamic architecture and peace.',
      fullDescription:
          'The King Abdullah I Mosque is one of the most famous and recognizable architectural landmarks in Amman, Jordan. Built between 1982 and 1989 by the late King Hussein as a memorial to his grandfather, King Abdullah I (the founder of modern Jordan), the mosque is a magnificent example of contemporary Islamic architecture blended with traditional decorative arts.\n\nIts most striking feature is its magnificent blue dome, which rises 35 meters above the prayer hall and is decorated with golden Quranic inscriptions. The dome is 35 meters in diameter and sits without any internal supporting pillars, creating a massive, open, and airy prayer hall that can accommodate up to 7,000 worshippers. An additional 3,000 people can pray in the mosque\'s courtyard, and there is a separate women\'s section for 500 worshippers.\n\nThe mosque is designed with a octagonal floor plan, reflecting traditional Islamic geometric designs. The exterior walls are faced with light Jordan limestone, while the interior features a stunning red carpet representing the earth and a beautiful Mihrab (prayer niche) carved with intricate wood and gold leaf designs. The mosque is also flanked by two slender minarets designed with modern geometric lines.\n\nUnlike many active mosques, the King Abdullah I Mosque warmly welcomes non-Muslim visitors outside of prayer times. It houses an Islamic Museum containing collection of photographs and personal effects of King Abdullah I, as well as historic coins, Islamic pottery, and stone carvings.',
      ticketPrice: '2 JOD (non-Muslim visitors)',
      bestTimeToVisit: 'Year-round (Saturday to Thursday, 8:00 AM to 11:00 AM and 12:30 PM to 2:00 PM)',
      activities: [
        'Admire the massive blue dome and modern geometric architecture',
        'Tour the main prayer hall with its pillarless design',
        'Visit the Islamic Museum inside the mosque complex',
        'Browse the local souvenir bazaar next to the mosque',
        'See the nearby Greek Orthodox Church of Our Lady, demonstrating Amman\'s religious harmony',
      ],
      tips: [
        'Dress modestly — legs and arms should be covered',
        'Women are required to wear an abaya (traditional head/body cover), which is provided for free at the visitors\' entrance',
        'Remove shoes before entering the carpeted main prayer hall',
        'Photography is allowed, but be respectful and avoid taking photos of worshippers during prayers',
        'Combine with a walk to nearby Abdali or downtown Amman',
      ],
      mapsUrl: 'https://maps.app.goo.gl/king-abdullah-mosque',
      isFeatured: false,
    ),
  ];

  // -----------------------------------------------------------------------
  // Category data
  // -----------------------------------------------------------------------
  static final List<CategoryModel> _categories = [
    CategoryModel(
      id: 1,
      name: 'Historical',
      icon: Icons.account_balance,
      description: 'Ancient ruins, castles, and archaeological sites spanning thousands of years of history.',
      color: const Color(0xFFB5651D),
    ),
    CategoryModel(
      id: 2,
      name: 'Nature',
      icon: Icons.terrain,
      description: 'Natural wonders including seas, hot springs, and unique geological formations.',
      color: const Color(0xFF2E8B57),
    ),
    CategoryModel(
      id: 3,
      name: 'Desert',
      icon: Icons.wb_sunny,
      description: 'Vast desert landscapes, sand dunes, and Bedouin culture under starlit skies.',
      color: const Color(0xFFCD853F),
    ),
    CategoryModel(
      id: 4,
      name: 'Religious',
      icon: Icons.church,
      description: 'Sacred sites and pilgrimage destinations important to the world\'s faiths.',
      color: const Color(0xFF6A5ACD),
    ),
  ];

  // -----------------------------------------------------------------------
  // Public methods
  // -----------------------------------------------------------------------

  List<DestinationModel> getAllDestinations() {
    return List.unmodifiable(_destinations);
  }

  List<DestinationModel> getFeaturedDestinations() {
    return _destinations.where((d) => d.isFeatured).toList();
  }

  List<DestinationModel> getDestinationsByCategory(String category) {
    if (category == 'All') return List.unmodifiable(_destinations);
    return _destinations.where((d) => d.category == category).toList();
  }

  List<DestinationModel> searchDestinations(String query) {
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return List.unmodifiable(_destinations);
    return _destinations.where((d) {
      return d.name.toLowerCase().contains(q) ||
          d.city.toLowerCase().contains(q) ||
          d.category.toLowerCase().contains(q) ||
          d.shortDescription.toLowerCase().contains(q);
    }).toList();
  }

  List<CategoryModel> getAllCategories() {
    return List.unmodifiable(_categories);
  }
}
