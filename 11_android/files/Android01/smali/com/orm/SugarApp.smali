.class public Lcom/orm/SugarApp;
.super Landroid/app/Application;
.source "SugarApp.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .line 11
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 12
    invoke-static {p0}, Lcom/orm/SugarContext;->init(Landroid/content/Context;)V

    return-void
.end method

.method public onTerminate()V
    .locals 0

    .line 17
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 18
    invoke-static {}, Lcom/orm/SugarContext;->terminate()V

    return-void
.end method
