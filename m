Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59D8C2A5E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfI3XJO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:14 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732683AbfI3XI6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCue5XQjosLvbgzo37y4DkrdLLa0pfNdXQatcw/Xoj1QfSScOiKlAkP93eyaUiR+uXCTszzAhYle6j4huzr9E1A7Fa7mUOBHpT9rhfaTVDkf1VRNDyxTSif3cIuCTLSV3XtUvxnMmwQYGfuywcx/mbAsY0eEBxzDtq+wRkJJW1Yfcum/6eL9OqmT2zKRPV1OP5jqXiR2qHPvoUbO8BzCXNusPOY/N/xPe7gRKfuvY/e8CAjlgyMQIoIGndHgUpVKnva5p0UR20jfNsxDgJJ1I7dCq5fJkewPWYQ6BwEVtqo1pJWISlNrfcgtuPigObThnhaaI6lVg3B/9GXBMfPPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaCYT94YeFl1o++ov4HQQnRx4R1OEcpIKK6cm9EuvZM=;
 b=ionU5BNsqlKpVNKum1femfunCf/vaKk+3Ofsc2HNtnF0pU3rnBBcogiYi+emYCnPeCOjOWu/uDJVr+pyfL0jmL0BPlBR/rICEpfpWKltYLbpaU1bzi+Yp9UsxSPbw9TJhj+yKpRwgkVTIvB0cXBmVUjDHKoDxcg1DhAGKNgVDIkS3SyG0C8TThkZkoqgJML/juIGm4Bu37XLzbs2a3PMSXY2I9Vvl7aVOJm3rb2uS75Fei5U3kJjylen0WcqRTY+mHuzbwGckiI5GLV3owet7tFm98BsovDU4JWiqjDYFBCjDwW4Pj9BbIGw+yjaZkgnbp2KViEGV9PZ8cgUHjw3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaCYT94YeFl1o++ov4HQQnRx4R1OEcpIKK6cm9EuvZM=;
 b=Toc1DFB5nHdJaPkTar4DKJpNWYb0BbBlTkyjDlFp/Fkv2o+iQyhO+qzt9zTbpaN1y0Z8USk/5xBAaqZxaMW0sO3VBnf1RpUOvRapH5qtERTy9xyamiAVmlj3B7V7zpPd/7udXP8w+iVEmQXhZSIm7s4q8dF03sCU+54dFD0yV2E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 28/37] MIPS: bitops: Use smp_mb__before_atomic in test_* ops
Thread-Topic: [PATCH 28/37] MIPS: bitops: Use smp_mb__before_atomic in test_*
 ops
Thread-Index: AQHVd+P+drhGMZ3mjES1+6XBK14pCg==
Date:   Mon, 30 Sep 2019 23:08:38 +0000
Message-ID: <20190930230806.2940505-29-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 88d52176-3a5f-4077-06f8-08d745fb20ba
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022F8CE2CC082CABB3D3154C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(101420200001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ClDyjq0oUFnGMxyaO0DsvvRwkyK/6FgC7VVzJFKsMOnBatjrCZ0erOVmj+pTaalH2b8d1RWftKWB8tsC0USin8FLS8IqAAznrz4v8r1hRvuL0carumOU199ZL7F0tVY7zcgM3DCeF8g/+jGD/S8OvPmq3anIhByJHBYqo98mNAma6lYy2R/zYN6FqFesmcpl6WngJmZ7as/66jNg1DzgQOreozsDSfO6njvaBiP3tNAlj0yDUQfQtvxb+OocW8gxXJWtvCuSnzdXiObZBwqO8yVVxLISPkro+IurmQZewA5v5F+FRVBO9MsC6zKTZFwrE92BCZfMTg5DCuGaT3gyUmVIPqrjVNwz8v6uX68weIDhv/LCVLu7jtna8qII22vqZdW0Iu/kwkGTP9vhhfcdtqH9BIT/4ZaKLqiNEtl3IDI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d52176-3a5f-4077-06f8-08d745fb20ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:38.6263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YT65Iy3T9Sa8pxHR0z6XU/tPTj2b5fYntwsRBoJukqkdcXPu5tnPymDQo399cclwWDbXzpVyhY823khiHNJcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use smp_mb__before_atomic() rather than smp_mb__before_llsc() in
test_and_set_bit(), test_and_clear_bit() & test_and_change_bit(). The
_atomic() versions make semantic sense in these cases, and will allow a
later patch to omit redundant barriers for Loongson3 systems that
already include a barrier within __test_bit_op().

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 9e967d6622c8..e6d97238a321 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -209,7 +209,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 static inline int test_and_set_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
 	return test_and_set_bit_lock(nr, addr);
 }
=20
@@ -228,7 +228,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_clear_bit(nr, addr);
@@ -265,7 +265,7 @@ static inline int test_and_change_bit(unsigned long nr,
 	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_change_bit(nr, addr);
--=20
2.23.0

