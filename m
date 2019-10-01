Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80CE5C4307
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfJAVx2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:28 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728107AbfJAVx2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpwfJgj3xZubnIgtc1o/99v2211BulRrSGkD3Kj+DMhGUSTAEYvBsO+ziliM3Dm/c/2fOeWd8qkuGw6qX5RSAJY821OlGooPxtOl+SiU6xZFI3lDsEletAOmNrQVVMJWCTvordWxvjI8+rYBLifQ767kIRMuK22e5kK3+rwDYP0RtzjONBa/VfQiFJomqDlRamByZXhAvVBEeTlCw0b6jXPhlpHw2EMUYEmcFK/+a1PH5AWHW0WzkxjknsNiqrx9tfZpHdMJyZXLGX16xVb4qVunqzBi5eotKeRB+cmE5gCQGChiuGQJjIhGzMWsX80/uDgkQgF+JarBIlElzKvWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oIdoh72+TuqYxw0e6v85QgBl6Han8Vh4G1I/SBvwDg=;
 b=lg441+636AFT+PKtOkKacyvJ3HLQqjNhHMkbHBa9uy/6d/mdzj+k73obmhRohc1fcufQVVS9oZ8QU+hivF3ZZUc5v0yO7dkWnCy+skjkUeDkvgfcRtZIw/EuZt944DSTIMHjZyhSNOSCXsgBKWm+PUQUNgQBn8sXt6qcLPjo9+vUVEqSZtlv1EMqDHaZ+fo3PAT9LLZWWJdw5CRH+05snVnN2zD8cwFfNsGL04n3JvEVACLjEDbvjO1ZZV7kx3jsVu9TLzUxal4w9ikRSqJMMz91isdjhFwUA6SGrOZsvJieCrWEAg8X09k2VtlcsTnDlvJFJWeHK9sCv2AlrqNfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oIdoh72+TuqYxw0e6v85QgBl6Han8Vh4G1I/SBvwDg=;
 b=anQiEHWkG+Cm5rT9cscMPbXU8wTgk5VLGYL1vGqSXj7YZ6Pcw+vs26Bcp0VOavZD+Ewk4Iqpid8+6rSIIY5ULyLhMACi1xq9We8x0lFB/qpv8tTtenyhRajcF/k94cMbiwm6djgiPsf+Bj9O8qvI7mCaQUSw+WxJNamH19LoMrI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 14/36] MIPS: atomic: Unify 32b & 64b sub_if_positive
Thread-Topic: [PATCH v2 14/36] MIPS: atomic: Unify 32b & 64b sub_if_positive
Thread-Index: AQHVeKKlEcpsFkxrr0SAHmIRa77Nfg==
Date:   Tue, 1 Oct 2019 21:53:23 +0000
Message-ID: <20191001215249.4157062-15-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: d8603796-3fe2-4034-1765-08d746b9c7a9
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439F905F5160AF025C35440C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VhFf1wWa3ekmr4zjGTkOJlAZMP9X9gL0/PYJOaLIlj/guMtEQQsh/nE73A41UGx7VHeear45kecdCduwErrgG1LGxzmDYahy+9DPKhtdibjqPPg6E8522O8v8lsAdTVeCKlbDrq0wHCFUqbUlxuZls9nr7o970DNzwYOX9uDOjstVfG1/upiD6qhvGh3bgll1iMEQF06Oo+c5dTY3Ly3xRXpdRRGh2XGkpQHSWDhfbHLVEUC8LKOM+Gu0wWjExsiyFcZAKEPJJfGgN8J6nNFHSJ9a8vP0gSmVu06OFR98IC6tO7klIbRo/meRbp6oKmTikeAz3m/QiJrBXsmUZ5301PLFOmUUeZ5byMqcwDUpvOoZX6c2EqStOoCd5hD2hrPnCDHzJqhcBHzarlurZOfR5Jg1Ei16744eoIz5wJVXMo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8603796-3fe2-4034-1765-08d746b9c7a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:23.1914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hS7P8MaCWkY9yvjZxPV9VIzNQkTK0zmaKDN20f3pTS0E49PAxvx/O6+y2VtC/O2Ias0kwFQkSzZKjQo2fczQwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unify the definitions of atomic_sub_if_positive() &
atomic64_sub_if_positive() using a macro like we do for most other
atomic functions. This allows us to share the implementation ensuring
consistency between the two. Notably this provides the appropriate
loongson3_war barriers in the atomic64_sub_if_positive() case which were
previously missing.

The code is rearranged a little to handle the !kernel_uses_llsc case
first in order to de-indent the LL/SC case & allow us not to go over 80
characters per line.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/atomic.h | 164 ++++++++++++---------------------
 1 file changed, 58 insertions(+), 106 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 24443ef29337..96ef50fa2817 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -192,65 +192,71 @@ ATOMIC_OPS(atomic64, xor, s64, ^=3D, xor, lld, scd)
  * Atomically test @v and subtract @i if @v is greater or equal than @i.
  * The function returns the old value of @v minus @i.
  */
