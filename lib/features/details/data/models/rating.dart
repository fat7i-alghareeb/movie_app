class Rating {
	String? source;
	String? value;

	Rating({this.source, this.value});

	factory Rating.fromJson(Map<String, dynamic> json) => Rating(
				source: json['Source'] as String?,
				value: json['Value'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'Source': source,
				'Value': value,
			};
}
