Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3966C4308
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfJAVxd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:33 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728135AbfJAVxc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZebZc8497xg5jL1sorMVjGXfrVeCtoAMJPaofccsG62wg9v2O1Ger4LSIFr3NU8c3sbgfa32s0rlXCs9eYzfA6tHgTwCwSYBIG1akJidb98i5k82Z2xAchE+iARurR1pBiOhVk1a8KY9bGQTCz1LjRCLbFze8SjK/Pwd9xqB9BoEr1bEF6Y7cb5Gllm36OcWmscOpPbB21oFpxcwWCIEIF92hcby+2L6DbL3xwRDohBksi3JLZUmvW5yv+FjSt6WoM9OyG0T6AxCa0SFlPIUCy4LSpMuCCUKBUSyYjq7YPmAe0eXxbaDYavt/dGL4IfaO7k2Ap3qmDi/MIYQt9YD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkvCPIfFuh5pfYvK0a3TRFuqTs94DeVNZNPt98OTCww=;
 b=NP2Y26BPXQzUniLDUnnlOHMx+l7UHhAE9QY947VXv9h69MCzrexnSVm2URR0wzlD+ZL0a3S10chT5tu3oSwOeY3MRIYfgEAgB/o4C3tpwVDdItdN8MdJHO6OzSTjr0JTabL/Ll1xHwJ8hkI14Dt7d/kZWX8WAyYA70HlS7BUa2WcR9XryuxSR/gXGbDI8OExZGCDbAz+JNRpi4FicgGFcRvfljLS/URADjn928Wf34y6yjNBCqgsI+HIlIs/kvNGkNwMncColhmyNtNJcLdvTgfQn5rM+qmJAR925amw7hndNXD0CurDB/HpuTS1VgQxN4np7k6nVU2ORXWzOWO9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkvCPIfFuh5pfYvK0a3TRFuqTs94DeVNZNPt98OTCww=;
 b=aKGRDpIF+NjWJWvukJwe87GoJALSdJGd+nUZ6Fqld/YZFjPu259kbX03ipnNkSAMa6EDPrCyP5stOVeCg4tWbNJ1uDuprlCM1ui+0wtVr8l9Jc+KbfXpsn/7436g/gl5r6Ag7jPNZN0K4DGJ7lMbYME+2JIzOoU1o1Rk6nZEp/M=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:25 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:25 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 16/36] MIPS: bitops: Handle !kernel_uses_llsc first
Thread-Topic: [PATCH v2 16/36] MIPS: bitops: Handle !kernel_uses_llsc first
Thread-Index: AQHVeKKmaw5LyazGw02kyUdZnEF8yg==
Date:   Tue, 1 Oct 2019 21:53:25 +0000
Message-ID: <20191001215249.4157062-17-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 46fc2c4b-0b12-40f6-5e86-08d746b9c91f
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB143906068A754E61ACD6FB4CC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(30864003)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SkRMbwgMKuoaMn1Sji9B4p8QeGdeplqM3LQEYZwwYBKRdCpSEFsbMJ1US29mM/lZGx8NQBncdw1N6A7eiW7qWIbD90kRcrUicC/dBoWyPE+JG1mMB68JRNSeWBm1oEGbuaFX3/GWy7Yl2wh3ItLmm2NjNegy6ozVnT4+G3eKI3ur62ymcoyegxS8g/VGYKK4lAl8iy+kyLOvQ5dpSKRmmFx3KcmB6nVP36weRJNxY2vMXPoR2yBBDTXspbqKltnbyIOKTTRh+a2/vooJqpM9up25HloTUTBhEl7XPalYEl2Uj595GKyieByv3hyJI4v8fhU37C+VzIoom7+v12tTsj5Sl6swxSm32iLxhrFu3V0sMKAo9toJjC9g9YegJ5l7kpZacVjr1f2bZ9xmGsE6Ic9PQQi9WBaUkJHoO6gslC4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fc2c4b-0b12-40f6-5e86-08d746b9c91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:25.6343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYK8AKt0342jdOZZoD5rh0KO3Pca1wj6+rT809ZFFl5RXraE61Pw+j95rklxbXjyNatUG3RoJ3pPzF55Jtij+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reorder conditions in our various bitops functions that check
kernel_uses_llsc such that they handle the !kernel_uses_llsc case first.
This allows us to avoid the need to duplicate the kernel_uses_llsc check
in all the other cases. For functions that don't involve barriers common
to the various implementations, we switch to returning from within each
if block making each case easier to read in isolation.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 213 ++++++++++++++++-----------------
 1 file changed, 105 insertions(+), 108 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 985d6a02f9ea..e300960717e0 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -52,11 +52,16 @@ int __mips_test_and_change_bit(unsigned long nr,
  */
 static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
 	unsigned long temp;
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
+	if (!kernel_uses_llsc) {
+		__mips_set_bit(nr, addr);
+		return;
+	}
+
+	if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -68,8 +73,11 @@ static inline void set_bit(unsigned long nr, volatile un=
signed long *addr)
 		: "=3D&r" (temp), "=3D" GCC_OFF_SMALL_ASM() (*m)
 		: "ir" (1UL << bit), GCC_OFF_SMALL_ASM() (*m)
 		: __LLSC_CLOBBER);
