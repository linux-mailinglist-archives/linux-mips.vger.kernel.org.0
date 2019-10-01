Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FDEC4346
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfJAVxL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:11 -0400
Received: from mail-eopbgr730112.outbound.protection.outlook.com ([40.107.73.112]:19088
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727837AbfJAVxK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq54d+9cWDFeSOL298QY+OBknY20t24Yn+cwL/1icQwBl/SEDDs/dAWL4A9hxbu0DGF0uPTfCRxhupqI8eFZASGmbmnq6UclNxgbr/AciHVciDp12zHhuWtomjSpZUcf3bOGb37JcdrzGbLxy/LPp3cp9SQ+obfghfJLPKaur65QMqzBdaghNYv6I65GO1OmtsEmi0P4ehb9VqXzcrtLw545ZNAUwiH6XlIb4xOXHbcGvtSKQgI7YUaAvWcIduTJq61C5ocOdCUJEtpqp6vOiVBVfjM2080vHbZry5OkiGyGMpmagRu3FffLKLU8pXEePtoa1HwYf5GPbXwVwImE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vI9gNCglkfhF5VFQxv/Hh5DetZ54lJmxxhImH/eGP0=;
 b=Jvvk3XNqS81dSYr2EqnqL9MOvEvj7SIMTrIPrB2pgrbkYSzfUVYBq3A2tpi2GFxNxu3YwnxLzw47C3I5h/oP06aRe1RuLpaBmIkjEuyv0hscqhoyiofiwCu3rk2pwAHGf5OB+gpk4F9LIOdwM8cFJgkS1JAV+f4I+soivBoisJN3E5RXWgfZ2YvzxZbQpSyzXM315nylzgTofD7613gBbhoewTRwdSPp2YN0tAJ2Z2t1rarmEVDBP6sRvvPqcJfHWi5NChH+NTgGXrLYbhljh8QfQ/xNuk/wYbmDfrlu5+LEAqDA/VevmSO8e5QmLC3M/FJBMSfil6EtsfytGWesUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vI9gNCglkfhF5VFQxv/Hh5DetZ54lJmxxhImH/eGP0=;
 b=u6aFAbnB+7vGyD+9pMdpavGFRLOV/E2gGJfvHgEXsNoNssuZnNwx6h7DSL9ep685tmvqUPBsyFMgxB09j2bV8ayb0tbW7Fjlj5iTXoDtCsrxQah7NPDi2lVGMs3BUoGvtXKHxeBsYCY53j7s47rNsrXPiXbvhl2owEeUIrOMol8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:06 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:06 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 01/36] MIPS: Unify sc beqz definition
Thread-Topic: [PATCH v2 01/36] MIPS: Unify sc beqz definition
Thread-Index: AQHVeKKbqA5jK9SbWEK9RRYhOQ0O0w==
Date:   Tue, 1 Oct 2019 21:53:05 +0000
Message-ID: <20191001215249.4157062-2-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 6fda94e5-9dc2-4aec-8c45-08d746b9bd24
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1213FF97DA50B579191C1AE6C19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(14444005)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RTsIeGHEJOf0i3VoV0EpuIzPujTXvd11t6EV21zEhSSGON4HhHAcmoxKv7PrxJsT2hmkVueAzNSSQHSmINRld2clKRLiYDR9GZsUYL/AaOnBNFAx5fXf2g2uM0zxKe1XUpRxoMuT6BiX3F1eQuOTygsb8ijpqO4pWqDPeOo61n+20lUwgQNgmU8ZmMaFYbzCoQOm90kA8YtVx91F8z+SB9nXHQsjlqK6nmkkxEUPoSTyPYYE78MJiSUPlRXfiqWfg3LCceIsJ/Jh9F8wOE9BVuBhjJ0en07LaR0Ri2ezbnmydhNEOyz4g4DAIuUFOw9aQc0mWFMU46DauAbRjoevXg145ZTYsOyVJz3tkvOE/fZIOGjduPyrY1QWfBuQqXgkte34bjoYQ0xGvmjmfMVqDCqNHL3592WKKQFrBVQOA6c=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fda94e5-9dc2-4aec-8c45-08d746b9bd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:05.9304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbqATM/wk+P06dP9xxd47OaCc0chIjw/vFI2uYijkGVH5nk2S1b3HeHaX0cz67ch90cJzHkPL8Y5Rf4UAqfJdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We currently duplicate the definition of __scbeqz in asm/atomic.h &
asm/cmpxchg.h. Move it to asm/llsc.h & rename it to __SC_BEQZ to fit
better with the existing __SC macro provided there.

