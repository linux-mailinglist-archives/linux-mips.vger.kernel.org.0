Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE47C4319
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfJAVyA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:00 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728267AbfJAVxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEkrCZRYhqja6gjw3X1B9TMrcD3FMSQJJfwlwwABOz7B38zuZNdrXjj9cZVM6OYtKb0Gjap0CTcDczv3jpGXsSy8H+y1bzHCTeTHfi2RHpjU7dgoSpLfHJLfJpEDqaEwiLRGSYGOeM3NRiZri+0p2HADYe+/Wy9fmqSi6PjO0wI0KCL+7xf4nl3W8IVIMcW57JaAe1xKuCfsxyI22zyA4u+WLpJU5kW5vMvkmZSkBGkD5Y+flNw7KgGmhQSZa9iwZI5DVPWao2hVBg6oKWUY6yfMZ+Lu4W+E5aaTA7akzZO1WpZbM9K8eZvviTjOlJ11+d1O7YS29wGDWjHiKuki+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wKkI6JMqdWbvnxqs2rDUzI1Mrt/HuPnZG7sFlZTi/A=;
 b=ZJjyb1J5aQyMUR7I6mFD3dciCcbEmdQKl5xlwujuMdj9gOSccDzdBrFGC6VjxgSLLcToyUJPa7gomJXsRrn/Zz9rPPSZVehn6h53mpU3zWkF4wSOUIbG67SsdbbVB0LWeeMuGB/0A/gKyF7Gw488Ujy7RgCKV+rkyfUraxNTK2DOL+hm9qnZRPu5zmD8PaA07YMyfE5bY7WZSap7+A3oKfX44so7UWH3WFPjKAeTKgZIo/U/BdxaEiLxUJoG9xVPVtAxNMR3aBAEpHWAk9XXz0mG7CSuSlwScd6ww1kOS3mgY0hYRwBas3e1mfsnmTcpRuPi+ffnjF0yDnWaP1M/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wKkI6JMqdWbvnxqs2rDUzI1Mrt/HuPnZG7sFlZTi/A=;
 b=hjcM0gd+3WebPEJM8pn99JujlHKeOB99RZ/JGyPoYXavNmbcOJxNxR6RAXd9DtGqTONdQP0J073i6S08dMH3/hPn91IdP99MSQtFtVBhC3ImM3dBpoqe3ims2U02NKSDH6tr7ei00KYgYynKzvP/44ZEvu6c3OgWJE41g9Bo724=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:35 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 26/36] MIPS: bitops: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH v2 26/36] MIPS: bitops: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVeKKsNoYb7CyIfESjM7bTex9Tow==
Date:   Tue, 1 Oct 2019 21:53:35 +0000
Message-ID: <20191001215249.4157062-27-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 0e8d0cd4-70c4-44d1-aa66-08d746b9cf06
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14390A211384678B20952BEBC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0FO8A+Xf3fzwtQi8vp1mpk/ZoC/jA8qIP2i7d3+xsY8puTJIia6am0YmEutrGSbTv5qMgkX5mkzIigPbb/p/y8zNwHLvFPAEe5OOklZYX1mQ3avtA3MOy/D1rGVWcII6dHKZttw8DLH0b2E2nEgbr5haEU1zDhJOOsNKju6c3Lt4/KoDYo8twZr15ZKGjcBpRrTuJ3degm6CNgBuTOuTWhu0HbXER0XA+rqDV9ZmSEhdHGYKQmfIxnhHeuJ+sYCDQyBptCgI7jNssHPzAJ5Uh+HZkcMNQ1wIaAkePG76N7rV/rdnawtmI4+zV4WMq5qwoOl9st639P//FCPErC1bGBdXw7/04HzpjRemRznoEZOcvpzPn1P1bmujf9pUAdxqH8cgfrcx8tmEVsmfgCWtkoYvwwG/hyk2jqSyrs+LNZU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d0cd4-70c4-44d1-aa66-08d746b9cf06
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:35.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVhj/JR8I/oxJxOaMM7zHpMQsI6W7wxddYiAzhPfClcAg5Q10WXAei7OUnkEm9Ux639VfQUkDzt5xb7UJ/8JFQ==
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

 arch/mips/include/asm/bitops.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index d39fca2def60..c08b6d225f10 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -31,6 +31,7 @@
 	asm volatile(						\
 	"	.set		push			\n"	\
 	"	.set		" MIPS_ISA_LEVEL "	\n"	\
+	"	" __SYNC(full, loongson3_war) "		\n"	\
 	"1:	" __LL		"%0, %1			\n"	\
 	"	" insn		"			\n"	\
 	"	" __SC		"%0, %1			\n"	\
@@ -47,6 +48,7 @@
 	asm volatile(						\
 	"	.set		push			\n"	\
 	"	.set		" MIPS_ISA_LEVEL "	\n"	\
+	"	" __SYNC(full, loongson3_war) "		\n"	\
 	"1:	" __LL		ll_dst ", %2		\n"	\
 	"	" insn		"			\n"	\
 	"	" __SC		"%1, %2			\n"	\
@@ -96,12 +98,10 @@ static inline void set_bit(unsigned long nr, volatile u=
nsigned long *addr)
 	}
=20
 	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit) && (bit >=3D 16)) =
{
-		loongson_llsc_mb();
 		__bit_op(*m, __INS "%0, %3, %2, 1", "i"(bit), "r"(~0));
 		return;
 	}
=20
-	loongson_llsc_mb();
 	__bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
 }
=20
@@ -126,12 +126,10 @@ static inline void clear_bit(unsigned long nr, volati=
le unsigned long *addr)
 	}
=20
 	if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(bit)) {
-		loongson_llsc_mb();
 		__bit_op(*m, __INS "%0, $0, %2, 1", "i"(bit));
 		return;
 	}
=20
-	loongson_llsc_mb();
 	__bit_op(*m, "and\t%0, %2", "ir"(~BIT(bit)));
 }
=20
@@ -168,7 +166,6 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		return;
 	}
=20
-	loongson_llsc_mb();
 	__bit_op(*m, "xor\t%0, %2", "ir"(BIT(bit)));
 }
=20
@@ -190,7 +187,6 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_set_bit_lock(nr, addr);
 	} else {
-		loongson_llsc_mb();
 		orig =3D __test_bit_op(*m, "%0",
 				     "or\t%1, %0, %3",
 				     "ir"(BIT(bit)));
@@ -237,13 +233,11 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_clear_bit(nr, addr);
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
-		loongson_llsc_mb();
 		res =3D __test_bit_op(*m, "%1",
 				    __EXT "%0, %1, %3, 1;"
 				    __INS "%1, $0, %3, 1",
 				    "i"(bit));
 	} else {
-		loongson_llsc_mb();
 		orig =3D __test_bit_op(*m, "%0",
 				     "or\t%1, %0, %3;"
 				     "xor\t%1, %1, %3",
@@ -276,7 +270,6 @@ static inline int test_and_change_bit(unsigned long nr,
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_change_bit(nr, addr);
 	} else {
-		loongson_llsc_mb();
 		orig =3D __test_bit_op(*m, "%0",
 				     "xor\t%1, %0, %3",
 				     "ir"(BIT(bit)));
--=20
2.23.0

