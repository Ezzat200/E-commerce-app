import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final int? userId;
	final String? userName;
	final String? userEmail;
	final String? userPassword;
	final String? userPhone;
	final int? userVerfiycode;
	final int? userApprove;
	final String? userCreate;

	const Datum({
		this.userId, 
		this.userName, 
		this.userEmail, 
		this.userPassword, 
		this.userPhone, 
		this.userVerfiycode, 
		this.userApprove, 
		this.userCreate, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				userId: json['user_id'] as int?,
				userName: json['user_name'] as String?,
				userEmail: json['user_email'] as String?,
				userPassword: json['user_password'] as String?,
				userPhone: json['user_phone'] as String?,
				userVerfiycode: json['user_verfiycode'] as int?,
				userApprove: json['user_approve'] as int?,
				userCreate: json['user_create'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'user_id': userId,
				'user_name': userName,
				'user_email': userEmail,
				'user_password': userPassword,
				'user_phone': userPhone,
				'user_verfiycode': userVerfiycode,
				'user_approve': userApprove,
				'user_create': userCreate,
			};

	@override
	List<Object?> get props {
		return [
				userId,
				userName,
				userEmail,
				userPassword,
				userPhone,
				userVerfiycode,
				userApprove,
				userCreate,
		];
	}
}
