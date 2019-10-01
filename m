Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C58AC431F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfJAVyS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:18 -0400
Received: from mail-eopbgr750119.outbound.protection.outlook.com ([40.107.75.119]:27367
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728385AbfJAVyQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0IjH+BPGM8yZ6kiQcoVYoBgh2Ik0LGkGtnMvxHVZtNBE6Nn5IYpGM+JoWfwCJuemKe1VXhKvo7TD75l35AhsM50HNZ8cZXhdpRbIIy+75mB4UFM/Hrx0RTDtzE4ofjUxODV7fYgwiXrVUS5teK0/zOYSssmFi/2q4mRPyb05I8vFjIYeTbbb9sW48DlnFrUwVlmgVPYCVTvzJ29YdHpY0H4I/8z5I1z8+wRxrpDjhEouvRzgvFMLL4p7CbVqQDXHaXBe+VX5DFNCPzGsRloroED1q2vPCAQwHNDBj87CiPt6gyIAzqJWExXf7FJihh8xX37vRqknBb2XMe0k4uOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm7wZ1vEmtJG3B5kaj+MwIDQ5nFxyg3K/vPx+nBAnUY=;
 b=LnSDGrmchIRz2d5VDFsIaqGobGJfllvYMofzKyr5Dig6uu6ss4+3QtRac+T471zHB5bH/Ve30ZRfAyNGcVN9q6pQU0BxtePyI8VH9bosRxPRvUiSWhkNL6k/KS+idqVWcSOvreI3LuFP2Xdcj1uEri4RZaAVYcmn+IPlWp3E9uS/4TTcG5XwnQMF+rYf8rxTjgcxQeAmogw9Y/yLPMxmIf0FvLJlct6sJMPP2rLlVVwwCykjbbBL15qEqJhPvLcUGJlenrSg0U1j42TwkeM05SbPDHAR0FrgDVOb32esQWM5bT1peaXlyc/dH+sklNgO7yFlk8ueGxyLuY1OFmQWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm7wZ1vEmtJG3B5kaj+MwIDQ5nFxyg3K/vPx+nBAnUY=;
 b=SLBwptn5SdnRwV/kDFBZPDNDbWiCcfwEAgJDoSq9BNGp2MO5jkeZrFKpbDCVu3b9nayqTtTnNmqj4atiZmVaot9jO+hyuLuQBgskB2m1XN2H/uKCetRzwWnpWJN0DE4SkoCtS5P37IIVMBdiEG3to835SFK/PMCl5sPqSpDyT78=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 31/36] MIPS: syscall: Emit Loongson3 sync workarounds
 within asm
Thread-Topic: [PATCH v2 31/36] MIPS: syscall: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVeKKvagu7Xn/Sc0OasjlKTL7UqA==
Date:   Tue, 1 Oct 2019 21:53:39 +0000
Message-ID: <20191001215249.4157062-32-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: a1f7219c-b493-435e-07c7-08d746b9d1a8
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581AA90770D243A31B1199BC19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3F11ALBr7yTQ0oLvEluNaCWmUoK+jnAPI5RwXJWun0s2hhKyCx1/E06dRXvMgb8x9KvVKFACHkkDzSznmJrNqyYD9PRXSDKd0CC/ExOZu0YQ4z7g5PQ9BITdM/eDFikH9KEfShIAsUFTl78XQrjq7OxUkGzD2FKfSSFDtS0FMXAmoWXi6XR6xXw/kIF6v6JUBSGxOeorM6sU4bYjIdgCuspI/jKs3TFJbBE/pmX5hGPjWbu8LsnZvlmV4bO1xbhu2G5Ckc2oRdA8dCV2uktn4GayH9DzJxAsq8hCE4f1/AX4yX3vMWdEvHgp0cYAApW/vePWLjhXyvc8aFLR3NXhjwImqLdlRaDeZ7O33KdjjZ88gU+acnjUs/vmgRotteQeZBzMwqiT04k3jCCoffJ94wPvpzQPzsrswDqU+clH4O0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f7219c-b493-435e-07c7-08d746b9d1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:39.8347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZD8yQWWFXdDhlxnSVfHNpPZVXxDFifzhTzrE9N2m2vRvc+q3tRjLV5H7C19SFRGkrzlSZCoW7K6KyORpUsmqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
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

 arch/mips/kernel/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index b0e25e913bdb..3ea288ca35f1 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -37,6 +37,7 @@
 #include <asm/signal.h>
 #include <asm/sim.h>
 #include <asm/shmparam.h>
+#include <asm/sync.h>
 #include <asm/sysmips.h>
 #include <asm/switch_to.h>
=20
@@ -132,12 +133,12 @@ static inline int mips_atomic_set(unsigned long addr,=
 unsigned long new)
 		  [efault] "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
-		loongson_llsc_mb();
 		__asm__ __volatile__ (
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 		"	li	%[err], 0				\n"
 		"1:							\n"
+		"	" __SYNC(full, loongson3_war) "			\n"
 		user_ll("%[old]", "(%[addr])")
 		"	move	%[tmp], %[new]				\n"
 		"2:							\n"
--=20
2.23.0

