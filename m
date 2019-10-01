Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8534EC432B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbfJAVy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:26 -0400
Received: from mail-eopbgr750115.outbound.protection.outlook.com ([40.107.75.115]:30851
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728447AbfJAVyZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCcrQDCNyI39OPoBimBqB7XUQS2Ga2MXGZbBue0u4s9NgufINqiQseC1/GvA52VozhYukiaItxrmuA/rGFCRD9aionJKOlpyL4f4Tw34zZtwpcsIkJEHHmUNZzdGXGzrvMqhrkkHtqbmEl/fy0edvoaEkbCiRGOAu4KtM98jnKbWDg3d9222R6U67VuO6MOtg+HiUIQ3Q7M2C5rfKLperA2g5PjlgyIUcgU2cB7erRaaTiqDJ4ujg/+0jxZFMuF/PiCOUym10PVP/fUMR+U2OpGi3RfylWUEbM+9g1Sk4qr/FYJZGzXO32Iwx8AaFlvnp1B+Gqr1lvvzD4NdCz0IHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEuJ/46XhwVU2eIrIfOwmeNx92pxUuflO1ZQt5HbWCo=;
 b=N0ecvU2KKDBxd/Uw1Cqjm8elo7cONLBlZYt5jWuebFZrf0r6VXpCJGJRoaRokpHFgQRVz/KYFdcFf6nZz6Bcs02FEoSoeY/J6OL6us4wX75zcpFEvl/8l3HKbOp+Zhicksu4Xb/g1Dqt/hg2DZFWleOzb72u319CHcbfESZ8WckoV9wDWzidbGE1btXKymXj6YI7LjSFSa37uFYZERup98mVKIJ5h7QzboU47TrPT2jjTrQvXLvLgYQ3PcpE7YxvGi6QGO9BFLQ61q19+sk0Uf0jaAxiiwFhPpS7+Obk/dsnTq4qr237pN64fciROmCAoCsDUpSvbmo/t+jG3fEXqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEuJ/46XhwVU2eIrIfOwmeNx92pxUuflO1ZQt5HbWCo=;
 b=FHC/iLNDqEgtRmQiQCdbLqBjCa/gUsqTymtp0wRtMVRbY3Ih8K8yOcFD2zyX2ohvwV3rqvQTW2iD2evozu9Xt1WHcOZsUDI8u54AJrUswUM6g1A5AGgZDqYk+dwfeKGnoxeXSwNl8bHoUKwXqOMYVgvKxCrvppIFRcDUlSuzEi4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:16 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:16 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 35/36] MIPS: genex: Don't reload address unnecessarily
Thread-Topic: [PATCH v2 35/36] MIPS: genex: Don't reload address unnecessarily
Thread-Index: AQHVeKKxGksHXgvWN0Cq1FTc0sIMpQ==
Date:   Tue, 1 Oct 2019 21:53:43 +0000
Message-ID: <20191001215249.4157062-36-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 4e443a24-2d61-4a1f-d2b9-08d746b9d3c8
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB15811DCBB2345314D8C6F232C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iVsi1yyHGIykh5K0ZPf/KofbYdCDYPPAMmpIm2u0Auy8AVha9V6a2JemHewtZ/tqRnCKl56PHcruuW92fZa9H6k8tc1a6scDR2YmMubylULzzAVSIsC6G4ryJ2fq8d8tXK8CiSF6+Hvr2g6O91MIE2oQrNTbjljPtQEUfneUFF4qgRTLF4El+mJSzNjicljLPFoXxLyvHSTDVkfdILouMD2yUiwGEs0axGlHGNR9cfFhoF5fwozFHXvOhfFoCDIAKNPPoLYRaFre4Mkdz+5mwODY7pPjozvGkkFpTMFMhOWqZBf1njOOQT/G9RRQp6S2/wyi0yhQxcIZclbK0hjeKFhnMTuNAxQFMwKFlZYkbySlYJqNltPZadQrDzYeeHNl7xVi93dFXYru4ArjZOp+vBRLul3XmXcvpvsS5CNLVIE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e443a24-2d61-4a1f-d2b9-08d746b9d3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:43.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbXSJizRjekxJcODd79Rvz4k1Zj1vDSB2datmgPnhsVv/bv8nU4fvZHaCSC2k4Tw09UyPk6nk2ZUAD5Ng3n0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In ejtag_debug_handler() we must reload the address of
ejtag_debug_buffer_spinlock if an sc fails, since the address in k0 will
have been clobbered by the result of the sc instruction. In the case
where we simply load a non-zero value (ie. there's contention for the
lock) the address will not be clobbered & we can simply branch back to
repeat the load from memory without reloading the address into k0.

The primary motivation for this change is that it moves the target of
the bnez instruction to an instruction within the LL/SC loop (the LL
itself), which we know contains no other memory accesses & therefore
isn't affected by Loongson3 LL/SC errata.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/kernel/genex.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index ac4f2b835165..60ede6b75a3b 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -355,8 +355,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
 	__SYNC(full, loongson3_war)
-	ll	k0, 0(k0)
-	bnez	k0, 1b
+2:	ll	k0, 0(k0)
+	bnez	k0, 2b
 	PTR_LA	k0, ejtag_debug_buffer_spinlock
 	sc	k0, 0(k0)
 	beqz	k0, 1b
--=20
2.23.0

