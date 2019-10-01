Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDA5C432A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbfJAVy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:26 -0400
Received: from mail-eopbgr750115.outbound.protection.outlook.com ([40.107.75.115]:30851
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728425AbfJAVyW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUl6jQ//W19rsoIqZaY0BQCNcXnP4ASTai2TIGMWhxalgVQheJCPKsQ0LJe/E6oh7OcTMvK75txz0HBuIP6isiyH5IPgZ5k3JG1wNGfr7io5qB31coyXlX210LNVHNLxCdJTPcnoLilrSQ3k64yDZKVygjJNvKt4ewOPklZr47NXPIUtYUTF3+/MAzw0lV1P3W5BLAsbU5rC91eRSEVuCaPPomYZZ7QBvNWR1fcP1LsHwniofpBVl8p1Pj4coJw7c1yMthX3wibOjbABe5DLTJEqV23/Gr7SiZG1vrqhuYQgqFBy78Gw8YLI6xeDc5rDJsdDh8DSNRVJyev933QREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+BP8EbJp0rVcdy7AFdozelvMtBsULC5QYdNbsMvZFo=;
 b=Ranmi2QLqhuKN2M5e9JGowrGjsJXqCyzpbq3oQ/qDubk51W+QTawlmG7ryZLz21Bscj28JJu2l4FV5BbzA2IUDqGftm3pscOSkcj60s+dQWR8hzWmYN3O0ustq2z+o4XyoUp1Udjhx/3ig/pKu2rfNZQG4f9+LOw61PCOPdfWzPRtDgp3aEGVIcBDmEIsT9ti7uCbtuRXbaWEThWuwUCb4CLx4Z4y2YujEgc67a24L+IU2C4PwmqzyL95ENV5J0Joh58b+Y7FXO5HS6S49oN6Ped6dtfv39SBV0N0E4ON9twfBod3hXoStx1NkxxTKmoryKWGy282fBeHrK970x0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+BP8EbJp0rVcdy7AFdozelvMtBsULC5QYdNbsMvZFo=;
 b=W1wn3Znz6NJd7mvW86PJOD/i5Ll9GiWvBD6LPpswZM3rlCVM3kTVDkj1/oQu2QSugpXjuv/TT6z5hnXV76V/prTjiZ2MUDwgyIxkm7KyHBBn8JDtQECnV+mCJjA9oIqOpu47Iq6xkGbxTBjhhpo2Z/z/HGC0vA8zIbvFEHc057U=
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
Subject: [PATCH v2 34/36] MIPS: genex: Add Loongson3 LL/SC workaround to
 ejtag_debug_handler
Thread-Topic: [PATCH v2 34/36] MIPS: genex: Add Loongson3 LL/SC workaround to
 ejtag_debug_handler
Thread-Index: AQHVeKKwzu5kY6X3IUqruCoqAj70MQ==
Date:   Tue, 1 Oct 2019 21:53:42 +0000
Message-ID: <20191001215249.4157062-35-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: bf9d3143-be94-4bbe-8a42-08d746b9d341
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB15815ACDCFB702CB24917D00C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(4744005)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uaw5EaBerF5xwd5YTlTFeJlsR4XQK800G1X/DWfMHO2l1+qfQlzxLX31OfrIE/AF1+j2DMXzZ4DLktEhxlqEDrZnVKym/ORZE4GNBRfb0pp/3uUpPwaMWwddb91cqwiL7WDUOo2ofGeq1Ym0WISce+4O1W15BWhlJWYsevesOB1+aHP4cEHWA7HNSkFtU35hWY9ochFQhF35qyOSZvfbYZiupDR1ltyxI2bn52OyFM+q53U+Kq/2YpHQfmT4iOIbLKmv+XJUe9i2ryKAGCUr0WZb/6B94ygq3zYaR2xZTDqbL/zdHWouy2OQ6HuCYrZDZXg10xEHpbqHaVFX/j/JfKRW0o726pWNcjLGImOyyoU10MYwjpL13PL1Hir8X68ZvmRxvHm+YXywt1CvOXemri+i4tBFPM2PahNzfcxxixc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9d3143-be94-4bbe-8a42-08d746b9d341
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:42.5305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYYekGG+Fe40NXL31TgHTn6mCGZQ5OPJDL/qGIsXdK/Snn1tEsED5jzM0STidMrvyczg5sq82C8v9VM3ZdJgbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In ejtag_debug_handler we use LL & SC instructions to acquire & release
an open-coded spinlock. For Loongson3 systems affected by LL/SC errata
this requires that we insert a sync instruction prior to the LL in order
to ensure correct behavior of the LL/SC loop.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/kernel/genex.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index efde27c99414..ac4f2b835165 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -18,6 +18,7 @@
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
+#include <asm/sync.h>
 #include <asm/war.h>
 #include <asm/thread_info.h>
=20
@@ -353,6 +354,7 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
=20
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
+	__SYNC(full, loongson3_war)
 	ll	k0, 0(k0)
 	bnez	k0, 1b
 	PTR_LA	k0, ejtag_debug_buffer_spinlock
--=20
2.23.0

