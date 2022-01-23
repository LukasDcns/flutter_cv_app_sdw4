import 'package:cv/model/airtable_data_education.dart';
import 'package:cv/model/airtable_data_experience.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cv/model/airtable_data_profil.dart';

import 'airtable_data_info.dart';
import 'airtable_data_skill.dart';

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/skill",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlInfo = Uri.https(
    "api.airtable.com",
    "/v0/${dotenv.env['AIRTABLE_PROJECT_KEY']}/info",
    {"maxRecords": "10", "view": "Grid view"},
  );


  Future<List<AirtableDataProfil>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataProfil> values = [];
      data.forEach(
            (value) => {
          values.add(
            AirtableDataProfil(
              id: value['id'],
              createdTime: value['createdTime'],
              content: value['fields']['content'],
              icon: value['fields']['icon'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataExperience> experiences = [];
      for (var experience in data) {
        experiences.add(
          AirtableDataExperience(
            id: experience['id'],
            jobTitle: experience['fields']['job_title'],
            jobDescription: experience['fields']['job_description'],
            period: experience['fields']['period'],
            logo: experience['fields']['logos'][0]['url'],
            createdTime: experience['createdTime'],
          ),
        );
      }
      return experiences;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataEducation> educations = [];
      for (var education in data) {
        educations.add(
          AirtableDataEducation(
            id: education['id'],
            title: education['fields']['title'],
            detail: education['fields']['detail'],
            image: education['fields']['image'][0]['url'],
            createdTime: education['createdTime'],
          ),
        );
      }
      return educations;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataSkill> skills = [];
      for (var skill in data) {
        skills.add(
          AirtableDataSkill(
            id: skill['id'],
            category: skill['fields']['category'],
            skill: skill['fields']['skill'],
            createdTime: skill['createdTime'],
          ),
        );
      }
      return skills;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<List<AirtableDataInfo>> getInfo() async {
    final res = await http.get(
      urlInfo,
      headers: {"Authorization": "Bearer ${dotenv.env['AIRTABLE_API_KEY']}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataInfo> infos = [];
      for (var info in data) {
        infos.add(
          AirtableDataInfo(
            id: info['id'],
            title: info['fields']['title'],
            detail: info['fields']['detail'],
            image: info['fields']['image'][0]['url'],
            createdTime: info['createdTime'],
          ),
        );
      }
      return infos;
    } else {
      throw "ERROR !!!!!";
    }
  }
}