Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1327ED00A7
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 20:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfJHSWy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 14:22:54 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com ([40.107.79.98]:6171
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726138AbfJHSWy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 14:22:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvavSjOstjnY0iHXxo7K35PkIZ7DXknWEnXXSVHQv3S4R3sGNwnB7d+QJSU5/pigQzVGMZh8jFbwq216Dgmm98o5chnO45wVfIhx3GgCsWMhXiKF4Q1r04kQVaq9E7PaX4MS8O90bd4ZnOiKZAkeBSjWOQMBXRBGO/1ku4dIjri9NKC6Ds9Bklx+PzFuFdL8HrrLLZKEtQic7UtWgnmYzq/qB5DoI1RF0ZwWi6UFQAIZ4eet1a9IaxA8ImNgV6erZ1JZOoUXH8ve8hOYocOcfQ3Mgn0Lnvm7ng0z8pXEBO7yLyBvowFNBUy2j8W74b7VvJRYeTcXqpyvjKsuEzUHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76/fO5nqn4NZymcaCaJcSVuJuw9qLw3dgZ1egIZD9jA=;
 b=EQQ3d+gZ7YZwzoHoyGCL8UsnFfIyy+NbtJYilx7BFmWGpQswtyBptj1Jga57t85XkcsLoE+WjEpF+ketLJRCPzOxn9yDexvlom/WY/sxcrJ18lnuICEs1Qjz8M0mU8C12cYSUPgMGVf0sXkDtRUqCtvbFoma4cc+8RgPkDvdsdg0Ukz8Mi7q3TcAxgNiWBwV+VJEBC4BnAI2uBuDZBXVmUVfSCEkR3FIRCGBuOqoYXJZlziDU6vEkFA4DXgkznkJoGtRsKW2y23k8hCT4f9r+5CvPHvdv3uTtMqvkqGE8/pmUA6AkZxJrZ+qKEtLzRjVoxaEVud/DQnqpis3AnwfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76/fO5nqn4NZymcaCaJcSVuJuw9qLw3dgZ1egIZD9jA=;
 b=CnN8G5562wzx3tvtEMQDBjt4gWHx9NggsO0kXK1jGugJHNbEIBuTF0tSWVYqbidwy6IKOom94bX04+MysfXQ8jjzOptkCOf/35Xy3WCLN+3RrDBvwFNWSog8OsgKUhmnBtLdW8Q/6TGYF1pw3Gl4dX+sNBhDrGRwI5fM+eP0ytE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1567.namprd22.prod.outlook.com (10.174.162.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 8 Oct 2019 18:22:00 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 18:22:00 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH] MIPS: Provide unroll() macro, use it for cache ops
Thread-Topic: [PATCH] MIPS: Provide unroll() macro, use it for cache ops
Thread-Index: AQHVfgVGUUFiUFsiX0+VhTzRiJkYfg==
Date:   Tue, 8 Oct 2019 18:22:00 +0000
Message-ID: <20191008182149.2082503-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d24d8ff7-2917-42cf-05ce-08d74c1c68d3
x-ms-traffictypediagnostic: MWHPR2201MB1567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1567F4E41E07223423FF1240C19A0@MWHPR2201MB1567.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(346002)(366004)(136003)(39840400004)(199004)(189003)(71190400001)(71200400001)(4326008)(2351001)(107886003)(50226002)(6512007)(81166006)(81156014)(8676002)(8936002)(5640700003)(6436002)(6486002)(66066001)(316002)(478600001)(476003)(2616005)(36756003)(42882007)(486006)(3846002)(6116002)(44832011)(66946007)(66476007)(66556008)(64756008)(66446008)(30864003)(5660300002)(25786009)(2501003)(1076003)(14454004)(256004)(14444005)(52116002)(99286004)(386003)(305945005)(6916009)(186003)(2906002)(7736002)(102836004)(26005)(6506007)(21314003)(579004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1567;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qovu4UFnlRHudNQOwXJzOPMA7iZdlnhZDiZ7SUlXo6wc2Gv44dW5iI1DDkPX+BSNkrMZQmJjoJHWMVA/qGstJ6XVp4T0ywNzOXwmt6gGvc+/ORqdTToa6z0/gVW+hF6PSygCJIXHY3z6HNO2PpDheQjxRpTmPtzBYC4DMhcJHRXhqaH5whaFe++Efgx6kK/f05Xs3DhLZoaE/9V3hSEnBdNAe2HMK+9XKTpROKGP4eLDF0ku6qi63D6WkYnYpo/L5FSoQYwmfhIzDkkUASzEqt4BYtAUnGcauBBbwXSLrGB6rclC0MmWf4hAh+6Y+44yBNScupvOimL0UdF5H4QAN2pf/7XgL9nupvdv6vrZqVvEBodIMp3oHY0GoTMEsfpKeEyLlJtSACTckCNiMdWl4oPHMvaHxyEOIa4G+LqVDsk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24d8ff7-2917-42cf-05ce-08d74c1c68d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 18:22:00.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8pWzN59+UrZRgSgDfqRkgPjXGwuBFSkdO3B1QjeN1o6Wksa4l1egxD/97d9OhoFO+PHQx8Ub4AnyMfreWRsyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1567
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently we have a lot of duplication in asm/r4kcache.h to handle
manually unrolling loops of cache ops for various line sizes, and we
have to explicitly handle the difference in cache op immediate width
between MIPSr6 & earlier ISA revisions with further duplication.

Introduce an unroll() macro in asm/unroll.h which expands to a switch
statement which is used to call a function or expand a preprocessor
macro a compile-time constant number of times in a row - effectively
explicitly unrolling a loop. We make use of this here to remove the
cache op duplication & will use it further in later patches.

A nice side effect of this is that calculating the cache op offset
immediate is now the compiler's responsibility, so we're no longer
sensitive to the width change of that immediate in MIPSr6 & will be
similarly agnostic to immediate width in any future supported ISA.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/r4kcache.h | 358 ++-----------------------------
 arch/mips/include/asm/unroll.h   |  76 +++++++
 arch/mips/mm/c-r4k.c             |  12 +-
 3 files changed, 103 insertions(+), 343 deletions(-)
 create mode 100644 arch/mips/include/asm/unroll.h

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kca=
che.h
index 7f4a32d3345a..e73fc9e899d2 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -15,12 +15,14 @@
 #include <linux/stringify.h>
=20
 #include <asm/asm.h>
+#include <asm/asm-eva.h>
 #include <asm/cacheops.h>
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
 #include <asm/cpu-type.h>
 #include <asm/mipsmtregs.h>
 #include <asm/mmzone.h>
+#include <asm/unroll.h>
 #include <linux/uaccess.h> /* for uaccess_kernel() */
=20
 extern void (*r4k_blast_dcache)(void);
@@ -39,16 +41,19 @@ extern void (*r4k_blast_icache)(void);
  */
 #define INDEX_BASE	CKSEG0
=20
-#define cache_op(op,addr)						\
+#define _cache_op(insn, op, addr)					\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	noreorder				\n"	\
 	"	.set "MIPS_ISA_ARCH_LEVEL"			\n"	\
-	"	cache	%0, %1					\n"	\
+	"	" insn("%0", "%1") "				\n"	\
 	"	.set	pop					\n"	\
 	:								\
 	: "i" (op), "R" (*(unsigned char *)(addr)))
=20
+#define cache_op(op, addr)						\
+	_cache_op(kernel_cache, op, addr)
+
 static inline void flush_icache_line_indexed(unsigned long addr)
 {
 	cache_op(Index_Invalidate_I, addr);
@@ -193,338 +198,10 @@ static inline void invalidate_tcache_page(unsigned l=
ong addr)
 	cache_op(Page_Invalidate_T, addr);
 }
=20
-#ifndef CONFIG_CPU_MIPSR6
-#define cache16_unroll32(base,op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips3					\n"	\
-	"	cache %1, 0x000(%0); cache %1, 0x010(%0)	\n"	\
-	"	cache %1, 0x020(%0); cache %1, 0x030(%0)	\n"	\
-	"	cache %1, 0x040(%0); cache %1, 0x050(%0)	\n"	\
-	"	cache %1, 0x060(%0); cache %1, 0x070(%0)	\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x090(%0)	\n"	\
-	"	cache %1, 0x0a0(%0); cache %1, 0x0b0(%0)	\n"	\
-	"	cache %1, 0x0c0(%0); cache %1, 0x0d0(%0)	\n"	\
-	"	cache %1, 0x0e0(%0); cache %1, 0x0f0(%0)	\n"	\
-	"	cache %1, 0x100(%0); cache %1, 0x110(%0)	\n"	\
-	"	cache %1, 0x120(%0); cache %1, 0x130(%0)	\n"	\
-	"	cache %1, 0x140(%0); cache %1, 0x150(%0)	\n"	\
-	"	cache %1, 0x160(%0); cache %1, 0x170(%0)	\n"	\
-	"	cache %1, 0x180(%0); cache %1, 0x190(%0)	\n"	\
-	"	cache %1, 0x1a0(%0); cache %1, 0x1b0(%0)	\n"	\
-	"	cache %1, 0x1c0(%0); cache %1, 0x1d0(%0)	\n"	\
-	"	cache %1, 0x1e0(%0); cache %1, 0x1f0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#define cache32_unroll32(base,op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips3					\n"	\
-	"	cache %1, 0x000(%0); cache %1, 0x020(%0)	\n"	\
-	"	cache %1, 0x040(%0); cache %1, 0x060(%0)	\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x0a0(%0)	\n"	\
-	"	cache %1, 0x0c0(%0); cache %1, 0x0e0(%0)	\n"	\
-	"	cache %1, 0x100(%0); cache %1, 0x120(%0)	\n"	\
-	"	cache %1, 0x140(%0); cache %1, 0x160(%0)	\n"	\
-	"	cache %1, 0x180(%0); cache %1, 0x1a0(%0)	\n"	\
-	"	cache %1, 0x1c0(%0); cache %1, 0x1e0(%0)	\n"	\
-	"	cache %1, 0x200(%0); cache %1, 0x220(%0)	\n"	\
-	"	cache %1, 0x240(%0); cache %1, 0x260(%0)	\n"	\
-	"	cache %1, 0x280(%0); cache %1, 0x2a0(%0)	\n"	\
-	"	cache %1, 0x2c0(%0); cache %1, 0x2e0(%0)	\n"	\
-	"	cache %1, 0x300(%0); cache %1, 0x320(%0)	\n"	\
-	"	cache %1, 0x340(%0); cache %1, 0x360(%0)	\n"	\
-	"	cache %1, 0x380(%0); cache %1, 0x3a0(%0)	\n"	\
-	"	cache %1, 0x3c0(%0); cache %1, 0x3e0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#define cache64_unroll32(base,op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips3					\n"	\
-	"	cache %1, 0x000(%0); cache %1, 0x040(%0)	\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x0c0(%0)	\n"	\
-	"	cache %1, 0x100(%0); cache %1, 0x140(%0)	\n"	\
-	"	cache %1, 0x180(%0); cache %1, 0x1c0(%0)	\n"	\
-	"	cache %1, 0x200(%0); cache %1, 0x240(%0)	\n"	\
-	"	cache %1, 0x280(%0); cache %1, 0x2c0(%0)	\n"	\
-	"	cache %1, 0x300(%0); cache %1, 0x340(%0)	\n"	\
-	"	cache %1, 0x380(%0); cache %1, 0x3c0(%0)	\n"	\
-	"	cache %1, 0x400(%0); cache %1, 0x440(%0)	\n"	\
-	"	cache %1, 0x480(%0); cache %1, 0x4c0(%0)	\n"	\
-	"	cache %1, 0x500(%0); cache %1, 0x540(%0)	\n"	\
-	"	cache %1, 0x580(%0); cache %1, 0x5c0(%0)	\n"	\
-	"	cache %1, 0x600(%0); cache %1, 0x640(%0)	\n"	\
-	"	cache %1, 0x680(%0); cache %1, 0x6c0(%0)	\n"	\
-	"	cache %1, 0x700(%0); cache %1, 0x740(%0)	\n"	\
-	"	cache %1, 0x780(%0); cache %1, 0x7c0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#define cache128_unroll32(base,op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips3					\n"	\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)	\n"	\
-	"	cache %1, 0x100(%0); cache %1, 0x180(%0)	\n"	\
-	"	cache %1, 0x200(%0); cache %1, 0x280(%0)	\n"	\
-	"	cache %1, 0x300(%0); cache %1, 0x380(%0)	\n"	\
-	"	cache %1, 0x400(%0); cache %1, 0x480(%0)	\n"	\
-	"	cache %1, 0x500(%0); cache %1, 0x580(%0)	\n"	\
-	"	cache %1, 0x600(%0); cache %1, 0x680(%0)	\n"	\
-	"	cache %1, 0x700(%0); cache %1, 0x780(%0)	\n"	\
-	"	cache %1, 0x800(%0); cache %1, 0x880(%0)	\n"	\
-	"	cache %1, 0x900(%0); cache %1, 0x980(%0)	\n"	\
-	"	cache %1, 0xa00(%0); cache %1, 0xa80(%0)	\n"	\
-	"	cache %1, 0xb00(%0); cache %1, 0xb80(%0)	\n"	\
-	"	cache %1, 0xc00(%0); cache %1, 0xc80(%0)	\n"	\
-	"	cache %1, 0xd00(%0); cache %1, 0xd80(%0)	\n"	\
-	"	cache %1, 0xe00(%0); cache %1, 0xe80(%0)	\n"	\
-	"	cache %1, 0xf00(%0); cache %1, 0xf80(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#else
-/*
- * MIPS R6 changed the cache opcode and moved to a 8-bit offset field.
- * This means we now need to increment the base register before we flush
- * more cache lines
- */
-#define cache16_unroll32(base,op)				\
-	__asm__ __volatile__(					\
-	"	.set push\n"					\
-	"	.set noreorder\n"				\
-	"	.set mips64r6\n"				\
-	"	.set noat\n"					\
-	"	cache %1, 0x000(%0); cache %1, 0x010(%0)\n"	\
-	"	cache %1, 0x020(%0); cache %1, 0x030(%0)\n"	\
-	"	cache %1, 0x040(%0); cache %1, 0x050(%0)\n"	\
-	"	cache %1, 0x060(%0); cache %1, 0x070(%0)\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x090(%0)\n"	\
-	"	cache %1, 0x0a0(%0); cache %1, 0x0b0(%0)\n"	\
-	"	cache %1, 0x0c0(%0); cache %1, 0x0d0(%0)\n"	\
-	"	cache %1, 0x0e0(%0); cache %1, 0x0f0(%0)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100	\n"	\
-	"	cache %1, 0x000($1); cache %1, 0x010($1)\n"	\
-	"	cache %1, 0x020($1); cache %1, 0x030($1)\n"	\
-	"	cache %1, 0x040($1); cache %1, 0x050($1)\n"	\
-	"	cache %1, 0x060($1); cache %1, 0x070($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x090($1)\n"	\
-	"	cache %1, 0x0a0($1); cache %1, 0x0b0($1)\n"	\
-	"	cache %1, 0x0c0($1); cache %1, 0x0d0($1)\n"	\
-	"	cache %1, 0x0e0($1); cache %1, 0x0f0($1)\n"	\
-	"	.set pop\n"					\
-		:						\
-		: "r" (base),					\
-		  "i" (op));
-
-#define cache32_unroll32(base,op)				\
-	__asm__ __volatile__(					\
-	"	.set push\n"					\
-	"	.set noreorder\n"				\
-	"	.set mips64r6\n"				\
-	"	.set noat\n"					\
-	"	cache %1, 0x000(%0); cache %1, 0x020(%0)\n"	\
-	"	cache %1, 0x040(%0); cache %1, 0x060(%0)\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x0a0(%0)\n"	\
-	"	cache %1, 0x0c0(%0); cache %1, 0x0e0(%0)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
-	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
-	"	cache %1, 0x0c0($1); cache %1, 0x0e0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
-	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
-	"	cache %1, 0x0c0($1); cache %1, 0x0e0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100\n"	\
-	"	cache %1, 0x000($1); cache %1, 0x020($1)\n"	\
-	"	cache %1, 0x040($1); cache %1, 0x060($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0a0($1)\n"	\
-	"	cache %1, 0x0c0($1); cache %1, 0x0e0($1)\n"	\
-	"	.set pop\n"					\
-		:						\
-		: "r" (base),					\
-		  "i" (op));
-
-#define cache64_unroll32(base,op)				\
-	__asm__ __volatile__(					\
-	"	.set push\n"					\
-	"	.set noreorder\n"				\
-	"	.set mips64r6\n"				\
-	"	.set noat\n"					\
-	"	cache %1, 0x000(%0); cache %1, 0x040(%0)\n"	\
-	"	cache %1, 0x080(%0); cache %1, 0x0c0(%0)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x040($1)\n"	\
-	"	cache %1, 0x080($1); cache %1, 0x0c0($1)\n"	\
-	"	.set pop\n"					\
-		:						\
-		: "r" (base),					\
-		  "i" (op));
-
-#define cache128_unroll32(base,op)				\
-	__asm__ __volatile__(					\
-	"	.set push\n"					\
-	"	.set noreorder\n"				\
-	"	.set mips64r6\n"				\
-	"	.set noat\n"					\
-	"	cache %1, 0x000(%0); cache %1, 0x080(%0)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, %0, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	"__stringify(LONG_ADDIU)" $1, $1, 0x100 \n"	\
-	"	cache %1, 0x000($1); cache %1, 0x080($1)\n"	\
-	"	.set pop\n"					\
-		:						\
-		: "r" (base),					\
-		  "i" (op));
-#endif /* CONFIG_CPU_MIPSR6 */
-
-/*
- * Perform the cache operation specified by op using a user mode virtual
- * address while in kernel mode.
- */
-#define cache16_unroll32_user(base,op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips0					\n"	\
-	"	.set eva					\n"	\
-	"	cachee %1, 0x000(%0); cachee %1, 0x010(%0)	\n"	\
-	"	cachee %1, 0x020(%0); cachee %1, 0x030(%0)	\n"	\
-	"	cachee %1, 0x040(%0); cachee %1, 0x050(%0)	\n"	\
-	"	cachee %1, 0x060(%0); cachee %1, 0x070(%0)	\n"	\
-	"	cachee %1, 0x080(%0); cachee %1, 0x090(%0)	\n"	\
-	"	cachee %1, 0x0a0(%0); cachee %1, 0x0b0(%0)	\n"	\
-	"	cachee %1, 0x0c0(%0); cachee %1, 0x0d0(%0)	\n"	\
-	"	cachee %1, 0x0e0(%0); cachee %1, 0x0f0(%0)	\n"	\
-	"	cachee %1, 0x100(%0); cachee %1, 0x110(%0)	\n"	\
-	"	cachee %1, 0x120(%0); cachee %1, 0x130(%0)	\n"	\
-	"	cachee %1, 0x140(%0); cachee %1, 0x150(%0)	\n"	\
-	"	cachee %1, 0x160(%0); cachee %1, 0x170(%0)	\n"	\
-	"	cachee %1, 0x180(%0); cachee %1, 0x190(%0)	\n"	\
-	"	cachee %1, 0x1a0(%0); cachee %1, 0x1b0(%0)	\n"	\
-	"	cachee %1, 0x1c0(%0); cachee %1, 0x1d0(%0)	\n"	\
-	"	cachee %1, 0x1e0(%0); cachee %1, 0x1f0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#define cache32_unroll32_user(base, op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips0					\n"	\
-	"	.set eva					\n"	\
-	"	cachee %1, 0x000(%0); cachee %1, 0x020(%0)	\n"	\
-	"	cachee %1, 0x040(%0); cachee %1, 0x060(%0)	\n"	\
-	"	cachee %1, 0x080(%0); cachee %1, 0x0a0(%0)	\n"	\
-	"	cachee %1, 0x0c0(%0); cachee %1, 0x0e0(%0)	\n"	\
-	"	cachee %1, 0x100(%0); cachee %1, 0x120(%0)	\n"	\
-	"	cachee %1, 0x140(%0); cachee %1, 0x160(%0)	\n"	\
-	"	cachee %1, 0x180(%0); cachee %1, 0x1a0(%0)	\n"	\
-	"	cachee %1, 0x1c0(%0); cachee %1, 0x1e0(%0)	\n"	\
-	"	cachee %1, 0x200(%0); cachee %1, 0x220(%0)	\n"	\
-	"	cachee %1, 0x240(%0); cachee %1, 0x260(%0)	\n"	\
-	"	cachee %1, 0x280(%0); cachee %1, 0x2a0(%0)	\n"	\
-	"	cachee %1, 0x2c0(%0); cachee %1, 0x2e0(%0)	\n"	\
-	"	cachee %1, 0x300(%0); cachee %1, 0x320(%0)	\n"	\
-	"	cachee %1, 0x340(%0); cachee %1, 0x360(%0)	\n"	\
-	"	cachee %1, 0x380(%0); cachee %1, 0x3a0(%0)	\n"	\
-	"	cachee %1, 0x3c0(%0); cachee %1, 0x3e0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
-
-#define cache64_unroll32_user(base, op)					\
-	__asm__ __volatile__(						\
-	"	.set push					\n"	\
-	"	.set noreorder					\n"	\
-	"	.set mips0					\n"	\
-	"	.set eva					\n"	\
-	"	cachee %1, 0x000(%0); cachee %1, 0x040(%0)	\n"	\
-	"	cachee %1, 0x080(%0); cachee %1, 0x0c0(%0)	\n"	\
-	"	cachee %1, 0x100(%0); cachee %1, 0x140(%0)	\n"	\
-	"	cachee %1, 0x180(%0); cachee %1, 0x1c0(%0)	\n"	\
-	"	cachee %1, 0x200(%0); cachee %1, 0x240(%0)	\n"	\
-	"	cachee %1, 0x280(%0); cachee %1, 0x2c0(%0)	\n"	\
-	"	cachee %1, 0x300(%0); cachee %1, 0x340(%0)	\n"	\
-	"	cachee %1, 0x380(%0); cachee %1, 0x3c0(%0)	\n"	\
-	"	cachee %1, 0x400(%0); cachee %1, 0x440(%0)	\n"	\
-	"	cachee %1, 0x480(%0); cachee %1, 0x4c0(%0)	\n"	\
-	"	cachee %1, 0x500(%0); cachee %1, 0x540(%0)	\n"	\
-	"	cachee %1, 0x580(%0); cachee %1, 0x5c0(%0)	\n"	\
-	"	cachee %1, 0x600(%0); cachee %1, 0x640(%0)	\n"	\
-	"	cachee %1, 0x680(%0); cachee %1, 0x6c0(%0)	\n"	\
-	"	cachee %1, 0x700(%0); cachee %1, 0x740(%0)	\n"	\
-	"	cachee %1, 0x780(%0); cachee %1, 0x7c0(%0)	\n"	\
-	"	.set pop					\n"	\
-		:							\
-		: "r" (base),						\
-		  "i" (op));
+#define cache_unroll(times, insn, op, addr, lsize) do {			\
+	int i =3D 0;							\
+	unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize)));	\
+} while (0)
=20
 /* build blast_xxx, blast_xxx_page, blast_xxx_page_indexed */
 #define __BUILD_BLAST_CACHE(pfx, desc, indexop, hitop, lsize, extra)	\
