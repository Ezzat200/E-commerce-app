import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
	final int? categorieId;
	final String? categorieNameEn;
	final String? categorieNameAr;
	final String? categorieImage;
	final String? categorieDatetime;

	const CategoriesModel({
		this.categorieId, 
		this.categorieNameEn, 
		this.categorieNameAr, 
		this.categorieImage, 
		this.categorieDatetime, 
	});

	factory CategoriesModel.fromJson(Map<String, dynamic> json) {
		return CategoriesModel(
			categorieId: json['categorie_id'] as int?,
			categorieNameEn: json['categorie_name_en'] as String?,
			categorieNameAr: json['categorie_name_ar'] as String?,
			categorieImage: json['categorie_image'] as String?,
			categorieDatetime: json['categorie_datetime'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'categorie_id': categorieId,
				'categorie_name_en': categorieNameEn,
				'categorie_name_ar': categorieNameAr,
				'categorie_image': categorieImage,
				'categorie_datetime': categorieDatetime,
			};

	@override
	List<Object?> get props {
		return [
				categorieId,
				categorieNameEn,
				categorieNameAr,
				categorieImage,
				categorieDatetime,
		];
	}
}
