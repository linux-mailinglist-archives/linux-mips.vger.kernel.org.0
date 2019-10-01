Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00F6C431B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbfJAVyG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:06 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728237AbfJAVxq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcPxqESVHSoHM0i3T5N8q4MTgwL6ytd6tXz8MsEnE1fNN/gBjK00YRyY2klqOs5gf+ZzA/I7V4VTXCPoxpRXMyO8Zp9cQNiVAKgedNeSDqOtynRP3yT5pt5je0Q/2+2sh+liT+mUkOUiLn44B6RpcLnJS82trEBCWg6HEcjDO676fs08TOOl/oI4KwubuIThjWwrMergdOD9VtB+XnADy1O+hH8iOc3e68nfHsJq75vS9oKYEOC9ed0t/1i/hSXDjUahNitKcZ2s0nbYr6n9FOKd+EFI1fOTqVoQCO0koW3VRIjQVSiUUn+h7owxOIb9aQHsD4y/SeqtSoeSdDqY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npOaMSJyJF5W9F6cpP/sgOA+pcyXNaIKTv58DqWOnDU=;
 b=NpLozVbQ5BaJo4VrPDmd4ewDPSzubFORcu1zzUrx0Sdg0I9ysPWww7kvoyN8pIh9Kdoor3hiXTAtzD+S0VGsjUBCzEjXHGNEEYLtNHcy/+GjMESOFbJ1xuuunV0RgB9R0dLbi/CIHQl2I+Z2HPGhqhF8XsWmHd/lp43A7cSbVimCGVzGUVnIRm6hHPGWMg+uIsSPhDwQ/6HkDElO4ZVuc0+ygWKAqkJbfoldZuzZlgoVDxLZryh20PS5tD9GG9MNscdjFFCdJ7wW8cpgtRMyUPfoT4Iocd3PHyejAnxcMLAtDEniJ/Ynlqrj5hVrqNGhlvUGK6UhhP5iszomnuq7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npOaMSJyJF5W9F6cpP/sgOA+pcyXNaIKTv58DqWOnDU=;
 b=gdycOskhuE/BcM5qmFx0GY0d3uM7LEWqaoe0Z7cfD1E1rmNhmwxiTCxc6hHWx2QrkX3HxQd9XDnnvHPwo4DhqSbYZjQojSqBSB8vgjanQA1rsTLwn11Lqo0H66PWPv28utmlwpYr9ueDsilqxsJX62hd9I3EPszKqxMWIs0alcU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 24/36] MIPS: bitops: Abstract LL/SC loops
Thread-Topic: [PATCH v2 24/36] MIPS: bitops: Abstract LL/SC loops
Thread-Index: AQHVeKKrVOaQd8iJw06uvKmFE7Np4A==
Date:   Tue, 1 Oct 2019 21:53:33 +0000
Message-ID: <20191001215249.4157062-25-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 4db24a35-7ef5-469e-bed5-08d746b9cdeb
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439739E094B1BFD9CBFFDD7C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9vbB7nk0euZmgbvf1SktAW1mJ8GTobIhTuZefLO8iwsu5C1D/IdmTjOXeUv5uTwa5EmI8aTXroquSHpqY1vrUDxQKSIylu1ZZYs4Gd+Up8+U31jEaEgvI4TNEnzvfNVVFleap7Mop+m7Le6IzCB5DyyqIdCQI4tphQ8mYvhaQq1M74CB7d52BE2c0uKuU8pkZSFjr0ow5k3JxH0ygH2iqjb6PVWIwciPPWtGrnx8tVYvEb/6tEvU0bUDq2FzSNh41cO8puzKlmohbgPiuxwl2qFmKJEg42HrLahj/4SK1BGDvCaZldkY/OL46j9ddKWhezmdFK6QvKP2FNkrJmZdAKecpN226VKGyjDFvivb5baYz8gydXLj1HYClAO1CJFhskqSkK859Tdtc+a61UZ7OKHhhz8+Y3f6sOIikng8za8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db24a35-7ef5-469e-bed5-08d746b9cdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:33.6646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHleMTU+6SGvttFkP2opPvhKUairgdGCJVRJ1CKHv5gHxNeOribS5fGuDDx6JoBgxhS5poXXzH6W/jRfTs8Z7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce __bit_op() & __test_bit_op() macros which abstract away the
implementation of LL/SC loops. This cuts down on a lot of duplicate
boilerplate code, and also allows R10000_LLSC_WAR to be handled outside
of the individual bitop functions.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 267 ++++++++-------------------------
 1 file changed, 63 insertions(+), 204 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 7671db2a7b73..fba0a842b98a 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -25,6 +25,41 @@
 #include <asm/sgidefs.h>
 #include <asm/war.h>
