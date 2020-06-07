.class final enum Lcom/orm/query/Condition$Type;
.super Ljava/lang/Enum;
.source "Condition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/orm/query/Condition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/orm/query/Condition$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/orm/query/Condition$Type;

.field public static final enum AND:Lcom/orm/query/Condition$Type;

.field public static final enum NOT:Lcom/orm/query/Condition$Type;

.field public static final enum OR:Lcom/orm/query/Condition$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 33
    new-instance v0, Lcom/orm/query/Condition$Type;

    const-string v1, "AND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/orm/query/Condition$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/orm/query/Condition$Type;->AND:Lcom/orm/query/Condition$Type;

    .line 34
    new-instance v0, Lcom/orm/query/Condition$Type;

    const-string v1, "OR"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/orm/query/Condition$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/orm/query/Condition$Type;->OR:Lcom/orm/query/Condition$Type;

    .line 35
    new-instance v0, Lcom/orm/query/Condition$Type;

    const-string v1, "NOT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/orm/query/Condition$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/orm/query/Condition$Type;->NOT:Lcom/orm/query/Condition$Type;

    const/4 v0, 0x3

    .line 32
    new-array v0, v0, [Lcom/orm/query/Condition$Type;

    sget-object v1, Lcom/orm/query/Condition$Type;->AND:Lcom/orm/query/Condition$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/orm/query/Condition$Type;->OR:Lcom/orm/query/Condition$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/orm/query/Condition$Type;->NOT:Lcom/orm/query/Condition$Type;

    aput-object v1, v0, v4

    sput-object v0, Lcom/orm/query/Condition$Type;->$VALUES:[Lcom/orm/query/Condition$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/orm/query/Condition$Type;
    .locals 1

    .line 32
    const-class v0, Lcom/orm/query/Condition$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/orm/query/Condition$Type;

    return-object p0
.end method

.method public static values()[Lcom/orm/query/Condition$Type;
    .locals 1

    .line 32
    sget-object v0, Lcom/orm/query/Condition$Type;->$VALUES:[Lcom/orm/query/Condition$Type;

    invoke-virtual {v0}, [Lcom/orm/query/Condition$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/orm/query/Condition$Type;

    return-object v0
.end method
