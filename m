Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89E9C4332
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJAVyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:12 -0400
Received: from mail-eopbgr750107.outbound.protection.outlook.com ([40.107.75.107]:29167
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728228AbfJAVxo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPJgBCyoQtWND11ksud+SdcKXI9nyGTBdY3O60WAF/IcvfwjRpeqjd7+4rXyQ0FJsXRM4RLIcUeSzo1Fo/VmygV3vCZKHevNwkLTzw0qvUQODnBnn4MTn2Icvv6EF9ULSOCs0yKS7I1+KZw+U0TiiqMWIv4h2pkgakvO/roRylQN5SCfWKJHK5sjACO25Lc2hbL1HN9/R2f7/10qYmlv/lFHzCOyYkDzra2Dtt46J3cup81My1kcMgj4qs246NzOOP02eHqDvGmQ5gljUNdHTMiieum3u0A/sfOu6T9e8D7grlP8/l+dTlitTC9JJF5/sK7uDwhZ9prYSYUaIi8thg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ofa9KCl/0RsNTSD7ocqa4+xq30RwjFidGpIUp1H1oQ=;
 b=EPjUEfM6Q0WyY84AQQwAmKsb9RqmaBAvKMSWji+ZHUJlt+i5fYlWvjnD2R+AiX/76j01VLVMr9fklEnIK9IIelYY4bpc5wXNzB7PxArulLdLtIHxG7u5f64/SYiXZ+Y10eSACIlXOKAnOnqHfm0TQz8p73YLlQRlBxjjJRl+GyxZQm3dyVqBq/nQHecNn9zRFHfjMMR8D+rhCN4CW312S+r3BZ00Z3AXdIEp4zWl297GvsQQVu42QBtKQT5erpFZffRKlna6Oxkvd4zndcxckdc800jmiKLyXoVsYoIGWBVt8LnwnckyvdxjzZv7ssJVPKOLUq3ny3KwmsuRHP1b2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ofa9KCl/0RsNTSD7ocqa4+xq30RwjFidGpIUp1H1oQ=;
 b=Y1Jdq1ZwggnILB0UsQjQe45LcQU073LjnroZY4JoRWPpsE4jg5okUDnXXr0RButUojBEP02NJzH0nJWs3Tvrg+LRKbpR0jJrOCcCqareHZHYoOjxCOrYd4jl5OraadY/0PdlfLDVJ2iRAdE+lsHQiuaLjhyGG7+gP83H+KgU9C0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:53:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 28/36] MIPS: cmpxchg: Emit Loongson3 sync workarounds
 within asm
