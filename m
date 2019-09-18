Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DAFB6F2B
	for <lists+linux-mips@lfdr.de>; Thu, 19 Sep 2019 00:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbfIRWDc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 18:03:32 -0400
Received: from mail-eopbgr730133.outbound.protection.outlook.com ([40.107.73.133]:12862
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731394AbfIRWDc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Sep 2019 18:03:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYhPi+PqIKRvzA3UUdnpTbY17kfuIIP3Lv3fuw7oUNir4VY0COtdErLGjtZvIQWEJPlgrFEPzSmiohLh8EazrPccX0MNvjRpYq5ArNNkrbqw3dd02rFmkvlp7JuftDTiOkvFauWa87h4feXCTdViN75aDQOKZyaUkXvmH1KAu7xJy2Mtxfalg7/nKYPhnvnahW/ET0w5Czg2y0gX2fmsTzVNptw1pJoFRrHzy+5C1Y9R0rjNuo+L18UDsYrVVw/bOXIGDNZjVpymAHbxyxjqHlhO3S7cdRwuZGcP/ywQLK5kWSsDOlmi0pXhF6R2l5tIsdH3MSOIa2Tj7xJfuenGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78OlvjNfM/M1+otIu47FSPThI9F7ft0yai6iH+54MbY=;
 b=OhQnzdoNaq3TpLGb9QCL3FT/oPtJ4aw8itRFtzl3M6WIkGvWEGJQ+vfY7pduXwEsjZbX8qHGZ/QQvN/d/vr4rplfbz8MgbwE859SDn0HY8Lh2fOYlh9tbZeQsLHRV73EA9otjUH7KxvFQK/qCCrGfXdUEZZL0+bItbh2Opk9UTUDhY1leeUFv/0NUF8lDaCeVJlt8oZpWbFNAYwy7cIhk4TP6vXsVmlnup7AW6EwGVu9O7Z+aAZ7tr4GwB7/pu3PbGIM2+TtJ8mVfBHD8Ag7gCH7q28ulLrJMVqu3u4xGiNowlPykrCWLtNFdOuauRBHiOlhzyMoWsf5Wl3NX9LaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78OlvjNfM/M1+otIu47FSPThI9F7ft0yai6iH+54MbY=;
 b=InVQm3jwLJlaGb1BW5nxWVn7FVieQVULgmenGn2Dhh9hedj6E5cfrRo+xUYdgAYRg9mSmU+VI+TnZF9MMzh2UrOjVectye7iGNpEWnJrpzlcJEgYlBN6Ffgnz6vN1YugeyidcqfThM4ph1Q7HzJ85CUNQ2iVqGOnqg7knXbJ8Ds=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Wed, 18 Sep 2019 22:03:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.009; Wed, 18 Sep
 2019 22:03:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] MIPS: Disable hugepages for MIPS32 with 4KB pages
Thread-Topic: [PATCH 2/3] MIPS: Disable hugepages for MIPS32 with 4KB pages
Thread-Index: AQHVbmznrzP4VEr5N0evITtuDogpAw==
Date:   Wed, 18 Sep 2019 22:03:29 +0000
Message-ID: <20190918220258.29428-2-paul.burton@mips.com>
References: <20190918220258.29428-1-paul.burton@mips.com>
In-Reply-To: <20190918220258.29428-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: ee0bdc3b-6acf-4b13-905a-08d73c840983
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1088;
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10881BC0E6E938976E48248CC18E0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(366004)(396003)(346002)(39840400004)(189003)(199004)(71200400001)(71190400001)(42882007)(2616005)(6506007)(26005)(50226002)(476003)(6916009)(76176011)(66946007)(66556008)(66476007)(102836004)(478600001)(7736002)(6116002)(14454004)(25786009)(2501003)(4326008)(8676002)(99286004)(186003)(81166006)(36756003)(64756008)(81156014)(3846002)(8936002)(6512007)(386003)(2906002)(54906003)(6436002)(305945005)(11346002)(446003)(1076003)(52116002)(5640700003)(316002)(5660300002)(2351001)(6486002)(14444005)(66066001)(44832011)(486006)(256004)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1088;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jY5MpF895yjXi2ogLrXN4+TpJkfjiA28eJmfxSRjVDKottFXVcDUeBESMxMYRmzBwy1dC36Qh1YtnCZ/92GRMuLb6fJTS8ixmuOTWrNfPDmhNheOdOLYdLVITBjkn21CXmh4usREIlBfQefSC4OeUYK/JPfgi7hzXuxhDztJkHaH2xYLZOtZRvPF9ACr/yDelzutc24+1GUhWQiu5SU4KyKtBXTH3MtqAozd4TftygQAkR9jJxh5I/jjiMe9a6lzkjtMF2ctAf8fpFEu8S0H4t4dAVmHkZTAsjU198tRyBESFthH+dKPh8d4r7nl+nE50EqTZl06tYbAg2rSnlHnkhLzRXzlgm9C/G/Rcp9gxhycQs+ZAumkp0hhI6p2am6iywo+vEMplNvYAIxRVKFphexzF00xmO8jHUNV+mCf/jM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0bdc3b-6acf-4b13-905a-08d73c840983
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:03:29.2189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Qar9tDX7e+rky2ABpXeWacKLlYDeaLmFDizJfuaRfCRQkeJF9Pj3J42gxKxb7pQE0C07EJwxdK/+7PLfd7x6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 35476311e529 ("MIPS: Add partial 32-bit huge page support") added
support for huge pages in MIPS32 kernels, which requires the addition of
the _PAGE_HUGE pgprot flag to PTEs. Unfortunately for configurations
that support RiXI this pushed the number of pgprot bits to 13 (ie.
_PFN_SHIFT =3D 13). When using 4KB pages (ie. PAGE_SHIFT =3D 12) this
results in us shifting the most significant bit of the physical address
beyond the end of the PTE, leading any mapped access to a physical
address above 2GB to incorrectly access an address 2GB lower than
intended.

Separately, commit 61cbfff4b1a7 ("MIPS: pte_special()/pte_mkspecial()
support") added support for pte_special() which involved another new
pgprot bit. This leads the lack of an available pgprot bit for
_PAGE_HUGE in MIPS32 4KiB page configurations to be extended to non-RiXi
configurations too.

Disable huge page support for the affected configurations to prevent
unexpected misbehaviour.

Fixes: 35476311e529 ("MIPS: Add partial 32-bit huge page support")
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Daniel Silsby <dansilsby@gmail.com>
Cc: Dmitry Korotin <dkorotin@wavecomp.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---

 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 18163c138676..fb75ed5443b8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1227,7 +1227,7 @@ config SYS_SUPPORTS_LITTLE_ENDIAN
=20
 config SYS_SUPPORTS_HUGETLBFS
 	bool
-	depends on CPU_SUPPORTS_HUGEPAGES
+	depends on CPU_SUPPORTS_HUGEPAGES && !(32BIT && PAGE_SIZE_4KB)
 	default y
=20
 config MIPS_HUGE_TLB_SUPPORT
--=20
2.23.0

