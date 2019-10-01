Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93F1C433A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfJAVzB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:01 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728116AbfJAVx3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEufhwe8NhiuB90fwBr0dUUUWK4jqSHlby/ZQtA/5YIepMbzIBu/q9eGKApu+Ed/MLiuJ9wAdsnpV+8gueyJ0PJiiVqTD8PmoM1SnQS6FXSxPedXMjcVCb+aqExLgVdNArNSo7SkugDqn9iDnSluMrythdSxr6gNHjUgQPKAUlhUXS2S3/7ycqfHi0WqdROsGfK/ULK1NRxdBBmYHoawLsmr1CCLJPbS64Cv0JCLtRsJPJjeZgfC6oepHGwdeSueGKsd2QcUOdv+l6QB4F4jQVlwfABW/vGlI7NvmmBSkjpf67pIX0JTNVG3gAxR1MQYK1QJdIYyssPm9af3RsWD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dho5hzus8m/2lkImn8ZIXDv7gok3Vo42gJWi78e//V4=;
 b=DB8Pf1FiTNKr+qRd4rZBVX8Ze+4joCE3l4160pCQ63lQtMZx1dx+Jl3g34Es4G0dJOI76xcBdAe/ZsHkU5rJVlyncNRymGvkzGSKRk530iDhG0+bJQ0wovYce4GKDC2pMoYnK5Gj13qMgEuby8LDaFb+42YNLH44hLKpEmZ/BWJz+rflRk3voc8yYUV9D5hV+EEb8K29Pr4jXYZBeYLbvCo/CWnWoeN/gqn/Gl9ELU4m0ceQhb4CbOSaaPje8wWSeg5TGgZEE/tOIYGpZbzWh/PMfRYFOmgB/heo66tlwhqtEoLnRJ96h9MAMX8vuf5KgubCNA5R9t5qRQ/lmDLflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dho5hzus8m/2lkImn8ZIXDv7gok3Vo42gJWi78e//V4=;
 b=PmsZpBHYK11++JtOfhV7JK7iu05A2QQpkJTSWg8LfaWNqllb7vKFD0tT0RXuCPDX0yvC9MA1A4SnVJXIg6mBerdEmT8xkn/Ktw34/1IHkkqYz6yVj+zajMiJQekBJVEECBQa2+9FPup6W2lxi9jx4bBP0pI/lVfXroBn4COTplA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 15/36] MIPS: atomic: Deduplicate 32b & 64b read, set, xchg,
 cmpxchg
Thread-Topic: [PATCH v2 15/36] MIPS: atomic: Deduplicate 32b & 64b read, set,
 xchg, cmpxchg
