import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudHelperFunctions {
  /// Helper function to check the state of a single databse record
  ///
  /// Returns a widget based on the state of the snapshot;
  /// If data  is still loading, it return a circularProgressIndicator
  ///  If no data found, it returns a generic No Data found
  ///  if an error occurs, it return a generic message
  ///  otherwise it return null
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found'));
    }
    if (snapshot.hasError) {
      return const Center(child: Text('Something went wrong.'));
    }
    return null;
  }

  /// Helper function to check the state of a multiple list database records
  ///
  /// Returns a widget based on the state of the snapshot;
  /// If data  is still loading, it return a circularProgressIndicator
  ///  If no data found, it returns a generic No Data found
  ///  if an error occurs, it return a generic message
  ///  otherwise it return null
  static Widget? checkMultiRecordState<T>({ required AsyncSnapshot<
      T> snapshot, Widget? loader, Widget? error, Widget? nothingFound,}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found'));
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong.'));
    }
    return null;
  }


  /// Creat a reference with an initialfile path and nameand retrieve the download url
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