+		return;
+	}
+
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
+	if (__builtin_constant_p(bit)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -80,23 +88,23 @@ static inline void set_bit(unsigned long nr, volatile u=
nsigned long *addr)
 			: "ir" (bit), "r" (~0)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
+		return;
+	}
 #endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
-	} else if (kernel_uses_llsc) {
-		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1		# set_bit	\n"
-			"	or	%0, %2				\n"
-			"	" __SC	"%0, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "ir" (1UL << bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
-	} else
-		__mips_set_bit(nr, addr);
+
+	loongson_llsc_mb();
+	do {
+		__asm__ __volatile__(
+		"	.set	push				\n"
+		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
+		"	" __LL "%0, %1		# set_bit	\n"
+		"	or	%0, %2				\n"
+		"	" __SC	"%0, %1				\n"
+		"	.set	pop				\n"
+		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
+		: "ir" (1UL << bit)
+		: __LLSC_CLOBBER);
+	} while (unlikely(!temp));
 }
=20
 /*
@@ -111,11 +119,16 @@ static inline void set_bit(unsigned long nr, volatile=
 unsigned long *addr)
  */
 static inline void clear_bit(unsigned long nr, volatile unsigned long *add=
r)
 {
-	unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
 	unsigned long temp;
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
+	if (!kernel_uses_llsc) {
+		__mips_clear_bit(nr, addr);
+		return;
+	}
+
+	if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -127,8 +140,11 @@ static inline void clear_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
 		: "ir" (~(1UL << bit))
 		: __LLSC_CLOBBER);
+		return;
+	}
+
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	} else if (kernel_uses_llsc && __builtin_constant_p(bit)) {
+	if (__builtin_constant_p(bit)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -139,23 +155,23 @@ static inline void clear_bit(unsigned long nr, volati=
le unsigned long *addr)
 			: "ir" (bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
+		return;
+	}
 #endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
-	} else if (kernel_uses_llsc) {
-		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1		# clear_bit	\n"
-			"	and	%0, %2				\n"
-			"	" __SC "%0, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "ir" (~(1UL << bit))
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
-	} else
-		__mips_clear_bit(nr, addr);
+
+	loongson_llsc_mb();
+	do {
+		__asm__ __volatile__(
+		"	.set	push				\n"
+		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
+		"	" __LL "%0, %1		# clear_bit	\n"
+		"	and	%0, %2				\n"
+		"	" __SC "%0, %1				\n"
+		"	.set	pop				\n"
+		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
+		: "ir" (~(1UL << bit))
+		: __LLSC_CLOBBER);
+	} while (unlikely(!temp));
 }
