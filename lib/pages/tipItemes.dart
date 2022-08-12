import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class healthTipCollection extends StatelessWidget {
  const healthTipCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewHomePage(),
    );
  }
}

class ListViewHomePage extends StatefulWidget {
  const ListViewHomePage({Key? key}) : super(key: key);

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  var titleList = [
    "Eat a healthy diet",
    "less salt and sugar",
    "Reduce harmful fats",
    "Avoid harmful alcohol",
    "Don’t smoke",
    "Be active",
    "Blood Pressure checkup",
    "Get tested",
    "Get vaccinated",
    "Practice safe sex",
    "Covered coughing or sneezing",
    "Prevent mosquito bites",
    "Follow traffic laws",
    "Drink only safe water",
    "Breastfeed babies",
    "Reduce stress",
    "Antibiotics only as prescribed",
    "Clean your hands properly",
    "Prepare your food correctly",
    "Have regular check-ups",
  ];
  var description = [
    "Eat a combination of different foods, including fruit, vegetables, legumes, nuts and whole grains. Adults should eat at least five portions (400g) of fruit and vegetables per day. You can improve your intake of fruits and vegetables by always including veggies in your meal; eating fresh fruit and vegetables as snacks; eating a variety of fruits and vegetables; and eating them in season. By eating healthy, you will reduce your risk of malnutrition and noncommunicable diseases (NCDs) such as diabetes, heart disease, stroke and cancer.",
    "Filipinos consume twice the recommended amount of sodium, putting them at risk of high blood pressure, which in turn increases the risk of heart disease and stroke. Most people get their sodium through salt. Reduce your salt intake to 5g per day, equivalent to about one teaspoon. It’s easier to do this by limiting the amount of salt, soy sauce, fish sauce and other high-sodium condiments when preparing meals; removing salt, seasonings and condiments from your meal table; avoiding salty snacks; and choosing low-sodium products.On the other hand, consuming excessive amounts of sugars increases the risk of tooth decay and unhealthy weight gain. In both adults and children, the intake of free sugars should be reduced to less than 10% of total energy intake. This is equivalent to 50g or about 12 teaspoons for an adult. WHO recommends consuming less than 5% of total energy intake for additional health benefits. You can reduce your sugar intake by limiting the consumption of sugary snacks, candies and sugar-sweetened beverages. ",
    "Fats consumed should be less than 30% of your total energy intake. This will help prevent unhealthy weight gain and NCDs. There are different types of fats, but unsaturated fats are preferable over saturated fats and trans-fats. WHO recommends reducing saturated fats to less than 10% of total energy intake; reducing trans-fats to less than 1% of total energy intake; and replacing both saturated fats and trans-fats to unsaturated fats. The preferable unsaturated fats are found in fish, avocado and nuts, and in sunflower, soybean, canola and olive oils; saturated fats are found in fatty meat, butter, palm and coconut oil, cream, cheese, ghee and lard; and trans-fats are found in baked and fried foods, and pre-packaged snacks and foods, such as frozen pizza, cookies, biscuits, and cooking oils and spreads. ",
    "There is no safe level for drinking alcohol. Consuming alcohol can lead to health problems such as mental and behavioural disorders, including alcohol dependence, major NCDs such as liver cirrhosis, some cancers and heart diseases, as well as injuries resulting from violence and road clashes and collisions.",
    "Smoking tobacco causes NCDs such as lung disease, heart disease and stroke. Tobacco kills not only the direct smokers but even non-smokers through second-hand exposure. Currently, there are around 15.9 million Filipino adults who smoke tobacco but 7 in 10 smokers are interested or plan to quit. If you are currently a smoker, it’s not too late to quit. Once you do, you will experience immediate and long-term health benefits. If you are not a smoker, that’s great! Do not start smoking and fight for your right to breathe tobacco-smoke-free air.",
    "Physical activity is defined as any bodily movement produced by skeletal muscles that requires energy expenditure. This includes exercise and activities undertaken while working, playing, carrying out household chores, travelling, and engaging in recreational pursuits. The amount of physical activity you need depends on your age group but adults aged 18-64 years should do at least 150 minutes of moderate-intensity physical activity throughout the week. Increase moderate-intensity physical activity to 300 minutes per week for additional health benefits.",
    "Hypertension, or high blood pressure, is called a “silent killer”. This is because many people who have hypertension may not be aware of the problem as it may not have any symptoms. If left uncontrolled, hypertension can lead to heart, brain, kidney and other diseases. Have your blood pressure checked regularly by a health worker so you know your numbers. If your blood pressure is high, get the advice of a health worker. This is vital in the prevention and control of hypertension.",
    "Getting yourself tested is an important step in knowing your health status, especially when it comes to HIV, hepatitis B, sexually-transmitted infections (STIs) and tuberculosis (TB). Left untreated, these diseases can lead to serious complications and even death. Knowing your status means you will know how to either continue preventing these diseases or, if you find out that you’re positive, get the care and treatment that you need. Go to a public or private health facility, wherever you are comfortable, to have yourself tested.",
    "Vaccination is one of the most effective ways to prevent diseases. Vaccines work with your body’s natural defences to build protection against diseases like cervical cancer, cholera, diphtheria, hepatitis B, influenza, measles, mumps, pneumonia, polio, rabies, rubella, tetanus, typhoid, and yellow fever. In the Philippines, free vaccines are provided to children 1 year old and below as part of the Department of Health’s routine immunization programme. If you are an adolescent or adult, you may ask your physician if to check your immunization status or if you want to have yourself vaccinated.",
    "Looking after your sexual health is important for your overall health and well-being. Practice safe sex to prevent HIV and other sexually transmitted infections like gonorrhoea and syphilis. There are available prevention measures such as pre-exposure prophylaxis (PrEP) that will protect you from HIV and condoms that will protect you from HIV and other STIs.",
    "Diseases such as influenza, pneumonia and tuberculosis are transmitted through the air. When an infected person coughs or sneezes, infectious agents may be passed on to others through airborne droplets. When you feel a cough or sneeze coming on, make sure you have covered your mouth with a face mask or use a tissue then dispose it carefully. If you do not have a tissue close by when you cough or sneeze, cover your mouth as much as possible with the crook (or the inside) of your elbow.",
    "Mosquitoes are one of the deadliest animals in the world. Diseases like dengue, chikungunya, malaria and lymphatic filariasis are transmitted by mosquitoes and continue to affect Filipinos. You can take simple measures to protect yourself and your loved ones against mosquito-borne diseases. If you’re traveling to an area with known mosquito-borne diseases, consult a physician for a vaccine to prevent diseases such as Japanese encephalitis and yellow fever or if you need to take antimalarial medicines. Wear light-coloured, long-sleeved shirts and pants and use insect repellent. At home, use window and door screens, use bed nets and clean your surroundings weekly to destroy mosquito breeding sites.",
    "Road crashes claim over one million lives around the world and millions more are injured. Road traffic injuries are preventable through a variety of measures implemented by the government such as strong legislation and enforcement, safer infrastructure and vehicle standards, and improved post-crash care. You yourself can also prevent road crashes by ensuring that you follow traffic laws such as using the seatbelt for adults and child restraint for your kids, wearing a helmet when riding a motorcycle or bicycle, not drinking and driving, and not using your mobile phone while driving.",
    "Drinking unsafe water can lead to water-borne diseases such as cholera, diarrhoea, hepatitis A, typhoid and polio. Globally, at least 2 billion people use a drinking water source contaminated with faeces. Check with your water concessionaire and water refilling station to ensure that the water you’re drinking is safe. In a setting where you are unsure of your water source, boil your water for at least one minute. This will destroy harmful organisms in the water. Let it cool naturally before drinking.",
    "Breastfeeding is the best way to provide the ideal food for newborns and infants. WHO recommends that mothers initiate breastfeeding within one hour of birth. Breastfeeding for the first six months is crucial for the baby to grow up healthy. It is recommended that breastfeeding is continued for up to two years and beyond. Aside from being beneficial to babies, breastfeeding is also good for the mother as it reduces the risk of breast and ovarian cancer, type II diabetes, and postpartum depression.",
    "Depression is a common illness worldwide with over 260 million people affected. Depression can manifest in different ways, but it might make you feel hopeless or worthless, or you might think about negative and disturbing thoughts a lot or have an overwhelming sense of pain. If you’re going through this, remember that you are not alone. Talk to someone you trust such as a family member, friend, colleague or mental health professional about how you feel. If you feel that you are in danger of harming yourself, contact the National Center for Mental Health hotline at 0917-899-USAP (8727).",
    "Antibiotic resistance is one of the biggest public health threats in our generation. When antibiotics lose their power, bacterial infections become harder to treat, leading to higher medical costs, prolonged hospital stays, and increased mortality. Antibiotics are losing their power because of misuse and overuse in humans and animals. Make sure you only take antibiotics if prescribed by a qualified health professional. And once prescribed, complete the treatment days as instructed. Never share antibiotics.",
    "Hand hygiene is critical not only for health workers but for everyone. Clean hands can prevent the spread of infectious illnesses. You should handwash using soap and water when your hands are visibly soiled or handrub using an alcohol-based product.",
    "Unsafe food containing harmful bacteria, viruses, parasites or chemical substances, causes more than 200 diseases – ranging from diarrhoea to cancers. When buying food at the market or store, check the labels or the actual produce to ensure it is safe to eat. If you are preparing food, make sure you follow the Five Keys to Safer Food: (1) keep clean; (2) separate raw and cooked; (3) cook thoroughly; (4) keep food at safe temperatures; and (5) use safe water and raw materials.",
    "Regular check-ups can help find health problems before they start. Health professionals can help find and diagnose health issues early, when your chances for treatment and cure are better. Go to your nearest health facility to check out the the health services, screenings and treatment that are accessible to you.",
  ];
  var imageList = [
    "assets/t1.jpg",
    "assets/t2.jpg",
    "assets/t3.jpg",
    "assets/t4.jpg",
    "assets/t5.jpg",
    "assets/t6.jpg",
    "assets/t7.jpg",
    "assets/t8.jpg",
    "assets/t9.jpg",
    "assets/t10.jpg",
    "assets/t11.jpg",
    "assets/t12.jpg",
    "assets/t13.jpg",
    "assets/t14.jpg",
    "assets/t15.jpg",
    "assets/t16.jpg",
    "assets/t17.jpg",
    "assets/t18.jpg",
    "assets/t19.jpg",
    "assets/t20.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Tips",
          style: TextStyle(color: Colors.white, fontFamily: "serif"),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(51, 83, 176, 1),
      ),
      body: ListView.builder(
          itemCount: description.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialogFunc(context, imageList[index], titleList[index],
                    description[index]);
              },
              // child: Card(
              //   color: Colors.white,
              //   child: Row(
              //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(8.0),
              //                   color: Color.fromRGBO(14, 100, 175, 1),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.black,
              //                       blurRadius: 2.0,
              //                       spreadRadius: 0.0,
              //                       offset: Offset(3.0, 3.0),
              //                     )
              //                   ]),
              //               width: width,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10.0),
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       titleList[index],
              //                       style: TextStyle(
              //                           fontSize: 18,
              //                           color: Colors.white,
              //                           fontWeight: FontWeight.bold,
              //                           fontFamily: "serif"),
              //                     ),
              //                     ReadMoreText(
              //                       description[index],
              //                       style: TextStyle(
              //                           fontSize: 15,
              //                           color: Colors.white,
              //                           fontFamily: "serif"),
              //                       trimLength: 2,
              //                       colorClickableText:
              //                           Color.fromRGBO(51, 83, 176, 1),
              //                       trimMode: TrimMode.Line,
              //                       trimCollapsedText: 'Show',
              //                       trimExpandedText: 'Show less',
              //                       moreStyle: TextStyle(
              //                         fontSize: 15,
              //                         color: Color.fromRGBO(51, 83, 176, 1),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Container(
              //         width: 100,
              //         height: 60,
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //               color: Color.fromRGBO(51, 83, 176, 1),
              //             ),
              //             borderRadius: BorderRadius.all(Radius.circular(6))),
              //         child: Image.asset(
              //           imageList[index],
              //           fit: BoxFit.fitWidth,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //second option
              child: Card(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      titleList[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(51, 83, 176, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "serif"),
                                    ),
                                  ),
                                  ReadMoreText(
                                    description[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(51, 83, 176, 1),
                                        fontFamily: "serif"),
                                    trimLength: 2,
                                    colorClickableText:
                                        Color.fromRGBO(51, 83, 176, 1),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show ',
                                    trimExpandedText: 'Show less',
                                    moreStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(51, 83, 176, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(51, 83, 176, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Expanded(
                    flex: 1,
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical, //.horizontal
                      child: new Text(
                        desc,
                        style: new TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(51, 83, 176, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
