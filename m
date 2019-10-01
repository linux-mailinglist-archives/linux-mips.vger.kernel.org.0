Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F30EC4337
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfJAVzC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:02 -0400
Received: from mail-eopbgr780114.outbound.protection.outlook.com ([40.107.78.114]:49402
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728122AbfJAVx3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5VXRcMMj+vhzrIbeaty0ivIBBqfwhJxUgaNnbeKDitZ/k0NCS3MPLv/nwToBdWE6GRCvA9MZlaxZLtEKPbcDgoajGv+LkTnbeJ+wpCPv/0JN1O0oN0xwN2eyXEIb1moAAM06mphSf/wuSkwEcSjweKV9wFtlen1Z/ZiSgiOOoKaud/BqDNv5uWSBncJJoX17aYQ+JC5R+vSKDTzc4x6vjBits3m3UL1bQ81SudEz84hUMwJisPBe9SvVGO8CJKVYSGqss06uwfIII5FeRFNGOWjgqDWTTwXmw6k6QvprXqUOyOnrK+SIMXCwsfzK+rgs8YmKAFUj7KPOdEeGkhaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVeqRdQx8uxlqlfyAFwW6/7HHFA0hQKyR9N3fC+u/Cg=;
 b=DmkVAfyNjs3S1LUGJcfFRLrFws4wQU3SZqjKA17BcPpvDFMO6v7sZToP+LaIreJl5JGjEd8TdNqGATd6rEsIBier6AbF2c1DYi8Fm7nqoCzYT/KTYbhDMa5srwXrD4eh7uvgHp3BAO/O5FluQTiAv0HmG0LO33Q5q1/kBLrEsnR6z5ARET5vwMiqAhC6j3uXw6KcpbMtVv0jXOYBl9Gu7h6YhjQ8uvJpGRjE3apBIqDX1RQ6u9ZKmH0FfOcrrApO+M3lPIxUp3AzIepcJ5AD5DlO5bQ58FN9hBljZD3sOvuJC6NTJUA7l5T5pSes2xRqYTp/a7ZqEmffSm25j5zu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVeqRdQx8uxlqlfyAFwW6/7HHFA0hQKyR9N3fC+u/Cg=;
 b=LiXFfHKTf/c7u6gL7HJ2fjVyuL1nnTpOGgzkyxFavQS1I7Npz112SW/B5TPjMHs8B+4V9jHagG582mBrUcPJQXBOZFN/ezM1FzaTh+TBV0LJVLV/7tg8NAulaV0TJvKmN/uR3Zo1UAtu99XkjqVyvnGhT5XNeRJWU6t8ojmFzUY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 18/36] MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
Thread-Topic: [PATCH v2 18/36] MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
Thread-Index: AQHVeKKngmDrZVAa20Gg4WzhINML+w==
Date:   Tue, 1 Oct 2019 21:53:27 +0000
Message-ID: <20191001215249.4157062-19-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: fa24ba13-7f02-4d32-56f4-08d746b9ca3d
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1213824DDD1F04A0AF42298DC19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(14444005)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfrP+nZnYz4gpBrMwLAlWVyW3i+IXquODu17ejqBVmc1L/ep8b2Bqn/DaqyXr0c2/Z9iIRBOxSed/ZvSEH5zVHO+khgBtVm3A5IeAhyJ5UMYX6Y6b7qD2e+Qms8ZptIOvVA6bLMwwNxD0GC8QNT2zhQ+E+FjgXVjOToxSzWO1zs1tPMu5f/ONZUeUkJbCOhu0gH2NODyBBgb2MGR/FGTBB0AkqJeW6CyPH+fOKOVhoKhG3aCTOXOzfqCRDqpB09QDH6ZOegGTQ/NAw/04mtkn47zfGRFgDCfZ1hNceLRtntCbtakbjQSm93IrjTgTgLzoVrcOB5FYbyEMcdtnwNp88muav5NFIrh9upv7Q45aNC2mS/iJJcrulD52WrPwbRI6uTS9Puqpl1Pbp1KwIzPP4gxIrpvGE5LVVGYaKpIMqk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa24ba13-7f02-4d32-56f4-08d746b9ca3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:27.3745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54EYtv8P97pQ41RHp63z20ChkRbdI6DCw4a5rohz6lbmpBk8NykOz56046eXC2fZOFdwxUZjIAXUDq/8F0pNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
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

Changes in v2: None

 arch/mips/include/asm/bitops.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 1e5739191ddf..0f5329e32e87 100644
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

