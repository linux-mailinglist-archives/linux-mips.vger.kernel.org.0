Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 062EFC2A6E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732469AbfI3XI2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:28 -0400
Received: from mail-eopbgr820107.outbound.protection.outlook.com ([40.107.82.107]:31072
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732465AbfI3XI1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FApIFlUVwxdoIcNUwAVbdMx4hnH0PmvQMFKxSywQzVLcSzgFKWBmDG8KMiW4ZuVLyL541jr7gUI8EN+Bc6uNfrceoAkQGBCNBiAlkjWVr3PIpj0Ge4qeZ0bR/R8giXDtOJyR+ahSWNN94boUjvIKeeuDwwqTI2MoKSD6Yc1k8H81Pri0h6V9JoHV1D7YDiZEbMCIjwAbMx7t4Obyy/u4pV5zrgPQrUVhvM7VxHLeIraJwh+ORDQOH+bD0xrKFCWg+JWSWh2X4MFog/8Gr5WbIKymEKw1hEuSfiFIZ16V0tK8Fz4Z8dDc/O1ps9XBfGyIzjcigILH4cAImUlpRCGMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmuuw90m6VKvCRrNPGLStO7w4ycAue1K5cdAUukTOvQ=;
 b=Xv4P7EBpAMfEfLiaju9hqSyluJnuV2mUgmNNAvrxOkHgp7kC7aloZY7qB4nYrLNvakk8prbZuhOqH8ncSS5oPRlY6N0crbtPYheiI9UeKETBRnD7dQv02b8eh0sfcMfgjKqaBv+i1UAkCMgglMuWKeR4adTIwY/mRCPiEC024wNpQSwY+0NsK6SWDiFHGgnuIVb/uho+MlUOiagW9X4A77OiYn3iVyRRzhXwEvAW2FLBPpWeWqTVpzcgjenxdLsoPYOH4q8vP3BcnyLtSxlmC/qtoaGC8NGJH2pAirTgEWda8nFCqXdIPqHWiDBxPFkoRzpn1uUZr6YqMZJ90yLu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmuuw90m6VKvCRrNPGLStO7w4ycAue1K5cdAUukTOvQ=;
 b=ipuNaaF+OebEZ34HojGkZOv3azfvpx3D9OwptbtH3IIEz/Asn/7kXCjHs+utMZeDssAHKf1IGuoSyWq/iJPKJplU+fW2s/AAIaM62Gwl26C7B5x1lbSkOiJaQX94CrvEVgi9VZrSUJ7Zx2eOJNFAhuFOvWMQvSh/nwYDLoUdLZs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:22 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 09/37] MIPS: atomic: Fix whitespace in ATOMIC_OP macros
Thread-Topic: [PATCH 09/37] MIPS: atomic: Fix whitespace in ATOMIC_OP macros
Thread-Index: AQHVd+P0L0Ik2goEok+JOiw7Ifofdg==
Date:   Mon, 30 Sep 2019 23:08:22 +0000
Message-ID: <20190930230806.2940505-10-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e8a50c42-6779-41e6-f6ed-08d745fb170e
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022821C6840EC3DB9B781E0C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jm+vXwUtf/vmumtKI2u1MTu1/qJqYFItQMwdvLVd8IysM/RX9JvwwB4mzBDDMbJjwnmPcdGCJ0E9xug+ix/osIKuOV4MlhWhWdBsGg6cYPKBPbSOXY4eSPpXaY6R/Z5NJHF33p4+vmsLL4hp/9QXbhLUKwt2kr4if4txQg4zXlXOeLCr6hqcRBHHhtTZuDwu/pns+G0AhPAfDX/2YI6ftx6ukQfJDo3YbVV60JZEa0G+Odh48aZycyF1wM8gvWVN2CM2Bm88f5jdVDM7E2+OHBYEpvmt44X4aG7SDwVEjKc3nMiAcjBq/DNKtOEgb1NP7o5LEcF4vozTmZ0HcK+JM+pi9WG6NQY8XYJuvSRnXqnB8CctzQAfBWB6Sv0DHT5OYKf3wyVFbHKF/owN+UTLljJZG3VW81rYGmFSrUFoR18=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a50c42-6779-41e6-f6ed-08d745fb170e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:22.3658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrpDh1oE2cOqZKtCzbd82XCHBAiX3mV4P4CWyUVmNb0MaZ8E3PQZrQTZQLIO8DAK7wScsCqs6Hp0OgRNx3TU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We define macros in asm/atomic.h which end each line with space
characters before a backslash to continue on the next line. Remove the
space characters leaving tabs as the whitespace used for conformity with
coding convention.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/atomic.h | 184 ++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 7578c807ef98..2d2a8a74c51b 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -42,102 +42,102 @@
  */
 #define atomic_set(v, i)	WRITE_ONCE((v)->counter, (i))
