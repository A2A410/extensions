.class public final Leu/kanade/tachiyomi/extension/all/universal/Universal;
.super Leu/kanade/tachiyomi/source/online/ParsedHttpSource;
.source "Universal.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nUniversal.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Universal.kt\neu/kanade/tachiyomi/extension/all/universal/Universal\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,109:1\n1586#2:110\n1661#2,3:111\n*S KotlinDebug\n*F\n+ 1 Universal.kt\neu/kanade/tachiyomi/extension/all/universal/Universal\n*L\n67#1:110\n67#1:111,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0003\u0018\u0000 22\u00020\u0001:\u00012B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\u0008\u0010\u0014\u001a\u00020\u0005H\u0014J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0014J\u0008\u0010\u0019\u001a\u00020\u0005H\u0014J\u0010\u0010\u001a\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\u0008\u0010\u001b\u001a\u00020\u0005H\u0014J \u0010\u001c\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u001d\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u001fH\u0014J\u0008\u0010 \u001a\u00020\u0005H\u0014J\u0010\u0010!\u001a\u00020\u00112\u0006\u0010\"\u001a\u00020#H\u0014J\u0016\u0010$\u001a\u0008\u0012\u0004\u0012\u00020&0%2\u0006\u0010\"\u001a\u00020#H\u0014J\u0010\u0010\'\u001a\u00020(2\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\u0008\u0010)\u001a\u00020\u0005H\u0014J\u0010\u0010*\u001a\u00020\u00052\u0006\u0010\"\u001a\u00020#H\u0014J\u0010\u0010+\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\n\u0010,\u001a\u0004\u0018\u00010\u0005H\u0014J\u0010\u0010-\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0014J\u0008\u0010.\u001a\u00020\u0005H\u0014J\u0010\u0010/\u001a\u0002002\u0006\u00101\u001a\u00020\u0005H\u0002R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\u0005X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007R\u0014\u0010\u000c\u001a\u00020\rX\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u00063"
    }
    d2 = {
        "Leu/kanade/tachiyomi/extension/all/universal/Universal;",
        "Leu/kanade/tachiyomi/source/online/ParsedHttpSource;",
        "<init>",
        "()V",
        "baseUrl",
        "",
        "getBaseUrl",
        "()Ljava/lang/String;",
        "lang",
        "getLang",
        "name",
        "getName",
        "supportsLatest",
        "",
        "getSupportsLatest",
        "()Z",
        "popularMangaFromElement",
        "Leu/kanade/tachiyomi/source/model/SManga;",
        "element",
        "Lorg/jsoup/nodes/Element;",
        "popularMangaNextPageSelector",
        "popularMangaRequest",
        "Lokhttp3/Request;",
        "page",
        "",
        "popularMangaSelector",
        "searchMangaFromElement",
        "searchMangaNextPageSelector",
        "searchMangaRequest",
        "query",
        "filters",
        "Leu/kanade/tachiyomi/source/model/FilterList;",
        "searchMangaSelector",
        "mangaDetailsParse",
        "document",
        "Lorg/jsoup/nodes/Document;",
        "pageListParse",
        "",
        "Leu/kanade/tachiyomi/source/model/Page;",
        "chapterFromElement",
        "Leu/kanade/tachiyomi/source/model/SChapter;",
        "chapterListSelector",
        "imageUrlParse",
        "latestUpdatesFromElement",
        "latestUpdatesNextPageSelector",
        "latestUpdatesRequest",
        "latestUpdatesSelector",
        "getDate",
        "",
        "str",
        "Companion",
        "universal"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;

.field private static final DATE_FORMAT$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final baseUrl:Ljava/lang/String;

.field private final lang:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final supportsLatest:Z


# direct methods
.method public static synthetic $r8$lambda$6iA4DBkWRvtZZ1ldtVCrGxAhwdA(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->mangaDetailsParse$lambda$0$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$cwNXHOl-AYyg1fUXFekbQJQaA-4(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 1

    invoke-static {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->popularMangaFromElement$lambda$0$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->Companion:Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;

    .line 104
    new-instance v0, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->DATE_FORMAT$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Leu/kanade/tachiyomi/source/online/ParsedHttpSource;-><init>()V

    .line 19
    const-string v0, "[[BASE_URL]]"

    iput-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->baseUrl:Ljava/lang/String;

    .line 20
    const-string v0, "[[LANG]]"

    iput-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->lang:Ljava/lang/String;

    .line 21
    const-string v0, "[[NAME]]"

    iput-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->name:Ljava/lang/String;

    return-void
.end method

.method static final DATE_FORMAT_delegate$lambda$0()Ljava/text/SimpleDateFormat;
    .registers 3

    .line 105
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    return-object v0
.end method

.method public static final synthetic access$getDATE_FORMAT$delegate$cp()Lkotlin/Lazy;
    .registers 1

    .line 18
    sget-object v0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->DATE_FORMAT$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method private final getDate(Ljava/lang/String;)J
    .registers 5

    const-wide/16 v0, 0x0

    .line 98
    :try_start_2
    sget-object v2, Leu/kanade/tachiyomi/extension/all/universal/Universal;->Companion:Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;

    # invokes: Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;->getDATE_FORMAT()Ljava/text/SimpleDateFormat;
    invoke-static {v2}, Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;->access$getDATE_FORMAT(Leu/kanade/tachiyomi/extension/all/universal/Universal$Companion;)Ljava/text/SimpleDateFormat;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    if-eqz p1, :cond_12

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_12
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_12} :catch_12

    :catch_12
    :cond_12
    return-wide v0
.end method

.method private static final mangaDetailsParse$lambda$0$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 2

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p0

    const-string v0, "text(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/lang/CharSequence;

    return-object p0
.end method

.method private static final popularMangaFromElement$lambda$0$0(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;
    .registers 2

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p0

    const-string v0, "text(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/lang/CharSequence;

    return-object p0
.end method


# virtual methods
.method protected chapterFromElement(Lorg/jsoup/nodes/Element;)Leu/kanade/tachiyomi/source/model/SChapter;
    .registers 5

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    sget-object v0, Leu/kanade/tachiyomi/source/model/SChapter;->Companion:Leu/kanade/tachiyomi/source/model/SChapter$Companion;

    invoke-virtual {v0}, Leu/kanade/tachiyomi/source/model/SChapter$Companion;->create()Leu/kanade/tachiyomi/source/model/SChapter;

    move-result-object v0

    .line 78
    const-string v1, "link[rel=canonical]"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    const-string v2, "abs:href"

    invoke-virtual {v1, v2}, Lorg/jsoup/select/Elements;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "attr(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->setUrlWithoutDomain(Leu/kanade/tachiyomi/source/model/SChapter;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 79
    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SChapter;->setChapter_number(F)V

    .line 80
    const-string v1, "GALLERY"

    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SChapter;->setName(Ljava/lang/String;)V

    .line 81
    const-string v1, "time"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p1

    invoke-virtual {p1}, Lorg/jsoup/select/Elements;->text()Ljava/lang/String;

    move-result-object p1

    const-string v1, "text(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getDate(Ljava/lang/String;)J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Leu/kanade/tachiyomi/source/model/SChapter;->setDate_upload(J)V

    return-object v0
.end method

.method protected chapterListSelector()Ljava/lang/String;
    .registers 2

    .line 84
    const-string v0, "html"

    return-object v0
.end method

.method public getBaseUrl()Ljava/lang/String;
    .registers 2

    .line 19
    iget-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->baseUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getLang()Ljava/lang/String;
    .registers 2

    .line 20
    iget-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->lang:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 21
    iget-object v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportsLatest()Z
    .registers 2

    .line 22
    iget-boolean v0, p0, Leu/kanade/tachiyomi/extension/all/universal/Universal;->supportsLatest:Z

    return v0
.end method

.method protected imageUrlParse(Lorg/jsoup/nodes/Document;)Ljava/lang/String;
    .registers 3

    const-string v0, "document"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected latestUpdatesFromElement(Lorg/jsoup/nodes/Element;)Leu/kanade/tachiyomi/source/model/SManga;
    .registers 3

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected latestUpdatesNextPageSelector()Ljava/lang/String;
    .registers 2

    .line 91
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected latestUpdatesRequest(I)Lokhttp3/Request;
    .registers 2

    .line 93
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected latestUpdatesSelector()Ljava/lang/String;
    .registers 2

    .line 95
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected mangaDetailsParse(Lorg/jsoup/nodes/Document;)Leu/kanade/tachiyomi/source/model/SManga;
    .registers 13

    const-string v0, "document"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    sget-object v0, Leu/kanade/tachiyomi/source/model/SManga;->Companion:Leu/kanade/tachiyomi/source/model/SManga$Companion;

    invoke-virtual {v0}, Leu/kanade/tachiyomi/source/model/SManga$Companion;->create()Leu/kanade/tachiyomi/source/model/SManga;

    move-result-object v0

    .line 57
    const-string v1, "h1"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->text()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SManga;->setTitle(Ljava/lang/String;)V

    .line 58
    const-string v1, "div.pl-3 > a"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p1

    const-string v1, "select(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v2, p1

    check-cast v2, Ljava/lang/Iterable;

    const-string p1, ", "

    move-object v3, p1

    check-cast v3, Ljava/lang/CharSequence;

    new-instance v8, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda2;

    invoke-direct {v8}, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda2;-><init>()V

    const/16 v9, 0x1e

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v10}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Leu/kanade/tachiyomi/source/model/SManga;->setGenre(Ljava/lang/String;)V

    return-object v0
.end method

.method protected pageListParse(Lorg/jsoup/nodes/Document;)Ljava/util/List;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Document;",
            ")",
            "Ljava/util/List<",
            "Leu/kanade/tachiyomi/source/model/Page;",
            ">;"
        }
    .end annotation

    const-string v0, "document"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    .line 67
    :goto_c
    const-string v1, "#main img.block"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    const-string v2, "select(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Iterable;

    .line 110
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 111
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 112
    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 68
    new-instance v4, Leu/kanade/tachiyomi/source/model/Page;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    const-string v6, "src"

    invoke-virtual {v3, v6}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v9, 0xa

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v10}, Leu/kanade/tachiyomi/source/model/Page;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/net/Uri;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 112
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 113
    :cond_56
    check-cast v2, Ljava/util/List;

    .line 70
    const-string v1, "a[rel=next]"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p1

    const-string v1, "abs:href"

    invoke-virtual {p1, v1}, Lorg/jsoup/select/Elements;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "attr(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_73

    return-object v0

    .line 72
    :cond_73
    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getClient()Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getHeaders()Lokhttp3/Headers;

    move-result-object v2

    const/4 v3, 0x4

    const/4 v4, 0x0

    invoke-static {p1, v2, v4, v3, v4}, Leu/kanade/tachiyomi/network/RequestsKt;->GET$default(Ljava/lang/String;Lokhttp3/Headers;Lokhttp3/CacheControl;ILjava/lang/Object;)Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {v1, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    invoke-interface {p1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {p1, v4, v1, v4}, Leu/kanade/tachiyomi/util/JsoupExtensionsKt;->asJsoup$default(Lokhttp3/Response;Ljava/lang/String;ILjava/lang/Object;)Lorg/jsoup/nodes/Document;

    move-result-object p1

    goto/16 :goto_c
.end method

.method protected popularMangaFromElement(Lorg/jsoup/nodes/Element;)Leu/kanade/tachiyomi/source/model/SManga;
    .registers 14

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    sget-object v0, Leu/kanade/tachiyomi/source/model/SManga;->Companion:Leu/kanade/tachiyomi/source/model/SManga$Companion;

    invoke-virtual {v0}, Leu/kanade/tachiyomi/source/model/SManga$Companion;->create()Leu/kanade/tachiyomi/source/model/SManga;

    move-result-object v0

    .line 26
    const-string v1, ".relative img"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    const-string v2, "src"

    invoke-virtual {v1, v2}, Lorg/jsoup/select/Elements;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SManga;->setThumbnail_url(Ljava/lang/String;)V

    .line 27
    const-string v1, ".flex a"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    const-string v2, "select(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v3, v1

    check-cast v3, Ljava/lang/Iterable;

    const-string v1, ", "

    move-object v4, v1

    check-cast v4, Ljava/lang/CharSequence;

    new-instance v9, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda1;

    invoke-direct {v9}, Leu/kanade/tachiyomi/extension/all/universal/Universal$$ExternalSyntheticLambda1;-><init>()V

    const/16 v10, 0x1e

    const/4 v11, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v11}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SManga;->setGenre(Ljava/lang/String;)V

    .line 30
    const-string v1, "h2"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->text()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Leu/kanade/tachiyomi/source/model/SManga;->setTitle(Ljava/lang/String;)V

    .line 31
    const-string v1, "a"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p1

    const-string v1, "href"

    invoke-virtual {p1, v1}, Lorg/jsoup/select/Elements;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "attr(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->setUrlWithoutDomain(Leu/kanade/tachiyomi/source/model/SManga;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 32
    invoke-interface {v0, p1}, Leu/kanade/tachiyomi/source/model/SManga;->setInitialized(Z)V

    return-object v0
.end method

.method protected popularMangaNextPageSelector()Ljava/lang/String;
    .registers 2

    .line 35
    const-string v0, "a[rel=next]"

    return-object v0
.end method

.method protected popularMangaRequest(I)Lokhttp3/Request;
    .registers 5

    .line 36
    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getBaseUrl()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/?page="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getHeaders()Lokhttp3/Headers;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-static {p1, v0, v1, v2, v1}, Leu/kanade/tachiyomi/network/RequestsKt;->GET$default(Ljava/lang/String;Lokhttp3/Headers;Lokhttp3/CacheControl;ILjava/lang/Object;)Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method protected popularMangaSelector()Ljava/lang/String;
    .registers 2

    .line 38
    const-string v0, "#main > div > div"

    return-object v0
.end method

.method protected searchMangaFromElement(Lorg/jsoup/nodes/Element;)Leu/kanade/tachiyomi/source/model/SManga;
    .registers 3

    const-string v0, "element"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    invoke-virtual {p0, p1}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->popularMangaFromElement(Lorg/jsoup/nodes/Element;)Leu/kanade/tachiyomi/source/model/SManga;

    move-result-object p1

    return-object p1
.end method

.method protected searchMangaNextPageSelector()Ljava/lang/String;
    .registers 2

    .line 43
    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->popularMangaNextPageSelector()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected searchMangaRequest(ILjava/lang/String;Leu/kanade/tachiyomi/source/model/FilterList;)Lokhttp3/Request;
    .registers 5

    const-string v0, "query"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filters"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    sget-object p3, Lokhttp3/HttpUrl;->Companion:Lokhttp3/HttpUrl$Companion;

    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getBaseUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lokhttp3/HttpUrl$Companion;->get(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object p3

    invoke-virtual {p3}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object p3

    .line 46
    const-string v0, "search"

    invoke-virtual {p3, v0}, Lokhttp3/HttpUrl$Builder;->addPathSegment(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 47
    const-string v0, "kw"

    invoke-virtual {p3, v0, p2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 48
    const-string p2, "page"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p2, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 49
    invoke-virtual {p3}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object p1

    .line 50
    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->getHeaders()Lokhttp3/Headers;

    move-result-object p2

    const/4 p3, 0x0

    const/4 v0, 0x4

    .line 44
    invoke-static {p1, p2, p3, v0, p3}, Leu/kanade/tachiyomi/network/RequestsKt;->GET$default(Lokhttp3/HttpUrl;Lokhttp3/Headers;Lokhttp3/CacheControl;ILjava/lang/Object;)Lokhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method protected searchMangaSelector()Ljava/lang/String;
    .registers 2

    .line 53
    invoke-virtual {p0}, Leu/kanade/tachiyomi/extension/all/universal/Universal;->popularMangaSelector()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
