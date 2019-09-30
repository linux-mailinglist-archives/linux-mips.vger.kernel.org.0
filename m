Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018B8C2A79
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbfI3XJP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:15 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732672AbfI3XI4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq+dMSlD/JjM+m3BtMLGd9kYc8oOHKGAFc8cRIxnnLFFRZeMKjPWuArq8QRnKWQUjT59X1Sx7r4zrv3IqrCVJv9BFcN7mwpMY54R5t4SaFb+qdeC/wWMKOSijC2gqOKh87iRLgcsRXBPf46J1eCWvsxhxA/yF/mdbSMu6kBwG6kUCZkPa+ji1fr+H2a1+oe9oWDb3PxYohWLxCqgk35NdPxLwti7DxGZorj1R7/X+uxWgJjmxkI9g19BokeyZBqhC7VFnJ41MTqtxAB78UpJoHk9qGX8EiaCSe3sGvTDQnGstlnaACXm1lGli6NXSRMzQh6JI/RVcUKZ+r0XPSicmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhNYsmwbn6ZJzQOTghd2RFII1dQQ5hCvplB6kY72LnU=;
 b=fYnVfHcGr7u1S5NOiqpLEzLN5eiYHSV77+9XzWZRXQz75XQXEk11t9CKrSIYENFFv5bc6GTDDpjAIzuseMQZMpImn5GdAChrm9A4SVy9a4VB58PgRrgn2TZ+wosPSBG2z3QAY9SM7weFv8TAuMsNBYU+QuEC6gW6Or4ECY80cyhy2LmTvaruXV19lNcV8c9zYOqTzcAU38B52Djj/AwVf40cTIiAq0Azo8NdzXaxGKsJAJHjrJvXG9FImn3ROZ5P3nY5745p5JJEYmn6cG0dFabkWi7T3pcJQ2e1M1LOW6Kw2HCq9OKTQAAUSTK4jwUURsRr2XvEPRWM/TvhH3VEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhNYsmwbn6ZJzQOTghd2RFII1dQQ5hCvplB6kY72LnU=;
 b=IcudCc/H75WFsOdhwARk1IwuiWachCPVBFF6oPWnfr7RC5m3iLurm4DIroU6SuygYiSI/TtIf9oWhVjYsGPS7EJts0lpR4H8Qytc/07+9c3y0NpMNQJaBsrkkqkeYp5Yosp/QEH/ggp+ApaxnzuQ5zj64ag5u4iY0rerHWkEHWk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 27/37] MIPS: bitops: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH 27/37] MIPS: bitops: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVd+P9shQj/qNsjEaOCGSSfpq8Ug==
Date:   Mon, 30 Sep 2019 23:08:37 +0000
Message-ID: <20190930230806.2940505-28-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 4d790d6c-0013-42ec-7c79-08d745fb2047
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10222976988E374182B8E62EC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cZJsMpqKDcoskgCEm7UjFFxY5yM6Ptm0L8wRvBXorC8NZzw157myQJ2TUP5L9NvdqWckxIEpV1pinBOP/lG12NGGIpThvr+VM2bEV9d6rru50YrbkAr1mckuy3AwwmIDjde3+iNY8GYlXU2Gk5p9KOiyMVgV/aBQY35EE2vKa/oC7kM38e3EbwkXC4ycmZStScW98Pvx4qrCCyQTjSBA/q4bai2TZqM0t8fFUdLPzYjr+Vdm71KGZAmAj4iq2tuZWbdiMvZsN+h7n4os7ZUkRE/RzRXORWx7GJZZoiXG3FwCRuhBL4YPahMPl3yas2Mk6utahn2kxg600/ASBV8tPpMibCilhOSkOlW4OD1YXJpDeLko4tZh2shk0DIFNyVYJ80YlmBX7OG24O5n+yp40ZYGAyecFK+4UZv0+dejzv4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d790d6c-0013-42ec-7c79-08d745fb2047
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:37.8047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2h52Eny3Cin1RaHdj3yN4r148ulaWfmmuZkUHxqWVlqJQo1Y9gXAYnX7ceiSOm0rDfRrhPNXgPJwiNpOr/81w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 59fe1d5d4fc9..9e967d6622c8 100644
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

