.class public Lcom/orm/query/Select;
.super Ljava/lang/Object;
.source "Select.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable;"
    }
.end annotation


# instance fields
.field private args:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private arguments:[Ljava/lang/String;

.field private groupBy:Ljava/lang/String;

.field private limit:Ljava/lang/String;

.field private offset:Ljava/lang/String;

.field private orderBy:Ljava/lang/String;

.field private record:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private whereClause:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 14
    iput-object v0, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    .line 22
    iput-object p1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    return-void
.end method

.method private convertArgs(Ljava/util/List;)[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 170
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 172
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 173
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static from(Ljava/lang/Class;)Lcom/orm/query/Select;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 26
    new-instance v0, Lcom/orm/query/Select;

    invoke-direct {v0, p0}, Lcom/orm/query/Select;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method private mergeConditions([Lcom/orm/query/Condition;Lcom/orm/query/Condition$Type;)V
    .locals 6

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    aget-object v3, p1, v2

    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, " "

    .line 60
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/orm/query/Condition$Type;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    :cond_0
    sget-object v4, Lcom/orm/query/Condition$Check;->LIKE:Lcom/orm/query/Condition$Check;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheck()Lcom/orm/query/Condition$Check;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/orm/query/Condition$Check;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    sget-object v4, Lcom/orm/query/Condition$Check;->NOT_LIKE:Lcom/orm/query/Condition$Check;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheck()Lcom/orm/query/Condition$Check;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/orm/query/Condition$Check;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_2

    .line 71
    :cond_1
    sget-object v4, Lcom/orm/query/Condition$Check;->IS_NULL:Lcom/orm/query/Condition$Check;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheck()Lcom/orm/query/Condition$Check;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/orm/query/Condition$Check;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Lcom/orm/query/Condition$Check;->IS_NOT_NULL:Lcom/orm/query/Condition$Check;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheck()Lcom/orm/query/Condition$Check;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/orm/query/Condition$Check;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    .line 77
    :cond_2
    invoke-virtual {v3}, Lcom/orm/query/Condition;->getProperty()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheckSymbol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "? "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    iget-object v4, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 73
    :cond_3
    :goto_1
    invoke-virtual {v3}, Lcom/orm/query/Condition;->getProperty()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheckSymbol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 65
    :cond_4
    :goto_2
    invoke-virtual {v3}, Lcom/orm/query/Condition;->getProperty()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getCheckSymbol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\'"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/orm/query/Condition;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_5
    const-string p1, ""

    .line 85
    iget-object v1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/orm/query/Condition$Type;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    .line 89
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public varargs and([Lcom/orm/query/Condition;)Lcom/orm/query/Select;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/orm/query/Condition;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 98
    sget-object v0, Lcom/orm/query/Condition$Type;->AND:Lcom/orm/query/Condition$Type;

    invoke-direct {p0, p1, v0}, Lcom/orm/query/Select;->mergeConditions([Lcom/orm/query/Condition;Lcom/orm/query/Condition$Type;)V

    return-object p0
.end method

.method public count()J
    .locals 7

    .line 122
    iget-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/orm/query/Select;->convertArgs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    .line 126
    :cond_0
    iget-object v1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    iget-object v2, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    iget-object v4, p0, Lcom/orm/query/Select;->groupBy:Ljava/lang/String;

    iget-object v5, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    iget-object v6, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    invoke-static/range {v1 .. v6}, Lcom/orm/SugarRecord;->count(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public first()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/orm/query/Select;->convertArgs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    .line 134
    :cond_0
    iget-object v1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    iget-object v2, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    iget-object v4, p0, Lcom/orm/query/Select;->groupBy:Ljava/lang/String;

    iget-object v5, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    const-string v6, "1"

    invoke-static/range {v1 .. v6}, Lcom/orm/SugarRecord;->find(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 135
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method getArgs()[Ljava/lang/String;
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/orm/query/Select;->convertArgs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getWhereCond()Ljava/lang/String;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    return-object v0
.end method

.method public groupBy(Ljava/lang/String;)Lcom/orm/query/Select;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/orm/query/Select;->groupBy:Ljava/lang/String;

    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 181
    iget-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/orm/query/Select;->convertArgs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    .line 185
    :cond_0
    iget-object v1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    iget-object v2, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    iget-object v4, p0, Lcom/orm/query/Select;->groupBy:Ljava/lang/String;

    iget-object v5, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    iget-object v6, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    invoke-static/range {v1 .. v6}, Lcom/orm/SugarRecord;->findAsIterator(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public limit(Ljava/lang/String;)Lcom/orm/query/Select;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    return-object p0
.end method

.method public list()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    if-nez v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/orm/query/Select;->args:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/orm/query/Select;->convertArgs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    .line 118
    :cond_0
    iget-object v1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    iget-object v2, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    iget-object v4, p0, Lcom/orm/query/Select;->groupBy:Ljava/lang/String;

    iget-object v5, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    iget-object v6, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    invoke-static/range {v1 .. v6}, Lcom/orm/SugarRecord;->find(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public varargs or([Lcom/orm/query/Condition;)Lcom/orm/query/Select;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/orm/query/Condition;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 103
    sget-object v0, Lcom/orm/query/Condition$Type;->OR:Lcom/orm/query/Condition$Type;

    invoke-direct {p0, p1, v0}, Lcom/orm/query/Select;->mergeConditions([Lcom/orm/query/Condition;Lcom/orm/query/Condition$Type;)V

    return-object p0
.end method

.method public orderBy(Ljava/lang/String;)Lcom/orm/query/Select;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    return-object p0
.end method

.method toSql()Ljava/lang/String;
    .locals 2

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT * FROM "

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/orm/query/Select;->record:Ljava/lang/Class;

    invoke-static {v1}, Lcom/orm/util/NamingHelper;->toSQLName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    iget-object v1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, "WHERE "

    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    if-eqz v1, :cond_1

    const-string v1, "ORDER BY "

    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/orm/query/Select;->orderBy:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_1
    iget-object v1, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    if-eqz v1, :cond_2

    const-string v1, "LIMIT "

    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/orm/query/Select;->limit:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    :cond_2
    iget-object v1, p0, Lcom/orm/query/Select;->offset:Ljava/lang/String;

    if-eqz v1, :cond_3

    const-string v1, "OFFSET "

    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/orm/query/Select;->offset:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public where(Ljava/lang/String;)Lcom/orm/query/Select;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 45
    iput-object p1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    return-object p0
.end method

.method public where(Ljava/lang/String;[Ljava/lang/String;)Lcom/orm/query/Select;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 108
    iput-object p1, p0, Lcom/orm/query/Select;->whereClause:Ljava/lang/String;

    .line 109
    iput-object p2, p0, Lcom/orm/query/Select;->arguments:[Ljava/lang/String;

    return-object p0
.end method

.method public varargs where([Lcom/orm/query/Condition;)Lcom/orm/query/Select;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/orm/query/Condition;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 51
    sget-object v0, Lcom/orm/query/Condition$Type;->AND:Lcom/orm/query/Condition$Type;

    invoke-direct {p0, p1, v0}, Lcom/orm/query/Select;->mergeConditions([Lcom/orm/query/Condition;Lcom/orm/query/Condition$Type;)V

    return-object p0
.end method

.method public varargs whereOr([Lcom/orm/query/Condition;)Lcom/orm/query/Select;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/orm/query/Condition;",
            ")",
            "Lcom/orm/query/Select<",
            "TT;>;"
        }
    .end annotation

    .line 93
    sget-object v0, Lcom/orm/query/Condition$Type;->OR:Lcom/orm/query/Condition$Type;

    invoke-direct {p0, p1, v0}, Lcom/orm/query/Select;->mergeConditions([Lcom/orm/query/Condition;Lcom/orm/query/Condition$Type;)V

    return-object p0
.end method
