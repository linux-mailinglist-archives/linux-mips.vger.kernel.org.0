Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C9FC433B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfJAVxZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:25 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728085AbfJAVxW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0DoO3aqfI3qnBGW6jVYRjRuRWPFnY7L3RK6COyntOjlVT4kX4iycgoE6CXh+9kliTFcfuKUQzKR+wsqRiBRErQRlqJ5NBupiYrNurXOYrsOMbHJLQU+c3Jjo/3FtoIoBxAVlI2DqDOY8XaK5lOL5MUfVZKbYTNbJb6KiQpr23AzbIKZZdUZe0GD4a+57LjeAoVlCtAxkCJYejzqSQQw/eH+G6xMOS6isq8aPm4qIuFmMqcVjqaA30jrNcWjEjCfFenvu5rwxp5TDfEWqVMYhbBXrq7mL713P0+P5DUqA6M+qRgYA+q4mNx6ajpF9bQ/EsIbNTGaXs9ecUT9ZxKdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3so5Qt3Lo3QN1t8xjuC8bWCMsfm5kOHTcsNrsjDRuaE=;
 b=dUOyj32QTJ/Bu4Ez5ETRHQizTzXipwTJQUH/xi2wQ/1XwNZbHhcBl4QZtZ+3pPvVIAGIjWxrmdrDzC3KC4jkTzgYEBYyEIKG7r1j1OnqXDgIGfuCLITKs0FkxLQh2B4g9Nl53pVYpZjIzRP9cRnVAVbSCwC1nJnwXVw6RdQAMV+OU7U+bbdVcNctLwew+rX1MPuqSyAt2ZtKxGiGgzn53rhUDMNa8OPOogNXLHwgi9rJVyFzbK+xHsb3kRNsytt3lk+QCQie1n17GG9/4NK1y1J03xVOC92bG0UdcNRQ6MQczl1e0BpJ8EZOD50dozofl6Vl6ZHl8++BRYOoWQVZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3so5Qt3Lo3QN1t8xjuC8bWCMsfm5kOHTcsNrsjDRuaE=;
 b=ieMwNRpcgb/LAleG5e07BhBsL0bmbckmgs874hBXbIA76d2FxQuKBtJJc7tM8pFwrHghCcd8oYZ6jvN8Y6F+eq6/pVwK1jitA5cURxDKw521tR/54Ysw9m7O+dG15tgjZG4z0HR774vDFcJu7Bz9vNXYA5IDX382316ed3Qmys0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:18 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:18 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 11/36] MIPS: atomic: Use one macro to generate 32b & 64b
 functions
Thread-Topic: [PATCH v2 11/36] MIPS: atomic: Use one macro to generate 32b &
 64b functions
Thread-Index: AQHVeKKirPSs9DL0w0uLssz8WQ7moQ==
Date:   Tue, 1 Oct 2019 21:53:18 +0000
Message-ID: <20191001215249.4157062-12-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 572cc263-79bf-40c5-add9-08d746b9c4f2
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14393EF1A61EDE0CC4F3CB8BC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YiQrRRWydu3omWQFlxwJgMIn2nOkNS9odaPON+YiZR6TWeOQlXuV2YPWm0AhTWa+9hwF/PEqCzUwBBNHKBu6Tn/WACvlRxBFF51f167vKno4G5F+h7PAX9f2hrdi7xFuq9uh7bHNsLWzSQEhkzzfS96JNUG6FgWcgzBpFouBJV8qZ9iuRXtXeaZU7hWwQH3It+Nfkha/BVlAJGzoBImVuzQxzGHmHWFF5h0tIi7Vr5sOEnDyEHsTO/HlfwgDsjmjShwP1KRWrkZ7p5HAjMuUQdRoOz5OgGfDvF8cc6HBj5G/OHfupUEa8vIuxr62klC4bk1fb8xKy4CMRBb95sxNfJPxPzi0RQvkdyT7vguewluBphTf68mjf5ys60VEDK78PhNF4Acj0kS7z5xv1ll+4+kcDnDainOFRYFIYzXvrhA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572cc263-79bf-40c5-add9-08d746b9c4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:18.6565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPsZgScZZm/KXR0Psx9FdSVYSNHQibwqgGmi9FQYwGaAJ53G4LQ696Gp5vcwK5StMhYXCSfqKyGRG+X/LkzP8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cut down on duplication by generalizing the ATOMIC_OP(),
ATOMIC_OP_RETURN() & ATOMIC_FETCH_OP() macros to work for both 32b &
64b atomics, and removing the ATOMIC64_ variants. This ensures
consistency between our atomic_* & atomic64_* functions.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/atomic.h | 196 ++++++++-------------------------
 1 file changed, 45 insertions(+), 151 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index ace2ea005588..b834af5a7382 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -42,10 +42,10 @@
  */
 #define atomic_set(v, i)	WRITE_ONCE((v)->counter, (i))