=20
-#define ATOMIC_OP(op, c_op, asm_op)					      \
-static __inline__ void atomic_##op(int i, atomic_t * v)			      \
-{									      \
-	if (kernel_uses_llsc) {						      \
-		int temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	ll	%0, %1		# atomic_" #op "	\n"   \
-		"	" #asm_op " %0, %2				\n"   \
-		"	sc	%0, %1					\n"   \
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
+#define ATOMIC_OP(op, c_op, asm_op)					\
+static __inline__ void atomic_##op(int i, atomic_t * v)			\
+{									\
+	if (kernel_uses_llsc) {						\
+		int temp;						\
+									\
+		loongson_llsc_mb();					\
+		__asm__ __volatile__(					\
+		"	.set	push				\n"	\
+		"	.set	"MIPS_ISA_LEVEL"		\n"	\
+		"1:	ll	%0, %1	# atomic_" #op "	\n"	\
+		"	" #asm_op " %0, %2			\n"	\
+		"	sc	%0, %1				\n"	\
+		"\t" __SC_BEQZ "%0, 1b				\n"	\
+		"	.set	pop				\n"	\
+		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	\
+		: "Ir" (i) : __LLSC_CLOBBER);				\
+	} else {							\
+		unsigned long flags;					\
+									\
+		raw_local_irq_save(flags);				\
+		v->counter c_op i;					\
+		raw_local_irq_restore(flags);				\
+	}								\
 }
=20
-#define ATOMIC_OP_RETURN(op, c_op, asm_op)				      \
-static __inline__ int atomic_##op##_return_relaxed(int i, atomic_t * v)	  =
    \
-{									      \
-	int result;							      \
-									      \
-	if (kernel_uses_llsc) {						      \
-		int temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	ll	%1, %2		# atomic_" #op "_return	\n"   \
-		"	" #asm_op " %0, %1, %3				\n"   \
-		"	sc	%0, %2					\n"   \
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
+#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+static __inline__ int atomic_##op##_return_relaxed(int i, atomic_t * v)	\
+{									\
+	int result;							\
+									\
+	if (kernel_uses_llsc) {						\
+		int temp;						\
+									\
+		loongson_llsc_mb();					\
+		__asm__ __volatile__(					\
+		"	.set	push				\n"	\
+		"	.set	"MIPS_ISA_LEVEL"		\n"	\
+		"1:	ll	%1, %2	# atomic_" #op "_return	\n"	\
+		"	" #asm_op " %0, %1, %3			\n"	\
+		"	sc	%0, %2				\n"	\
+		"\t" __SC_BEQZ "%0, 1b				\n"	\
+		"	" #asm_op " %0, %1, %3			\n"	\
+		"	.set	pop				\n"	\
+		: "=3D&r" (result), "=3D&r" (temp),				\
+		  "+" GCC_OFF_SMALL_ASM() (v->counter)			\
+		: "Ir" (i) : __LLSC_CLOBBER);				\
+	} else {							\
+		unsigned long flags;					\
+									\
+		raw_local_irq_save(flags);				\
+		result =3D v->counter;					\
+		result c_op i;						\
+		v->counter =3D result;					\
+		raw_local_irq_restore(flags);				\
+	}								\
+									\
+	return result;							\
 }
=20
-#define ATOMIC_FETCH_OP(op, c_op, asm_op)				      \
-static __inline__ int atomic_fetch_##op##_relaxed(int i, atomic_t * v)	   =
   \
-{									      \
-	int result;							      \
-									      \
-	if (kernel_uses_llsc) {						      \
-		int temp;						      \
-									      \
-		loongson_llsc_mb();					      \
-		__asm__ __volatile__(					      \
-		"	.set	push					\n"   \
-		"	.set	"MIPS_ISA_LEVEL"			\n"   \
-		"1:	ll	%1, %2		# atomic_fetch_" #op "	\n"   \
-		"	" #asm_op " %0, %1, %3				\n"   \
-		"	sc	%0, %2					\n"   \
-		"\t" __SC_BEQZ "%0, 1b					\n"   \
-		"	.set	pop					\n"   \
-		"	move	%0, %1					\n"   \
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
+#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
+static __inline__ int atomic_fetch_##op##_relaxed(int i, atomic_t * v)	\
+{									\
+	int result;							\
+									\
+	if (kernel_uses_llsc) {						\
+		int temp;						\
+									\
+		loongson_llsc_mb();					\
+		__asm__ __volatile__(					\
+		"	.set	push				\n"	\
+		"	.set	"MIPS_ISA_LEVEL"		\n"	\
+		"1:	ll	%1, %2	# atomic_fetch_" #op "	\n"	\
+		"	" #asm_op " %0, %1, %3			\n"	\
+		"	sc	%0, %2				\n"	\
+		"\t" __SC_BEQZ "%0, 1b				\n"	\
+		"	.set	pop				\n"	\
+		"	move	%0, %1				\n"	\
+		: "=3D&r" (result), "=3D&r" (temp),				\
+		  "+" GCC_OFF_SMALL_ASM() (v->counter)			\
+		: "Ir" (i) : __LLSC_CLOBBER);				\
+	} else {							\
+		unsigned long flags;					\
+									\
+		raw_local_irq_save(flags);				\
+		result =3D v->counter;					\
+		v->counter c_op i;					\
+		raw_local_irq_restore(flags);				\
+	}								\
+									\
+	return result;							\
 }
=20
-#define ATOMIC_OPS(op, c_op, asm_op)					      \
-	ATOMIC_OP(op, c_op, asm_op)					      \
-	ATOMIC_OP_RETURN(op, c_op, asm_op)				      \
+#define ATOMIC_OPS(op, c_op, asm_op)					\
+	ATOMIC_OP(op, c_op, asm_op)					\
+	ATOMIC_OP_RETURN(op, c_op, asm_op)				\
 	ATOMIC_FETCH_OP(op, c_op, asm_op)
=20
 ATOMIC_OPS(add, +=3D, addu)
@@ -149,8 +149,8 @@ ATOMIC_OPS(sub, -=3D, subu)
 #define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
=20
 #undef ATOMIC_OPS
-#define ATOMIC_OPS(op, c_op, asm_op)					      \
-	ATOMIC_OP(op, c_op, asm_op)					      \
+#define ATOMIC_OPS(op, c_op, asm_op)					\
+	ATOMIC_OP(op, c_op, asm_op)					\
 	ATOMIC_FETCH_OP(op, c_op, asm_op)
=20
 ATOMIC_OPS(and, &=3D, and)
--=20
2.23.0