=20
+#define __bit_op(mem, insn, inputs...) do {			\
+	unsigned long temp;					\
+								\
+	asm volatile(						\
+	"	.set		push			\n"	\
+	"	.set		" MIPS_ISA_LEVEL "	\n"	\
+	"1:	" __LL		"%0, %1			\n"	\
+	"	" insn		"			\n"	\
+	"	" __SC		"%0, %1			\n"	\
+	"	" __SC_BEQZ	"%0, 1b			\n"	\
+	"	.set		pop			\n"	\
+	: "=3D&r"(temp), "+" GCC_OFF_SMALL_ASM()(mem)		\
+	: inputs						\
+	: __LLSC_CLOBBER);					\
+} while (0)
+
+#define __test_bit_op(mem, ll_dst, insn, inputs...) ({		\
+	unsigned long orig, temp;				\
+								\
+	asm volatile(						\
+	"	.set		push			\n"	\
+	"	.set		" MIPS_ISA_LEVEL "	\n"	\
+	"1:	" __LL		ll_dst ", %2		\n"	\
+	"	" insn		"			\n"	\
+	"	" __SC		"%1, %2			\n"	\
+	"	" __SC_BEQZ	"%1, 1b			\n"	\
+	"	.set		pop			\n"	\
+	: "=3D&r"(orig), "=3D&r"(temp),				\
+	  "+" GCC_OFF_SMALL_ASM()(mem)				\
+	: inputs						\
+	: __LLSC_CLOBBER);					\
+								\
+	orig;							\
+})
+
 /*
  * These are the "slower" versions of the functions and are in bitops.c.
  * These functions call raw_local_irq_{save,restore}().
@@ -54,55 +89,20 @@ static inline void set_bit(unsigned long nr, volatile u=
nsigned long *addr)
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long temp;
=20
 	if (!kernel_uses_llsc) {
 		__mips_set_bit(nr, addr);
 		return;
 	}
=20
-	if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL "%0, %1			# set_bit	\n"
-		"	or	%0, %2					\n"
-		"	" __SC	"%0, %1					\n"
-		"	beqzl	%0, 1b					\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "=3D" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (BIT(bit)), GCC_OFF_SMALL_ASM() (*m)
-		: __LLSC_CLOBBER);
-		return;
-	}
-
 	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit) && (bit >=3D 16)) =
{
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	" __LL "%0, %1		# set_bit	\n"
-			"	" __INS "%0, %3, %2, 1			\n"
-			"	" __SC "%0, %1				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "i" (bit), "r" (~0)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
+		__bit_op(*m, __INS "%0, %3, %2, 1", "i"(bit), "r"(~0));
 		return;
 	}
=20
 	loongson_llsc_mb();
-	do {
-		__asm__ __volatile__(
-		"	.set	push				\n"
-		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1		# set_bit	\n"
-		"	or	%0, %2				\n"
-		"	" __SC	"%0, %1				\n"
-		"	.set	pop				\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-	} while (unlikely(!temp));
+	__bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
 }
=20
 /*
@@ -119,55 +119,20 @@ static inline void clear_bit(unsigned long nr, volati=
le unsigned long *addr)
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long temp;
=20
 	if (!kernel_uses_llsc) {
 		__mips_clear_bit(nr, addr);
 		return;
 	}
=20
-	if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL "%0, %1			# clear_bit	\n"
-		"	and	%0, %2					\n"
-		"	" __SC "%0, %1					\n"
-		"	beqzl	%0, 1b					\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(BIT(bit)))
-		: __LLSC_CLOBBER);
-		return;
-	}
-
 	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit)) {
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	" __LL "%0, %1		# clear_bit	\n"
-			"	" __INS "%0, $0, %2, 1			\n"
-			"	" __SC "%0, %1				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "i" (bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
+		__bit_op(*m, __INS "%0, $0, %2, 1", "i"(bit));
 		return;
 	}
=20
 	loongson_llsc_mb();
-	do {
-		__asm__ __volatile__(
-		"	.set	push				\n"
-		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1		# clear_bit	\n"
-		"	and	%0, %2				\n"
-		"	" __SC "%0, %1				\n"
-		"	.set	pop				\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(BIT(bit)))
-		: __LLSC_CLOBBER);
-	} while (unlikely(!temp));
+	__bit_op(*m, "and\t%0, %2", "ir"(~BIT(bit)));
 }
=20
 /*
@@ -197,41 +162,14 @@ static inline void change_bit(unsigned long nr, volat=
ile unsigned long *addr)
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long temp;
=20
 	if (!kernel_uses_llsc) {
 		__mips_change_bit(nr, addr);
 		return;
 	}
=20
-	if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push				\n"
-		"	.set	arch=3Dr4000			\n"
-		"1:	" __LL "%0, %1		# change_bit	\n"
-		"	xor	%0, %2				\n"
-		"	" __SC	"%0, %1				\n"
-		"	beqzl	%0, 1b				\n"
-		"	.set	pop				\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-		return;
-	}
-
 	loongson_llsc_mb();
-	do {
-		__asm__ __volatile__(
-		"	.set	push				\n"
-		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-		"	" __LL "%0, %1		# change_bit	\n"
-		"	xor	%0, %2				\n"
-		"	" __SC	"%0, %1				\n"
-		"	.set	pop				\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-	} while (unlikely(!temp));
+	__bit_op(*m, "xor\t%0, %2", "ir"(BIT(bit)));
 }
=20
 /*
@@ -247,41 +185,16 @@ static inline int test_and_set_bit_lock(unsigned long=
 nr,
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res, temp;
+	unsigned long res, orig;
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_set_bit_lock(nr, addr);
-	} else if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL "%0, %1		# test_and_set_bit	\n"
-		"	or	%2, %0, %3				\n"
-		"	" __SC	"%2, %1					\n"
-		"	beqzl	%2, 1b					\n"
-		"	and	%2, %0, %3				\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-
-		res =3D res !=3D 0;
 	} else {
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1	# test_and_set_bit	\n"
-			"	or	%2, %0, %3			\n"
-			"	" __SC	"%2, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (BIT(bit))
-			: __LLSC_CLOBBER);
-		} while (unlikely(!res));
-
-		res =3D (temp & BIT(bit)) !=3D 0;
+		orig =3D __test_bit_op(*m, "%0",
+				     "or\t%1, %0, %3",
+				     "ir"(BIT(bit)));
+		res =3D (orig & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
@@ -317,57 +230,25 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res, temp;
+	unsigned long res, orig;
=20
 	smp_mb__before_llsc();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_clear_bit(nr, addr);
-	} else if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL	"%0, %1		# test_and_clear_bit	\n"
-		"	or	%2, %0, %3				\n"
-		"	xor	%2, %3					\n"
-		"	" __SC	"%2, %1					\n"
-		"	beqzl	%2, 1b					\n"
-		"	and	%2, %0, %3				\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-
-		res =3D res !=3D 0;
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
-			"	" __EXT "%2, %0, %3, 1			\n"
-			"	" __INS "%0, $0, %3, 1			\n"
-			"	" __SC	"%0, %1				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "i" (bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!temp));
+		res =3D __test_bit_op(*m, "%1",
+				    __EXT "%0, %1, %3, 1;"
+				    __INS "%1, $0, %3, 1",
+				    "i"(bit));
 	} else {
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL	"%0, %1 # test_and_clear_bit	\n"
-			"	or	%2, %0, %3			\n"
-			"	xor	%2, %3				\n"
-			"	" __SC	"%2, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (BIT(bit))
-			: __LLSC_CLOBBER);
-		} while (unlikely(!res));
-
-		res =3D (temp & BIT(bit)) !=3D 0;
+		orig =3D __test_bit_op(*m, "%0",
+				     "or\t%1, %0, %3;"
+				     "xor\t%1, %1, %3",
+				     "ir"(BIT(bit)));
+		res =3D (orig & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
@@ -388,43 +269,18 @@ static inline int test_and_change_bit(unsigned long n=
r,
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
-	unsigned long res, temp;
+	unsigned long res, orig;
=20
 	smp_mb__before_llsc();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_change_bit(nr, addr);
-	} else if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL	"%0, %1		# test_and_change_bit	\n"
-		"	xor	%2, %0, %3				\n"
-		"	" __SC	"%2, %1					\n"
-		"	beqzl	%2, 1b					\n"
-		"	and	%2, %0, %3				\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (BIT(bit))
-		: __LLSC_CLOBBER);
-
-		res =3D res !=3D 0;
 	} else {
 		loongson_llsc_mb();
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL	"%0, %1 # test_and_change_bit	\n"
-			"	xor	%2, %0, %3			\n"
-			"	" __SC	"\t%2, %1			\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (BIT(bit))
-			: __LLSC_CLOBBER);
-		} while (unlikely(!res));
-
-		res =3D (temp & BIT(bit)) !=3D 0;
+		orig =3D __test_bit_op(*m, "%0",
+				     "xor\t%1, %0, %3",
+				     "ir"(BIT(bit)));
+		res =3D (orig & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
@@ -432,6 +288,9 @@ static inline int test_and_change_bit(unsigned long nr,
 	return res;
 }
=20
+#undef __bit_op
+#undef __test_bit_op
+
 #include <asm-generic/bitops/non-atomic.h>
=20
 /*
--=20
2.23.0

