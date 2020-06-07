.class abstract Lcom/google/common/cache/Striped64;
.super Ljava/lang/Number;
.source "Striped64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/cache/Striped64$Cell;
    }
.end annotation


# static fields
.field static final NCPU:I

.field private static final UNSAFE:Lsun/misc/Unsafe;

.field private static final baseOffset:J

.field private static final busyOffset:J

.field static final rng:Ljava/util/Random;

.field static final threadHashCode:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[I>;"
        }
    .end annotation
.end field


# instance fields
.field volatile transient base:J

.field volatile transient busy:I

.field volatile transient cells:[Lcom/google/common/cache/Striped64$Cell;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 125
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/google/common/cache/Striped64;->threadHashCode:Ljava/lang/ThreadLocal;

    .line 130
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/google/common/cache/Striped64;->rng:Ljava/util/Random;

    .line 133
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lcom/google/common/cache/Striped64;->NCPU:I

    .line 298
    :try_start_0
    invoke-static {}, Lcom/google/common/cache/Striped64;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0

    sput-object v0, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    .line 299
    const-class v0, Lcom/google/common/cache/Striped64;

    .line 300
    sget-object v1, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    const-string v2, "base"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v1, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v1

    sput-wide v1, Lcom/google/common/cache/Striped64;->baseOffset:J

    .line 302
    sget-object v1, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    const-string v2, "busy"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v1, v0}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v0

    sput-wide v0, Lcom/google/common/cache/Striped64;->busyOffset:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 305
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>()V
    .locals 0

    .line 154
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lsun/misc/Unsafe;
    .locals 1

    .line 21
    invoke-static {}, Lcom/google/common/cache/Striped64;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0

    return-object v0
.end method

.method private static getUnsafe()Lsun/misc/Unsafe;
    .locals 3

    .line 318
    :try_start_0
    invoke-static {}, Lsun/misc/Unsafe;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 321
    :catch_0
    :try_start_1
    new-instance v0, Lcom/google/common/cache/Striped64$1;

    invoke-direct {v0}, Lcom/google/common/cache/Striped64$1;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;
    :try_end_1
    .catch Ljava/security/PrivilegedActionException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    move-exception v0

    .line 334
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not initialize intrinsics"

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method final casBase(JJ)Z
    .locals 8

    .line 161
    sget-object v0, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/cache/Striped64;->baseOffset:J

    move-object v1, p0

    move-wide v4, p1

    move-wide v6, p3

    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    move-result p1

    return p1
.end method

.method final casBusy()Z
    .locals 6

    .line 168
    sget-object v0, Lcom/google/common/cache/Striped64;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/cache/Striped64;->busyOffset:J

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapInt(Ljava/lang/Object;JII)Z

    move-result v0

    return v0
.end method

.method abstract fn(JJ)J
.end method

