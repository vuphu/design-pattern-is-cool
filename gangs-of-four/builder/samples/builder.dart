// dart builder.dart

class SqlQueryBuilder {
  String _table = '';
  List<String> _columns = [];
  String _whereClause = '';
  String _orderByClause = '';
  int _limit = 0;
  int _offset = 0;

  SqlQueryBuilder table(String table) {
    _table = table;
    return this;
  }

  SqlQueryBuilder select(List<String> columns) {
    _columns = columns;
    return this;
  }

  SqlQueryBuilder where(String whereClause) {
    _whereClause = whereClause;
    return this;
  }

  SqlQueryBuilder orderBy(String orderByClause) {
    _orderByClause = orderByClause;
    return this;
  }

  SqlQueryBuilder limit(int limit) {
    _limit = limit;
    return this;
  }
  
  SqlQueryBuilder offset(int offset) {
    _offset = offset;
    return this;
  }

  String build() {
    if (_table == null) {
      throw Exception("Table name cannot be null");
    }
    
    String query = 'SELECT ${_columns.isEmpty ? '*' : _columns.join(', ')} FROM $_table';
    if (_whereClause.isNotEmpty) {
      query += ' WHERE $_whereClause';
    }
    if (_orderByClause.isNotEmpty) {
      query += ' ORDER BY $_orderByClause';
    }
    if (_limit > 0) {
      query += ' LIMIT $_limit';
    }
    if (_offset > 0) {
      query += ' OFFSET $_offset';
    }

    return query;
  }
}

void main() {
  SqlQueryBuilder queryBuilder = SqlQueryBuilder();
  String query = queryBuilder
      .table('users')
      .select(['id', 'name', 'email'])
      .where('age > 18')
      .orderBy('name ASC')
      .limit(10)
      .offset(10)
      .build();

  print(query);
}