-static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
-{
-	int result;
-
-	smp_mb__before_atomic();
-
-	if (kernel_uses_llsc) {
-		int temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	" __SYNC(full, loongson3_war) "			\n"
-		"1:	ll	%1, %2		# atomic_sub_if_positive\n"
-		"	.set	pop					\n"
-		"	subu	%0, %1, %3				\n"
-		"	move	%1, %0					\n"
-		"	bltz	%0, 2f					\n"
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	sc	%1, %2					\n"
-		"\t" __SC_BEQZ "%1, 1b					\n"
-		"2:	" __SYNC(full, loongson3_war) "			\n"
-		"	.set	pop					\n"
-		: "=3D&r" (result), "=3D&r" (temp),
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)
-		: "Ir" (i) : __LLSC_CLOBBER);
-	} else {
-		unsigned long flags;
+#define ATOMIC_SIP_OP(pfx, type, op, ll, sc)				\
+static __inline__ int pfx##_sub_if_positive(type i, pfx##_t * v)	\
+{									\
+	type temp, result;						\
+									\
+	smp_mb__before_atomic();					\
+									\
+	if (!kernel_uses_llsc) {					\
+		unsigned long flags;					\
+									\
+		raw_local_irq_save(flags);				\
+		result =3D v->counter;					\
+		result -=3D i;						\
+		if (result >=3D 0)					\
+			v->counter =3D result;				\
+		raw_local_irq_restore(flags);				\
+		smp_mb__after_atomic();					\
+		return result;						\
+	}								\
+									\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" __SYNC(full, loongson3_war) "			\n"	\
+	"1:	" #ll "	%1, %2		# atomic_sub_if_positive\n"	\
+	"	.set	pop					\n"	\
+	"	" #op "	%0, %1, %3				\n"	\
+	"	move	%1, %0					\n"	\
+	"	bltz	%0, 2f					\n"	\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" #sc "	%1, %2					\n"	\
+	"	" __SC_BEQZ "%1, 1b				\n"	\
+	"2:	" __SYNC(full, loongson3_war) "			\n"	\
+	"	.set	pop					\n"	\
+	: "=3D&r" (result), "=3D&r" (temp),					\
+	  "+" GCC_OFF_SMALL_ASM() (v->counter)				\
+	: "Ir" (i)							\
+	: __LLSC_CLOBBER);						\
+									\
+	/*								\
+	 * In the Loongson3 workaround case we already have a		\
+	 * completion barrier at 2: above, which is needed due to the	\
+	 * bltz that can branch	to code outside of the LL/SC loop. As	\
+	 * such, we don't need to emit another barrier here.		\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__after_atomic();					\
+									\
+	return result;							\
+}
=20
-		raw_local_irq_save(flags);
-		result =3D v->counter;
-		result -=3D i;
-		if (result >=3D 0)
-			v->counter =3D result;
-		raw_local_irq_restore(flags);
-	}
+ATOMIC_SIP_OP(atomic, int, subu, ll, sc)
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(1, v)
=20
-	/*
-	 * In the Loongson3 workaround case we already have a completion
-	 * barrier at 2: above, which is needed due to the bltz that can branch
-	 * to code outside of the LL/SC loop. As such, we don't need to emit
-	 * another barrier here.
-	 */
-	if (!__SYNC_loongson3_war)
-		smp_mb__after_atomic();
+#ifdef CONFIG_64BIT
+ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
+#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(1, v)
+#endif
=20
-	return result;
-}
+#undef ATOMIC_SIP_OP
=20
 #define atomic_cmpxchg(v, o, n) (cmpxchg(&((v)->counter), (o), (n)))
 #define atomic_xchg(v, new) (xchg(&((v)->counter), (new)))
=20
-/*
- * atomic_dec_if_positive - decrement by 1 if old value positive
- * @v: pointer of type atomic_t
- */
-#define atomic_dec_if_positive(v)	atomic_sub_if_positive(1, v)
-
 #ifdef CONFIG_64BIT
=20
 #define ATOMIC64_INIT(i)    { (i) }
@@ -269,64 +275,10 @@ static __inline__ int atomic_sub_if_positive(int i, a=
tomic_t * v)
  */
 #define atomic64_set(v, i)	WRITE_ONCE((v)->counter, (i))
=20
-/*
- * atomic64_sub_if_positive - conditionally subtract integer from atomic
- *                            variable
- * @i: integer value to subtract
- * @v: pointer of type atomic64_t
- *
- * Atomically test @v and subtract @i if @v is greater or equal than @i.
- * The function returns the old value of @v minus @i.
- */
-static __inline__ s64 atomic64_sub_if_positive(s64 i, atomic64_t * v)
-{
-	s64 result;
-
-	smp_mb__before_llsc();
-
-	if (kernel_uses_llsc) {
-		s64 temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"1:	lld	%1, %2		# atomic64_sub_if_positive\n"
-		"	dsubu	%0, %1, %3				\n"
-		"	move	%1, %0					\n"
-		"	bltz	%0, 1f					\n"
-		"	scd	%1, %2					\n"
-		"\t" __SC_BEQZ "%1, 1b					\n"
-		"1:							\n"
-		"	.set	pop					\n"
-		: "=3D&r" (result), "=3D&r" (temp),
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)
-		: "Ir" (i));
-	} else {
-		unsigned long flags;
-
-		raw_local_irq_save(flags);
-		result =3D v->counter;
-		result -=3D i;
-		if (result >=3D 0)
-			v->counter =3D result;
-		raw_local_irq_restore(flags);
-	}
-
-	smp_llsc_mb();
-
-	return result;
-}
-
 #define atomic64_cmpxchg(v, o, n) \
 	((__typeof__((v)->counter))cmpxchg(&((v)->counter), (o), (n)))
 #define atomic64_xchg(v, new) (xchg(&((v)->counter), (new)))
=20
-/*
- * atomic64_dec_if_positive - decrement by 1 if old value positive
- * @v: pointer of type atomic64_t
- */
-#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(1, v)
-
 #endif /* CONFIG_64BIT */
=20
 #endif /* _ASM_ATOMIC_H */
--=20
2.23.0

