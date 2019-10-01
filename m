Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9747FC4334
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbfJAVxh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:37 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728177AbfJAVxg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJCab2LgaLrvJyYrUnFOSa9RcFME5qBcRP6NKxM5c/jx+DVUIOaNfX8oaLTah2KWiom/1f9duZhf4Wu4tMu2zxEc1FsWGgIJOVqOFOgp0ZSZj5T1dZPKkpOMkaMMUOM57NFrvwpXA3SVTJm+ngMtv7QO6AW6kXrt7UCr0etDwzIPddjkqBVjy1/CJoKLEYV9c/o0TZe934oOGxiHj1fJX8SId7EwtiOoz4kwf+hxiAlbQG5hSs4iIyNupIyFUZrMXKA60kKNX6mSiikNB4kXV5r33gbTmIIzVJn1b8Hl6sFrGv8he+Mt8EiaHfzculKabdDcZKWhfU3mj5ILeCduAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfQFj92XwiM5Yll6ITwBRnUHmK79aZPRXQ36V53lwPs=;
 b=afQ8TXxmy/FqSd5so196E4HVcUeiyt9jiacGyT5Py7251Uu9Rk/IAIBSANQz4l2joyiEbZbf5wpMKJ++yRzZ2a0V5oEYGuia2jxPxEIPn15A6WwXkQtZw4Kjp/WHdRU7tUhKkt4qZhhYoWIO+EPrgSw4NTM38zEaF5ml1LyPY/hxLjNIFw1cn98CDxt2A/tYUvmPdK425uKJetDBOveVM4Ugjuw0JtK2RK7QSquHdyGVMqVHpfU9gxFwiTMOsEgCYucuz8phkDuK2yovNhyOLDsAHk/VwoLLPDNFhZKiHXDw0Cm/NzHs7MW6YY0klIhstQC9L3zp3PJQf4jRWW0MtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfQFj92XwiM5Yll6ITwBRnUHmK79aZPRXQ36V53lwPs=;
 b=o42ZpeGPUWIHtUH6cCDu9WTgYZjE/OdtdRPUqDUQoAQ9rh54kTstPBNf+xt4qtoqBVpKRUp1TIFfCpr29yFpOrYucYepOWpRBLkhdWvze5yy14FUl+2Qa0SWdycOYiyBhpIJFzSN+z9ZXBCkpkPhApkz/Cge6KMGkMr/wif5D/E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 19/36] MIPS: bitops: ins start position is always an
 immediate
Thread-Topic: [PATCH v2 19/36] MIPS: bitops: ins start position is always an
 immediate
Thread-Index: AQHVeKKpGFkNJ1wM/EuB/qgdkW07aw==
Date:   Tue, 1 Oct 2019 21:53:29 +0000
Message-ID: <20191001215249.4157062-20-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 468e0ca3-ee65-49c3-4969-08d746b9cb81
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14399608912C26D85978EA69C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004)(14773001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c6ks9cX5dYcPxi7uPV1n4z1Wm5ToFFHkt2GHB7u935/bVkaYx9XI7oecMEACZCaKUO04Hcg+MXKnoJQ2UA4TP/NPQ3eyZamjRD7bMY+OvVTenrSSgRMcMPrJgg6lSGelRI61VdJ8GM7yKGhduFHccV7NsODXxiq+R4Ic8mhZkgN4zw88BZ/WiW29T305Vtmrmlg/sObDsKFrGJBwfl79mOQSudIjDt6YWzM+07BVYRmkBdZEeYg8j6o/wz3T19PgEi66yem3pR0b/7GjIrr4Rz55CB1Hur+9XB44yS7s0Bhk4zvoNSEpt70Eklv3tZMt3u667YuRBUeBhR4ajhSShH+G2BwLqmDPzP7pwzWoTwGVsh8/7YpO8niSBpQfpUUYF92DcTaf+2vxZDbSkfM1XyU3Id/E2pKxjdBvTpG5RyQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468e0ca3-ee65-49c3-4969-08d746b9cb81
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:29.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OX7LwPCZnvbTKg2EQrBMW4QMfNLCw3lQ3TirWoN4tqszFt5imivMI69r9VDmmkaop6kqyT26RnfEJqi0DV08cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
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

Changes in v2: None

 arch/mips/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 0f5329e32e87..03532ae9f528 100644
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

