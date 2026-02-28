.class public final synthetic Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    check-cast p1, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->$r8$lambda$cwNXHOl-AYyg1fUXFekbQJQaA-4(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
