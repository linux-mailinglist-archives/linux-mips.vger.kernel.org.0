Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A93CBC441A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 01:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfJAXEh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 19:04:37 -0400
Received: from mail-eopbgr700103.outbound.protection.outlook.com ([40.107.70.103]:24961
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726050AbfJAXEg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 19:04:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD3HWGUByGl+NME568rQI8ale5LCKT/Z/FAEEYzJcU/uvOitfvgdXni5s0vucqIfQJw+OhAdHIAroKuh2AZY2Q9wV4AJuYwChgodhZegdV+bxsef/dEU8kZAZh1lXufZGjH4n7qF6X4N3BA2ZcuRP/SPE6hCOV1EAHgnFNS/rNA/UsZXKeZnq4RRUfIWTQP5Vjd6MNyH7LtoJech6yqUwtTJYLeL2pDpoN0oH0L2BGIoU+nFk2A/Bu4wyycup6lhMQ0b2Mual3drr58tLPwYfZxsvhD20ZH6wv9Edb7ZsuEQvu+4It/dCHJv/UTuT37v8Kwpub91EEWBh8AicuFWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4s1uKHknWrWg7+tKT4n0L4s4gxr5xlP+7VbtuFDPSE=;
 b=IoV9XkG3+nAzBQ8CMsyTlhPlNFWBDu5t31jBrulRUzN6Q/n2vgvgP7hVaweSUPPFwPwpZMEiZTyuVnqJAey002WfzwuI4BX2M/sSaGfvwvxObUIDB0U4ugXUolfTwaODgYHj63W5M4v2BeOnzUNZXwxVa4ZEOnh8mf4SgnvZXFK2yc9ti/z/C3HlWziHqB4UrBcbumO21qOm3NmKDQezqla1Q+4NLkdV+UWJ8ZNME1OAgxmT3MtFE23r6nAmccIK+IFex8OJF0/9TMiDKX5aNm5029fSm9QcOHte3oxRmbYVY3E6Uaqp25gXdOo/9+evzjo5rG8X++AKXI2CYv36Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4s1uKHknWrWg7+tKT4n0L4s4gxr5xlP+7VbtuFDPSE=;
 b=VTT0kJVQvsK3wV6rG1f0oZrE11TTEwroxxgoy9U8zpLxL5xmkvN19GHbiPa63LYx/gKUKeiuj1VeXaGa8vvIWsCdp+lPUdQUr7jQ3swJjqDXkNZWqnEtO3/rdbZ3U4lfMnrHts8GRAeqtPUUX6w0SG8EIxOIAY7zhTVtne/hIuA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.22; Tue, 1 Oct 2019 23:04:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 23:04:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 1/2] MIPS: r4k-bugs64: Limit R4k bug checks to affected
 systems
Thread-Topic: [PATCH 1/2] MIPS: r4k-bugs64: Limit R4k bug checks to affected
 systems
