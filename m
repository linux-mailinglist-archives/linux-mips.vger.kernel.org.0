Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3123C2A9A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732894AbfI3XK1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:10:27 -0400
Received: from mail-eopbgr710120.outbound.protection.outlook.com ([40.107.71.120]:26432
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732301AbfI3XI0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrqyB217Zsg1jTUFDrycLyvGlkUUcmY5cGzHjbPyQmb9U4aObnVRoRV404M2XganAVPZg6+b/yMRVaYVjuOGcvw0yWSjTdg2Yes8O96UmOeF9IQbYrwuiNNa6i1yiIf0Kanciu39kaLWrFcPfCGgaE9/p/+WR6y/stnBzVOj7D4QwFqWzw464ttxMobTKVdSxC7LOySOtlhwVVzSntXAntfKJvIgSg6IaRtdLHbTtaLAA1bC7PxC2m4ePerSl22/TvkSRNj6A/W6BKGnZxhIreZsrfEiZZ6UuFC/rK5sjDOaq3tzPaMen458hyTt/6+wV6IBYB54s2o3GexuDDdXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm6FPvZH8hxf+zAzpzsntcS0rkuB6XfnOtezk+/vkWA=;
 b=Z7GOS+2ihdFZ4pphBa6UGnZmRJIHHZUUEgJOoVV3Tg7M5tINnkwPNkzjTOz+NyUTDLTMiK1wSb0jNjImkjjTAsdLKMuSLzGBvwXrZNR7QFKbWu1uz6NRhV/jG6Jk+Q2YAhi9dbQsdvTFM4boNtbTk5dYx4tW09u3pU+fMuLmu0eZN7KEz8LCkhQQag+ZDaUHzeZ3ExVeX//yLIjtZQl6nNtqkttUxVw4Q7IQvCUqI9bRgp36BMeMG+AV/lKe6oExbW8z9ETIHRvaKLHjzNJ2H/9tB0qAH+NoqXatvdeGeQ08iIek7frGhkFZ4IAxTTVJ3pyENKtTOUdC2/zDVjn+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm6FPvZH8hxf+zAzpzsntcS0rkuB6XfnOtezk+/vkWA=;
 b=alNIxFLkgxtO30gCg2dyF2xh6SeaIPmV2eELP0cMofJl5PdLh1OnhSwSLATtcSpoYFXbfc45EmR3533/YXSNXgRXj8E0RBo2nDdTb9BV8U2sP6NO7eHCfh8o2DP9plX/qiLdrqNWgmdIEaQZ9s80vaI6cUrwlAmz6bg4HmZsuN4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:24 +0000
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
Subject: [PATCH 12/37] MIPS: atomic: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH 12/37] MIPS: atomic: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVd+P2LHb7bttF2kuoIZMMsxRr2Q==
Date:   Mon, 30 Sep 2019 23:08:24 +0000
Message-ID: <20190930230806.2940505-13-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: b2b90aa2-97df-40b2-2d1a-08d745fb1884
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB17094B763BA5F776B8E560D4C1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(14444005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFcCf4+6fBzEaCN0IeyP6/8d/qYudt+JvKxsIjv1z37/CAKsdqP0WLbZTbpFPy1SWf6/bF7YaILL7hGyAsfphdg1Xdlz3Ju53gr6q9qxK9AabJH8hb35ElVYSbPD99A5he9fPNadoWqDpwWp3ZAyIifdgTP/aIpbNMo7lK4WomzVlVtKwvjGGNQdZaQH2Tz9Cut6u6qIIXiB5pooX0PIp9BJhxpEah7AkivWRJpuOLQVdYuZHz9GzqYXnvuikUsQE8Dwi7c5XxDg1vNeCYp9QplJBgTm83FdJvCsEBMaU7B5GP10GBUay5hwi7i0IXiBqTG5LE2tfzCP5xS/WQPA2PatctMGM84BmoY9BMIYWoyP2YqgHXviE5YUIMSnhnwuHlCrArpjRzuCJ6VRFOZRjd8pkXiQf4bUgX5mCPnm+8o=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b90aa2-97df-40b2-2d1a-08d745fb1884
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:24.8297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjC0DEfcgWtBq3Tx8SsUz1mIiueYr9NZHTe40D8ZICyOTkC4l4RaCoGLFPBVblpN5TAAMzNrPKZTXIDRTg2QLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
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