@@ -539,7 +216,8 @@ static inline void extra##blast_##pfx##cache##lsize(voi=
d)		\
 									\
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)				\
 		for (addr =3D start; addr < end; addr +=3D lsize * 32)	\
-			cache##lsize##_unroll32(addr|ws, indexop);	\
+			cache_unroll(32, kernel_cache, indexop,		\
+				     addr | ws, lsize);			\
 }									\
 									\
 static inline void extra##blast_##pfx##cache##lsize##_page(unsigned long p=
age) \
@@ -548,7 +226,7 @@ static inline void extra##blast_##pfx##cache##lsize##_p=
age(unsigned long page) \
 	unsigned long end =3D page + PAGE_SIZE;				\
 									\
 	do {								\
-		cache##lsize##_unroll32(start, hitop);			\
+		cache_unroll(32, kernel_cache, hitop, start, lsize);	\
 		start +=3D lsize * 32;					\
 	} while (start < end);						\
 }									\
@@ -565,7 +243,8 @@ static inline void extra##blast_##pfx##cache##lsize##_p=
age_indexed(unsigned long
 									\
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)				\
 		for (addr =3D start; addr < end; addr +=3D lsize * 32)	\
-			cache##lsize##_unroll32(addr|ws, indexop);	\
+			cache_unroll(32, kernel_cache, indexop,		\
+				     addr | ws, lsize);			\
 }
