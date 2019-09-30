Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FC5C2A52
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732653AbfI3XIv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:51 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732643AbfI3XIu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhtG8gy19bL4ff1ISG2Yteka6SuAo0m7vkw0jSycE0uDtUEVcGRH5SvckBqkJ2mS2zw56deDoVp+DA6pdWcqHmpQOzZpZzhHH8EVFo9ubiacZ2BmNdl5SsQBJo+kvp6YOUjRmOZcvtznxwRA0TuPUPuyfXdxCwMCLY4+p4kwxkDPddM1lW/xNjBXmk9uX8VzTApCqkOu3gYbPuNBQt5MLeVI78AFNqABx0UmOqUi/+tYLvhj65MFx6LiB+UMaqugX2NZqCG5e0qzgfHNzpKs8T4D7USX5Bh7kI8zgrF0OLgbtEBeKAV887dP3P2qD70qysEm789RBkVuOFNZhT2rNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgsxAQtwHf3lBMshWcs6/1kAPwHEPvTRJQk3M0eQ9aQ=;
 b=I1hUrx7SIOjp4qLWfcG2LXfl2QqjHv0x/CxOIIZOu8xAf35AkLfIr48WCoM0ngvRV/Y9MV3/tN9tAm+aNeaJwCj+OVibUwFhgYkqQUtuFGcmhsWi94ibf0joShAfobgpX+2tBz1LVPigPF9AIMdMWCnmuZwo61NLMDRfzJNKiCETF5X6SJXWlMkKV1VzESTxHBoQE3MwICkGWi/RK7vJ8T6dFv5ogDk2by4uuW0PuJP22WKA9EZnXuFuu8L0z9DZbwzVaoQh5BqV2pYxNz8zC99mPLB0V7S07khnlK1GdN+Zk3hVYOiPu+Oh/y5lUnBZVtr8ESV+/NRPDiIVLGKH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgsxAQtwHf3lBMshWcs6/1kAPwHEPvTRJQk3M0eQ9aQ=;
 b=MCuzWv06nVLwkZQbZA7iRc4XvxyCumdcV++KgTwikhD6d/yBNrH/22RvaP3HT90wh+hWEtPxXXtpZ7mc47y4+2D2nz1Np04xbFQhx18QHLlWFzLP+3aIj1MJH3u4Kls2fs7PkPY5F0i1SPQYgnt9pEdlwOmOFkfdydrxSfJ/z3M=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 22/37] MIPS: bitops: Allow immediates in
 test_and_{set,clear,change}_bit
Thread-Topic: [PATCH 22/37] MIPS: bitops: Allow immediates in
 test_and_{set,clear,change}_bit
Thread-Index: AQHVd+P7r/zRTB56Uk+oKVHxefve8w==
Date:   Mon, 30 Sep 2019 23:08:33 +0000
Message-ID: <20190930230806.2940505-23-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 42737e41-2df7-4b1a-c034-08d745fb1d89
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10228CE2A6B3D05D16FF1BA5C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(14773001)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yQa2z/5JeLAvGCl27NAu+IFCwhMVz8rQe8v36+UVeN8vOv07PWtQVW/FS8gZfSrB2fYqEoP/XoxcxvTNPo8uoSzrC215h3v6WxeoJU2ewx+xtaB04EnrT0BAVQ3/H6na/9TxDi+luOVkqjFUMo+gDiuxfev2QPSMDH5e0lo+JJjNb+OKN4e8UoSwCVK/R/YlNubkDoSGAkb00NdSFwckKDp/S6Oltl1KiyX6A2YzZmywM84yYV2kwAG0THTWuxugyZ3zFgOEUS8lmtmDOF6siOHZQcN6t6QJ1s5ENULZGqvf/yoC0HwhJ1WxhZ1mEIEZAmcQPVg/wlSfSrlvJmAX7QtTC5Rg4v9OYYs9ACm1oEFUOy8NieFUWrZ46VE+LQOGj4K8ETbQB2WDYn6SIqJFzcomB2wd9+RY979Ows5Mcm0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42737e41-2df7-4b1a-c034-08d745fb1d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:33.2538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kipr0YbbFfFrxVM3YuijGt4gcfSX4Mfajw5nm5hvCY0A5AgpdxcCW4FZWi1TXgl0oedsRb6iZDf57U4WfJVQjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The logical operations or & xor used in the test_and_set_bit_lock(),
test_and_clear_bit() & test_and_change_bit() functions currently force
the value 1<<bit to be placed in a register. If the bit is compile-time
constant & fits within the immediate field of an or/xor instruction (ie.
16 bits) then we can make use of the ori/xori instruction variants &
avoid the use of an extra register. Add the extra "i" constraints in
order to allow use of these immediate encodings.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 34d6fe3f18d0..0b0ce0adce8f 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -261,7 +261,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -274,7 +274,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
@@ -332,7 +332,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
@@ -358,7 +358,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
@@ -400,7 +400,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -413,7 +413,7 @@ static inline int test_and_change_bit(unsigned long nr,
 			"	" __SC	"\t%2, %1			\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
--=20
2.23.0