=20
-#define ATOMIC_OP(op, c_op, asm_op)					\
-static __inline__ void atomic_##op(int i, atomic_t * v)			\
+#define ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
+static __inline__ void pfx##_##op(type i, pfx##_t * v)			\
 {									\
-	int temp;							\
+	type temp;							\
 									\
 	if (!kernel_uses_llsc) {					\
 		unsigned long flags;					\
@@ -60,19 +60,19 @@ static __inline__ void atomic_##op(int i, atomic_t * v)=
			\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
-	"1:	ll	%0, %1		# atomic_" #op "	\n"	\
+	"1:	" #ll "	%0, %1		# " #pfx "_" #op "	\n"	\
 	"	" #asm_op " %0, %2				\n"	\
-	"	sc	%0, %1					\n"	\
+	"	" #sc "	%0, %1					\n"	\
 	"\t" __SC_BEQZ "%0, 1b					\n"	\
 	"	.set	pop					\n"	\
 	: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)		\
 	: "Ir" (i) : __LLSC_CLOBBER);					\
 }
=20
-#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
-static __inline__ int atomic_##op##_return_relaxed(int i, atomic_t * v)	\
+#define ATOMIC_OP_RETURN(pfx, op, type, c_op, asm_op, ll, sc)		\
+static __inline__ type pfx##_##op##_return_relaxed(type i, pfx##_t * v)	\
 {									\
-	int temp, result;						\
+	type temp, result;						\
 									\
 	if (!kernel_uses_llsc) {					\
 		unsigned long flags;					\
@@ -89,9 +89,9 @@ static __inline__ int atomic_##op##_return_relaxed(int i,=
 atomic_t * v)	\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
-	"1:	ll	%1, %2		# atomic_" #op "_return	\n"	\
+	"1:	" #ll "	%1, %2		# " #pfx "_" #op "_return\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
-	"	sc	%0, %2					\n"	\
+	"	" #sc "	%0, %2					\n"	\
 	"\t" __SC_BEQZ "%0, 1b					\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	.set	pop					\n"	\
@@ -102,8 +102,8 @@ static __inline__ int atomic_##op##_return_relaxed(int =
i, atomic_t * v)	\
 	return result;							\
 }
=20
-#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
-static __inline__ int atomic_fetch_##op##_relaxed(int i, atomic_t * v)	\
+#define ATOMIC_FETCH_OP(pfx, op, type, c_op, asm_op, ll, sc)		\
+static __inline__ type pfx##_fetch_##op##_relaxed(type i, pfx##_t * v)	\
 {									\
 	int temp, result;						\
 									\
@@ -120,10 +120,10 @@ static __inline__ int atomic_fetch_##op##_relaxed(int=
 i, atomic_t * v)	\
 	loongson_llsc_mb();						\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
-	"	.set	"MIPS_ISA_LEVEL"			\n"	\
-	"1:	ll	%1, %2		# atomic_fetch_" #op "	\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"1:	" #ll "	%1, %2		# " #pfx "_fetch_" #op "\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
-	"	sc	%0, %2					\n"	\
+	"	" #sc "	%0, %2					\n"	\
 	"\t" __SC_BEQZ "%0, 1b					\n"	\
 	"	.set	pop					\n"	\
 	"	move	%0, %1					\n"	\
@@ -134,32 +134,50 @@ static __inline__ int atomic_fetch_##op##_relaxed(int=
 i, atomic_t * v)	\
 	return result;							\
 }
