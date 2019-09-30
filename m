Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBFE5C2A5C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732709AbfI3XJF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:05 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732650AbfI3XI7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsz5hlypEcliCG08pwWFFJfGYGe6Z5JOF+R5F6002pY45qF0mGP+CbJB1l7BTFMAZBjiXCa127lP3/ODZ1J9Wnolrw2M89sYvlhqTNXcQRzbcy08vDKBEjuvUiPEHlt1vaHAE97YA5mjhjKsMLfsm7NnfrgoU2wD6PFrWWyM/2DEtPQN1WrvyXmHYjtnInBqnG4fLCXiTUinQa5Y16C+QhLcR0Roo9ppyiROJdVmbsCEqwozXY8ktCUgLgJ7pmjFLbzkmj0LoHlf56vEcrCGWAvMKFEePyCgde0+bkYRUSZy9e03kLF4QWJcdWbMRIhqk0tQSw5ULom5+UsTZmiYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6/Ez4vkXZURVDHG/O+B8Niebtwqn0sJ7vIuPvLgslk=;
 b=ho07t5t88Hw/QT3+FiBXDpgEoF3+5Kdw3J6WW4K+KxNu9RhI7KbBn18IvL3pGolfu9O4irxLy+kafkASOs5QbajAMdgdbXQh+NajBcWHnP/qkAe4kw3/SGaKez/ifgzbytqx+4jrrOpJjYO83EHiX6zDSYka44sUbKPmZuCfnZtbLdAw0Dby00/SniLnLnqfv7bH3JEEM86xlekvuD0r1be0zoaNiondXZ0YiokSf5Uwpp/CfD/JcpCxRgapIhJ0wJP5tTq99JHzxq0YB0XoVf9dJik8F+ZySZUGY0iUI0nTX7OQjJiNl1DanOhNhG9yRGEK2qMsDD2LBd6hZQDKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6/Ez4vkXZURVDHG/O+B8Niebtwqn0sJ7vIuPvLgslk=;
 b=pUve4ULpiuNEVUaMCXiMmzZSlWRAdJiB2n4NC4f6EcPMWxHuVPeRpubHb7x/ubpbmNdYwBqE8InT0vVLBF+BGyuWkQgrEs0A4cmNPaxJOOdeQ4248r9e9gJ0tcOWrLUQtiwKKYOibtJbn0XI5zbs7/xPgNq+x32Mz6E/pp01ot0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 29/37] MIPS: cmpxchg: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH 29/37] MIPS: cmpxchg: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVd+P+ax0/6CFtlkmWfuxHQZzrbQ==
Date:   Mon, 30 Sep 2019 23:08:39 +0000
Message-ID: <20190930230806.2940505-30-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: bb85eca4-3ecc-4d76-728d-08d745fb213a
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022D4C901B759E12D995989C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(133343001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNsP2bWBUOyUlvZjUirbVNntXhox8XIr247t+ZkRbLMGP16VHiosYBMNWzdjP4ZGroze98LSu2wd3xSZTxvX80PQIlUCzSSvvFRZmoux+s2FbiFWZhxm5cYElprfH3y9vkNWdbE8Ks8dMCClSs+7fIQXFgaEf3j0g33T7WazcJnnbfMVibGWzhJjrgRdOihML7oJ3vZEVvf5kNfj5q9ka2g7WRBh2+pcMqFrT41fbOx2kO6xdle73NcuyGzBuvAf5hUQCAz9OUSCarS2+x7qwjkJp5xt1Mcy5e1qVzGYgxGeaNTEfn3CHIVQp9HeOAokMtxy3QIyXZqEEZ85IKw3XF7BGCRi0WDmAPeUUhxlNKg07fCM8TyODoIZwTMdLJX+L9YK2N32sdks44IKO4oYZR8c4V2wJ13Yw9S71JbGVtQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb85eca4-3ecc-4d76-728d-08d745fb213a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:39.4730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQG1Y9ojiTOYrt1ajS3NjVcOwt2fczA4W0z7xyBB371lvjOX4uY9JxKCLQusOQSLe1B4taFCXT60SIqPafJGUw==
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

