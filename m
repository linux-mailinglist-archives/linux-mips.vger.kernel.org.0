Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC092C2A72
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbfI3XIf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:35 -0400
Received: from mail-eopbgr690120.outbound.protection.outlook.com ([40.107.69.120]:5486
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732492AbfI3XIe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnQ9MKdUyNnUOwQsbSxUzsE41Xb9finS+jLuXmgn36SlQ/cYu+/gA8X89T1TCFSzTwHR2s50o/MvGHgTgB/OiwjpSyHx11srtVDYy+L0/q0cjNxIBUCu6WBUn0Hx40ftt4qN5GG8WSimIoByNpaL9YBhdnqUOeYLA+xbyUl+GRzvuMFG//dYI0VHc7jNkzsRHLOrgeDhbPF/z5o0ipu6RLNiPn3ONKYKJnv5qOPxjsSLp37aU84c9MMDacQkKKp+A5/cVo5s/ZPcxBjbZYKGCJu1JUVt8DlfOn20H+aMIRmL2pE4kJTFzr7GbYgSfzXOc68xLJyfiyc4XYQhoCxblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtFUuxNtGyKgTm8sYtvx7wErdP2YS57JTXaHkESRX2w=;
 b=RDLHBOyD5jT3y4cRoC9Y5+g+n29nHJR3U+jTrS276QPH/zoQ8b/M6vzRCTn6bnNd/jz0+W8u7AoP5S+3JSWkxYCbp8CaZhY9iUhescR0pNxzzgXNn/1UfgyJlS5/M57YpNZ9tYAdJSW2UwINZEXit/oWrjiKqtwOxjkAYuRHqDGkQ8O8Q/b8VfuZ12YbtjiW6hx+zEY3yLBkF8e6eWK9iFd5YL8ToBsiT2+ypXaFreqywrgrR3bnmbvHqqaMGn+1wEfh3H7H474+/eb1i39eI/nSQASEZqf0ZNTAwXjrr/q0sOet8syK5Gcw1eQW7/lJH3eZDFB4RW5EsxcrP8tM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtFUuxNtGyKgTm8sYtvx7wErdP2YS57JTXaHkESRX2w=;
 b=qaNMvq7xuf2Whg5bnVecwARjydnUsiwefxo0QPJa+iPZqTVSaBgufi4a0UpdjghRULM5T8pV0uPzCG0yigjE42t41/DAWmzkQiNXBRvvVfv0M1qv5J551scNwblq/13dnpKmQzh2FHC/iu2XDCC5JAc98zP3T9aGQTc/OUepx2o=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 11/37] MIPS: atomic: Use one macro to generate 32b & 64b
 functions
Thread-Topic: [PATCH 11/37] MIPS: atomic: Use one macro to generate 32b & 64b
 functions
Thread-Index: AQHVd+P1wlbGJw6/50+AxU3guQTeDA==
Date:   Mon, 30 Sep 2019 23:08:23 +0000
Message-ID: <20190930230806.2940505-12-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 6bd73448-4a2a-4f47-2968-08d745fb180a
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10221AA33F4064F568427B42C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xA6VK9OpHOgV/U1Nuf9S5oINtEhOkSVur1g6VoYseZGSex9kSSACcc3KixqxTL3Nt1afEpb8slCcQNQ8GDYRfbgo66hX9iZgubBZ4WGVlEdIYe+5PBiX4dmVWT4UMwXMEPBmbdJznvTCIAvFWUh2xY5W6ja2ncfk/5sDVbPuztBC6IH5qB1B7i3s2FAj5I7pDSOYmuogxBx9QRDyVeSV2cxJJBkPlQatf6iW252l2tN0LRTVU6BsFE07N2WYRPTbVEfYahjF1OKLjmBZINN3//x0MR17of6RuD3c7d9aY0QzhAAcCfrXSZ5qrNxFlFsyvmkHn7U8p0Ii94gaY4u6T0v48+kWACsG4idlC7c9wqiFQUe6njxldi5Q3qjNZHawKm11gSEs0+GzZOi1WRKOenirUDUwVHqSAg+4Q7YWIQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd73448-4a2a-4f47-2968-08d745fb180a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:24.0220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7A30GShd4fj9rMMqQVYa83zufXwqJp/HL4h5GmLnZ6qMnz/Qf8ySRG6LbtvMeGjzLQIIrVD0LA4G1fqlQOwWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

