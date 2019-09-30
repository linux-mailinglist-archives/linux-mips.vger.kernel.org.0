Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B8CC2A50
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732625AbfI3XIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:45 -0400
Received: from mail-eopbgr820094.outbound.protection.outlook.com ([40.107.82.94]:14848
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732541AbfI3XIj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdgQtKANOmTpQWn6R1gdb9mseCN45OivmHVAsruSs5z0pTlD4OoghYjvVchKl8XRvcdoOZsM2NSxzGCBPWZ7AMyJoleGts33/JssW/OWr56Te41inFFL0C7d2igRW6hicZUYOwxM30DQbtXY1TauegtJ5KvMFq8f2808PV3jL3jln3rDU4vfA8QlSdDJOiwqRG7Ly5lahfInKbVWvIq01N/sgHCo29AD3oLkfvQC6zfx0Gg3MYwwGEIUMClymRoabI/WHglrPIuW5AzTkbqeb7su9WVYj1NhBFU9CAAEY+gHxfnTGjRAyKlMhrtMKYd225bmpUDkXlAUwgwGR0LqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwCHP8f9vEEqF1DOMB5/K7kyiVoVkxQPBMeJvvZV5TQ=;
 b=jyBI8RI1+ozP15kI4nXJ0i3x2DhoXplRDphQnJhNbPNrPvxqdw15IAT7FojuHWVAbP9L3Ok4QhIQ6+jJ9helxPbdnFtush09LdUh+Nn89irZ0bnr1xwk9xAV1m0ZNiVdnRAlC4ZXE5y0ZmlxSij8T4Pju+yU1PPJ8Q7SdAgbnJRyF3EdRWks0dJ6HgtD3prFagkNDD03OUqPF8aBcU/VZo/NWPxDp9QCOjmlLY/Fez2Ciju4QAr1rz7Jn+L6Z/Gg3hZodQAtW/HpU1dz0/gR0PFGemkpdaIiPPxdaDi4INW2Flgc8k3pZ5YD/NyzBg6v1PBsCBK2164pzPjvJY6RtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwCHP8f9vEEqF1DOMB5/K7kyiVoVkxQPBMeJvvZV5TQ=;
 b=WUmHQoyPp6+63Fto2wIvA3FKjcgmPNe73H7jZcglzE83MxiqFQanOIhFRYEPx/27NUk5gN+YwOiz5TdXD7Qzht7SHl16980jeBTSd1ZQPF5mYbrddsfJ78JMzl/mmDaW4et8Tj8FODEik5gJ5rYVccrLPCA+zQ0kOuSIquZUR3k=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 17/37] MIPS: bitops: Handle !kernel_uses_llsc first
Thread-Topic: [PATCH 17/37] MIPS: bitops: Handle !kernel_uses_llsc first
Thread-Index: AQHVd+P4EAlteNxBukiF3XGmYDe6Yg==
Date:   Mon, 30 Sep 2019 23:08:28 +0000
Message-ID: <20190930230806.2940505-18-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: d20ec455-e8bb-460c-65e3-08d745fb1af8
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022D685FB428DE8A32ABC90C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(30864003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GKmbXYzMoY32hNd77uIXKdML7Qy4kZyiPhbN6Hsk4XKJFasSyyvvIlbJ08+7weXNWSgxsZC4P0y3H+vSoKmKAnNK3A2EurWM1sT3Q/YMOoKt1fGEhDOLfrcni6ihZDuXdc7PULsbzEMWobCu0Ow4bBa3jNwryFeBG9O2eVzzfpM/IeVixLzOIJCk0f0cIbaAono1Z9yn0qnF/nmnZUrBnxcV/vaUjzh4ZECRuNgHN01huORofeECazWBvqzwyIdLQ0D7B0lzVqBoNbM6LsSPp62/YP0PIZAo7+DBlSB4sbh/ET77tUYQZd/I5BuESRiT1j2msUj3uuUZmH6MkVdOw0j/3jXPlxvOgsVHNiep126OYyj1m9BZDqYiuKblrQus1YvRQuU6vukdHxxntJI4tHf3mktKs9vpnc8ZjCnGUZs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20ec455-e8bb-460c-65e3-08d745fb1af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:28.9688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8j0rAxC9uYMKpbITzy8bvpsHnQm5srFUK7UPHJLb7XGG+gerhGZRRO9q+IgH6Pizg+d4PRB4+Iws4DWc4BpJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 213 ++++++++++++++++-----------------
 1 file changed, 105 insertions(+), 108 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 4b618afbfa5b..d3f3f37ca0b1 100644
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

