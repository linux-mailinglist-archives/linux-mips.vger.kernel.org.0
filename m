Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590B6B6F2D
	for <lists+linux-mips@lfdr.de>; Thu, 19 Sep 2019 00:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731399AbfIRWEK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 18:04:10 -0400
Received: from mail-eopbgr760090.outbound.protection.outlook.com ([40.107.76.90]:7339
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729027AbfIRWEK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Sep 2019 18:04:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdPhYU4CtAVCHTAem3jMgPYoM8Bdo3v+Ov5kjKgj5Bl4jdrwaHSN1Tp9CkWAKRjF8lEsgSMJnMD5yci6+A0k9GuCusN757NNOlvt/ndwvgMFpYx9464ELynwVfr5Mh83R9YBnJGrpaAxlBBmzPXBCEZG1/iiJELhjiuLicq0AmRcbA0vj9BL9zYgQD5wn896o+w5lMKQkrnnezjbWExwpcwthrYGCxZPMw2+jomttIhvhLp9V+DBTqQZv+1Pk54YFA5rfci+DH+gMWdTPEfDXNJIuU63nUHgSbL6YP32sGaAP9Pwn0p9UBXsgeXNisNcmrYKTfHqDY+y/1TVUT575A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioFTyCEd4cP3VhvRel5WzT53ZK7kIom+KDzbNYah6WI=;
 b=ih2Dom/WJvTlSj4JsXSydTnndjw9/IIiwmZkNlDsYh9+NrVSdsMeGjd5n3+C/W9h40YDR9VERQKVM/RlOsclAM88JPUpV+4WOQganlkvNQxqDr11OcKjcvNGKMhwPOnW4yXebMnm+cm1CQ8rYXNJ65PmrLjaVexZKDMDzqd8vsJE3HXInLaaw9aam0S6SotesHRuFe3E9W335+XtouYZhrrIEdPBr/KROWlnTI1Zj1vq/KrQdHFm/MccNCMX/BZDZGcoJYMoBRMYBf4Rj9ZQrr3ISoIEMe4xQ09hATcvgxUYmOhjMWYrAucjNdmHCzNzn4s2BzEzdDBDHdcCrIjOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioFTyCEd4cP3VhvRel5WzT53ZK7kIom+KDzbNYah6WI=;
 b=vc57zSKtNqcfRdUhFGFk68aNQk16gCEe7PNoybvfrKK2sEG3Ioh5Fod5IAzzYYSeiRv5vGKhffwuizfhFxmmtekFWv6ymR0lyY0E2O+exoo9XYv/Z4PJWpcWpBHC3Dfy/V4Jf+0jyi6myLyELekFiZp1kce+qHEziVa3nGuWEJQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.16; Wed, 18 Sep 2019 22:03:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.009; Wed, 18 Sep
 2019 22:03:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Dmitry Korotin <dkorotin@wavecomp.com>
Subject: [PATCH 1/3] MIPS: Disable pte_special() for MIPS32 with 4KiB pages &
 RiXi
Thread-Topic: [PATCH 1/3] MIPS: Disable pte_special() for MIPS32 with 4KiB
 pages & RiXi
Thread-Index: AQHVbmzmqHjqG429vkSh9effcziumA==
Date:   Wed, 18 Sep 2019 22:03:27 +0000
Message-ID: <20190918220258.29428-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:d4::43) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.246.51.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69021238-503e-4b53-9599-08d73c840892
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1375FF56A284ACAF8781CB6AC18E0@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(346002)(376002)(366004)(136003)(199004)(189003)(486006)(305945005)(2351001)(14454004)(25786009)(44832011)(2906002)(508600001)(107886003)(6506007)(386003)(66066001)(66946007)(71190400001)(71200400001)(64756008)(52116002)(6512007)(7736002)(99286004)(102836004)(66556008)(66476007)(66446008)(8676002)(4326008)(81156014)(81166006)(42882007)(5660300002)(26005)(6436002)(6486002)(476003)(8936002)(54906003)(50226002)(6916009)(36756003)(14444005)(256004)(186003)(5640700003)(1076003)(2501003)(2616005)(3846002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gCtrDzZK3VEPIlNmvaOW7ngn2O0Dydqe11qbH56gXh2AY29BsaFDxqkbnHD1S1dZn+cPu2SH+8KNgVOfNsEmED5PzQ8kQj4aVJ9Pk42JPYIOf1cfQmynYVqX9xuPfBTgYRnpeIbyEDMuCC4t2KCtSYUprSHyLG3a+nUFp0dStFb5DUdr72d/i1qFhpukLAzmTQTtyMsQYnDj8UiNzkGyWS1cffaUK7YKTio6rxnubdrRcOn9Vxx5+zcFddXu2/XGW0zXWXqfPOvP56jLHw3VMnVfYaellJufQcZhAj5I+usPodnAxgYorYRQqXRjDWB0tCx+glxYAmstsLG3fIQcCCDDUYw0c1BjAxjcRa3umXMqUgvaul+1Vj1SNecDWFZrCrJwXzFkSJJvmax5WZTzGFVYFiw6SJDXs8Yh/Y0FRiM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69021238-503e-4b53-9599-08d73c840892
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:03:27.5677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+eZEO1b3GV8FE6XGz27KyAg77YW42j0cyDVfaLqyW6OV2A40zgUfr4fPAte4tGat/nWi0q08AVZVSlp87d0ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 61cbfff4b1a7 ("MIPS: pte_special()/pte_mkspecial() support")
added a _PAGE_SPECIAL bit to the pgprot bits of our PTEs. Unfortunately
for MIPS32 configurations with RiXi support this pushed the number of
pgprot bits to 13 (ie. _PFN_SHIFT =3D 13). When using 4KB pages (ie.
PAGE_SHIFT =3D 12) this results in us shifting the most significant bit of
the physical address beyond the end of the PTE, leading any mapped
access to a physical address above 2GB to incorrectly access an address
2GB lower than intended.

For now, disable the pte_special() support for MIPS32 configurations
that use 4KB pages & support RiXi.

Fixes: 61cbfff4b1a7 ("MIPS: pte_special()/pte_mkspecial() support")
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Dmitry Korotin <dkorotin@wavecomp.com>
---

 arch/mips/Kconfig                    |  2 +-
 arch/mips/include/asm/pgtable-bits.h | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3f18aa018a0c..18163c138676 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -84,7 +84,7 @@ config MIPS
 	select RTC_LIB
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
-	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_PTE_SPECIAL if !(32BIT && PAGE_SIZE_4KB && CPU_HAS_RIXI)
=20
 menu "Machine selection"
=20
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/p=
gtable-bits.h
index 409ae01ed7be..4da79b85c179 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -52,7 +52,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
+#endif
 };
