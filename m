Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7556AC2A6F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732465AbfI3XIb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:31 -0400
Received: from mail-eopbgr820107.outbound.protection.outlook.com ([40.107.82.107]:31072
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732442AbfI3XIa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Efb0CpuDdhiIPnTnUsVbEUJ6ub5Ml3l6aEKnOYzZN+kl3apzz9+NLnRzpvrw6b6Exqby23oKWEO9s1+J0OKlib3QlEDedvtjVKSG+9q0SZHg2eY0vtDJHoHgHcYkbud8W1k35DtGf+NuvmQB8KDnJf1/cOvolOpyiyZiLrCQOxucyRuvhA5s2qvVIXQGAX9zahOuqPEVOWJw6N5grVbXybqpkPa8ZT5mw8JbzNDRGbk3Xk66yVP/2IhF2wdMtI0Y1vzZmgfoyCWA42inr3rgDwvwmVKFeY0sPMRcFb9xFD9ldtAtthfH9FyfTANrTikKLgYpDZ7MBvobtBNnR2+bHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah2k+zkbqTqhr690CKGvSZSI7ugQNvjVIW57u5CEK2w=;
 b=F5UHUwN/ynXKtZlUqeBcwez0S+BKqW9ST8uyuqo4cI6xuZ95p9/zQ9i6AFqtiUPIO/mzZvcYomHJRIAtCsWvAicZU05pEdmkhvl3SQYBrLJdj+rT2lyHlgaPyR+uC4E5HCF24X2NyAKjF82nDRE/EpfIAiVrbXl+xKJ1JBnaf1IPyXVOot0vdIVJs5R864/PY2MCLZ66+Qj449Tt8Vac+JJcs3K6UcMAf+k58YSEsSEJbJNlXc43rN9oQeCPYKZAKZFZS7U7FD3AHcmlvK8UH6RmnUyx2FDE8Gw3QApzpQqGLW+nA9chgifOvoHj6orx9Lk6CRQ1+3kGo6y684wS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah2k+zkbqTqhr690CKGvSZSI7ugQNvjVIW57u5CEK2w=;
 b=p9VlviHoG4ZJsXxlb0Zu2+oFMfXBiPSQab7OebpOnkF21GOWzW+ZyULkFGxnOaR/lDxPr7BP3d00NIbiql77+neKEBZbZPK1VECx9mhbP2xqethAnYw6Iwvvsay2pnnmiGvcR/ay81KYjoTLfEiMbCTUTlbHat+j18VEvpKd+fM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 10/37] MIPS: atomic: Handle !kernel_uses_llsc first
Thread-Topic: [PATCH 10/37] MIPS: atomic: Handle !kernel_uses_llsc first
Thread-Index: AQHVd+P1xkAisMuQ50+vtEJHejn45w==
Date:   Mon, 30 Sep 2019 23:08:23 +0000
Message-ID: <20190930230806.2940505-11-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: fbc6eac6-cff2-4222-5e6e-08d745fb1788
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022426DCA1C31820E837F01C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYco+SGa6qTn9BdJRWPfATta8sV9klTiRTH1OZLRYxMmW5Mczr8s5mO3p6hKmaedEqPxnqI1AOnbYxH9/1km89vBBJkLcR3ox6YyIFa8iij4qYNWygKW1QPbeeoiV1ZPElKub2HmJDtwNniyzLRUJytjH+tW57NR2SDeXFSVaL/HyIVKKRmgHzTANuKw7p0vbr9FgPKf7gjNBq0ielf5ctz/i073G30tOQ6OcmDH1TT4phZluO+7ZFUdU/UkhPd4B9mrmjC8HIOoRMl+/bLe3wEYD7Lrsah2V6NTXcwPIa5skgmZJtpwZDkTfyI1OHY+bdg22+tqSYVEAEyDivybGjWBkrylsJMf6D7ikqOqFJQs6okGSXKo3WnA7ZwJuG6OlPShH+n8Xy6GhQ7F/q4r5qdmftl1YO4HwJrewBg62cg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc6eac6-cff2-4222-5e6e-08d745fb1788
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:23.1734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vv0cM2cvou/CpSYgophny4ErMr0pn7ZwjWW19//bMCzu8amAcGPwooDwffv9otM3S4VBDldQTOxXhMHRA5DEsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Handle the !kernel_uses_llsc path first in our ATOMIC_OP(),
ATOMIC_OP_RETURN() & ATOMIC_FETCH_OP() macros & return from within the
block. This allows us to de-indent the kernel_uses_llsc path by one
level which will be useful when making further changes.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/atomic.h | 99 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 2d2a8a74c51b..ace2ea005588 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -45,51 +45,36 @@
 #define ATOMIC_OP(op, c_op, asm_op)					\
 static __inline__ void atomic_##op(int i, atomic_t * v)			\
 {									\
-	if (kernel_uses_llsc) {						\
-		int temp;						\
+	int temp;							\
 									\
-		loongson_llsc_mb();					\
-		__asm__ __volatile__(					\
-		"	.set	push				\n"	\
-		"	.set	"MIPS_ISA_LEVEL"		\n"	\
-		"1:	ll	%0, %1	# atomic_" #op "	\n"	\
-		"	" #asm_op " %0, %2			\n"	\
-		"	sc	%0, %1				\n"	\
-		"\t" __SC_BEQZ "%0, 1b				\n"	\
-		"	.set	pop				\n"	\
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	\
-		: "Ir" (i) : __LLSC_CLOBBER);				\
-	} else {							\
+	if (!kernel_uses_llsc) {					\
 		unsigned long flags;					\
 									\
 		raw_local_irq_save(flags);				\
 		v->counter c_op i;					\
 		raw_local_irq_restore(flags);				\
+		return;							\
 	}								\
+									\
+	loongson_llsc_mb();						\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"1:	ll	%0, %1		# atomic_" #op "	\n"	\
+	"	" #asm_op " %0, %2				\n"	\
+	"	sc	%0, %1					\n"	\
+	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"	.set	pop					\n"	\
+	: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)		\
+	: "Ir" (i) : __LLSC_CLOBBER);					\
 }
