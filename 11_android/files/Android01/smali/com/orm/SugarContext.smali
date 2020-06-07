.class public Lcom/orm/SugarContext;
.super Ljava/lang/Object;
.source "SugarContext.java"


# static fields
.field private static instance:Lcom/orm/SugarContext;


# instance fields
.field private context:Landroid/content/Context;

.field private entitiesMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private sugarDb:Lcom/orm/SugarDb;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/orm/SugarContext;->context:Landroid/content/Context;

    .line 18
    new-instance v0, Lcom/orm/SugarDb;

    invoke-direct {v0, p1}, Lcom/orm/SugarDb;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/orm/SugarContext;->sugarDb:Lcom/orm/SugarDb;

    .line 19
    new-instance p1, Lcom/google/common/collect/MapMaker;

    invoke-direct {p1}, Lcom/google/common/collect/MapMaker;-><init>()V

    invoke-virtual {p1}, Lcom/google/common/collect/MapMaker;->weakKeys()Lcom/google/common/collect/MapMaker;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/collect/MapMaker;->makeMap()Ljava/util/concurrent/ConcurrentMap;

    move-result-object p1

    iput-object p1, p0, Lcom/orm/SugarContext;->entitiesMap:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method private doTerminate()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/orm/SugarContext;->sugarDb:Lcom/orm/SugarDb;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/orm/SugarContext;->sugarDb:Lcom/orm/SugarDb;

    invoke-virtual {v0}, Lcom/orm/SugarDb;->getDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_0
    return-void
.end method

.method public static getSugarContext()Lcom/orm/SugarContext;
    .locals 2

    .line 23
    sget-object v0, Lcom/orm/SugarContext;->instance:Lcom/orm/SugarContext;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "SugarContext has not been initialized properly. Call SugarContext.init(Context) in your Application.onCreate() method and SugarContext.terminate() in your Application.onTerminate() method."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_0
    sget-object v0, Lcom/orm/SugarContext;->instance:Lcom/orm/SugarContext;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1

    .line 30
    new-instance v0, Lcom/orm/SugarContext;

    invoke-direct {v0, p0}, Lcom/orm/SugarContext;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/orm/SugarContext;->instance:Lcom/orm/SugarContext;

    return-void
.end method

.method public static terminate()V
    .locals 1

    .line 34
    sget-object v0, Lcom/orm/SugarContext;->instance:Lcom/orm/SugarContext;

    if-nez v0, :cond_0

    return-void

    .line 37
    :cond_0
    sget-object v0, Lcom/orm/SugarContext;->instance:Lcom/orm/SugarContext;

    invoke-direct {v0}, Lcom/orm/SugarContext;->doTerminate()V

    return-void
.end method


# virtual methods
.method getEntitiesMap()Ljava/util/concurrent/ConcurrentMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/orm/SugarContext;->entitiesMap:Ljava/util/concurrent/ConcurrentMap;

    return-object v0
.end method

.method protected getSugarDb()Lcom/orm/SugarDb;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/orm/SugarContext;->sugarDb:Lcom/orm/SugarDb;

    return-object v0
.end method
