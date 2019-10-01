Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA231C4330
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbfJAVyR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:17 -0400
Received: from mail-eopbgr750119.outbound.protection.outlook.com ([40.107.75.119]:27367
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbfJAVyP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3bvrSnV/nzmSbMJfNyJHhwS/82TCs8xRyUlun3CoH6h2KZYwU+mhbdPFQ8RWN7m+w/8qIDvccgRh5kZgLHp9eH1LbZMoGcUUCz+unGKgqMgjsJuzLL2JpG3R+q8BXanwcbRTActJumPEPblLxnsyCGTSwHN+ztFiBeEKBLS1E8Uf/eDGl8jxixzFH4LAQ8A6yI+g6O1IEHnKBG74z2wfjtk2rWi1JfZTc9yJOxewW93czsa6XOY9vTvVrGbUKCOjrjcogKTtJXFQmnik61W9/mxkhV+5hYHxZGw85pZCJREzxvRilhB1f+54TSmeu+Qyj21K9XOLRKVTmYEUPPfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvKp4k19ls4+6tnMRA/6GTdZbR5v9xxSyD4Fo6DCAgc=;
 b=oXqW67f4GRW6SE4XbVxKLyiPPkevVmd5lar/z7HJs6OV8tqCekXFu4tOdqSRl9uk/d9bLfcXa47CoDUZGouXhalnvs96xCPwgb7h82GHGR1l3gqYUhnYY4N2B0aOW+tAvwXGiUmqMOEUlDn41fNdParnbsB+zfmcMsxwkcq89hw5fVdN6s0GukRopl+JZmhsfY3JXxoPwdmFgzqTbvzEJcu7/IZ1TFpaJ/Hd9kV6R5RQ/CuKXazqYbikIQOrD0/lH3chNQAAXu9lGFF36U9KRTcMPr6iBTg06j8wDWxN4clkaG0xRxhLfdOxEN8jXP0sQifTrll3tcwuQygnjckXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvKp4k19ls4+6tnMRA/6GTdZbR5v9xxSyD4Fo6DCAgc=;
 b=WAeikLFLynD7GhQWiTh4BRAbnQzLSUWyMF38WiECfwSqikhP2UwSm6MzIV6H1m1b5tHVUNibl+e1pyoaYBajbaKWR77QXRSKHPLmVxJT8590WhRkmWyq8tuHlAasaV0B7xaUcFY8ram2F7zY2nyY8f9m+2SGSXdrrnnuIYk0Hok=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 30/36] MIPS: futex: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH v2 30/36] MIPS: futex: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVeKKu1sY4yaAX30mGgrwia3pl8g==
Date:   Tue, 1 Oct 2019 21:53:38 +0000
Message-ID: <20191001215249.4157062-31-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 46063039-e7f3-4061-08fe-08d746b9d123
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB158185CD45F6D32B262DFC5FC19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSWApVL7msZAe8xVsRPOignrSKZbcKO9lxKgKC5ohxE4VemMM+EpvfrMJrOfxWHcFuPm0mgM4C6UCpTGsdnJdfGVCk3Ofw+MnBbkGCJ8Yuv+bVuAAW48silcTHQNzI8VmcCsatZFj8sc2kYs19ngmIz0b5DaUwy1kTaSu9hEGigkJSCJeIdmYu2ZOa4EgPTGNlq183cp1e5gRNI+e6L/hduVR9FfJGVW+xtrGuICBe3MUmobyG9+iaoo/JjpQeNmUFGqX5oDStjKD8LkSjXvI3fEdYEJ0KM/tS3QKiE1nOwNopKtK/DbR/JUU4p1sRNJgDmWYaEtbEIYL0qKL+7aekpzYfMVz6PiYatm5vcQ/xHGWX+9s5IXC1rL3dcBk/SvAzwYE0OVBaTVMBULDs+RRPFewlpc2e2PSHVhhN8vRPQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46063039-e7f3-4061-08fe-08d746b9d123
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:39.0201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CHeDW8NAzx90tYYcwEXctd8NA7Tl12/6PFJ6VL9z65Vic/32mCyM2ygEd+pQWHeH9MMO7/mPMKCuotGCqPVSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generate the sync instructions required to workaround Loongson3 LL/SC
errata within inline asm blocks, which feels a little safer than doing
it from C where strictly speaking the compiler would be well within its
rights to insert a memory access between the separate asm statements we
previously had, containing sync & ll instructions respectively.

