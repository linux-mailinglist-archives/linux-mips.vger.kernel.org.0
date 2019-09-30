Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECBD9C2A4F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbfI3XIo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:44 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732613AbfI3XIn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS9eys8wfHo6jTIju2NX8oBMShKpAbswepAE2e2yVC9YK94mOh6b76SG+Kbem18RGAh1WaE2Qo52dUqZt/sp7huXPWierIPoYrdV9soL8Pz5JaB3UHAfuFN+/WzDG1W2J6XYfcEoj/nfihiMx6BN1JbsDw22FughdwjllRzGU/CvLEnRs0ktcU+6q+fJaqCoZLaOLixcYta+3MiGc+RCv73DtU+fIcVtlof7LdkhzVcm/wiyu0KRv7+9CCKptS6Pq6bvmUxe6DqwdnhA0SMRibavWNZQ8LgcTFT8Al0FBJyC0rz++psRkVwvfRMXEeSa1WUm4CkVr64MCBP4tqBwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSyB7GHykUnfUEZB4BGbdX9bewQ3q5pARr130wTJK3g=;
 b=JgDTy5dw4mOysjif7XhAICgzffXiTTqixHeFBk78WF+CkUcuCpk7V/psscj/BYfWXDQ0tfx3wuMmgmAoeA96bd79ozHOBc4J8xpSp9fcA5VVPW+mJzwdsU01DZmH3ySlX3oT4R3JCBA9RWigTNCaV3Xf+JARy4lEyFigsYHZJw9wLXX9M799VoQ7fvkYGGZR35f9UmECTYf9V7weiyFzLYLkGQr4sHra7wsW9XYKsPjHJscPWgbyU5Z3WpyUAA8GAz46iTj1JfmkDesCxVZpF5wdNvCQ1c4UzQP/EJHLnH+2CimApIowFSjp+pwLDBSne9inZk1xb9fqUNG/DGkPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSyB7GHykUnfUEZB4BGbdX9bewQ3q5pARr130wTJK3g=;
 b=GUc17W6/lInA2K1VXm/+gsUzHcKssXXqqFY9vGhlKp/DjmlRkIN1cE6caYMgXKoQB/tgcyQYuATfQlgaxSfdQK3t/2fnorldkPFB6SydlCoPJJrW8DWLezeG9ZxnMojuSbVdf8j1QjKF07IG2oF80W/FlQtJomXIrGUK/DdgrxY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 19/37] MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
Thread-Topic: [PATCH 19/37] MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
Thread-Index: AQHVd+P5kxB47wj2YEm+Ca+Rab8Jgg==
Date:   Mon, 30 Sep 2019 23:08:30 +0000
Message-ID: <20190930230806.2940505-20-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: d8ec46ed-5859-4dac-e204-08d745fb1bf5
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10222AAEC0202CF8F7E85146C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uO55gWxhUXsfY9doV59OUEFYMG0Qdu5gbrfgx6qmfb1LuHJUen1B2ptnc14tCBPf2juy8/PHy0Mui6c0qBqEkJ9wl4GxQU9bswygVrN0s6JclodD2GHB4FbvlAsPsVEkBorS2FdJ/ebvwdOgU6wYTsrLYQRaMgfNZYq0pqRe6PTVthFGb8OkzVoeQ5ZSIN/5JFYPQTeL+LLY3CxTHvcfC+qqEDqyoJ6T+YHDGZVZZmtO/0YlHSyEMoaDL1t+EDZ+/jZPA+3KIlQZgkxdB4KgvdhfEwPwFNZoFnQ0ZlWBvrfbNCHCtVkKeU9qZd5cgeId0Mz+w9gHEFFudngo0jhvh/yOLcD5KZlZf88TF5R5pvC3CXeMbg8/2YsE/+KGl8Kt/JDssPdeaTyW6Qjck6106v/9kfirFp8xbOVTzSM/L3g=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ec46ed-5859-4dac-e204-08d745fb1bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:30.6650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qiVgGIQEu+SgVj4buqM1nTiaYHEcMn8t3KZ7LCq2N0KlUz+IHZhuprsF2BwPUPsvCe/elfm6vHVzFJphSdsuow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rather than #ifdef on CONFIG_CPU_* to determine whether the ins
instruction is supported we can simply check MIPS_ISA_REV to discover
whether we're targeting MIPSr2 or higher. Do so in order to clean up the
code.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 3ea4f172ac08..b8785bdf3507 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -19,6 +19,7 @@
 #include <asm/byteorder.h>		/* sigh ... */
 #include <asm/compiler.h>
 #include <asm/cpu-features.h>
+#include <asm/isa-rev.h>
 #include <asm/llsc.h>
 #include <asm/sgidefs.h>
 #include <asm/war.h>
@@ -76,8 +77,7 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 		return;
 	}
=20
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	if (__builtin_constant_p(bit) && (bit >=3D 16)) {
+	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit) && (bit >=3D 16)) =
{
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -90,7 +90,6 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 		} while (unlikely(!temp));
 		return;
 	}
-#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
=20
 	loongson_llsc_mb();
 	do {
@@ -143,8 +142,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		return;
 	}
=20
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	if (__builtin_constant_p(bit)) {
+	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -157,7 +155,6 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		} while (unlikely(!temp));
 		return;
 	}
-#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
=20
 	loongson_llsc_mb();
 	do {
@@ -377,8 +374,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	} else if (__builtin_constant_p(nr)) {
+	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
@@ -390,7 +386,6 @@ static inline int test_and_clear_bit(unsigned long nr,
 			: "ir" (bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
-#endif
 	} else {
 		loongson_llsc_mb();
 		do {
--=20
2.23.0

