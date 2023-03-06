import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';


class SupaBaseHandler{
  static String supabaseUrl = "https://szumdwmvibaffxujgqcz.supabase.co";
  static String supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN6dW1kd212aWJhZmZ4dWpncWN6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc4NjI3NjIsImV4cCI6MTk5MzQzODc2Mn0.pLXyJ4_hwKjO5mypwom7gYVkLccjr-DQwgGRcArcBIs";
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
    // print("from supa ${response.data}");
    //     // print("from supa name ${response1.data}");

  }
  updateData(String id,List<dynamic> jan){
    var response = client.from('user').update({
      'jan' :jan
    }).eq('uid', id).execute();
  }



}