Thread-Index: AQHVeKKlJxT7iMVLuk6sBsJVvUiXBQ==
Date:   Tue, 1 Oct 2019 21:53:24 +0000
Message-ID: <20191001215249.4157062-16-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e36d3218-ddf0-4a29-109c-08d746b9c84b
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14395E98321904BB79F3616AC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004)(17423001)(156123004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hJHMGK9rixxdn8S+HITneOMVgWtCKJV0XWmk9f4z246tOU7i0LgXnZm5Q3lIGPxxhpNh2HcDoPb3Epby09Tarb6mfM70tzSPum6XgNotstOEGhmfMamCKrTDBcjBZJy8Sg3uDjREgFM3US0iNtbd9GiSFl6QSXqDGlol4s3XZIuA864Zb7lXdwGfBCPXUDwPcYjPupmd5Srw5ZAV/4PNoBhYEwrEvljb5sxjWlnYjS4pQbQQNhb4/SjhIrrCPVXgALXegRRAm3HPYRBC8pWJpnldE9HYt8ErUVHqzQm4RHTXHOwmUo+nUGQ4S5GraHtCHJZ0BsVO3Rnawf8k5Cz5e/zBKxItW8NoYOhL6PyMIUXmQyC6WQUZotQiAxis2gnCVOz88lGCzpdH1/oWk4DzZJBSXyJat3i54/LL83SDk4Y=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36d3218-ddf0-4a29-109c-08d746b9c84b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:24.2479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vgw/i5OgStAW4NH8lB6S2dTTaBXJBL8FntPeixBdf7rcLz3FPXianjrvx/gPYDwEvxfJMSj1LOgoI9IdoYHz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the remaining duplication between 32b & 64b in asm/atomic.h by
making use of an ATOMIC_OPS() macro to generate:

  - atomic_read()/atomic64_read()
  - atomic_set()/atomic64_set()
  - atomic_cmpxchg()/atomic64_cmpxchg()
  - atomic_xchg()/atomic64_xchg()

This is consistent with the way all other functions in asm/atomic.h are
generated, and ensures consistency between the 32b & 64b functions.

Of note is that this results in the above now being static inline
functions rather than macros.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/atomic.h | 70 +++++++++++++---------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 96ef50fa2817..e5ac88392d1f 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -24,24 +24,34 @@
 #include <asm/sync.h>
 #include <asm/war.h>
=20
-#define ATOMIC_INIT(i)	  { (i) }
+#define ATOMIC_OPS(pfx, type)						\
+static __always_inline type pfx##_read(const pfx##_t *v)		\
+{									\
+	return READ_ONCE(v->counter);					\
+}									\
+									\
+static __always_inline void pfx##_set(pfx##_t *v, type i)		\
+{									\
+	WRITE_ONCE(v->counter, i);					\
+}									\
+									\
+static __always_inline type pfx##_cmpxchg(pfx##_t *v, type o, type n)	\
+{									\
+	return cmpxchg(&v->counter, o, n);				\
+}									\
+									\
+static __always_inline type pfx##_xchg(pfx##_t *v, type n)		\
+{									\
+	return xchg(&v->counter, n);					\
+}
=20
-/*
- * atomic_read - read atomic variable
- * @v: pointer of type atomic_t
- *
- * Atomically reads the value of @v.
- */
-#define atomic_read(v)		READ_ONCE((v)->counter)
+#define ATOMIC_INIT(i)		{ (i) }
+ATOMIC_OPS(atomic, int)
=20
-/*
- * atomic_set - set atomic variable
- * @v: pointer of type atomic_t
- * @i: required value
- *
- * Atomically sets the value of @v to @i.
- */
-#define atomic_set(v, i)	WRITE_ONCE((v)->counter, (i))
+#ifdef CONFIG_64BIT
+# define ATOMIC64_INIT(i)	{ (i) }
+ATOMIC_OPS(atomic64, s64)
+#endif
=20
 #define ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
 static __inline__ void pfx##_##op(type i, pfx##_t * v)			\
@@ -135,6 +145,7 @@ static __inline__ type pfx##_fetch_##op##_relaxed(type =
i, pfx##_t * v)	\
 	return result;							\
 }
=20
+#undef ATOMIC_OPS
 #define ATOMIC_OPS(pfx, op, type, c_op, asm_op, ll, sc)			\
 	ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
 	ATOMIC_OP_RETURN(pfx, op, type, c_op, asm_op, ll, sc)		\
@@ -254,31 +265,4 @@ ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
=20
 #undef ATOMIC_SIP_OP
=20
-#define atomic_cmpxchg(v, o, n) (cmpxchg(&((v)->counter), (o), (n)))
-#define atomic_xchg(v, new) (xchg(&((v)->counter), (new)))
-
-#ifdef CONFIG_64BIT
-
-#define ATOMIC64_INIT(i)    { (i) }
-
-/*
- * atomic64_read - read atomic variable
- * @v: pointer of type atomic64_t
- *
- */
-#define atomic64_read(v)	READ_ONCE((v)->counter)
-
-/*
- * atomic64_set - set atomic variable
- * @v: pointer of type atomic64_t
- * @i: required value
- */
-#define atomic64_set(v, i)	WRITE_ONCE((v)->counter, (i))
-
-#define atomic64_cmpxchg(v, o, n) \
-	((__typeof__((v)->counter))cmpxchg(&((v)->counter), (o), (n)))
-#define atomic64_xchg(v, new) (xchg(&((v)->counter), (new)))
-
-#endif /* CONFIG_64BIT */
-
 #endif /* _ASM_ATOMIC_H */
--=20
2.23.0

