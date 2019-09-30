Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BE8C2A78
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732676AbfI3XIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:54 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732664AbfI3XIy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMOXENCh6Qnf1QhHczZLMnGgD+ygIGu4v3dq3qT6NnkGo3zM1NNGOKGk/gQLaG05ZKhqhwiJFqmtj1hk6Svpk2EaimvQ+jHGF4ktI7rSYrO+JFGA8TLq2BmlRAmbcIg4OpCC56IAf7pgspnzO4arrBpUPIj6mkeD8BMa5ri1Vn/UVsCY/Yy2xE32Tf69sIvH0wIv3Ne7gqHuVGDlGRdIaEwCFeI515XBpgMTCFGAD5vVLfb626WvbjpXv2y4nqHWWPyPvetV1+we3dTShnwnAQphTeigXsRdfQ2PgMa/y08osi+s8wAMmeKl312ev+0w9rTDchoov+IgHzbfc3a3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak6sjpxGyC8CbsbIm1/cUuebkaYx7A1pT8ibGpVE7uU=;
 b=SyPhHUpm7iJbVydeFLHwl45J0BvAXGVk3Z+nA52i5D5rZ8Z5o7YOAdaerlXWM4gZtHHrq1rA/lnSIs+MgXh0OZPwWJf1A16COg9z673IqiK4Smqq8pyagxzOfIXoL7Cpk2L7R2USyLJRvv2GBTD4IBYBhFpvjG2HjIlNWqQzd7VxY8BJqpoJgS6vXYYQ2GXacGHqF7KZZ9AEvMzd2jVuRc0bus4jn6WxuCRjKqFRFPw+Xaea2+6+uizLfKSAgZHfwxksP7/64qQtdd/2n1cIa9T+l5FYEzn3dXaC4lpicJERw6Zu7Q6L4w3VhFhvbAgnc588vSYJJ7cFM0jbp/4TvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak6sjpxGyC8CbsbIm1/cUuebkaYx7A1pT8ibGpVE7uU=;
 b=JJbbvJrQkpdHmFc2SOQw6T6PJvCsl/kuZSFKOiZ8J2E9zMZMqhDy/CchxthhEInYGich04V7/X6h4JEDNtLpN9HI9jIY33Ucd09TncdeVRuE+CJkryIiL8VBmgwKGK88MJ/pAC9uNSoivrBFR8pJzKw/9vtCLJjRVpXN90ytbGs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 25/37] MIPS: bitops: Abstract LL/SC loops
Thread-Topic: [PATCH 25/37] MIPS: bitops: Abstract LL/SC loops
Thread-Index: AQHVd+P8NJwoT+um5EOQRUe4f/jQIw==
Date:   Mon, 30 Sep 2019 23:08:36 +0000
Message-ID: <20190930230806.2940505-26-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: d0f649e1-e92b-4f71-1a77-08d745fb1f47
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022991BD0AF34A10A63EC39C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wym9qoA4ReEjcWGoJFCiZC4P/VpLFP/t6bTJiqX262km2FQWhYjoCF1R0yNbnsc9M05ydw4OxjHI33LTB7vkVKKlD2ZI9b7eUd/Ngv6b90UxXhbMKjcKRKXqvHMC6IPabBSp+EJcAEi8D7LkZ/Kx/TWqVyj9/hDUuxkdYXL9sXOTl8UBc2nznqgYs7ByH6DU4qW1xspiutNn+Zv/c80Iow+WQlkFQGUMFeavb4umrCxsWegnnokdi8uB94T8975Spwh04zI7iX8DDzvbsB8lNQFvcGTrzK3mV5MsFVhIPlEjQDmQoTPMAPLqrB+wbgG+2s5uEUz2MmdAArdIWXpfFkLRI4URewECqMp1goIo1Zl+7/UcLDLb3jrfXW3UYfOdpiclC3w5bR0MYRROXy6UqKHHCWJBOcgJq/vQ7qOe8VA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f649e1-e92b-4f71-1a77-08d745fb1f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:36.1785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fx31rtvENW4/R2oL2X11xjj3fU2YgprUY6mG6vvsRpG0pPJCqeDrbqYkK3Vhw35T4x9H6JG2XXwDZauJzrBuzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 267 ++++++++-------------------------
 1 file changed, 63 insertions(+), 204 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 3e5589320e83..5701f8b41e87 100644
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

