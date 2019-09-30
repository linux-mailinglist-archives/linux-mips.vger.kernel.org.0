Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0ADC2A55
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732666AbfI3XIx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:53 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732660AbfI3XIx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLr8so0oI8rBkho2fAAW6o1i5qaHKxgu4MT2KwYwu3D/rv59kLS/QdTUobncKJeLbi2Lkd+CzuWmLtv5NGa85R19ugViF7yuU4xaSZxJe3gc+Fxc2vGXeCHvG2E5maBKelcZLy+RcezOnv80mOw+qZaoIIZYS3wDixlCuAqGIMaSqa9R9hbMTcb1quKvdZ1L2nU7EK+4h3yX9kbaJEzdVwKFROSSfpXVK1yUXOVairn1+XWoagY1qQoNyIxneh0d1mHd8LkLO4ILWp7isMxb4WMPuulVRz6dt6XiPDqqtmxRzJMUMaKuy7hj0YXIFKcRz+2ubAnM26KetCUhTuNJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6hL1v6jV4BHoMLK6wrVGnQWkPUvOe+a6kzlMbdv42s=;
 b=WQScYYcrhmDTa4um38C+Y7bscVEMh2BVnEF73XS8Fjn74iYbHGxeeFeiJq9XtKBTLscjfZ7ezh8RozViBGJl30RaKNYFmCecpkZmS62CSlt7uEVWXWxATcSXgwY4/SJ+D60IDBkBWg3ieI3cVC8Nx1qJMydnuVoLHfyRyxq6aoJ2JcHp50Lh8fqHzjQOs8lu5eLyCdekRuH8oTVNDAg4TqBwNZzSFaEGgQE2OQIY+vcbOeJ+3fVKczI8VpM6eWXEpcuyCb8ygoAr49QDRia8psKnOaPuWNu3OgdfmcctdsxFKEclYW4a33mbYkJhdRj7XXcypXp6936sTD0ek2Y1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6hL1v6jV4BHoMLK6wrVGnQWkPUvOe+a6kzlMbdv42s=;
 b=MZrdaIiagRQ8hLKTf8kC2n/GpW7GWCzjvX0byNR7GQDqpBLEWkS4mCuIrf9mRBb2mLfze+m61iaJbDcMy6R7XEFfFx7V6IBUXTUtRviqCOKgiPQrMQF4XtpUP9EmMdXcUkkfGj8YCiy8a8MLNrEf3fBEMPohYbXNL2umeyexrUU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:35 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:35 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 24/37] MIPS: bitops: Avoid redundant zero-comparison for
 non-LLSC
Thread-Topic: [PATCH 24/37] MIPS: bitops: Avoid redundant zero-comparison for
 non-LLSC
Thread-Index: AQHVd+P8A0ilHb6j/UC44m7h7ENk2w==
Date:   Mon, 30 Sep 2019 23:08:35 +0000
Message-ID: <20190930230806.2940505-25-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 9e77b366-0363-47ad-5390-08d745fb1ecc
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022B535D2B2E48443F1CAE7C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xHQy0NF4YL96/8yitOFmgspi7YEhptGFiU31hBTp3A/c8ncOKW0X3hdp2YKQvVu29uWZ6hgFzdl7CaUPGMVHeLSFWTg6kMWchq1WlN7h4LtgXPhAlTOALbRmgBmqg2x5k582r+8KHW1FPFrlv+a0NtjZmIRQLjNPw0izcIPneQJiNz5UG+DY0vJdnc6E0c0GHPRGxYIRl7dWM9spivLS6Hjtao9J9ETtTwO5ZdgWMfYjpI1AM1/5bdPQPzEfmiLVZfDk4U7jjwJZ1nwmElq1NN66q+YHp1muPMUj0nJEFS7noOFww4Nc0YEHuK68Vq/wmDAlRHMk7DY/beXBViLHY/i9JVPZ6WQQLwacXcdVmV63cesM44/rhsAgKuBF8oEdqaUK28nUE/tvyzAwR3fslvIOIzRs4OcEqw3FL48kNuM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e77b366-0363-47ad-5390-08d745fb1ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:35.3418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSMvfZnXdp8Zc+ztQTN1UMPEd2Jxv9BO+lnFSqysiE8j+rrEC4TUWss78A5NcHLnr2fl6RIaF9QlXaDKCwYOqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 35582afc057b..3e5589320e83 100644
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

