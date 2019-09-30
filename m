Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03DE3C2A98
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732530AbfI3XKN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:10:13 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732442AbfI3XIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKJESwtrBItD+o9SsVNjiGVRYeYzIYvtoYshrcJ96js7tzvIxTOLj2j3PPA9TdIeuIvdI8fgBBze4co/Tz8e0i+jjkAVN0aYAqKsGM63PM9wYtPY0neWdlst2OR2b/Z5HxfgwHkHAj/G52fKoXX+1o01zNZUKPtCMd6a+9jy7quES9QMMl2Lu3wEtzVIXm7BE05nLikMiIkJLfbdXM6uP13LWM0bIj21GDDPVENi2lc9UeWM/nqQF86+gbPQGRk9Bpbu9aqurueBMk+OUljb5UbUiWmHMiD7sAV/VjTXMKhqfo/PqrYnhSGfgZJTgmOCT0+jouK1G6pU9giQnDlh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s52wFl4qopTrNonQGmwvzdL3cvCZuaf5g3wPIwJ0j0=;
 b=QOkBQbPpeyc79BPmlWAuT4vRZVQRh8OOS3BqHLuPo+LLnsDkUMFNVhh4gu51KoWRMOX4b5YyontWeTFNJolWeucG54vCp2UXL0d/F+Qk+I1n0CMcxKd4j0caOsjzTr+aj5EmBliac9OI0WJuidqAOHtpQToCYiLtADyDa1jG+PICqZbxaTXlFqi5KNnF2SrS0MJATzHuALLtX1lRaiotUMNaL4CngzJ6gk5u9DePmhFr4d24NsQ/TNayGWFqh7X4+oiAu4w2F2NUH1C2HgTsiiugL4QYqiGSVK/jeH4yU2rUmlIiiBxlAjbbZibxMdJVnyWJyOZf79rbuUMcBQlEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s52wFl4qopTrNonQGmwvzdL3cvCZuaf5g3wPIwJ0j0=;
 b=ghseb7DClReMwrQkyGrOOVwRbGzoDRNcGOmJkgQ7m84a0HcIAu51N8QsRPumpV+JSWCkn4y37zSNsLqduxezmkAdmLvdhEGzvpgB/QQPCiHashJQ82VSvzTio2O/78tt5xsMqru4dsjxklVHLc/F9Lcrm/3YngG/f0FsYXMuEJ4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:31 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 20/37] MIPS: bitops: ins start position is always an immediate
Thread-Topic: [PATCH 20/37] MIPS: bitops: ins start position is always an
 immediate
Thread-Index: AQHVd+P6EZDR/gPpYUyjQdLtXj7q0A==
Date:   Mon, 30 Sep 2019 23:08:31 +0000
Message-ID: <20190930230806.2940505-21-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e925c1fd-dd62-41bc-0392-08d745fb1c7d
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10228FFB56A6EA8C6B560005C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(14773001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fOeJyq1AqjBmeRQYUnQM0Hjp7gwZEsDLhOvVN/B1TnPRhhjKALHxJdh7U9VMOURYcqdHlntVdJJva15i9siAsfnPbIx2aiWKf+GcXbW4+FcU0yfyf0dbYgB2qJcGWhjw6ARRTUAZ2AHvgoqXTPs18Vnp0RLDl+oQ368pdhB+IxPYiYeCERPaOYW0pQqmftJPQGLEmaLFEJIcoWPvrzOyYNKsoV+22KTHzYzmJe62B479+vOMFrQUXGNLLOuWNBuhqFHMHZBWUFJNeFSQH97g1dT/qrC0oAyu5phax3ZSQJa2v2A7J2cl9BQjK9KnwJ1sUi34GYcJsKrr2RsgX5J6fN2HneIaUgvPMJImulg101rEDBWwGDFRWi3DV/3Gis8uCDJD/uWAx6txduGB2/2FkOHU3sZjuFU0WllihaQ4QeM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e925c1fd-dd62-41bc-0392-08d745fb1c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:31.6295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7gmbtDLRwgx6tHV8LYT9ndXM0TgZhfI1n/vkLYxW4POHzDAkUwa42rRP578duq5420AiDQRVyezDrYQlR1ZsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The start position for an ins instruction is always encoded as an
immediate, so allowing registers to be used by the inline asm makes no
sense. It should never happen anyway since a bit index should always be
small enough to be treated as an immediate, but remove the nonsensical
"r" for sanity.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index b8785bdf3507..83fd1f1c3ab4 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -85,7 +85,7 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 			"	" __INS "%0, %3, %2, 1			\n"
 			"	" __SC "%0, %1				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "ir" (bit), "r" (~0)
+			: "i" (bit), "r" (~0)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
 		return;
@@ -150,7 +150,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 			"	" __INS "%0, $0, %2, 1			\n"
 			"	" __SC "%0, %1				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-			: "ir" (bit)
+			: "i" (bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
 		return;
@@ -383,7 +383,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 			"	" __INS "%0, $0, %3, 1			\n"
 			"	" __SC	"%0, %1				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (bit)
+			: "i" (bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!temp));
 	} else {
--=20
2.23.0

