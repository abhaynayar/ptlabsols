.class Landroid/support/v4/media/MediaBrowserServiceCompatApi23;
.super Landroid/support/v4/media/MediaBrowserServiceCompatApi21;
.source "MediaBrowserServiceCompatApi23.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptorApi23;,
        Landroid/support/v4/media/MediaBrowserServiceCompatApi23$ItemCallback;,
        Landroid/support/v4/media/MediaBrowserServiceCompatApi23$ServiceImplApi23;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaBrowserServiceCompatApi21"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserServiceCompatApi21;-><init>()V

    return-void
.end method

.method public static createService()Ljava/lang/Object;
    .locals 1

    .line 30
    new-instance v0, Landroid/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptorApi23;

    invoke-direct {v0}, Landroid/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptorApi23;-><init>()V

    return-object v0
.end method

.method public static onCreate(Ljava/lang/Object;Landroid/support/v4/media/MediaBrowserServiceCompatApi23$ServiceImplApi23;)V
    .locals 0

    .line 34
    check-cast p0, Landroid/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptorApi23;

    invoke-virtual {p0, p1}, Landroid/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptorApi23;->onCreate(Landroid/support/v4/media/MediaBrowserServiceCompatApi23$ServiceImplApi23;)V

    return-void
.end method
