Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C39C2A7C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732765AbfI3XJV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:21 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732672AbfI3XJU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1qcQNtRSgZshGrTX6zvHOPr9mhrlogJ6+NF1KgdW9RqT7CjpE4U71I1Xg6JnThf6RYoK2Xtgy+/gaw2iU9ggj8lzkNtc8+jZWBVCaPDPCtnkYXyJg+1i7Fhv3EWlTR8fXnjYzbl9ts5F+L3MpXU0s8lVYIySkVsVZ96qBYMla6a1vSWlTBAJyXPO/vFV4fbdoljfEtgqmLA53B+a2dIf+eoqH4zA+FJfH5UerKYRfIpdI5uth0H5LSfT1w9MkXMiUGrTT0FUu7AdMgQW7OySWLWhcPSv3SGvHhEQYOoZd8j8b3l4JhmL4GADHNytEbljbKesGp+M2v0p0pU380WoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0SLHaYaFGFzK6n/63oO+4z01N7bEclUItN7ToHZMX4=;
 b=EbmcaPOyfeJW4v7TWJ6JLtwAUqdSOnhk8hyNHQf6YtQvPGAu9B6fQ/65tTicZ1sAXbnLewrA0X5Dnz8/IrCzkBqXW5+MUm8bUoh2xEw+LbuQD1GvUfyrpl8vgKIdKC7f8Dv4K81Mz8CfejxigNPPicWaO/08xSyEnNMc2dzcabqfcduGprnpznZgVXdGaLa4J2jgM7yoRCFARvp2LH+rfjQ2sxxugpErnLLjrYINHQwBVmqIrYtPs8kmwnvfjbKLsO1JBcAWMvi7RNQ2Yz2t1IvY0yHfEjTSmIjuCjrAEnblv83ECr96F6jqAVDQlbY8ctZaGnMxr8UNsOe5vqz3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0SLHaYaFGFzK6n/63oO+4z01N7bEclUItN7ToHZMX4=;
 b=jeFB7g9n+4lyoFwvIMefS/35FikGhY4MAat1hTMF3p8QzUczfja2OFvcLnGlINshju0JBTJLnjYJEPUkmppn8vXB79YZcpfHssbT4oQV3Sdcy+fLaBbiXoMJ4JLsdkaeZRZOfKm7+pGqH2oo0E3cDXTjZBBvVDF9mvZRPYTCOqQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:10 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:10 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 31/37] MIPS: futex: Emit Loongson3 sync workarounds within asm
Thread-Topic: [PATCH 31/37] MIPS: futex: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVd+P/6LGFBO66C0WgJGpQYiO+9w==
Date:   Mon, 30 Sep 2019 23:08:41 +0000
Message-ID: <20190930230806.2940505-32-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 4ff78ddf-ae98-4eca-5e4a-08d745fb2255
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022AD09B723C2797D1599CEC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FYC4ZXZLIfUFKlE/zWT3YFbQMYUYTz6OxA6V1bI2bJe5k0wFlOMbV+CT0mvbhOroeU74Enljg0edMim7u/T9KZG5zeM75zZepPrFfEh1OoI0pitZDyx583Oq425WlOtIOwmpNy23UsZyBPV08eEBEPMP72qumF9xe9Qb5BAL0VXENz6633X63YD1jAbHvegOp6CRbNhp8nJpyXNF2p/WRrj6Zn5e6KnWoAvDhlhzVLhIdGU0Yg+pxI9bE8+8dgyZrzSNYs/b+YtzjlFD9CpHOQJh6qcZT9GnpBTiTz47CtQIL3yJ37c5LXnmSAptLrieh3YLlmWNJ2dJafpRvBgGTJAh3CwY4UpeOiUgFoBLHHaANPlBumxnaBRAabYBAJzFDSpnG+E5HnTycapeyctWlUoOVemjlcr67vrua53WGNM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff78ddf-ae98-4eca-5e4a-08d745fb2255
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:41.3771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHu5Ny7z/f+IPEXnw6PdwwzvtlEHSgaftshCG3I7V7K/jHTgjl3CoKTnhRFFDQQSHaWGOuNBN9BwWE28GXzUzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/futex.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index b83b0397462d..45c3e3652f48 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -16,6 +16,7 @@
 #include <asm/barrier.h>
 #include <asm/compiler.h>
 #include <asm/errno.h>
+#include <asm/sync.h>
 #include <asm/war.h>
=20
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
@@ -50,12 +51,12 @@
 		  "i" (-EFAULT)						\
 		: "memory");						\
 	} else if (cpu_has_llsc) {					\
-		loongson_llsc_mb();					\
 		__asm__ __volatile__(					\
 		"	.set	push				\n"	\
 		"	.set	noat				\n"	\
 		"	.set	push				\n"	\
 		"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"	\
+		"	" __SYNC(full, loongson3_war) "		\n"	\
 		"1:	"user_ll("%1", "%4")" # __futex_atomic_op\n"	\
 		"	.set	pop				\n"	\
 		"	" insn	"				\n"	\
@@ -164,13 +165,13 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *=
uaddr,
 		  "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
-		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"# futex_atomic_cmpxchg_inatomic			\n"
 		"	.set	push					\n"
 		"	.set	noat					\n"
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
+		"	" __SYNC(full, loongson3_war) "			\n"
 		"1:	"user_ll("%1", "%3")"				\n"
 		"	bne	%1, %z4, 3f				\n"
 		"	.set	pop					\n"
@@ -178,8 +179,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 		"2:	"user_sc("$1", "%2")"				\n"
 		"	beqz	$1, 1b					\n"
-		__WEAK_LLSC_MB
-		"3:							\n"
+		"3:	" __SYNC_ELSE(full, loongson3_war, __WEAK_LLSC_MB) "\n"
 		"	.insn						\n"
 		"	.set	pop					\n"
 		"	.section .fixup,\"ax\"				\n"
@@ -194,7 +194,6 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
 		: GCC_OFF_SMALL_ASM() (*uaddr), "Jr" (oldval), "Jr" (newval),
 		  "i" (-EFAULT)
 		: "memory");
-		loongson_llsc_mb();
 	} else
 		return -ENOSYS;
=20
--=20
2.23.0

