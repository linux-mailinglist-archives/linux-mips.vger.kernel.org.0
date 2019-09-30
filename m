Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAD6C2A67
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbfI3XIS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:18 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732018AbfI3XIS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl+Fd7JwP3EPA3BYzGPPubbIffr28ZHNVPXKgXy+hQnsqjGgvKRoXc+2gupOlhDNCkuwWLlAZqS02wS/q+0uN9yuB63i5S8OFtz5livjNz/dUEvzrrYlFpt62zYHRPQ9hJWNfXjcPYnAjBN2fjmKA4eQ3JxOx4SqexLYUmaPLm7U1bV9RK6L6kX5/8XTmEJB/gM/T0/bp7lsVEpiB1uX1g4PulHARpXXY9DtuBCYLk3tcueaiJsGHNXdrxwXB6/a/gkqoe18Ga0TjIH+amLBgNBmXTHm95BVxlDRqrBIF3KeNytnEaeXTkaA6kPxC83a6dXQD59O3ryrfIgtPD2xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IllcbHu49UnIzLg2B1vxZlSaLf4pVPVKbtzaaUYQwSg=;
 b=X8DGjc27eSe5jw3PfkiW0MR40mwpoFn/Z9W4cEbFSR2HHTHDeu5wiCnShJ3fReHQAX/08y8iGvqD3vvc2BmIIXYE+BCSL2rlNZR5XBjtY8fLCGroGM6P4QvtHZE5ZK/ScA1dk3cECscikuv+prL66CFrtpgmbSGh5Uym42lL7UHue2jd/74B8PWRaFK+YXh3thFxU5OM9rMWWd5JPE+JewAL0xxt/GwzIoZ+23ThP+pudjb8KWOxiHnF3EVg1G7vZRrwtWug8CU4E5HlTa1Qa/xP8z5cVM4AXA/aKaAtY7eCpDZ6IaWRUWe46NEqH5ni0x23L8BIwdl9UXlTk4jycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IllcbHu49UnIzLg2B1vxZlSaLf4pVPVKbtzaaUYQwSg=;
 b=P1V+7VW3cariwhBs9S90N+uTqIEoXfblO1DhUPcAH0HyqM8a1dW+8V/YyXy0jB7uuBVmXOJAQ1Pci4XwG6gAzb3h06++SWtDXjYqIgKyi/KcKi0Eny6vrqk/77RfIfr56KaGPCFgMXkCgvrDk2ys4uh1VaPvR/yt1n5hmHnwQ7Q=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 01/37] MIPS: Unify sc beqz definition
Thread-Topic: [PATCH 01/37] MIPS: Unify sc beqz definition
Thread-Index: AQHVd+Pwc/PZwTOkWk+5nsJHrv9cbQ==
Date:   Mon, 30 Sep 2019 23:08:15 +0000
Message-ID: <20190930230806.2940505-2-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 0e672a2c-5249-42c0-2cfe-08d745fb12b8
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1709D168920EF55CCA0276ECC1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(14444005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uxSaKN6eGf5LXd2MClFbFUKaY+bL0243GdcLdGY10favhYSiEYs+X6sPh48KNtcVRcwfmKZkdF7XdEeGz8gTfqACE8g4Eu65n7xPSTb2XE0JGK66+W/k8x4d0ViTgT8rBojZ4MBbVnEyXixHKqkdqqy3gwUzLCvN+WpOaTfGsvex0z3hLcnRDOn7quIqZveQKsBklfSyEXfMWQ1hcCBtbpku9LzVrp+lRMW7aofnGYoycxCWlGFyyUEvM5xKPaoEfEoXnX9d4gwhHozfr+iPyFeLcdp7HjVaLT0SUwacxLaQ4tWvpn4HCvUd7s9KcT5qSdv/JNCTfaSIYYOaRqm2CdwEaWczHC2gUVfOQA3JcEt2fzk1TzZ+SsF1VZAvNdW/FeEPkAG4duXTHqpA8qsfYRjvxRKfPkuNJkvVnL6xoHY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e672a2c-5249-42c0-2cfe-08d745fb12b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:15.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2vXDTOHSXPvOWdjRUlkP0jpNnHxVeSwWleMAjarmzfT/WsrQqd57nGZaHHQMT85vA9yn9Eujku0l9D8Lo2Ogw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
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