=20
 /*
@@ -79,7 +81,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
+#endif
 };
=20
 #elif defined(CONFIG_CPU_R3K_TLB)
@@ -92,7 +96,9 @@ enum pgtable_bits {
 	_PAGE_WRITE_SHIFT,
 	_PAGE_ACCESSED_SHIFT,
 	_PAGE_MODIFIED_SHIFT,
+#if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
+#endif
=20
 	/* Used by TLB hardware (placed in EntryLo) */
 	_PAGE_GLOBAL_SHIFT =3D 8,
@@ -116,7 +122,9 @@ enum pgtable_bits {
 #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 	_PAGE_HUGE_SHIFT,
 #endif
+#if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
 	_PAGE_SPECIAL_SHIFT,
+#endif
=20
 	/* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_CPU_HAS_RIXI)
@@ -139,7 +147,11 @@ enum pgtable_bits {
 #if defined(CONFIG_MIPS_HUGE_TLB_SUPPORT)
 # define _PAGE_HUGE		(1 << _PAGE_HUGE_SHIFT)
 #endif
-#define _PAGE_SPECIAL		(1 << _PAGE_SPECIAL_SHIFT)
+#if defined(CONFIG_ARCH_HAS_PTE_SPECIAL)
+# define _PAGE_SPECIAL		(1 << _PAGE_SPECIAL_SHIFT)
+#else
+# define _PAGE_SPECIAL		0
+#endif
=20
 /* Used by TLB hardware (placed in EntryLo*) */
 #if defined(CONFIG_XPA)
--=20
2.23.0

