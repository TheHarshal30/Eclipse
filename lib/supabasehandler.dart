import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';


class SupaBaseHandler{
  static String supabaseUrl = "";
  static String supabaseKey = "";
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  addData(String uid, List<double> jan,String name){
    var response = client.from('user').insert({
      'uid' : uid,
      'jan' : jan,
      'name' : name
    }).execute();
  }
  readData()async{
    var response = await client.from('user').select('name').eq('uid', FirebaseAuth.instance.currentUser!.uid.toString()).execute();
    var response1 = await client.from('user').select('jan').eq('uid', FirebaseAuth.instance.currentUser!.uid.toString()).execute();
    print("from supa ${response.data}");
    print("from supa name ${response1.data}");

  }
  updateData(String id,List<dynamic> jan){
    var response = client.from('user').update({
      'jan' :jan
    }).eq('uid', id).execute();
  }



}