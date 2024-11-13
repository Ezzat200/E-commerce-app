import 'package:equatable/equatable.dart';

class ItemsModel extends Equatable {
	final int? itemId;
	final String? itemNameEn;
	final String? itemNameAr;
	final String? itemDescEn;
	final String? itemDescAr;
	final int? itemPrice;
	final int? itemDisc;
	final int? itemCount;
	final String? itemImage;
	final int? itemActive;
	final String? itemDate;
	final int? itemCatId;
	final int? categorieId;
	final String? categorieNameEn;
	final String? categorieNameAr;
	final String? categorieImage;
	final String? categorieDatetime;

	const ItemsModel({
		this.itemId, 
		this.itemNameEn, 
		this.itemNameAr, 
		this.itemDescEn, 
		this.itemDescAr, 
		this.itemPrice, 
		this.itemDisc, 
		this.itemCount, 
		this.itemImage, 
		this.itemActive, 
		this.itemDate, 
		this.itemCatId, 
		this.categorieId, 
		this.categorieNameEn, 
		this.categorieNameAr, 
		this.categorieImage, 
		this.categorieDatetime, 
	});

	factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
				itemId: json['item_id'] as int?,
				itemNameEn: json['item_name_en'] as String?,
				itemNameAr: json['item_name_ar'] as String?,
				itemDescEn: json['item_desc_en'] as String?,
				itemDescAr: json['item_desc_ar'] as String?,
				itemPrice: json['item_price'] as int?,
				itemDisc: json['item_disc'] as int?,
				itemCount: json['item_count'] as int?,
				itemImage: json['item_image'] as String?,
				itemActive: json['item_active'] as int?,
				itemDate: json['item_date'] as String?,
				itemCatId: json['item_cat_id'] as int?,
				categorieId: json['categorie_id'] as int?,
				categorieNameEn: json['categorie_name_en'] as String?,
				categorieNameAr: json['categorie_name_ar'] as String?,
				categorieImage: json['categorie_image'] as String?,
				categorieDatetime: json['categorie_datetime'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'item_id': itemId,
				'item_name_en': itemNameEn,
				'item_name_ar': itemNameAr,
				'item_desc_en': itemDescEn,
				'item_desc_ar': itemDescAr,
				'item_price': itemPrice,
				'item_disc': itemDisc,
				'item_count': itemCount,
				'item_image': itemImage,
				'item_active': itemActive,
				'item_date': itemDate,
				'item_cat_id': itemCatId,
				'categorie_id': categorieId,
				'categorie_name_en': categorieNameEn,
				'categorie_name_ar': categorieNameAr,
				'categorie_image': categorieImage,
				'categorie_datetime': categorieDatetime,
			};

	@override
	List<Object?> get props {
		return [
				itemId,
				itemNameEn,
				itemNameAr,
				itemDescEn,
				itemDescAr,
				itemPrice,
				itemDisc,
				itemCount,
				itemImage,
				itemActive,
				itemDate,
				itemCatId,
				categorieId,
				categorieNameEn,
				categorieNameAr,
				categorieImage,
				categorieDatetime,
		];
	}
}