Thread-Index: AQHVeKyVHe6LsfVCvkuqMlkkqP8DBA==
Date:   Tue, 1 Oct 2019 23:04:32 +0000
Message-ID: <20191001230423.70119-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [73.93.153.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74749d61-973a-43ea-4da7-08d746c3b844
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1232A09B472EB417CE19A61BC19D0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(39850400004)(346002)(396003)(199004)(189003)(50226002)(1076003)(486006)(256004)(5660300002)(14444005)(42882007)(6436002)(5640700003)(7736002)(476003)(305945005)(14454004)(44832011)(6512007)(99286004)(6116002)(3846002)(2351001)(386003)(6506007)(2906002)(26005)(2616005)(52116002)(102836004)(71200400001)(186003)(71190400001)(66066001)(66946007)(36756003)(66476007)(66556008)(64756008)(8676002)(66446008)(4326008)(2501003)(25786009)(81166006)(81156014)(316002)(107886003)(478600001)(6486002)(8936002)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFgToO6GcgfYhxDhva9268I9HaVn+bFvlYvVBf/v09f+t2YUrD36xBSVhCH0I47cwvIqWGs5K90BauK+xLr1HeVxV9NEa/8b4dhWe5x3MCTLnFnd/bKXE3mD7VnF1t+GUGVtBoXD60d71I6hBYSN984th6hv0vXZ7bpWf/F4rarmt+CXIyWmqSkjThfIfIMYXacAaXO/louE9e7fExwUy2Cu7MVin+KFwLE/iB/Uc6xvzLJAnFb7icNgtdbZFwT9jaMWiSCKWKsi4u/JyW82IXtjekJc5gvpCsmiH8UA2WBTBfoCQs6iMz/MpWywnkJXd6pQ0BJImsddEQlGUtB6+HjqO8H4g2NnmfAkgbE7MkeWuF0fEyzf0fT7GC/JW7SXgxbPU/xgIIlGquopKeUFTek8wFmhNWcs/GXlsexg/Ng=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74749d61-973a-43ea-4da7-08d746c3b844
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 23:04:32.1674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7K2wgI0fNjplEq6G5GbTypOVxy7JSf/0nkhG9+AyZ92VmLSIgo1eulJi6xfJOuX0g/wY5IdRTof/Ls3/bum5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Only build the checks for R4k errata workarounds if we expect that the
kernel might actually run on a system with an R4k CPU - ie.
CONFIG_SYS_HAS_CPU_R4X00=3Dy & we're targeting a pre-MIPSr1 ISA revision.

Rename cpu-bugs64.c to r4k-bugs64.c to indicate the fact that the code
is specific to R4k CPUs.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig                              |  4 ++++
 arch/mips/include/asm/bugs.h                   | 18 ++++++++----------
 arch/mips/kernel/Makefile                      |  2 +-
 arch/mips/kernel/genex.S                       |  2 +-
 .../mips/kernel/{cpu-bugs64.c =3D> r4k-bugs64.c} |  0
 5 files changed, 14 insertions(+), 12 deletions(-)
 rename arch/mips/kernel/{cpu-bugs64.c =3D> r4k-bugs64.c} (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a0bd9bdb5f83..8736bf4420bc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2554,6 +2554,10 @@ config CPU_R4000_WORKAROUNDS
 config CPU_R4400_WORKAROUNDS
 	bool
=20
+config CPU_R4X00_BUGS64
+	bool
+	default y if SYS_HAS_CPU_R4X00 && 64BIT && (TARGET_ISA_REV < 1)
+
 config MIPS_ASID_SHIFT
 	int
 	default 6 if CPU_R3000 || CPU_TX39XX
diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d8ab8b7129b5..d72dc6e1cf3c 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -26,9 +26,8 @@ extern void check_bugs64(void);
=20
 static inline void check_bugs_early(void)
 {
-#ifdef CONFIG_64BIT
-	check_bugs64_early();
-#endif
+	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
+		check_bugs64_early();
 }
=20
 static inline void check_bugs(void)
@@ -37,19 +36,18 @@ static inline void check_bugs(void)
=20
 	cpu_data[cpu].udelay_val =3D loops_per_jiffy;
 	check_bugs32();
-#ifdef CONFIG_64BIT
-	check_bugs64();
-#endif
+
+	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
+		check_bugs64();
 }
=20
 static inline int r4k_daddiu_bug(void)
 {
-#ifdef CONFIG_64BIT
+	if (!IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
+		return 0;
+
 	WARN_ON(daddiu_bug < 0);
 	return daddiu_bug !=3D 0;
-#else
-	return 0;
-#endif
 }
=20
 #endif /* _ASM_BUGS_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 89b07ea8d249..d6e97df51cfb 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_KGDB)		+=3D kgdb.o
 obj-$(CONFIG_PROC_FS)		+=3D proc.o
 obj-$(CONFIG_MAGIC_SYSRQ)	+=3D sysrq.o
=20
-obj-$(CONFIG_64BIT)		+=3D cpu-bugs64.o
+obj-$(CONFIG_CPU_R4X00_BUGS64)	+=3D r4k-bugs64.o
=20
 obj-$(CONFIG_I8253)		+=3D i8253.o
=20
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index efde27c99414..d586cdac9605 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -657,7 +657,7 @@ isrdhwr:
 	.set	pop
 	END(handle_ri_rdhwr)
=20
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_CPU_R4X00_BUGS64
 /* A temporary overflow handler used by check_daddi(). */
=20
 	__INIT
diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
similarity index 100%
rename from arch/mips/kernel/cpu-bugs64.c
rename to arch/mips/kernel/r4k-bugs64.c
--=20
2.23.0

