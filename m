Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82AC4301
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfJAVxR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:17 -0400
Received: from mail-eopbgr730120.outbound.protection.outlook.com ([40.107.73.120]:2512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728041AbfJAVxR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpw5rkOdN9n3LvgmSuj+Z+YzY1xhW9xdYxnjfM7mmVKiXPJxRrMILeI+ZFc8DCKFdfG1N1Ji2ElogKr9Z428YaRI/Wp7fBsOBftBB3UG8thN/9jnoWu+D4MQhJzJJ4C+KgpDEo9SXcjGjMarCWGLOar7qlfP5vdYEFNpd7BL43Wdn0+uGUI+oKzHP2lNv9Tfx22mofqtHr3EDStHY6RBoHXsdil0SfuFVCJ1pJiSCJMKS2xZhxxE5++/6bL0AnH7klNHaXUagog0zT2rolXLwTTBuPgLqUoxDY2bY3bT7y2Xywt91+6OGYipKdpicLNT0gS33Mm3FmJ5BywSDsTjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5ZgLdYPRBTcgvtPfNv7KwgHqKOev7ZMnWj11NjJxGg=;
 b=nYhAJ5lsYt4MekIA5crRlCi/zRUVc/5AUuVgZWGUYZiUFD+p4H1oGiuVWUXyrcRSl43xmd1jjFHC3h7Pj8CfqKYz+UyCmiYa6Zh/eePky03h40893L118AUxYs6BpstoEhiaHnPFYFUxrDhZNDyImZJS/ZKEwP34r0iH8eIGzo7LSMLP+55Q6uK199quj5TAt5MVmrKYQWBqnG4V+TM9V6/LeTNHd7NOLBOCCFlmkZ0LM0SSDXpx9PoP5x8qkpkK1iIgbMe4DdsaakqfHlbkSuw0bqig+YbIndph34x4/C2qNPSM9R63DUvy4+KCKhiyHToGEZnkt9aNQomN472J+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5ZgLdYPRBTcgvtPfNv7KwgHqKOev7ZMnWj11NjJxGg=;
 b=IcMD8WtWITHiSiS/ylrtRyCEcprBJ1Ol2TNDu7S4X+0xnAifiysFPzyftRBwOTJSlc4/Rqu4hpBiw73vRz1UVnRUibME6AP/5xCqHxuQv3SfFKPAk01TDk9JSbTdcTMnSmNPyc8lBY++3VoizClBepNoLRwrmOKLVqJPGS5BYzs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:08 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:08 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 04/36] MIPS: barrier: Clean up rmb() & wmb() definitions
Thread-Topic: [PATCH v2 04/36] MIPS: barrier: Clean up rmb() & wmb()
 definitions
Thread-Index: AQHVeKKcp1ytqV6lDUWfIgPgu4vc+Q==
Date:   Tue, 1 Oct 2019 21:53:08 +0000
Message-ID: <20191001215249.4157062-5-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e8974825-8baf-498f-d225-08d746b9bf1f
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12131EB9C72F97269177F3F9C19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UCyCNu77ncsgdme9okacj04MFkDblRbxO8RRwzXKK6lz57dQqH6HG4QipUellyNMINUeTeecy8I5UoE/LelV2VOXY53oFZEY204JeRQ2B3D0OMUJBxkMesvmLfTt59nadjl6T1nhaC+WkFJ2qdnC7qWLKYp/dQ5KUQs0y+MFO4YyKDjEm2BAbDGlpcm5XeL9RvHQ66vtXLUSzBzgCyCMwh2Mdk7ZOOk9S+Hm4uKxJYoMoR6aOIllUi7A30i3wJFwc/6BJ1CdlY61fR+vXmugvrdoTsNN5CPDnzMN9pu9XsIsA2JuZd1JKazMaFCapdg4NVLZ9HKLMr21eC+wISL+QAiDXrEX9S6/Sag1NLZTuOU2JYkLsoQaJls1CwAq+vgtcrrtSuW7TVDYZXLWfRoerpgwHfwTO4pasg9Rabvlqy8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8974825-8baf-498f-d225-08d746b9bf1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:08.6881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kkqL1OIGQPy7vZOHUtAhl+UQHuBvcK4czqDmW1bKLZs2CSda6VTzCaktFRsKnTsajDeXjXtPevJsmPU4Ub1ztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Simplify our definitions of rmb() & wmb() using the new __SYNC()
infrastructure.

The fast_rmb() & fast_wmb() macros are removed, since they only provided
a level of indirection that made the code less readable & weren't
directly used anywhere in the kernel tree.

The Octeon #ifdef'ery is removed, since the "syncw" instruction
previously used is merely an alias for "sync 4" which __SYNC() will emit
for the wmb sync type when the kernel is configured for an Octeon CPU.
Similarly __SYNC() will emit nothing for the rmb sync type in Octeon
configurations.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 5ad39bfd3b6d..f36cab87cfde 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -26,6 +26,18 @@
 #define __sync()	do { } while(0)
 #endif
=20
+static inline void rmb(void)
+{
+	asm volatile(__SYNC(rmb, always) ::: "memory");
+}
+#define rmb rmb
+
+static inline void wmb(void)
+{
+	asm volatile(__SYNC(wmb, always) ::: "memory");
+}
+#define wmb wmb
+
 #define __fast_iob()				\
 	__asm__ __volatile__(			\
 		".set	push\n\t"		\
@@ -37,16 +49,9 @@
 		: "m" (*(int *)CKSEG1)		\
 		: "memory")
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
-# define OCTEON_SYNCW_STR	".set push\n.set arch=3Docteon\nsyncw\nsyncw\n.s=
et pop\n"
-# define __syncw()	__asm__ __volatile__(OCTEON_SYNCW_STR : : : "memory")
-
-# define fast_wmb()	__syncw()
-# define fast_rmb()	barrier()
 # define fast_mb()	__sync()
 # define fast_iob()	do { } while (0)
 #else /* ! CONFIG_CPU_CAVIUM_OCTEON */
-# define fast_wmb()	__sync()
-# define fast_rmb()	__sync()
 # define fast_mb()	__sync()
 # ifdef CONFIG_SGI_IP28
 #  define fast_iob()				\
@@ -83,19 +88,14 @@
=20
 #endif /* !CONFIG_CPU_HAS_WB */
=20
-#define wmb()		fast_wmb()
-#define rmb()		fast_rmb()
-
 #if defined(CONFIG_WEAK_ORDERING)
 # ifdef CONFIG_CPU_CAVIUM_OCTEON
 #  define __smp_mb()	__sync()
-#  define __smp_rmb()	barrier()
-#  define __smp_wmb()	__syncw()
 # else
 #  define __smp_mb()	__asm__ __volatile__("sync" : : :"memory")
-#  define __smp_rmb()	__asm__ __volatile__("sync" : : :"memory")
-#  define __smp_wmb()	__asm__ __volatile__("sync" : : :"memory")
 # endif
+# define __smp_rmb()	rmb()
+# define __smp_wmb()	wmb()
 #else
 #define __smp_mb()	barrier()
 #define __smp_rmb()	barrier()
--=20
2.23.0

