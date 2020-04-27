import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Containers/reusablecard.dart';
import 'package:bmi_calculator/Containers/icon_default.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
import 'result_screen.dart';
import 'business-logic.dart';

const int inactiveCode = 0xff1D1E33;
const int activeCode = 0xff000051;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleBtn = inactiveCode;
  int femaleBtn = inactiveCode;

  int weight = 55;
  int age = 25;
  int height = 175;
  bool checkIfSelected = false;

  void updateOnClickEvent(Gender gender) {
    switch (gender) {
      case Gender.male:
        maleBtn = activeCode;
        femaleBtn = inactiveCode;
        break;
      case Gender.female:
        femaleBtn = activeCode;
        maleBtn = inactiveCode;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    ontap: () {
                      setState(() {
                        this.updateOnClickEvent(Gender.male);
                        this.checkIfSelected = true;
                      });
                    },
                    color: Color(maleBtn),
                    cardChild: IconDefault(
                      icon: FontAwesomeIcons.mars,
                      gender: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    ontap: () {
                      setState(() {
                        this.updateOnClickEvent(Gender.female);
                        this.checkIfSelected = true;
                      });
                    },
                    color: Color(femaleBtn),
                    cardChild: IconDefault(
                      icon: FontAwesomeIcons.venus,
                      gender: 'Female',
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height',
                        textAlign: TextAlign.center, style: kTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          this.height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Colors.pink,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 20),
                          overlayColor: Colors.pinkAccent,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey),
                      child: Slider(
                        value: this.height.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            this.height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
                color: Color(activeCode),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: Color(activeCode),
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconRound(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              IconRound(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: Color(activeCode),
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconRound(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              IconRound(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (checkIfSelected) {
                  var cal = Calculate(height: this.height, weight: this.weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          resultPercentage: cal.getResultPercentage(),
                          result: cal.getResult(),
                          interpretation: cal.getInterpretation()),
                    ),
                  );
                } else {
                  Alert(
                    context: context,
                    type: AlertType.info,
                    style: AlertStyle(
                        backgroundColor: Color(activeCode),
                        titleStyle: TextStyle(color: Colors.white),
                        descStyle: TextStyle(color: Colors.white)),
                    title: 'Message',
                    desc: "Select gender",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                        radius: BorderRadius.circular(5.0),
                        width: 90,

                      ),
                    ],
                  ).show();
                }
              },
              child: Container(
                color: Colors.pink,
                width: double.infinity,
                margin: EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                height: 60,
              ),
            )
          ],
        ));
  }
}

class IconRound extends StatelessWidget {
  final IconData icon;
  final Function onpress;

  IconRound({this.icon, this.onpress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 12,
      fillColor: Color(0xff4C4F5E),
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