Thread-Topic: [PATCH v2 28/36] MIPS: cmpxchg: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVeKKt1X3uRc/5eE62lTuyLiifoQ==
Date:   Tue, 1 Oct 2019 21:53:37 +0000
Message-ID: <20191001215249.4157062-29-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: c58e5c79-619e-48ae-a209-08d746b9d036
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581ED7FA41320C1D4AD1294C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001)(133343001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uokMrjLGcZqhtqEk6EJEbDfx9NCSvdfxmqECgNOimUkSN5cghJ7dQmVbnC3oIeu9TdSt2YjARW9I5Fnsi9hPpEmVBan2BK0ccw7R6foRg7QTFIYpjgBMQRtG/HRTa+c2DRaDEteqxsTnl3gErCkOi6JniZx9nMaW1S4gXXrly8RjY3RToJQF0cs2D8xnEsefJv0nNdOEk8XCFjfjpRacravcZwU5owj4D0wiawrDYJBwTT0L4VXHask3vjq+8VJ2IAL5p096fpMZir/hRgKQ8iEZAN5RRols8cZeS/f1c/8xxQPR1XI10aXSsN+bIZEuIBThVCEwQdR0oxhbIZfcpJNk4STWFAydJ8vGuSMbGHvPltNmR4kXG7ap99Z/wc3J3QpXTq2MJlUzyaQHaKAfajUSEYlHVhIcumrs6TLmmZA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58e5c79-619e-48ae-a209-08d746b9d036
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:37.3819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnD2oHWrKwYRPLzL/3aF1jbfGp/UXvvxfSkbnCFpVCmMC4CSSkZQvY06VoYJN2ERI0csphibNqxw8WYnSh8/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generate the sync instructions required to workaround Loongson3 LL/SC
errata within inline asm blocks, which feels a little safer than doing
it from C where strictly speaking the compiler would be well within its
rights to insert a memory access between the separate asm statements we
previously had, containing sync & ll instructions respectively.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/cmpxchg.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxch=
g.h
index 5d3f0e3513b4..fc121d20a980 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -12,6 +12,7 @@
 #include <linux/irqflags.h>
 #include <asm/compiler.h>
 #include <asm/llsc.h>
+#include <asm/sync.h>
 #include <asm/war.h>
=20
 /*
@@ -36,12 +37,12 @@ extern unsigned long __xchg_called_with_bad_pointer(voi=
d)
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
 		"	.set	push				\n"	\
 		"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"	\
+		"	" __SYNC(full, loongson3_war) "		\n"	\
 		"1:	" ld "	%0, %2		# __xchg_asm	\n"	\
 		"	.set	pop				\n"	\
 		"	move	$1, %z3				\n"	\
@@ -108,12 +109,12 @@ static inline unsigned long __xchg(volatile void *ptr=
, unsigned long x,
 	__typeof(*(m)) __ret;						\
 									\
 	if (kernel_uses_llsc) {						\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
 		"	.set	push				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
+		"	" __SYNC(full, loongson3_war) "		\n"	\
 		"1:	" ld "	%0, %2		# __cmpxchg_asm \n"	\
 		"	bne	%0, %z3, 2f			\n"	\
 		"	.set	pop				\n"	\
@@ -122,11 +123,10 @@ static inline unsigned long __xchg(volatile void *ptr=
, unsigned long x,
 		"	" st "	$1, %1				\n"	\
 		"\t" __SC_BEQZ	"$1, 1b				\n"	\
 		"	.set	pop				\n"	\
-		"2:						\n"	\
+		"2:	" __SYNC(full, loongson3_war) "		\n"	\
 		: "=3D&r" (__ret), "=3D" GCC_OFF_SMALL_ASM() (*m)		\
 		: GCC_OFF_SMALL_ASM() (*m), "Jr" (old), "Jr" (new)	\
 		: __LLSC_CLOBBER);					\
-		loongson_llsc_mb();					\
 	} else {							\
 		unsigned long __flags;					\
 									\
@@ -222,11 +222,11 @@ static inline unsigned long __cmpxchg64(volatile void=
 *ptr,
 	 */
 	local_irq_save(flags);
=20
-	loongson_llsc_mb();
 	asm volatile(
 	"	.set	push				\n"
 	"	.set	" MIPS_ISA_ARCH_LEVEL "		\n"
 	/* Load 64 bits from ptr */
+	"	" __SYNC(full, loongson3_war) "		\n"
 	"1:	lld	%L0, %3		# __cmpxchg64	\n"
 	/*
 	 * Split the 64 bit value we loaded into the 2 registers that hold the
@@ -260,7 +260,7 @@ static inline unsigned long __cmpxchg64(volatile void *=
ptr,
 	/* If we failed, loop! */
 	"\t" __SC_BEQZ "%L1, 1b				\n"
 	"	.set	pop				\n"
-	"2:						\n"
+	"2:	" __SYNC(full, loongson3_war) "		\n"
 	: "=3D&r"(ret),
 	  "=3D&r"(tmp),
 	  "=3D" GCC_OFF_SMALL_ASM() (*(unsigned long long *)ptr)
@@ -268,7 +268,6 @@ static inline unsigned long __cmpxchg64(volatile void *=
ptr,
 	  "r" (old),
 	  "r" (new)
 	: "memory");
-	loongson_llsc_mb();
=20
 	local_irq_restore(flags);
 	return ret;
--=20
2.23.0

