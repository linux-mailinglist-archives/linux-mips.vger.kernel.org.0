Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 862DDC4303
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfJAVxV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:21 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728078AbfJAVxT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+poWWrzh6BF6Tj9lPI1WRAV6nUD13ps4VfavvOH/FOiIJiWqaaybvbsBw7BaDSK1PjUuyKH8R9C1+JnGKtoDQvs9IQP8z+Dw4nlHtDvN4VS2dw5DpPji97nWxbS7Gi8VKQkJmtYsoUpSyvtkDDIMQrxcqSNRc/TEa4zo6Tx3IgOCzbaZTciVuqhdM8GeOaFyBADsQUS9DiI7phX3LqVcGrc6ju/+gdTLzepj8wNx++V69pqBGATK+w3UmUUkMuhe8ZlGhnaMNq7r1dHR90/PQBY0ooucjnNfv3roEVWgh7luCcoqNzCapVU4ft2GKGZONnuPv2DoK9Z5toRdl1zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlM+lUTj9OAkDM61xJmFNZDp9Ocv+/vFn06O1gXXcWQ=;
 b=OulNr0HgDI8RpiCv7avlBh/yoPJqZJJRf+tlwgMIMrwyh9u8/NH8d0LbUxDwI4KYFCxow5Q9sVzcEDqdybeyFJMT11ilpy7U8PEkcgJNPbv3Hvovm1W/Rc8Ezd4jV3S1j8L2kF+Z1RyyQZj7HjVhagCcIgx1JjtrsGCMZ1im/jXvThkej/AexCUulsdRgqfOzNbclubKb4ysbbl82K+cwYiBc58yq8ioJ7AUT6Ey0EVKR02zf71dJT02XA2aUMVuj0FUzASmc3t5OSYiLqRZpi5BiSEJtRRCCyFmUUOgHTv3YRM8C/UEE+z3dA/3C4dqoOCe/FyTKaIqqkjpeUwGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlM+lUTj9OAkDM61xJmFNZDp9Ocv+/vFn06O1gXXcWQ=;
 b=EbH/L4Mh445+MzvHVOZFDRjZPUF21OGC1f33D39HXep5KzLrtFzvnpm3x2az+OILGw/Oh8bmsPvjs4qgy922U1o4neJ+pH269S6K9zggIUe8SxnyBuljTG+9sxkEQA0rBUNFuS7cruWWsj948kWbdRfr+DABWt3G3aUdqXzHXGM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 10/36] MIPS: atomic: Handle !kernel_uses_llsc first
Thread-Topic: [PATCH v2 10/36] MIPS: atomic: Handle !kernel_uses_llsc first
Thread-Index: AQHVeKKhvkClO5qosUCaGdrXmajwZw==
Date:   Tue, 1 Oct 2019 21:53:16 +0000
Message-ID: <20191001215249.4157062-11-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 22f1026f-7b7c-42db-359e-08d746b9c405
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14390589F568D8DDAC7F64B1C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mc/uP0zYlFO1yz3lm4347BeOFBM0qilgWQ2dx18Jbup+O59FSqM2/PnOPd708KJ5WnW8+XCPs1+b8+hXgHclmvrVyyWQOSvSLf1JdmiaXDa8TZ1eBESMAWfV33I0BiwBQ4tgxr7QTC/cMGRLoS3BD1lBPbJwnFeiXDjFd54FYiIyh1b7IcfPX+4uIP/YgQ8lZ3zgzUbDXCZQCSaQ+MYGOh8c9wxhAAfCNHBEpesIEpV8rBaiH5ywg9mcxJ1waUZ0CeRLjsx7z83zzq3FKeNKJUfcnKyGYwqJjpHTCv1b6gIjHAvKsiJlTOtNNRWcxhRuYLiP7fvEq3XeGp3+g2opeiuPUTw8qlETXjjq+2jKu4yQTJ3MEN18IbnEWkERi4cJnkkCNNOUdFt5c/TJwcQoqQiw6aE1+EzFWgqbe+26oYg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f1026f-7b7c-42db-359e-08d746b9c405
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:17.0752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NxqOt6hWJ8aqjDTY3cQu8qxjSJyBmEElHklu9FuJ6J5KVp+xEybqgKyJ5mSrbIfRDQ8ROEYpbi7pQS2mUN2vaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
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

Changes in v2: None

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

