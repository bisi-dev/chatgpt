class Query {
  final String title;
  final String body;

  const Query({required this.title, required this.body});

  static const List<Query> list = [
    Query(
      title: 'Design a database schema',
      body: 'for an online merch store',
    ),
    Query(
      title: 'Show me a code snippet',
      body: 'of a website\'s sticky header',
    ),
    Query(
      title: 'Help me pick',
      body: 'a birthday gift for my mom who likes gardening',
    ),
    Query(
      title: 'Compare storytelling techniques',
      body: 'in novels and in films',
    ),
  ];
}