=20
 __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D,=
 16, )
@@ -596,7 +275,7 @@ static inline void blast_##pfx##cache##lsize##_user_pag=
e(unsigned long page) \
 	unsigned long end =3D page + PAGE_SIZE;				\
 									\
 	do {								\
-		cache##lsize##_unroll32_user(start, hitop);             \
+		cache_unroll(32, user_cache, hitop, start, lsize);	\
 		start +=3D lsize * 32;					\
 	} while (start < end);						\
 }
@@ -688,7 +367,8 @@ static inline void blast_##pfx##cache##lsize##_node(lon=
g node)		\
 									\
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)				\
 		for (addr =3D start; addr < end; addr +=3D lsize * 32)	\
-			cache##lsize##_unroll32(addr|ws, indexop);	\
+			cache_unroll(32, kernel_cache, indexop,		\
+				     addr | ws, lsize);			\
 }
=20
 __BUILD_BLAST_CACHE_NODE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_=
Inv_SD, 16)
diff --git a/arch/mips/include/asm/unroll.h b/arch/mips/include/asm/unroll.=
h
new file mode 100644
index 000000000000..df1cdcfc5a47
--- /dev/null
+++ b/arch/mips/include/asm/unroll.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_UNROLL_H__
+#define __ASM_UNROLL_H__
+
+/*
+ * Explicitly unroll a loop, for use in cases where doing so is performanc=
e
+ * critical.
+ *
+ * Ideally we'd rely upon the compiler to provide this but there's no comm=
only
+ * available means to do so. For example GCC's "#pragma GCC unroll"
+ * functionality would be ideal but is only available from GCC 8 onwards. =
Using
+ * -funroll-loops is an option but GCC tends to make poor choices when
+ * compiling our string functions. -funroll-all-loops leads to massive cod=
e
+ * bloat, even if only applied to the string functions.
+ */
+#define unroll(times, fn, ...) do {				\
+	extern void bad_unroll(void)				\
+		__compiletime_error("Unsupported unroll");	\
+								\
+	/*							\
+	 * We can't unroll if the number of iterations isn't	\
+	 * compile-time constant. Unfortunately GCC versions	\
+	 * up until 4.6 tend to miss obvious constants & cause	\
+	 * this check to fail, even though they go on to	\
+	 * generate reasonable code for the switch statement,	\
+	 * so we skip the sanity check for those compilers.	\
+	 */							\
+	BUILD_BUG_ON(GCC_VERSION >=3D 40700 &&			\
+		     !__builtin_constant_p(times));		\
+								\
+	switch (times) {					\
+	case 32: fn(__VA_ARGS__); /* fall through */		\
+	case 31: fn(__VA_ARGS__); /* fall through */		\
+	case 30: fn(__VA_ARGS__); /* fall through */		\
+	case 29: fn(__VA_ARGS__); /* fall through */		\
+	case 28: fn(__VA_ARGS__); /* fall through */		\
+	case 27: fn(__VA_ARGS__); /* fall through */		\
+	case 26: fn(__VA_ARGS__); /* fall through */		\
+	case 25: fn(__VA_ARGS__); /* fall through */		\
+	case 24: fn(__VA_ARGS__); /* fall through */		\
+	case 23: fn(__VA_ARGS__); /* fall through */		\
+	case 22: fn(__VA_ARGS__); /* fall through */		\
+	case 21: fn(__VA_ARGS__); /* fall through */		\
+	case 20: fn(__VA_ARGS__); /* fall through */		\
+	case 19: fn(__VA_ARGS__); /* fall through */		\
+	case 18: fn(__VA_ARGS__); /* fall through */		\
+	case 17: fn(__VA_ARGS__); /* fall through */		\
+	case 16: fn(__VA_ARGS__); /* fall through */		\
+	case 15: fn(__VA_ARGS__); /* fall through */		\
+	case 14: fn(__VA_ARGS__); /* fall through */		\
+	case 13: fn(__VA_ARGS__); /* fall through */		\
+	case 12: fn(__VA_ARGS__); /* fall through */		\
+	case 11: fn(__VA_ARGS__); /* fall through */		\
+	case 10: fn(__VA_ARGS__); /* fall through */		\
+	case 9: fn(__VA_ARGS__); /* fall through */		\
+	case 8: fn(__VA_ARGS__); /* fall through */		\
+	case 7: fn(__VA_ARGS__); /* fall through */		\
+	case 6: fn(__VA_ARGS__); /* fall through */		\
+	case 5: fn(__VA_ARGS__); /* fall through */		\
+	case 4: fn(__VA_ARGS__); /* fall through */		\
+	case 3: fn(__VA_ARGS__); /* fall through */		\
+	case 2: fn(__VA_ARGS__); /* fall through */		\
+	case 1: fn(__VA_ARGS__); /* fall through */		\
+	case 0: break;						\
+								\
+	default:						\
+		/*						\
+		 * Either the iteration count is unreasonable	\
+		 * or we need to add more cases above.		\
+		 */						\
+		bad_unroll();					\
+		break;						\
+	}							\
+} while (0)
+
+#endif /* __ASM_UNROLL_H__ */
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4bf990633135..378cbb02dcdd 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -271,12 +271,14 @@ static inline void tx49_blast_icache32(void)
 	/* I'm in even chunk.  blast odd chunks */
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)
 		for (addr =3D start + 0x400; addr < end; addr +=3D 0x400 * 2)
