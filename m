Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCD7C4333
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbfJAVyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:12 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728177AbfJAVxo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4u2ANLHWaywxHKlGlUbFpdEqZR0SWNwXuA4z0dlpAbcwIBLOj13963QxRRLKxwCBWbpbD45pLLDnVSCf0ZpEi0o/7MXT8gbOZDh8dioEUAXLTUVpnVpnc0TeQTbplZQDe6ekJseMYLEIYvK9EzsIpVa3g6n8oz5eRv6kvfN8iv7fcfZl+5cVvvH1GG2lddKp2FQy19nmDADrLF3cm4u12uquuAlp1rvfSivLLmvaY8sbqcNcp6jAN684NaiKyEm5pogZ+okotCDRYrQ08pgYmAEPM1HreNI6lu95DSjpR1iFBCKjJOQdLC79uuLuygicRBKOTbxuc6G/pP5g1exAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08aXOuUCv1QBQ78zSHt4gRJFznTUvA/Oy5HXdvyZIf8=;
 b=CYgvxIpOnllsx1RvjIn1h1xNFX8P775vTM/j+Kb7GiMnKYbZi0PK6FHU4rVi3L30c3+E3gNPtt9E5XOWbd1vcePPl9fL7VzRiBIEiW00LeQGjlCJ7FEDSWWJuEIOyrJ5GV/W+mbNJHdo3MX/JEOb4kjFCofeyYWj+4FbuDYmjuevB9dRch6iqr23MErzCXXjtizuq1jvkcWBcYb6PMJlWks7PqvJby1PFUv1cGrvf42Ia9rTRoJAboSkda0IdMz2J0OAc+aLgn8QEOCvZAkuwaosjk2ulD44ky7p42eYWwjDr19nstDbCwXz6uRxtfEzNpOswILFBujlhpUGTtgTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08aXOuUCv1QBQ78zSHt4gRJFznTUvA/Oy5HXdvyZIf8=;
 b=quuuvoVTt5nSQX5Q3BCm/owf9hVlbiVjGHwncWB3nSk+PfXTkWRzXBbYqKUATYZoELukE3yNwfT3B/v+tq7pLyuX7nxHDeEUgDzeWccsI/G//lt1sllJb0wNE0IDpbgQZ8JOZ6mLbHfRdwDGknsCg2Epmi+i55qfkU1M8JxDiyM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 23/36] MIPS: bitops: Avoid redundant zero-comparison for
 non-LLSC
Thread-Topic: [PATCH v2 23/36] MIPS: bitops: Avoid redundant zero-comparison
 for non-LLSC
Thread-Index: AQHVeKKr/ZciCZFEkku5+pQr0Jn66g==
Date:   Tue, 1 Oct 2019 21:53:32 +0000
Message-ID: <20191001215249.4157062-24-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: c89cc258-248f-4811-ae57-08d746b9cd6e
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439ACCFD0906F565515CFD2C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WxbgGVYN1Nvhe47PK0tlnvGGMDFotd0jF396+tnuQOdSj45qGfyfoqVD3SkQDkYJDUOB0Le6mN5Wb8FKh441m70nFxa9S0nt+wrMI+1Nz9qsZfk7XF66JojG3RmHaLUWUtijFeeGH5bBemmu1ryU0rW0Hb8GO8HLPJdRmS7wrJUMnAR8USRpCvIDzrfsA1GUTHBhPh19Ltjdsc/r0PfNZCBSdLTQZYPdyutEqiIenYADc4f/b4aybZjFDiVEyieHWgUXnETO9mFc7HujsGy20QOOmh/LXTXoMWIuKK9WS7BWPSuS5tTZSRJoaWfpP4MRzcLHn4QapYAaGaCRh0q2rFxLPd2UaVu2a7OLTQOTf7HttItdlQG4QAtb1ZIlEAI0Ik1xPupstSWCnRXlqlxFx1VjdxHL/TLK4Qc7VFQPzM4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89cc258-248f-4811-ae57-08d746b9cd6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:32.7210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbU+xxcf3H8sHO4b/F3ewENS/Zz0rwk5ySqKGxX/HcooT8qbnzDBXOonUEyJf7qWRIMFc0gO6ZN6X2YNbmlQlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The IRQ-disabling non-LLSC fallbacks for bitops on UP systems already
return a zero or one, so there's no need to perform another comparison
against zero. Move these comparisons into the LLSC paths to avoid the
redundant work.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 0f8ff896e86b..7671db2a7b73 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -264,6 +264,8 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
 		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
+
+		res =3D res !=3D 0;
 	} else {
 		loongson_llsc_mb();
 		do {
@@ -279,12 +281,12 @@ static inline int test_and_set_bit_lock(unsigned long=
 nr,
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & BIT(bit);
+		res =3D (temp & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
=20
-	return res !=3D 0;
+	return res;
 }
=20
 /*
@@ -335,6 +337,8 @@ static inline int test_and_clear_bit(unsigned long nr,
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
 		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
+
+		res =3D res !=3D 0;
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
 		do {
@@ -363,12 +367,12 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & BIT(bit);
+		res =3D (temp & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
=20
-	return res !=3D 0;
+	return res;
 }
=20
 /*
@@ -403,6 +407,8 @@ static inline int test_and_change_bit(unsigned long nr,
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
 		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
+
+		res =3D res !=3D 0;
 	} else {
 		loongson_llsc_mb();
 		do {
@@ -418,12 +424,12 @@ static inline int test_and_change_bit(unsigned long n=
r,
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & BIT(bit);
+		res =3D (temp & BIT(bit)) !=3D 0;
 	}
=20
 	smp_llsc_mb();
=20
-	return res !=3D 0;
+	return res;
 }
=20
 #include <asm-generic/bitops/non-atomic.h>
--=20
2.23.0

