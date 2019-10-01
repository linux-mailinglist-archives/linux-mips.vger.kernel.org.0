Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816AAC4305
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbfJAVx0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:26 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728097AbfJAVxZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVS/yz6ktY075wTCOFM3aP0aOjOzzkxNlKZDQ+UmYICT2KECbsRx07pE2XoxxMsUC4vismuWpkFuV3f/NdGiuh7YTjcKG54kzvRdZcSKT9ZgEPk6ZhQ+HSHtYWWKnqlPLv9K0QHgnwTexo0bgZqeqKTfkFbDqzZBh0lwgbN22VGAd9oKfuCLGkIQWeOIPYWmWwe2e839CYcU3agw7Re7m717HOqciNgu2To3hDQKxHCFhhGod8ywuypTJax+a05s76S2s+BmC+qMddPdph0Hl0DPLqdSSkazhk6ScCfilWnOFapxSnRmhE1p237BGe44BPoSaNZbNGnkVKPkAnrxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J30odTe+XebbxzQL8i/yALQ5p9SuUs5yaDqAG4FQBl4=;
 b=fjqKrDF3G/2fmDQB47TT67lQsXMp4krhRR/Apgb/U4T03EJrDj6/mTfYn6gf/5a0RNvI5EfhRsmx8DSc2qyY2RzDhpl3lX2VqbVMMzmTJ+M9KG9lBvhJbztS+W1OHtShQTtMKXKizSkV7/nkSST01yKlnjdFjF3grHn5kOuBRe2ynQA0xMO4AubVc77wg6jQ2v+GDGCYJLMdEc8nzPWnT689BXN17en0R5Bee0rfa49duE8KhktwG8viaflQoz8H2h4yrfzOzBKOohaAZO2ctYRiEX7JgJXWGAOehlYRpSVC7YoAm5wb4Qi4e0Sa7SdhegTJlptn3KN3Y8zM/WdS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J30odTe+XebbxzQL8i/yALQ5p9SuUs5yaDqAG4FQBl4=;
 b=XWSA86CuFoEEgVAnhTFpSxBF0qsoxwiRdOi/vDHAc2aKDNedbLflDTXcWhLK3oH9QAwHXZpbst9JERxJzw490xi4ka7715HNFi8i74qFq+rwWA8Z70BZv2WEL3Ec9zwejxV4Wg8HtVFl7adsiJZgtLSyd3MP6eoBFBsWK/AmDTo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:20 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:20 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 12/36] MIPS: atomic: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH v2 12/36] MIPS: atomic: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVeKKjF/6Q5rRGb0K/TMnkoH0pMw==
Date:   Tue, 1 Oct 2019 21:53:20 +0000
Message-ID: <20191001215249.4157062-13-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: ca7395f4-4828-4b47-d562-08d746b9c61e
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14393F3B7E841AD3C4445316C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rHRrDQXCVg7JxC3pCmxsRUaQLQDWtfdgda9Af9+smRLwkbuIxCv5RtgDFQcEZNpgkhHkDS5MdEvOGLL9Lta6PDHP9EhPtz0Y6E7bFS0NooA8Ew4u+Nw/7eOnyiF1OfuVLfVpEyA/IklRRvRegnPdQL+HOSbWYuvrRt3C/E5yyLPkKhnk7iInDv7QFkdu9Ex8dmmP+jIzx1/1I3WlNZ7HlgKjDqKeXvGRvTpgS+RTLQDDyUfmVI1gNfFT2RVtD686oJdgCX1/Qu+xN2Wya6l0lsbhdJqD3cSotvA3CpgH6FcyyVmzrsX4bHH7QUflsU1OMjAiOFXR1BPsgFbBi/F70PBsCeBot60VV2HxYZNPW1+DyLZpN8mpEEy4c1IhZRxjq/W7xbT6nZbAkigLT8lB/ifIwSsbefqGXljt22LGPf0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7395f4-4828-4b47-d562-08d746b9c61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:20.4087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12gd/BhFbsEk5J8yx4q284umlN2xPxNLrlBTtG9pLHLo5NLBgZD+pasS8nO6ueXKdSLgG1kuepqjKZM5hN5njA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
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

 arch/mips/include/asm/atomic.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index b834af5a7382..841ff274ada6 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -21,6 +21,7 @@
 #include <asm/cpu-features.h>
 #include <asm/cmpxchg.h>
 #include <asm/llsc.h>
+#include <asm/sync.h>
 #include <asm/war.h>
=20
 #define ATOMIC_INIT(i)	  { (i) }
@@ -56,10 +57,10 @@ static __inline__ void pfx##_##op(type i, pfx##_t * v)	=
		\
 		return;							\
 	}								\
 									\
-	loongson_llsc_mb();						\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" __SYNC(full, loongson3_war) "			\n"	\
 	"1:	" #ll "	%0, %1		# " #pfx "_" #op "	\n"	\
 	"	" #asm_op " %0, %2				\n"	\
 	"	" #sc "	%0, %1					\n"	\
@@ -85,10 +86,10 @@ static __inline__ type pfx##_##op##_return_relaxed(type=
 i, pfx##_t * v)	\
 		return result;						\
 	}								\
 									\
-	loongson_llsc_mb();						\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" __SYNC(full, loongson3_war) "			\n"	\
 	"1:	" #ll "	%1, %2		# " #pfx "_" #op "_return\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	" #sc "	%0, %2					\n"	\
@@ -117,10 +118,10 @@ static __inline__ type pfx##_fetch_##op##_relaxed(typ=
e i, pfx##_t * v)	\
 		return result;						\
 	}								\
 									\
-	loongson_llsc_mb();						\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" __SYNC(full, loongson3_war) "			\n"	\
 	"1:	" #ll "	%1, %2		# " #pfx "_fetch_" #op "\n"	\
 	"	" #asm_op " %0, %1, %3				\n"	\
 	"	" #sc "	%0, %2					\n"	\
@@ -200,10 +201,10 @@ static __inline__ int atomic_sub_if_positive(int i, a=
tomic_t * v)
 	if (kernel_uses_llsc) {
 		int temp;
=20
-		loongson_llsc_mb();
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_LEVEL"			\n"
+		"	" __SYNC(full, loongson3_war) "			\n"
 		"1:	ll	%1, %2		# atomic_sub_if_positive\n"
 		"	.set	pop					\n"
 		"	subu	%0, %1, %3				\n"
@@ -213,7 +214,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 		"	.set	"MIPS_ISA_LEVEL"			\n"
 		"	sc	%1, %2					\n"
 		"\t" __SC_BEQZ "%1, 1b					\n"
-		"2:							\n"
+		"2:	" __SYNC(full, loongson3_war) "			\n"
 		"	.set	pop					\n"
 		: "=3D&r" (result), "=3D&r" (temp),
 		  "+" GCC_OFF_SMALL_ASM() (v->counter)
@@ -229,7 +230,14 @@ static __inline__ int atomic_sub_if_positive(int i, at=
omic_t * v)
 		raw_local_irq_restore(flags);
 	}
=20
-	smp_llsc_mb();
+	/*
+	 * In the Loongson3 workaround case we already have a completion
+	 * barrier at 2: above, which is needed due to the bltz that can branch
+	 * to code outside of the LL/SC loop. As such, we don't need to emit
+	 * another barrier here.
+	 */
+	if (!__SYNC_loongson3_war)
+		smp_llsc_mb();
=20
 	return result;
 }
--=20
2.23.0