We include a tab in the string in order to avoid the need for users to
indent code any further to include whitespace of their own after the
instruction mnemonic.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/atomic.h  | 28 +++++++++-------------------
 arch/mips/include/asm/cmpxchg.h | 20 ++++----------------
 arch/mips/include/asm/llsc.h    | 11 +++++++++++
 3 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index bb8658cc7f12..7578c807ef98 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -20,19 +20,9 @@
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
 #include <asm/cmpxchg.h>
+#include <asm/llsc.h>
 #include <asm/war.h>
=20
-/*
- * Using a branch-likely instruction to check the result of an sc instruct=
ion
- * works around a bug present in R10000 CPUs prior to revision 3.0 that co=
uld
- * cause ll-sc sequences to execute non-atomically.
- */
-#if R10000_LLSC_WAR
-# define __scbeqz "beqzl"
-#else
-# define __scbeqz "beqz"
-#endif
-
 #define ATOMIC_INIT(i)	  { (i) }
=20
 /*
@@ -65,7 +55,7 @@ static __inline__ void atomic_##op(int i, atomic_t * v)		=
	      \
 		"1:	ll	%0, %1		# atomic_" #op "	\n"   \
 		"	" #asm_op " %0, %2				\n"   \
 		"	sc	%0, %1					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	.set	pop					\n"   \
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	      \
 		: "Ir" (i) : __LLSC_CLOBBER);				      \
@@ -93,7 +83,7 @@ static __inline__ int atomic_##op##_return_relaxed(int i,=
 atomic_t * v)	      \
 		"1:	ll	%1, %2		# atomic_" #op "_return	\n"   \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	sc	%0, %2					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	.set	pop					\n"   \
 		: "=3D&r" (result), "=3D&r" (temp),				      \
@@ -127,7 +117,7 @@ static __inline__ int atomic_fetch_##op##_relaxed(int i=
, atomic_t * v)	      \
 		"1:	ll	%1, %2		# atomic_fetch_" #op "	\n"   \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	sc	%0, %2					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	.set	pop					\n"   \
 		"	move	%0, %1					\n"   \
 		: "=3D&r" (result), "=3D&r" (temp),				      \
@@ -205,7 +195,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	sc	%1, %2					\n"
-		"\t" __scbeqz "	%1, 1b					\n"
+		"\t" __SC_BEQZ "%1, 1b					\n"
 		"2:							\n"
 		"	.set	pop					\n"
 		: "=3D&r" (result), "=3D&r" (temp),
@@ -267,7 +257,7 @@ static __inline__ void atomic64_##op(s64 i, atomic64_t =
* v)		      \
 		"1:	lld	%0, %1		# atomic64_" #op "	\n"   \
 		"	" #asm_op " %0, %2				\n"   \
 		"	scd	%0, %1					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	.set	pop					\n"   \
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	      \
 		: "Ir" (i) : __LLSC_CLOBBER);				      \
@@ -295,7 +285,7 @@ static __inline__ s64 atomic64_##op##_return_relaxed(s6=
4 i, atomic64_t * v)   \
 		"1:	lld	%1, %2		# atomic64_" #op "_return\n"  \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	scd	%0, %2					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	.set	pop					\n"   \
 		: "=3D&r" (result), "=3D&r" (temp),				      \
@@ -329,7 +319,7 @@ static __inline__ s64 atomic64_fetch_##op##_relaxed(s64=
 i, atomic64_t * v)    \
 		"1:	lld	%1, %2		# atomic64_fetch_" #op "\n"   \
 		"	" #asm_op " %0, %1, %3				\n"   \
 		"	scd	%0, %2					\n"   \
-		"\t" __scbeqz "	%0, 1b					\n"   \
+		"\t" __SC_BEQZ "%0, 1b					\n"   \
 		"	move	%0, %1					\n"   \
 		"	.set	pop					\n"   \
 		: "=3D&r" (result), "=3D&r" (temp),				      \
@@ -404,7 +394,7 @@ static __inline__ s64 atomic64_sub_if_positive(s64 i, a=
tomic64_t * v)
 		"	move	%1, %0					\n"
 		"	bltz	%0, 1f					\n"
 		"	scd	%1, %2					\n"
-		"\t" __scbeqz "	%1, 1b					\n"
+		"\t" __SC_BEQZ "%1, 1b					\n"
 		"1:							\n"
 		"	.set	pop					\n"
 		: "=3D&r" (result), "=3D&r" (temp),
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxch=
g.h
index 79bf34efbc04..5d3f0e3513b4 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -11,19 +11,9 @@
 #include <linux/bug.h>
 #include <linux/irqflags.h>
 #include <asm/compiler.h>
+#include <asm/llsc.h>
 #include <asm/war.h>
=20
-/*
- * Using a branch-likely instruction to check the result of an sc instruct=
ion
- * works around a bug present in R10000 CPUs prior to revision 3.0 that co=
uld
- * cause ll-sc sequences to execute non-atomically.
- */
-#if R10000_LLSC_WAR
-# define __scbeqz "beqzl"
-#else
-# define __scbeqz "beqz"
-#endif
-
 /*
  * These functions doesn't exist, so if they are called you'll either:
  *
@@ -57,7 +47,7 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
 		"	move	$1, %z3				\n"	\
 		"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"	\
 		"	" st "	$1, %1				\n"	\
-		"\t" __scbeqz "	$1, 1b				\n"	\
+		"\t" __SC_BEQZ	"$1, 1b				\n"	\
 		"	.set	pop				\n"	\
 		: "=3D&r" (__ret), "=3D" GCC_OFF_SMALL_ASM() (*m)		\
 		: GCC_OFF_SMALL_ASM() (*m), "Jr" (val)			\
@@ -130,7 +120,7 @@ static inline unsigned long __xchg(volatile void *ptr, =
unsigned long x,
 		"	move	$1, %z4				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
 		"	" st "	$1, %1				\n"	\
-		"\t" __scbeqz "	$1, 1b				\n"	\
+		"\t" __SC_BEQZ	"$1, 1b				\n"	\
 		"	.set	pop				\n"	\
 		"2:						\n"	\
 		: "=3D&r" (__ret), "=3D" GCC_OFF_SMALL_ASM() (*m)		\
@@ -268,7 +258,7 @@ static inline unsigned long __cmpxchg64(volatile void *=
ptr,
 	/* Attempt to store new at ptr */
 	"	scd	%L1, %2				\n"
 	/* If we failed, loop! */
-	"\t" __scbeqz "	%L1, 1b				\n"
+	"\t" __SC_BEQZ "%L1, 1b				\n"
 	"	.set	pop				\n"
 	"2:						\n"
 	: "=3D&r"(ret),
@@ -311,6 +301,4 @@ static inline unsigned long __cmpxchg64(volatile void *=
ptr,
 # endif /* !CONFIG_SMP */
 #endif /* !CONFIG_64BIT */
=20
-#undef __scbeqz
-
 #endif /* __ASM_CMPXCHG_H */
diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index c6d17d171147..9b19f38562ac 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -25,4 +25,15 @@
 #define __EXT		"dext	"
 #endif
=20
+/*
+ * Using a branch-likely instruction to check the result of an sc instruct=
ion
+ * works around a bug present in R10000 CPUs prior to revision 3.0 that co=
uld
+ * cause ll-sc sequences to execute non-atomically.
+ */
+#if R10000_LLSC_WAR
+# define __SC_BEQZ "beqzl	"
+#else
+# define __SC_BEQZ "beqz	"
+#endif
+
 #endif /* __ASM_LLSC_H  */
--=20
2.23.0

