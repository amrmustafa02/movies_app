import 'dart:convert';

class ReviewModel {
  ReviewModel({
      this.id, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  ReviewModel.fromJson(dynamic json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ReviewResult.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? id;
  num? page;
  List<ReviewResult>? results;
  num? totalPages;
  num? totalResults;

}

class ReviewResult {
  ReviewResult({
      this.author, 
      this.authorDetails, 
      this.content, 
      this.createdAt, 
      this.id, 
      this.updatedAt, 
      this.url,});

  ReviewResult.fromJson(dynamic json) {
    author = json['author'];
    authorDetails = json['author_details'] != null ? AuthorDetails.fromJson(json['author_details']) : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;


}

class AuthorDetails {
  AuthorDetails({
      this.name, 
      this.username, 
      this.avatarPath, 
      this.rating,});

  AuthorDetails.fromJson(dynamic json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }
  String? name;
  String? username;
  String? avatarPath;
  num? rating;



}