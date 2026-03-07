class MediaEntities {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isCircle;
  const MediaEntities(
    this.title,
    this.subtitle,
    this.imageUrl, {
    this.isCircle = false,
  });
}
