import 'package:cv/model/airtable_data.dart';
import 'package:cv/model/airtable_data_skill.dart';
import 'package:flutter/material.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: airtableData.getSkill(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
                  print(airtableData.getSkill());
                  if (snapshot.hasData) {
                    List<AirtableDataSkill>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataSkill value) => ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(value.category,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Colors.white
                                      )),
                                  ),
                                  Wrap(
                                      children:
                                        value.skill
                                          .map<Widget>((picture) => Container (
                                            margin: const EdgeInsets.all(10),
                                            height: 50,
                                            width: 50,
                                            child: Image.network(picture['url']),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.5), //shadow color
                                                    spreadRadius: 5, // spread radius
                                                    blurRadius: 7, // shadow blur radius
                                                    offset: const Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                            ),
                                        ),
                                      ).toList()
                                  )
                            ],
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      )
                          .toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}