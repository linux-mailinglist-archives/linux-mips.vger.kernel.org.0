Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5DF70C39
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 00:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbfGVWAG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 18:00:06 -0400
Received: from mail-eopbgr690127.outbound.protection.outlook.com ([40.107.69.127]:58497
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbfGVWAF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 18:00:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRQFsZR8XxXNm3dvcUXR7BQjJj9d7t/lZczDkiNPv6XLHAXomrhz9snkKgz7iIkC0YJaTfQmLJpJx2a1f3Qii/sXJQLVJCoa3UNUbPw1g0T+9mxsTizjoo4/Vh+IP/LPhMxm1Mn/IyYUROR1uj+G7/k7UfvJghfu6BNMGqvb0yIS3G9JmiUXe7UwIXIlo12rAnlc3GaR1zM6H8oO57akYNJntrOSzb8qIyBgq6VfX20qJAt2YZ6XS0cQdKUbAA5wiOTMHK3y5c4JnscQ6XqP9X7GAMZs7jVk37n12q63BB0/y0Fc6dU2uYuwc+KRoYfZDyeDitullcG/sYoOUMyQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5A06+SrX6+aqjWpow4sahxxRBNUdDM4+P7w6rYPTUg=;
 b=XLNkFvling7c4dtZr+1kHZQPYShWDs3qW6GGVRJtupL+Ic+p7hlPv1xe95euW6lQrunYCFDVqkCFK/LO0GSIZMSCf/pCgZtZ535711xwTIP3yyfBU2K1McWD8rtgTXROuth3kbJTBUbBeqRvA6HgyXKPxvb/kNO+ZAxn3FMMltfrCVN5j6rhpyqzrcbCJtQ8giHiL46c3x8As8tVQyWrQtfuLWfL531dKcCs5GtqDjoeWGWzJrJEO3dlk162lRypumxUBIDGDlUJnFYCazXRAWsn45mQoBub2pBy07OAGMyUcwZPJLtdiMcZ5/BrhUlS5Z/k6DPmXVWpjizHPKP2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5A06+SrX6+aqjWpow4sahxxRBNUdDM4+P7w6rYPTUg=;
 b=XHosIUhuEwg552oZVWaYTJcLjdVgzTx77cZMZtJD6UMdy3DGC/eR1+ly6sjYrnjt/4kP1bWzAg7ssZRpdkYTpgYOKE9bEtjwMCp6HMW4kBO1yxwhb7qu6/ssCJSNHWsy0ckT+RPftIR85VvdHAnUHrSHOC26SrbbjIi4g7p48iE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 22:00:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 22:00:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 3/4] MIPS: Remove unused R5432_CP0_INTERRUPT_WAR
Thread-Topic: [PATCH 3/4] MIPS: Remove unused R5432_CP0_INTERRUPT_WAR
Thread-Index: AQHVQNjP3MyiinLTTU29vU++kcUjHQ==
Date:   Mon, 22 Jul 2019 22:00:00 +0000
Message-ID: <20190722215705.20109-3-paul.burton@mips.com>
References: <20190722215705.20109-1-paul.burton@mips.com>
In-Reply-To: <20190722215705.20109-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:a03:80::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12449650-65e5-4ed2-681a-08d70eefef65
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB118433D394A88A2A431ABEFCC1C40@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(376002)(39840400004)(366004)(199004)(189003)(2351001)(6436002)(4326008)(316002)(99286004)(66066001)(6916009)(107886003)(2906002)(6512007)(68736007)(386003)(478600001)(66946007)(36756003)(44832011)(7736002)(66476007)(66556008)(66446008)(64756008)(5640700003)(305945005)(25786009)(8936002)(6486002)(53936002)(446003)(50226002)(5660300002)(1076003)(102836004)(14444005)(186003)(256004)(8676002)(2501003)(42882007)(81156014)(26005)(81166006)(14454004)(476003)(76176011)(486006)(71190400001)(71200400001)(11346002)(6116002)(3846002)(6506007)(2616005)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J2pNLvvr1AB/XxzLmffsHgD83uYiFSaqFEaGcVkyv+uuEStdQhzAZJlyd1ZbMZWVYNJTbW/jE+DGlgoD8BNBSiI+4+mkstOLvcdfnQMgomwd4VN+AH+I0nvtISDA/99saF17QKXkWU/UrapH+5+cDdA+i7JMvXyzBIzsVqgAACm5ysEcNq1xFlveeN7nIWYBXhOPRJCjlRly+Zyy7ghpe0cXeVpZV232G0hH5uWTuHQnVJzpR6LEGKaps3aAfIS59vc+9zg8kALmQxt7ausZzh7NkB6ac71ULZvFDYGVk/6+KxuEEsMKxoX7zux3iIU9vnIST7umwRMqd5yBnwK3TlY2kHtsg6aUDX1dttWEWh/1Bm2wI3JW/xubzsbApQIvLdzgw8LkADFLQ/MOEKISt1mrrGGdNWj7/XZkCFyKtlI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12449650-65e5-4ed2-681a-08d70eefef65
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 22:00:00.9998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1184
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

