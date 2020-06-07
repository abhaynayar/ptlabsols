.class Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;
.super Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;
.source "MediaBrowserCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaBrowserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SubscriptionCallbackApi21"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21$StubApi21;
    }
.end annotation


# instance fields
.field private mOptions:Landroid/os/Bundle;

.field mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

.field private final mSubscriptionCallbackObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;Landroid/os/Bundle;)V
    .locals 0

    .line 533
    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;-><init>()V

    .line 534
    iput-object p1, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    .line 535
    iput-object p2, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mOptions:Landroid/os/Bundle;

    .line 536
    new-instance p1, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21$StubApi21;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21$StubApi21;-><init>(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;Landroid/support/v4/media/MediaBrowserCompat$1;)V

    invoke-static {p1}, Landroid/support/v4/media/MediaBrowserCompatApi21;->createSubscriptionCallback(Landroid/support/v4/media/MediaBrowserCompatApi21$SubscriptionCallback;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallbackObj:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$1800(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;)Ljava/lang/Object;
    .locals 0

    .line 528
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallbackObj:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$400(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;)Landroid/os/Bundle;
    .locals 0

    .line 528
    iget-object p0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mOptions:Landroid/os/Bundle;

    return-object p0
.end method


# virtual methods
.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 547
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 562
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 575
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onError(Ljava/lang/String;)V

    return-void
.end method

.method public onError(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 592
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallbackApi21;->mSubscriptionCallback:Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->onError(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method
