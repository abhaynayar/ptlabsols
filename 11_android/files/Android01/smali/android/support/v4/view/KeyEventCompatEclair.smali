.class Landroid/support/v4/view/KeyEventCompatEclair;
.super Ljava/lang/Object;
.source "KeyEventCompatEclair.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispatch(Landroid/view/KeyEvent;Landroid/view/KeyEvent$Callback;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 30
    check-cast p2, Landroid/view/KeyEvent$DispatcherState;

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static getKeyDispatcherState(Landroid/view/View;)Ljava/lang/Object;
    .locals 0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object p0

    return-object p0
.end method

.method public static isTracking(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 38
    invoke-virtual {p0}, Landroid/view/KeyEvent;->isTracking()Z

    move-result p0

    return p0
.end method

.method public static startTracking(Landroid/view/KeyEvent;)V
    .locals 0

    .line 34
    invoke-virtual {p0}, Landroid/view/KeyEvent;->startTracking()V

    return-void
.end method