.method final internalReset(J)V
    .locals 4

    .line 280
    iget-object v0, p0, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    .line 281
    iput-wide p1, p0, Lcom/google/common/cache/Striped64;->base:J

    if-eqz v0, :cond_1

    .line 283
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 285
    aget-object v3, v0, v2

    if-eqz v3, :cond_0

    .line 287
    iput-wide p1, v3, Lcom/google/common/cache/Striped64$Cell;->value:J

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method final retryUpdate(J[IZ)V
    .locals 17

    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez p3, :cond_1

    .line 196
    sget-object v4, Lcom/google/common/cache/Striped64;->threadHashCode:Ljava/lang/ThreadLocal;

    new-array v7, v5, [I

    invoke-virtual {v4, v7}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 197
    sget-object v4, Lcom/google/common/cache/Striped64;->rng:Ljava/util/Random;

    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :cond_0
    aput v4, v7, v6

    move-object/from16 v16, v7

    move v7, v4

    move-object/from16 v4, v16

    goto :goto_0

    .line 201
    :cond_1
    aget v7, p3, v6

    move-object/from16 v4, p3

    :goto_0
    move/from16 v8, p4

    :goto_1
    const/4 v9, 0x0

    .line 205
    :cond_2
    :goto_2
    iget-object v10, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-eqz v10, :cond_d

    array-length v11, v10

    if-lez v11, :cond_d

    add-int/lit8 v12, v11, -0x1

    and-int/2addr v12, v7

    .line 206
    aget-object v12, v10, v12

    if-nez v12, :cond_5

    .line 207
    iget v10, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-nez v10, :cond_4

    .line 208
    new-instance v10, Lcom/google/common/cache/Striped64$Cell;

    invoke-direct {v10, v2, v3}, Lcom/google/common/cache/Striped64$Cell;-><init>(J)V

    .line 209
    iget v11, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-nez v11, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 213
    :try_start_0
    iget-object v11, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-eqz v11, :cond_3

    array-length v12, v11

    if-lez v12, :cond_3

    add-int/lit8 v12, v12, -0x1

    and-int/2addr v12, v7

    aget-object v13, v11, v12

    if-nez v13, :cond_3

    .line 216
    aput-object v10, v11, v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v10, 0x1

    goto :goto_3

    :cond_3
    const/4 v10, 0x0

    .line 220
    :goto_3
    iput v6, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-eqz v10, :cond_2

    goto/16 :goto_b

    :catchall_0
    move-exception v0

    move-object v2, v0

    iput v6, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v2

    :cond_4
    :goto_4
    const/4 v9, 0x0

    goto :goto_8

    :cond_5
    if-nez v8, :cond_6

    const/4 v8, 0x1

    goto :goto_8

    .line 231
    :cond_6
    iget-wide v13, v12, Lcom/google/common/cache/Striped64$Cell;->value:J

    invoke-virtual {v1, v13, v14, v2, v3}, Lcom/google/common/cache/Striped64;->fn(JJ)J

    move-result-wide v5

    invoke-virtual {v12, v13, v14, v5, v6}, Lcom/google/common/cache/Striped64$Cell;->cas(JJ)Z

    move-result v5

    if-eqz v5, :cond_7

    goto/16 :goto_b

    .line 233
    :cond_7
    sget v5, Lcom/google/common/cache/Striped64;->NCPU:I

    if-ge v11, v5, :cond_4

    iget-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-eq v5, v10, :cond_8

    goto :goto_4

    :cond_8
    if-nez v9, :cond_9

    const/4 v9, 0x1

    goto :goto_8

    .line 237
    :cond_9
    iget v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-nez v5, :cond_c

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 239
    :try_start_1
    iget-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-ne v5, v10, :cond_b

    shl-int/lit8 v5, v11, 0x1

    .line 240
    :try_start_2
    new-array v5, v5, [Lcom/google/common/cache/Striped64$Cell;

    const/4 v6, 0x0

    :goto_5
    if-ge v6, v11, :cond_a

    .line 242
    aget-object v9, v10, v6

    aput-object v9, v5, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 243
    :cond_a
    iput-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object v2, v0

    const/4 v5, 0x0

    goto :goto_7

    :cond_b
    :goto_6
    const/4 v5, 0x0

    .line 246
    iput v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    const/4 v5, 0x1

    const/4 v6, 0x0

    goto/16 :goto_1

    :catchall_2
    move-exception v0

    const/4 v5, 0x0

    move-object v2, v0

    :goto_7
    iput v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v2

    :cond_c
    :goto_8
    shl-int/lit8 v5, v7, 0xd

    xor-int/2addr v5, v7

    ushr-int/lit8 v6, v5, 0x11

    xor-int/2addr v5, v6

    shl-int/lit8 v6, v5, 0x5

    xor-int/2addr v5, v6

    const/4 v6, 0x0

    .line 254
    aput v5, v4, v6

    move v7, v5

    const/4 v5, 0x0

    goto :goto_c

    .line 256
    :cond_d
    iget v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-nez v5, :cond_f

    iget-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-ne v5, v10, :cond_f

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/Striped64;->casBusy()Z

    move-result v5

    if-eqz v5, :cond_f

    .line 259
    :try_start_3
    iget-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    if-ne v5, v10, :cond_e

    const/4 v5, 0x2

    .line 260
    :try_start_4
    new-array v5, v5, [Lcom/google/common/cache/Striped64$Cell;

    and-int/lit8 v6, v7, 0x1

    .line 261
    new-instance v10, Lcom/google/common/cache/Striped64$Cell;

    invoke-direct {v10, v2, v3}, Lcom/google/common/cache/Striped64$Cell;-><init>(J)V

    aput-object v10, v5, v6

    .line 262
    iput-object v5, v1, Lcom/google/common/cache/Striped64;->cells:[Lcom/google/common/cache/Striped64$Cell;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    const/4 v5, 0x0

    const/4 v15, 0x1

    goto :goto_9

    :catchall_3
    move-exception v0

    move-object v2, v0

    const/4 v5, 0x0

    goto :goto_a

    :cond_e
    const/4 v5, 0x0

    const/4 v15, 0x0

    .line 266
    :goto_9
    iput v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    if-eqz v15, :cond_10

    goto :goto_b

    :catchall_4
    move-exception v0

    const/4 v5, 0x0

    move-object v2, v0

    :goto_a
    iput v5, v1, Lcom/google/common/cache/Striped64;->busy:I

    throw v2

    :cond_f
    const/4 v5, 0x0

    .line 271
    iget-wide v10, v1, Lcom/google/common/cache/Striped64;->base:J

    invoke-virtual {v1, v10, v11, v2, v3}, Lcom/google/common/cache/Striped64;->fn(JJ)J

    move-result-wide v12

    invoke-virtual {v1, v10, v11, v12, v13}, Lcom/google/common/cache/Striped64;->casBase(JJ)Z

    move-result v6

    if-eqz v6, :cond_10

    :goto_b
    return-void

    :cond_10
    :goto_c
    const/4 v5, 0x1

    const/4 v6, 0x0

    goto/16 :goto_2
.end method
