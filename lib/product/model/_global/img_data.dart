class ImgData {
  final String? imageUrl;

  ImgData({
    this.imageUrl,
  });

  ImgData copyWith({
    String? imageUrl,
  }) =>
      ImgData(
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory ImgData.fromJson(Map<String, dynamic> json) => ImgData(
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
      };
}