R5432_CP0_INTERRUPT_WAR is defined as 0 for every system we support, and
so the workaround is never used. Remove the dead code.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/mach-cavium-octeon/war.h |  1 -
 arch/mips/include/asm/mach-generic/war.h       |  1 -
 arch/mips/include/asm/mach-ip22/war.h          |  1 -
 arch/mips/include/asm/mach-ip27/war.h          |  1 -
 arch/mips/include/asm/mach-ip28/war.h          |  1 -
 arch/mips/include/asm/mach-ip32/war.h          |  1 -
 arch/mips/include/asm/mach-malta/war.h         |  1 -
 arch/mips/include/asm/mach-pmcs-msp71xx/war.h  |  1 -
 arch/mips/include/asm/mach-rc32434/war.h       |  1 -
 arch/mips/include/asm/mach-rm/war.h            |  1 -
 arch/mips/include/asm/mach-sibyte/war.h        |  1 -
 arch/mips/include/asm/mach-tx49xx/war.h        |  1 -
 arch/mips/include/asm/war.h                    | 13 -------------
 arch/mips/kernel/genex.S                       |  3 ---
 14 files changed, 28 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/inc=
lude/asm/mach-cavium-octeon/war.h
index 35c80be92207..2421411b7636 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -12,7 +12,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-generic/war.h b/arch/mips/include/a=
sm/mach-generic/war.h
index a1bc2e71f983..f0f4a35d0870 100644
--- a/arch/mips/include/asm/mach-generic/war.h
+++ b/arch/mips/include/asm/mach-generic/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip22/war.h b/arch/mips/include/asm/=
mach-ip22/war.h
index fba640517f4f..b48eb4ac362d 100644
--- a/arch/mips/include/asm/mach-ip22/war.h
+++ b/arch/mips/include/asm/mach-ip22/war.h
@@ -15,7 +15,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	1
 #define R4600_V1_HIT_CACHEOP_WAR	1
 #define R4600_V2_HIT_CACHEOP_WAR	1
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/include/asm/=
mach-ip27/war.h
index 4ee0e4bdf4fb..ef3efce0094a 100644
--- a/arch/mips/include/asm/mach-ip27/war.h
+++ b/arch/mips/include/asm/mach-ip27/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/include/asm/=
mach-ip28/war.h
index 4821c7b7a38c..61cd67354829 100644
--- a/arch/mips/include/asm/mach-ip28/war.h
+++ b/arch/mips/include/asm/mach-ip28/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-ip32/war.h b/arch/mips/include/asm/=
mach-ip32/war.h
index 9807ecda5a88..e77b9d1b6c96 100644
--- a/arch/mips/include/asm/mach-ip32/war.h
+++ b/arch/mips/include/asm/mach-ip32/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/include/asm=
/mach-malta/war.h
index d068fc411f47..d62d2ffe515e 100644
--- a/arch/mips/include/asm/mach-malta/war.h
+++ b/arch/mips/include/asm/mach-malta/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	1
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/war.h b/arch/mips/incl=
ude/asm/mach-pmcs-msp71xx/war.h
index a60bf9dd14ae..31c546f58bb5 100644
--- a/arch/mips/include/asm/mach-pmcs-msp71xx/war.h
+++ b/arch/mips/include/asm/mach-pmcs-msp71xx/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/include/a=
sm/mach-rc32434/war.h
index 1bfd489a3708..af430d26f713 100644
--- a/arch/mips/include/asm/mach-rc32434/war.h
+++ b/arch/mips/include/asm/mach-rc32434/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	1
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/include/asm/ma=
ch-rm/war.h
index a3dde98549bb..eca16d167c2f 100644
--- a/arch/mips/include/asm/mach-rm/war.h
+++ b/arch/mips/include/asm/mach-rm/war.h
@@ -15,7 +15,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	1
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/include/as=
m/mach-sibyte/war.h
index 520f8fc2c806..4755b6116807 100644
--- a/arch/mips/include/asm/mach-sibyte/war.h
+++ b/arch/mips/include/asm/mach-sibyte/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
=20
 #if defined(CONFIG_SB1_PASS_2_WORKAROUNDS)
=20
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/include/as=
m/mach-tx49xx/war.h
index a8e2c586a18c..445abb4eb769 100644
--- a/arch/mips/include/asm/mach-tx49xx/war.h
+++ b/arch/mips/include/asm/mach-tx49xx/war.h
@@ -11,7 +11,6 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define R5432_CP0_INTERRUPT_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
diff --git a/arch/mips/include/asm/war.h b/arch/mips/include/asm/war.h
index 9344e247a6c8..1eedd596a064 100644
--- a/arch/mips/include/asm/war.h
+++ b/arch/mips/include/asm/war.h
@@ -128,19 +128,6 @@
 #error Check setting of R4600_V2_HIT_CACHEOP_WAR for your platform
 #endif
=20
-/*
- * When an interrupt happens on a CP0 register read instruction, CPU may
- * lock up or read corrupted values of CP0 registers after it enters
- * the exception handler.
- *
- * This workaround makes sure that we read a "safe" CP0 register as the
- * first thing in the exception handler, which breaks one of the
- * pre-conditions for this problem.
- */
-#ifndef R5432_CP0_INTERRUPT_WAR
-#error Check setting of R5432_CP0_INTERRUPT_WAR for your platform
-#endif
-
 /*
  * Workaround for the Sibyte M3 errata the text of which can be found at
  *
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 398b905b027d..efde27c99414 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -32,9 +32,6 @@
 NESTED(except_vec3_generic, 0, sp)
 	.set	push
 	.set	noat
-#if R5432_CP0_INTERRUPT_WAR
-	mfc0	k0, CP0_INDEX
-#endif
 	mfc0	k1, CP0_CAUSE
 	andi	k1, k1, 0x7c
 #ifdef CONFIG_64BIT
--=20
2.22.0

