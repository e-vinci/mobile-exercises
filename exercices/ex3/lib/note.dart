class Note {
  final String title;
  final String content;

  const Note(this.title, this.content);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Note && runtimeType == other.runtimeType && title == other.title;

  @override
  int get hashCode => title.hashCode;
}