=20
 /*
@@ -183,12 +199,16 @@ static inline void clear_bit_unlock(unsigned long nr,=
 volatile unsigned long *ad
  */
 static inline void change_bit(unsigned long nr, volatile unsigned long *ad=
dr)
 {
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
+	unsigned long temp;
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
+	if (!kernel_uses_llsc) {
+		__mips_change_bit(nr, addr);
+		return;
+	}
=20
+	if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push				\n"
 		"	.set	arch=3Dr4000			\n"
@@ -200,25 +220,22 @@ static inline void change_bit(unsigned long nr, volat=
ile unsigned long *addr)
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
 		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
-	} else if (kernel_uses_llsc) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
+		return;
+	}
=20
-		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1		# change_bit	\n"
-			"	xor	%0, %2				\n"
-			"	" __SC	"%0, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "ir" (1UL << bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
-	} else
-		__mips_change_bit(nr, addr);
+	loongson_llsc_mb();
+	do {
+		__asm__ __volatile__(
+		"	.set	push				\n"
+		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
+		"	" __LL "%0, %1		# change_bit	\n"
+		"	xor	%0, %2				\n"
+		"	" __SC	"%0, %1				\n"
+		"	.set	pop				\n"
+		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
+		: "ir" (1UL << bit)
+		: __LLSC_CLOBBER);
+	} while (unlikely(!temp));
 }
=20
 /*
@@ -232,15 +249,15 @@ static inline void change_bit(unsigned long nr, volat=
ile unsigned long *addr)
 static inline int test_and_set_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res;
+	unsigned long res, temp;
=20
 	smp_mb__before_llsc();
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	if (!kernel_uses_llsc) {
+		res =3D __mips_test_and_set_bit(nr, addr);
+	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -253,10 +270,7 @@ static inline int test_and_set_bit(unsigned long nr,
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
-	} else if (kernel_uses_llsc) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	} else {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -272,8 +286,7 @@ static inline int test_and_set_bit(unsigned long nr,
 		} while (unlikely(!res));
=20
 		res =3D temp & (1UL << bit);
-	} else
-		res =3D __mips_test_and_set_bit(nr, addr);
+	}
=20
 	smp_llsc_mb();
=20
@@ -291,13 +304,13 @@ static inline int test_and_set_bit(unsigned long nr,
 static inline int test_and_set_bit_lock(unsigned long nr,
 	volatile unsigned long *addr)
 {
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res;
-
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
+	unsigned long res, temp;
=20
+	if (!kernel_uses_llsc) {
+		res =3D __mips_test_and_set_bit_lock(nr, addr);
+	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -310,11 +323,7 @@ static inline int test_and_set_bit_lock(unsigned long =
nr,
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
-	} else if (kernel_uses_llsc) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
-		loongson_llsc_mb();
+	} else {
 		do {
 			__asm__ __volatile__(
 			"	.set	push				\n"
@@ -329,8 +338,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		} while (unlikely(!res));
=20
 		res =3D temp & (1UL << bit);
-	} else
-		res =3D __mips_test_and_set_bit_lock(nr, addr);
+	}
=20
 	smp_llsc_mb();
=20
@@ -347,15 +355,15 @@ static inline int test_and_set_bit_lock(unsigned long=
 nr,
 static inline int test_and_clear_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res;
+	unsigned long res, temp;
=20
 	smp_mb__before_llsc();
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	if (!kernel_uses_llsc) {
+		res =3D __mips_test_and_clear_bit(nr, addr);
+	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -370,10 +378,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	} else if (kernel_uses_llsc && __builtin_constant_p(nr)) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	} else if (__builtin_constant_p(nr)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -386,10 +391,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
 #endif
-	} else if (kernel_uses_llsc) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	} else {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -406,8 +408,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		} while (unlikely(!res));
=20
 		res =3D temp & (1UL << bit);
-	} else
-		res =3D __mips_test_and_clear_bit(nr, addr);
+	}
=20
 	smp_llsc_mb();
=20
@@ -425,15 +426,15 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 static inline int test_and_change_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
+	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res;
+	unsigned long res, temp;
=20
 	smp_mb__before_llsc();
=20
-	if (kernel_uses_llsc && R10000_LLSC_WAR) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	if (!kernel_uses_llsc) {
+		res =3D __mips_test_and_change_bit(nr, addr);
+	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=3Dr4000				\n"
@@ -446,10 +447,7 @@ static inline int test_and_change_bit(unsigned long nr=
,
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
-	} else if (kernel_uses_llsc) {
-		unsigned long *m =3D ((unsigned long *) addr) + (nr >> SZLONG_LOG);
-		unsigned long temp;
-
+	} else {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -465,8 +463,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		} while (unlikely(!res));
=20
 		res =3D temp & (1UL << bit);
-	} else
-		res =3D __mips_test_and_change_bit(nr, addr);
+	}
=20
 	smp_llsc_mb();
=20
--=20
2.23.0

