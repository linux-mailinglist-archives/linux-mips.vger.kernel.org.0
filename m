Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B03C2A74
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732553AbfI3XIg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:36 -0400
Received: from mail-eopbgr690120.outbound.protection.outlook.com ([40.107.69.120]:5486
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732524AbfI3XIf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FecrNjBf701D8OEGBBAlLgW164YoxuKol4NQIH3ZiVuRV5yX2VFgkEBJg7lQOltbMCOX3OFQXC7Doj4ges5xN1L8Vir9hfRZQcAQTmsOMyB4XsTb7CEzMdhq36yPpfTiZdpXPVNXszY3gvDMOD9cXYr4eay8K9GQyCpycZfnvR+XG54gRZjF1j8/uJj2jcSFvhOqIKc/unNhhcg1BSIdKr1i3e4ruviBeJ1dP6Dmaiv5hkIFYV4IJvGzeZd1OsKRTwvOOvZeJD0sxr+0UuwBmckYX2f6DbJ0NZzWFM6o4kZWgTYxNRTa2roEgW+ExRrSsgxY7mMgZv/amh5gINT++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3uKaoCO7FzQJHIbI0DhZFwrC+UyLgiCc6+uwJwRO5o=;
 b=GCYkOVmrGQcT1o38m+9XVOGDQu2g1Zl9OXmwMWSUfHYyQmeUFEY90mwBTMDi10His/yb4hklFGdgbof4IJwYCnQyuw36SGRO+VjTI1rNcT2MDvtbu0Fvbo5MAUk5WrJ1KDOCVzpX8iTzcakkDSYZWIZYpYhz4hHCWGnC6eBujBHy22pn0cFjJcJgRKKHKDVI/hfSdgHclflCrMptCBAsX1BexqoaLKUCJj0zFNSDsDIPqJQZaoA6XpxU+zA8gXQpL+8NHCcinuk7vMIVwSYqSvrbtd1hsYsJZJVXv0T9pqKhpx0+ZzHXFE02BxAQiHss6YDfmYSRzyCiVABWNWj9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3uKaoCO7FzQJHIbI0DhZFwrC+UyLgiCc6+uwJwRO5o=;
 b=n2n7I+XaEi7dp1dqpP0QR+D38UcZF43TJhbFl6KvLsfiklY/64/CUHAj1eLegf1lDdy5Y36hIsS0LA6KtO2qiTj9SRI64SigkkFx3HkItEXD8oa2rwBPtKlmnjO20+pH6q83UQsK64mPpc4Bc64oifed0B26xtd1s+wvcBOn1a4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 15/37] MIPS: atomic: Deduplicate 32b & 64b read, set, xchg,
 cmpxchg
Thread-Topic: [PATCH 15/37] MIPS: atomic: Deduplicate 32b & 64b read, set,
 xchg, cmpxchg
Thread-Index: AQHVd+P3/LviTIzozkW5FHZOcasyGw==
Date:   Mon, 30 Sep 2019 23:08:27 +0000
Message-ID: <20190930230806.2940505-16-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e7fb17f-6c83-42fd-7436-08d745fb1a03
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB102274D1023BB09B50ABB53FC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(17423001)(156123004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LkTOYwvQiBygneB0U8I6lcwIk+8gWZieQHboF7jXEyb1Qg1CQsNk6iZ/beExSrMx2SMn6ZxkWj3rFzm411zw1uuvhaMlsqxgGns9bJ7EkMrcbmeZhOULG/c0QDuvMXOZpHb3CiqVx2JSjnli5VL5aI8C5KZqcgOOsBFcz+jove65Ft743QlARWTp8f5is8MjQht3bJz9cW6pIS1A87fZ6p9d/ktU0DJSj/wsvmolfVgvVrHKK21HYNLQrLu2wG/DXz8Z21HnUN/EjYduvUFtmdur5YCi7TFlSDiHPgTzzcywzshdng/4qcFOwTmegFlboYpx2/tbHNPagHbaSrWnhbKxN79MUGxXzIsog9vPlbMO/JMFkg1vbFSQP2KPPyCUkk+U7fEiMbtHYtNv6CYa6Ei9R3nA/fX7UT5tw8+Vgeg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7fb17f-6c83-42fd-7436-08d745fb1a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:27.3295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSebEwfI5rO5uWxjV/U754BDx4kI5mY22r/74G0ELP8RfXK0UmHECqjr7eTqWkm+hqYfxIvko08YhmoapjQauQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

