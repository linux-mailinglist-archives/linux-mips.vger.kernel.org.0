Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326A1C4300
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfJAVxR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:17 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728045AbfJAVxR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxYVwHSaAZgQICLEgrI4keSQVVIr81dTFIU+I2m2AVzbcIVlgP4ibsGnIhtBe3RPcTK6efI4DO7ZOydv7irHgH+WpFKYQtigkDweC0BCSqRCZ+gK4D5889n7cP69gpy8VEcp9GjFRRcT8XYiwjqSrH5BmwKzf9iVUzdBkZ2DgILY4MskTisK6rfPsCfbkgY5fwqr5PGPatt0uU5tdSLFDgegxl2I4/LIA+7hQZcINDapZOJcDW5LFuQUlDxg9SSzvL1cQoGlrUqGzUIrjvHhhmL82HN20XrZANsHTyUmLM7sN9BOeZZ8CGEessAkQXk4Hd0aYZs9zjvNnKXoK6TtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cwWhMELYLQJHbgf/OCb1XluOho2mW2rRT2RERpUepI=;
 b=Zp2I1Si+kNoT12J6BjO8dz8yim6T3bQNGoTXXjVA+2vKRR8+2afZBiUTT0xvEvk7sW973LpbeAohdow0Nehltxl9NdwPgjpRElCfAW1LQzeyunBQURDwDw9eV1QIriOhg4zuUWvqNFEvTk0S6y3ecZiAdltaW8HiDnKf18cVZ4pEhKuCywmTPdFdkVEo0mRITIFb3vFNPFcmtLuPqH5syhs1nmNmdDRrXISEq/piiOV3bH7nmNtdRvwOsJY6DygyTOffcHOwRGlia4sna7iImIsYD60bBjRfU5/C97CIm/vzYulKDOrHql4dfSNDgXczE60IwJ+22qmhMWA37tYoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cwWhMELYLQJHbgf/OCb1XluOho2mW2rRT2RERpUepI=;
 b=KGRY0GUyQ8/YESfw8tLKenT2QV5lszqfZibgpJ5HU9NH1PGI+Iv8gK4o6wulN7I7GDZwY/OCEmPuQKPqOIuj4AsiXxgjh14mZUeQsDj3oP8Hjz8Vuwez0TI4edFFq3kTiYgoHtJd2mU2AJnKaipsuEKnbZJcaLdMIGqQOdYUdps=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:14 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 08/36] MIPS: barrier: Clean up sync_ginv()
Thread-Topic: [PATCH v2 08/36] MIPS: barrier: Clean up sync_ginv()
Thread-Index: AQHVeKKfhd9UvyaMP0GSx91fZ7LfQg==
Date:   Tue, 1 Oct 2019 21:53:14 +0000
Message-ID: <20191001215249.4157062-9-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 5cb0c0b4-4343-4fc1-365f-08d746b9c254
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439413943D65DA2B2A05A2AC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(4744005)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P8I4hq1ao6dyv71Ya/7C2qFkkFjtxocDUVTo/tCTd7m+huXOnqgfguLvT/0i+Hrt3GxgjKPOLaysF97PQl981VwSLC/qoIROImlzSRJ3eDmWRGOwzqlsdor6iw7x3aVa1pTDD83UsAfHdXsATK5bDYI7vOUcft3N1kDjxVWSDrY5gliOnC9xGimBme7quOWyoIplxIOAj+3jp+j0+CUR6NHQ/1SMb2yzc6MIYokQn3bEGuU+WsilQ/9B6Dp9AYCY/8EcRBb2KDWzzKzKjO+xcSAH0ItxMHsJA7L4S4l6ckWswcSbkg6CsJNaUpRwsRcVh1iRem0DbkfYmUqsp31Y47xCvvmYklBKu1lgc01M4Zpkkr9RdjSM9dYeA39YRgUtlBNNs7nFh4PNpkz7QfSpZQ4LQkLu2nOWDQTQHOJIblg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb0c0b4-4343-4fc1-365f-08d746b9c254
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:14.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K8sZonESf0DLrqL1qqir9CJWY81GGZMkFK42TJPklgfrhKQe6H10Au6Vh+7p02kKefkn86/+cEjrbLZHG88Q3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the new __SYNC() infrastructure to implement sync_ginv(), for
consistency with much of the rest of the asm/barrier.h.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index a117c6d95038..c7e05e832da9 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -163,7 +163,7 @@ static inline void wmb(void)
=20
 static inline void sync_ginv(void)
 {
-	asm volatile("sync\t%0" :: "i"(__SYNC_ginv));
+	asm volatile(__SYNC(ginv, always));
 }
=20
 #include <asm-generic/barrier.h>
--=20
2.23.0