-			cache32_unroll32(addr|ws, Index_Invalidate_I);
+			cache_unroll(32, kernel_cache, Index_Invalidate_I,
+				     addr | ws, 32);
 	CACHE32_UNROLL32_ALIGN;
 	/* I'm in odd chunk.  blast even chunks */
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)
 		for (addr =3D start; addr < end; addr +=3D 0x400 * 2)
-			cache32_unroll32(addr|ws, Index_Invalidate_I);
+			cache_unroll(32, kernel_cache, Index_Invalidate_I,
+				     addr | ws, 32);
 }
=20
 static inline void blast_icache32_r4600_v1_page_indexed(unsigned long page=
)
@@ -302,12 +304,14 @@ static inline void tx49_blast_icache32_page_indexed(u=
nsigned long page)
 	/* I'm in even chunk.  blast odd chunks */
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)
 		for (addr =3D start + 0x400; addr < end; addr +=3D 0x400 * 2)
-			cache32_unroll32(addr|ws, Index_Invalidate_I);
+			cache_unroll(32, kernel_cache, Index_Invalidate_I,
+				     addr | ws, 32);
 	CACHE32_UNROLL32_ALIGN;
 	/* I'm in odd chunk.  blast even chunks */
 	for (ws =3D 0; ws < ws_end; ws +=3D ws_inc)
 		for (addr =3D start; addr < end; addr +=3D 0x400 * 2)
-			cache32_unroll32(addr|ws, Index_Invalidate_I);
+			cache_unroll(32, kernel_cache, Index_Invalidate_I,
+				     addr | ws, 32);
 }
=20
 static void (* r4k_blast_icache_page)(unsigned long addr);
--=20
2.23.0

