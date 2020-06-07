.class public Lcom/orm/util/NamingHelper;
.super Ljava/lang/Object;
.source "NamingHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toSQLName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 83
    const-class v0, Lcom/orm/dsl/Table;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 84
    const-class v0, Lcom/orm/dsl/Table;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/orm/dsl/Table;

    const-string v1, ""

    .line 85
    invoke-interface {v0}, Lcom/orm/dsl/Table;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/orm/util/NamingHelper;->toSQLNameDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 88
    :cond_0
    invoke-interface {v0}, Lcom/orm/dsl/Table;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 91
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/orm/util/NamingHelper;->toSQLNameDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toSQLName(Ljava/lang/reflect/Field;)Ljava/lang/String;
    .locals 1

    .line 66
    const-class v0, Lcom/orm/dsl/Column;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const-class v0, Lcom/orm/dsl/Column;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/orm/dsl/Column;

    .line 68
    invoke-interface {p0}, Lcom/orm/dsl/Column;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 71
    :cond_0
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/orm/util/NamingHelper;->toSQLNameDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toSQLNameDefault(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const-string v0, "_id"

    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "_id"

    return-object p0

    .line 27
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 30
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_a

    if-lez v2, :cond_1

    add-int/lit8 v3, v2, -0x1

    .line 31
    aget-char v3, p0, v3

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    .line 32
    :goto_1
    aget-char v4, p0, v2

    .line 33
    array-length v5, p0

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-ge v2, v5, :cond_2

    add-int/lit8 v5, v2, 0x1

    aget-char v5, p0, v5

    goto :goto_2

    :cond_2
    const/4 v5, 0x0

    :goto_2
    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    const/4 v6, 0x0

    :goto_3
    if-nez v6, :cond_8

    .line 36
    invoke-static {v4}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v6

    if-nez v6, :cond_8

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_4

    goto :goto_4

    .line 38
    :cond_4
    invoke-static {v4}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 39
    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 40
    invoke-static {v3}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v3

    const/16 v6, 0x5f

    if-eqz v3, :cond_5

    .line 41
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    :cond_5
    if-lez v5, :cond_6

    .line 42
    invoke-static {v5}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 43
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 45
    :cond_6
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 48
    :cond_7
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 37
    :cond_8
    :goto_4
    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_9
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    :cond_a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