Signed-off-by: Paul Burton <paul.burton@mips.com>

---

Changes in v2:
- De-string __WEAK_LLSC_MB to allow its use with __SYNC_ELSE().

 arch/mips/include/asm/barrier.h | 13 +++++++------
 arch/mips/include/asm/futex.h   | 15 +++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index c7e05e832da9..133afd565067 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -95,13 +95,14 @@ static inline void wmb(void)
  * ordering will be done by smp_llsc_mb() and friends.
  */
 #if defined(CONFIG_WEAK_REORDERING_BEYOND_LLSC) && defined(CONFIG_SMP)
-#define __WEAK_LLSC_MB		"	sync	\n"
-#define smp_llsc_mb()		__asm__ __volatile__(__WEAK_LLSC_MB : : :"memory")
-#define __LLSC_CLOBBER
+# define __WEAK_LLSC_MB		sync
+# define smp_llsc_mb() \
+	__asm__ __volatile__(__stringify(__WEAK_LLSC_MB) : : :"memory")
+# define __LLSC_CLOBBER
 #else
-#define __WEAK_LLSC_MB		"		\n"
-#define smp_llsc_mb()		do { } while (0)
-#define __LLSC_CLOBBER		"memory"
+# define __WEAK_LLSC_MB
+# define smp_llsc_mb()		do { } while (0)
+# define __LLSC_CLOBBER		"memory"
 #endif
=20
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index b83b0397462d..54cf20530931 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -16,6 +16,7 @@
 #include <asm/barrier.h>
 #include <asm/compiler.h>
 #include <asm/errno.h>
+#include <asm/sync.h>
 #include <asm/war.h>
=20
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
@@ -32,7 +33,7 @@
 		"	.set	arch=3Dr4000			\n"	\
 		"2:	sc	$1, %2				\n"	\
 		"	beqzl	$1, 1b				\n"	\
-		__WEAK_LLSC_MB						\
+		__stringify(__WEAK_LLSC_MB)				\
 		"3:						\n"	\
 		"	.insn					\n"	\
 		"	.set	pop				\n"	\
@@ -50,19 +51,19 @@
 		  "i" (-EFAULT)						\
 		: "memory");						\
 	} else if (cpu_has_llsc) {					\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
 		"	.set	push				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
+		"	" __SYNC(full, loongson3_war) "		\n"	\
 		"1:	"user_ll("%1", "%4")" # __futex_atomic_op\n"	\
 		"	.set	pop				\n"	\
 		"	" insn	"				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
 		"2:	"user_sc("$1", "%2")"			\n"	\
 		"	beqz	$1, 1b				\n"	\
-		__WEAK_LLSC_MB						\
+		__stringify(__WEAK_LLSC_MB)				\
 		"3:						\n"	\
 		"	.insn					\n"	\
 		"	.set	pop				\n"	\
@@ -147,7 +148,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
 		"	.set	arch=3Dr4000				\n"
 		"2:	sc	$1, %2					\n"
 		"	beqzl	$1, 1b					\n"
-		__WEAK_LLSC_MB
+		__stringify(__WEAK_LLSC_MB)
 		"3:							\n"
 		"	.insn						\n"
 		"	.set	pop					\n"
@@ -164,13 +165,13 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *=
uaddr,
 		  "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
-		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"# futex_atomic_cmpxchg_inatomic			\n"
 		"	.set	push					\n"
 		"	.set	noat					\n"
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
+		"	" __SYNC(full, loongson3_war) "			\n"
 		"1:	"user_ll("%1", "%3")"				\n"
 		"	bne	%1, %z4, 3f				\n"
 		"	.set	pop					\n"
@@ -178,8 +179,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 		"2:	"user_sc("$1", "%2")"				\n"
 		"	beqz	$1, 1b					\n"
-		__WEAK_LLSC_MB
-		"3:							\n"
+		"3:	" __SYNC_ELSE(full, loongson3_war, __WEAK_LLSC_MB) "\n"
 		"	.insn						\n"
 		"	.set	pop					\n"
 		"	.section .fixup,\"ax\"				\n"
@@ -194,7 +194,6 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
 		: GCC_OFF_SMALL_ASM() (*uaddr), "Jr" (oldval), "Jr" (newval),
 		  "i" (-EFAULT)
 		: "memory");
-		loongson_llsc_mb();
 	} else
 		return -ENOSYS;
=20
--=20
2.23.0

