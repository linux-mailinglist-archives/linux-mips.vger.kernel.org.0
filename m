Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 515DAC433D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfJAVzM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:12 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728063AbfJAVxS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpOPtTu+XozlYl4hrNAObIDM65bgyFUAdYmEBP6DEiXrd2a9rb7W5umbRO6+4qHm2YhjDEKliq2ppiZYS0VXWU3TbKjyhj6e6DzsMkXmUDGM6U6SpGvkuq168ks+knCxRkUklBIBEGOoXQ1J/vma8aFRgucByxEiC9rUAFyR+u9jqo+c36pYzSSfD7vBSPH1jaffJzejV+LSgn+BugSKxOft3+uat6tuF+UrlRvYI5skmQpUejmDmnyH/BxM/pMMf5IlMythtGl/jFL2q4XEqyadU3RjaBAJjRFkgQp1mDxq/I4m0HczTewDikgpVYzmz4oyFUMixwIpWsLo6etwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0dgxjl7VAQ6KGAg/hOjwYcyvgPNvW+txUWQu7qTaU0=;
 b=IBlwgda7DQk1eLW27dqfa79U7gN72Gef1FIJLW8CLYVacB7epH2zxYjcwdPSwFlwAiL+IBqMEDbAPmasWTcx5pyRuRNlp/wWuMm/xnfYhuFY/0oEPTylfAmpkCoZg70AfQqRAdqkHHwE6gTGYrPr66hwMGeT74IKkUt6f42S8bO6WgIUxUoXWTLl8oxDhkbMblOZotc/2WPPf51qNPtw9f49nVdO884tcKUqBZ8oQJOKR+ouGpGHaZw8dsdZcUzSk4d+HSfm6ntLbUepXaGvBrPIdIaX5CQrVF9xzHfQJU4q0JeySduUh12NKZioEwfy+nJAqHncCwsO+ypWpE7UOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0dgxjl7VAQ6KGAg/hOjwYcyvgPNvW+txUWQu7qTaU0=;
 b=VckPaciM59iXdlx2yfk07ZeuPK6Kp6k/rhOmu3QwdfK3LNQWlNQdFkF0r2dCQKogH+lWTtTF3xs8M0NxtTOvVt2pF66qzZ+9VWPpURFFH1fsoP0TYPFuB6IYX8qSPys94fmb4s1xev4OkdkV31nAWm041V07DDmkyTY627xYA30=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:16 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:16 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 09/36] MIPS: atomic: Fix whitespace in ATOMIC_OP macros
Thread-Topic: [PATCH v2 09/36] MIPS: atomic: Fix whitespace in ATOMIC_OP
 macros
Thread-Index: AQHVeKKgGWCu9gnKukKr6j/vfu7GEg==
Date:   Tue, 1 Oct 2019 21:53:15 +0000
Message-ID: <20191001215249.4157062-10-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 096b7edd-2821-4e59-fffa-08d746b9c35a
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439B5607A174D2852FAB9A7C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vq5wucUqF0O6RiYp4ZItsrJ1duNuX75rvrw0bxl58Bo4YlYmq4xVS5KGQu51Lk499Wgi90r6qqpTCAZ8+SKxXc3sek5C9luZJibgSgof9sqsot7yGWMvRDpMgkm8+I7MiLIAiLjhv95HPgr7djc2lDbi/WTIPq/QYv/VPoCGXcLMHgzwt8c+I/NuKwAJlGMWpKbfUgUINz4583WNJzpXHKx1ROpgZRjWYIIQbj6YOest0oq7T+Qa5kaDNsZGhj7kVR8EY8KsrA25y33OGHZG40cvN08EwV8Jn9KYiUD9Y92DL7jPkA18JwUBm8KB0X+j3BhrkIC2IfdUhmToFDcFaWAl6GjebgR6duQQGYnXlxNzJpWbMGyVQjc8kjVWgM7PLhlnBzq8LDnyaD8+NNG+tc5Y4MZtPFTHWveXeGsKMLM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096b7edd-2821-4e59-fffa-08d746b9c35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:15.8418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0v+fwGJCHWtF8r9dOyOqYQoL5l0h+nvcIeUbhVYoYBIOD7jkU65pUsWOLxQGx9u1BMh16LuyyhWGBUaDNvO98A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
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

Changes in v2: None

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