=20
-#define ATOMIC_OPS(op, c_op, asm_op)					\
-	ATOMIC_OP(op, c_op, asm_op)					\
-	ATOMIC_OP_RETURN(op, c_op, asm_op)				\
-	ATOMIC_FETCH_OP(op, c_op, asm_op)
+#define ATOMIC_OPS(pfx, op, type, c_op, asm_op, ll, sc)			\
+	ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
+	ATOMIC_OP_RETURN(pfx, op, type, c_op, asm_op, ll, sc)		\
+	ATOMIC_FETCH_OP(pfx, op, type, c_op, asm_op, ll, sc)
=20
-ATOMIC_OPS(add, +=3D, addu)
-ATOMIC_OPS(sub, -=3D, subu)
+ATOMIC_OPS(atomic, add, int, +=3D, addu, ll, sc)
+ATOMIC_OPS(atomic, sub, int, -=3D, subu, ll, sc)
=20
 #define atomic_add_return_relaxed	atomic_add_return_relaxed
 #define atomic_sub_return_relaxed	atomic_sub_return_relaxed
 #define atomic_fetch_add_relaxed	atomic_fetch_add_relaxed
 #define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
=20
+#ifdef CONFIG_64BIT
+ATOMIC_OPS(atomic64, add, s64, +=3D, daddu, lld, scd)
+ATOMIC_OPS(atomic64, sub, s64, -=3D, dsubu, lld, scd)
+# define atomic64_add_return_relaxed	atomic64_add_return_relaxed
+# define atomic64_sub_return_relaxed	atomic64_sub_return_relaxed
+# define atomic64_fetch_add_relaxed	atomic64_fetch_add_relaxed
+# define atomic64_fetch_sub_relaxed	atomic64_fetch_sub_relaxed
+#endif /* CONFIG_64BIT */
+
 #undef ATOMIC_OPS
-#define ATOMIC_OPS(op, c_op, asm_op)					\
-	ATOMIC_OP(op, c_op, asm_op)					\
-	ATOMIC_FETCH_OP(op, c_op, asm_op)
+#define ATOMIC_OPS(pfx, op, type, c_op, asm_op, ll, sc)			\
+	ATOMIC_OP(pfx, op, type, c_op, asm_op, ll, sc)			\
+	ATOMIC_FETCH_OP(pfx, op, type, c_op, asm_op, ll, sc)
=20
-ATOMIC_OPS(and, &=3D, and)
-ATOMIC_OPS(or, |=3D, or)
-ATOMIC_OPS(xor, ^=3D, xor)
+ATOMIC_OPS(atomic, and, int, &=3D, and, ll, sc)
+ATOMIC_OPS(atomic, or, int, |=3D, or, ll, sc)
+ATOMIC_OPS(atomic, xor, int, ^=3D, xor, ll, sc)
=20
 #define atomic_fetch_and_relaxed	atomic_fetch_and_relaxed
 #define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
 #define atomic_fetch_xor_relaxed	atomic_fetch_xor_relaxed
=20
+#ifdef CONFIG_64BIT
+ATOMIC_OPS(atomic64, and, s64, &=3D, and, lld, scd)
+ATOMIC_OPS(atomic64, or, s64, |=3D, or, lld, scd)
+ATOMIC_OPS(atomic64, xor, s64, ^=3D, xor, lld, scd)
+# define atomic64_fetch_and_relaxed	atomic64_fetch_and_relaxed
+# define atomic64_fetch_or_relaxed	atomic64_fetch_or_relaxed
+# define atomic64_fetch_xor_relaxed	atomic64_fetch_xor_relaxed
+#endif
+
 #undef ATOMIC_OPS
 #undef ATOMIC_FETCH_OP
 #undef ATOMIC_OP_RETURN
@@ -243,130 +261,6 @@ static __inline__ int atomic_sub_if_positive(int i, a=
tomic_t * v)
  */
 #define atomic64_set(v, i)	WRITE_ONCE((v)->counter, (i))
