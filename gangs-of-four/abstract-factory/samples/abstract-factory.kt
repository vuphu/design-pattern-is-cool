interface DBFactory {
    fun createConnection(): Connection
    fun createQueryBuilder(): QueryBuilder
}

class PostgresFactory : DBFactory {
    override fun createConnection(): Connection {
        return PostgresConnection()
    }

    override fun createQueryBuilder(): QueryBuilder {
        return PostgresQueryBuilder()
    }
}

class MongoDBFactory : DBFactory {
    override fun createConnection(): Connection {
        return MongoDBConnection()
    }

    override fun createQueryBuilder(): QueryBuilder {
        return MongoDBQueryBuilder()
    }
}

interface Connection {
    fun connect()
}

interface QueryBuilder {
    fun buildQuery(query: String)
}

class PostgresConnection : Connection {
    override fun connect() {
        println("Connecting to Postgres database.")
    }
}

class MongoDBConnection : Connection {
    override fun connect() {
        println("Connecting to MongoDB database.")
    }
}

class PostgresQueryBuilder : QueryBuilder {
    override fun buildQuery(query: String) {
        println("Building Postgres query: $query")
    }
}

class MongoDBQueryBuilder : QueryBuilder {
    override fun buildQuery(query: String) {
        println("Building MongoDB query: $query")
    }
}

fun main() {
    val storeType = "Postgres"
    val factory: DBFactory = when (storeType) {
        "Postgres" -> PostgresFactory()
        "MongoDB" -> MongoDBFactory()
        else -> throw IllegalArgumentException("Unknown store type: $storeType")
    }
    
    val connection = factory.createConnection()
    val queryBuilder = factory.createQueryBuilder()
    connection.connect()
    queryBuilder.buildQuery("SELECT * FROM users")
}