=20
 #define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
 static __inline__ int atomic_##op##_return_relaxed(int i, atomic_t * v)	\
 {									\
-	int result;							\
-									\
-	if (kernel_uses_llsc) {						\
-		int temp;						\
+	int temp, result;						\
 									\
-		loongson_llsc_mb();					\
-		__asm__ __volatile__(					\
-		"	.set	push				\n"	\
-		"	.set	"MIPS_ISA_LEVEL"		\n"	\
-		"1:	ll	%1, %2	# atomic_" #op "_return	\n"	\
-		"	" #asm_op " %0, %1, %3			\n"	\
-		"	sc	%0, %2				\n"	\
-		"\t" __SC_BEQZ "%0, 1b				\n"	\
-		"	" #asm_op " %0, %1, %3			\n"	\
-		"	.set	pop				\n"	\
-		: "=3D&r" (result), "=3D&r" (temp),				\
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)			\
-		: "Ir" (i) : __LLSC_CLOBBER);				\
-	} else {							\
+	if (!kernel_uses_llsc) {					\
 		unsigned long flags;					\
 									\
 		raw_local_irq_save(flags);				\
@@ -97,41 +82,55 @@ static __inline__ int atomic_##op##_return_relaxed(int =
i, atomic_t * v)	\
 		result c_op i;						\
 		v->counter =3D result;					\
 		raw_local_irq_restore(flags);				\
+		return result;						\
 	}								\
 									\
+	loongson_llsc_mb();						\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"1:	ll	%1, %2		# atomic_" #op "_return	\n"	\
+	"	" #asm_op " %0, %1, %3				\n"	\
+	"	sc	%0, %2					\n"	\
+	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"	" #asm_op " %0, %1, %3				\n"	\
+	"	.set	pop					\n"	\
+	: "=3D&r" (result), "=3D&r" (temp),					\
+	  "+" GCC_OFF_SMALL_ASM() (v->counter)				\
+	: "Ir" (i) : __LLSC_CLOBBER);					\
+									\
 	return result;							\
 }
=20
 #define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
 static __inline__ int atomic_fetch_##op##_relaxed(int i, atomic_t * v)	\
 {									\
-	int result;							\
+	int temp, result;						\
 									\
-	if (kernel_uses_llsc) {						\
-		int temp;						\
-									\
-		loongson_llsc_mb();					\
-		__asm__ __volatile__(					\
-		"	.set	push				\n"	\
-		"	.set	"MIPS_ISA_LEVEL"		\n"	\
-		"1:	ll	%1, %2	# atomic_fetch_" #op "	\n"	\
-		"	" #asm_op " %0, %1, %3			\n"	\
-		"	sc	%0, %2				\n"	\
-		"\t" __SC_BEQZ "%0, 1b				\n"	\
-		"	.set	pop				\n"	\
-		"	move	%0, %1				\n"	\
-		: "=3D&r" (result), "=3D&r" (temp),				\
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)			\
-		: "Ir" (i) : __LLSC_CLOBBER);				\
-	} else {							\
+	if (!kernel_uses_llsc) {					\
 		unsigned long flags;					\
 									\
 		raw_local_irq_save(flags);				\
 		result =3D v->counter;					\
 		v->counter c_op i;					\
 		raw_local_irq_restore(flags);				\
+		return result;						\
 	}								\
 									\
+	loongson_llsc_mb();						\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	"MIPS_ISA_LEVEL"			\n"	\
+	"1:	ll	%1, %2		# atomic_fetch_" #op "	\n"	\
+	"	" #asm_op " %0, %1, %3				\n"	\
+	"	sc	%0, %2					\n"	\
+	"\t" __SC_BEQZ "%0, 1b					\n"	\
+	"	.set	pop					\n"	\
+	"	move	%0, %1					\n"	\
+	: "=3D&r" (result), "=3D&r" (temp),					\
+	  "+" GCC_OFF_SMALL_ASM() (v->counter)				\
+	: "Ir" (i) : __LLSC_CLOBBER);					\
+									\
 	return result;							\
 }
=20
--=20
2.23.0

