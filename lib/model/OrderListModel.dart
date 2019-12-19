class OrderListModel {
	int code;
	int totle;
	List<OrderListModelRow> rows;

	OrderListModel({this.code, this.totle, this.rows});

	OrderListModel.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		totle = json['totle'];
		if (json['rows'] != null) {
			rows = new List<OrderListModelRow>();(json['rows'] as List).forEach((v) { rows.add(new OrderListModelRow.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['totle'] = this.totle;
		if (this.rows != null) {
      data['rows'] =  this.rows.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OrderListModelRow {
	String createUserBiztydsjgbd;
	dynamic updateUserBiztydsjgbd;
	String yszId;
	String clId;
	dynamic lay2Biztydsjgbd;
	String jsrwsjBiztydsjgbd;
	String pdsjBiztyd;
	String bdtp;
	String pdsmBiztyd;
	String idBiztydsjgbd;
	dynamic lay5Biztydsjgbd;
	String bdId;
	String licensePlate;
	dynamic lay1Biztydsjgbd;
	String cancelBiz;
	String ydhBiztyd;
	String fscmc;
	String yszName;
	String fscId;
	dynamic lay4Biztydsjgbd;
	dynamic createtimeBiztydsjgbd;
	String sjId;
	String idBiztyd;
	String qrsjBiztydsjgbd;
	int jzBizgbd;
	String sjqysjBiztydsjgbd;
	dynamic lay3Biztydsjgbd;
	String sjddsjBiztydsjgbd;
	String name;
	dynamic updatetimeBiztydsjgbd;
	int mzBizgbd;
	int pzBizgbd;
	String jhddsjBiztyd;
	String status;
	String jhqysjBiztyd;

	OrderListModelRow({this.createUserBiztydsjgbd, this.updateUserBiztydsjgbd, this.yszId, this.clId, this.lay2Biztydsjgbd, this.jsrwsjBiztydsjgbd, this.pdsjBiztyd, this.bdtp, this.pdsmBiztyd, this.idBiztydsjgbd, this.lay5Biztydsjgbd, this.bdId, this.licensePlate, this.lay1Biztydsjgbd, this.cancelBiz, this.ydhBiztyd, this.fscmc, this.yszName, this.fscId, this.lay4Biztydsjgbd, this.createtimeBiztydsjgbd, this.sjId, this.idBiztyd, this.qrsjBiztydsjgbd, this.jzBizgbd, this.sjqysjBiztydsjgbd, this.lay3Biztydsjgbd, this.sjddsjBiztydsjgbd, this.name, this.updatetimeBiztydsjgbd, this.mzBizgbd, this.pzBizgbd, this.jhddsjBiztyd, this.status, this.jhqysjBiztyd});

	OrderListModelRow.fromJson(Map<String, dynamic> json) {
		createUserBiztydsjgbd = json['createUserBiztydsjgbd'];
		updateUserBiztydsjgbd = json['updateUserBiztydsjgbd'];
		yszId = json['yszId'];
		clId = json['clId'];
		lay2Biztydsjgbd = json['lay2Biztydsjgbd'];
		jsrwsjBiztydsjgbd = json['jsrwsjBiztydsjgbd'];
		pdsjBiztyd = json['pdsjBiztyd'];
		bdtp = json['bdtp'];
		pdsmBiztyd = json['pdsmBiztyd'];
		idBiztydsjgbd = json['idBiztydsjgbd'];
		lay5Biztydsjgbd = json['lay5Biztydsjgbd'];
		bdId = json['bdId'];
		licensePlate = json['licensePlate'];
		lay1Biztydsjgbd = json['lay1Biztydsjgbd'];
		cancelBiz = json['cancelBiz'];
		ydhBiztyd = json['ydhBiztyd'];
		fscmc = json['fscmc'];
		yszName = json['yszName'];
		fscId = json['fscId'];
		lay4Biztydsjgbd = json['lay4Biztydsjgbd'];
		createtimeBiztydsjgbd = json['createtimeBiztydsjgbd'];
		sjId = json['sjId'];
		idBiztyd = json['idBiztyd'];
		qrsjBiztydsjgbd = json['qrsjBiztydsjgbd'];
		jzBizgbd = json['jzBizgbd'];
		sjqysjBiztydsjgbd = json['sjqysjBiztydsjgbd'];
		lay3Biztydsjgbd = json['lay3Biztydsjgbd'];
		sjddsjBiztydsjgbd = json['sjddsjBiztydsjgbd'];
		name = json['name'];
		updatetimeBiztydsjgbd = json['updatetimeBiztydsjgbd'];
		mzBizgbd = json['mzBizgbd'];
		pzBizgbd = json['pzBizgbd'];
		jhddsjBiztyd = json['jhddsjBiztyd'];
		status = json['status'];
		jhqysjBiztyd = json['jhqysjBiztyd'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createUserBiztydsjgbd'] = this.createUserBiztydsjgbd;
		data['updateUserBiztydsjgbd'] = this.updateUserBiztydsjgbd;
		data['yszId'] = this.yszId;
		data['clId'] = this.clId;
		data['lay2Biztydsjgbd'] = this.lay2Biztydsjgbd;
		data['jsrwsjBiztydsjgbd'] = this.jsrwsjBiztydsjgbd;
		data['pdsjBiztyd'] = this.pdsjBiztyd;
		data['bdtp'] = this.bdtp;
		data['pdsmBiztyd'] = this.pdsmBiztyd;
		data['idBiztydsjgbd'] = this.idBiztydsjgbd;
		data['lay5Biztydsjgbd'] = this.lay5Biztydsjgbd;
		data['bdId'] = this.bdId;
		data['licensePlate'] = this.licensePlate;
		data['lay1Biztydsjgbd'] = this.lay1Biztydsjgbd;
		data['cancelBiz'] = this.cancelBiz;
		data['ydhBiztyd'] = this.ydhBiztyd;
		data['fscmc'] = this.fscmc;
		data['yszName'] = this.yszName;
		data['fscId'] = this.fscId;
		data['lay4Biztydsjgbd'] = this.lay4Biztydsjgbd;
		data['createtimeBiztydsjgbd'] = this.createtimeBiztydsjgbd;
		data['sjId'] = this.sjId;
		data['idBiztyd'] = this.idBiztyd;
		data['qrsjBiztydsjgbd'] = this.qrsjBiztydsjgbd;
		data['jzBizgbd'] = this.jzBizgbd;
		data['sjqysjBiztydsjgbd'] = this.sjqysjBiztydsjgbd;
		data['lay3Biztydsjgbd'] = this.lay3Biztydsjgbd;
		data['sjddsjBiztydsjgbd'] = this.sjddsjBiztydsjgbd;
		data['name'] = this.name;
		data['updatetimeBiztydsjgbd'] = this.updatetimeBiztydsjgbd;
		data['mzBizgbd'] = this.mzBizgbd;
		data['pzBizgbd'] = this.pzBizgbd;
		data['jhddsjBiztyd'] = this.jhddsjBiztyd;
		data['status'] = this.status;
		data['jhqysjBiztyd'] = this.jhqysjBiztyd;
		return data;
	}
}
