class User {
  int userId;
  String userName;
  String userEmail;
  String userPassword;
  String userPhone;
  int userVerifyCode;
  int userApprove;
  String userCreate;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    required this.userVerifyCode,
    required this.userApprove,
    required this.userCreate,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPassword: json['user_password'],
      userPhone: json['user_phone'],
      userVerifyCode: json['user_verfiycode'],
      userApprove: json['user_approve'],
      userCreate: json['user_create'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_phone': userPhone,
      'user_verfiycode': userVerifyCode,
      'user_approve': userApprove,
      'user_create': userCreate,
    };
  }
}

// Main Response Model
class UserResponse {
  String status;
  List<User> data;

  UserResponse({
    required this.status,
    required this.data,
  });

  // Factory constructor to create UserResponse from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'],
      data: List<User>.from(json['data'].map((user) => User.fromJson(user))),
    );
  }

  // Convert UserResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((user) => user.toJson()).toList(),
    };
  }
}