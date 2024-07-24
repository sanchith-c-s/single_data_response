import 'dart:convert';

import 'package:collection/collection.dart';

class Single {
	int? userId;
	int? id;
	String? title;
	String? body;

	Single({this.userId, this.id, this.title, this.body});

	factory Single.fromMap(Map<String, dynamic> data) => Single(
				userId: data['userId'] as int?,
				id: data['id'] as int?,
				title: data['title'] as String?,
				body: data['body'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'userId': userId,
				'id': id,
				'title': title,
				'body': body,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Single].
	factory Single.fromJson(String data) {
		return Single.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Single] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Single) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			userId.hashCode ^
			id.hashCode ^
			title.hashCode ^
			body.hashCode;
}
