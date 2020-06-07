.class Landroid/support/v7/app/AppCompatDelegateImplV7$6;
.super Landroid/support/v4/view/ViewPropertyAnimatorListenerAdapter;
.source "AppCompatDelegateImplV7.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/app/AppCompatDelegateImplV7;->startSupportActionModeFromWindow(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;


# direct methods
.method constructor <init>(Landroid/support/v7/app/AppCompatDelegateImplV7;)V
    .locals 0

    .line 808
    iput-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    invoke-direct {p0}, Landroid/support/v4/view/ViewPropertyAnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/View;)V
    .locals 1

    .line 811
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mActionModeView:Landroid/support/v7/widget/ActionBarContextView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 812
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mFadeAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 813
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iput-object v0, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mFadeAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 1

    .line 818
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mActionModeView:Landroid/support/v7/widget/ActionBarContextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionBarContextView;->setVisibility(I)V

    .line 819
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mActionModeView:Landroid/support/v7/widget/ActionBarContextView;

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionBarContextView;->sendAccessibilityEvent(I)V

    .line 821
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mActionModeView:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionBarContextView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 822
    iget-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$6;->this$0:Landroid/support/v7/app/AppCompatDelegateImplV7;

    iget-object p1, p1, Landroid/support/v7/app/AppCompatDelegateImplV7;->mActionModeView:Landroid/support/v7/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionBarContextView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->requestApplyInsets(Landroid/view/View;)V

    :cond_0
    return-void
.end method