=20
-#define ATOMIC64_OP(op, c_op, asm_op)					      \
-static __inline__ void atomic64_##op(s64 i, atomic64_t * v)		      \
-{									      \
-	if (kernel_uses_llsc) {						      \
-		s64 temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	lld	%0, %1		# atomic64_" #op "	\n"   \
-		"	" #asm_op " %0, %2				\n"   \
-		"	scd	%0, %1					\n"   \
-		"\t" __SC_BEQZ "%0, 1b					\n"   \
-		"	.set	pop					\n"   \
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	      \
-		: "Ir" (i) : __LLSC_CLOBBER);				      \
-	} else {							      \
-		unsigned long flags;					      \
-									      \
-		raw_local_irq_save(flags);				      \
-		v->counter c_op i;					      \
-		raw_local_irq_restore(flags);				      \
-	}								      \
-}
-
-#define ATOMIC64_OP_RETURN(op, c_op, asm_op)				      \
-static __inline__ s64 atomic64_##op##_return_relaxed(s64 i, atomic64_t * v=
)   \
-{									      \
-	s64 result;							      \
-									      \
-	if (kernel_uses_llsc) {						      \
-		s64 temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	lld	%1, %2		# atomic64_" #op "_return\n"  \
-		"	" #asm_op " %0, %1, %3				\n"   \
-		"	scd	%0, %2					\n"   \
-		"\t" __SC_BEQZ "%0, 1b					\n"   \
-		"	" #asm_op " %0, %1, %3				\n"   \
-		"	.set	pop					\n"   \
-		: "=3D&r" (result), "=3D&r" (temp),				      \
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)			      \
-		: "Ir" (i) : __LLSC_CLOBBER);				      \
-	} else {							      \
-		unsigned long flags;					      \
-									      \
-		raw_local_irq_save(flags);				      \
-		result =3D v->counter;					      \
-		result c_op i;						      \
-		v->counter =3D result;					      \
-		raw_local_irq_restore(flags);				      \
-	}								      \
-									      \
-	return result;							      \
-}
-
-#define ATOMIC64_FETCH_OP(op, c_op, asm_op)				      \
-static __inline__ s64 atomic64_fetch_##op##_relaxed(s64 i, atomic64_t * v)=
    \
-{									      \
-	s64 result;							      \
-									      \
-	if (kernel_uses_llsc) {						      \
-		s64 temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	lld	%1, %2		# atomic64_fetch_" #op "\n"   \
-		"	" #asm_op " %0, %1, %3				\n"   \
-		"	scd	%0, %2					\n"   \
-		"\t" __SC_BEQZ "%0, 1b					\n"   \
-		"	move	%0, %1					\n"   \
-		"	.set	pop					\n"   \
-		: "=3D&r" (result), "=3D&r" (temp),				      \
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)			      \
-		: "Ir" (i) : __LLSC_CLOBBER);				      \
-	} else {							      \
-		unsigned long flags;					      \
-									      \
-		raw_local_irq_save(flags);				      \
-		result =3D v->counter;					      \
-		v->counter c_op i;					      \
-		raw_local_irq_restore(flags);				      \
-	}								      \
-									      \
-	return result;							      \
-}
-
-#define ATOMIC64_OPS(op, c_op, asm_op)					      \
-	ATOMIC64_OP(op, c_op, asm_op)					      \
-	ATOMIC64_OP_RETURN(op, c_op, asm_op)				      \
-	ATOMIC64_FETCH_OP(op, c_op, asm_op)
-
-ATOMIC64_OPS(add, +=3D, daddu)
-ATOMIC64_OPS(sub, -=3D, dsubu)
-
-#define atomic64_add_return_relaxed	atomic64_add_return_relaxed
-#define atomic64_sub_return_relaxed	atomic64_sub_return_relaxed
-#define atomic64_fetch_add_relaxed	atomic64_fetch_add_relaxed
-#define atomic64_fetch_sub_relaxed	atomic64_fetch_sub_relaxed
-
-#undef ATOMIC64_OPS
-#define ATOMIC64_OPS(op, c_op, asm_op)					      \
-	ATOMIC64_OP(op, c_op, asm_op)					      \
-	ATOMIC64_FETCH_OP(op, c_op, asm_op)
-
-ATOMIC64_OPS(and, &=3D, and)
-ATOMIC64_OPS(or, |=3D, or)
-ATOMIC64_OPS(xor, ^=3D, xor)
-
-#define atomic64_fetch_and_relaxed	atomic64_fetch_and_relaxed
-#define atomic64_fetch_or_relaxed	atomic64_fetch_or_relaxed
-#define atomic64_fetch_xor_relaxed	atomic64_fetch_xor_relaxed
-
-#undef ATOMIC64_OPS
-#undef ATOMIC64_FETCH_OP
-#undef ATOMIC64_OP_RETURN
-#undef ATOMIC64_OP
-
 /*
  * atomic64_sub_if_positive - conditionally subtract integer from atomic
  *                            variable
--=20
2.23.0

