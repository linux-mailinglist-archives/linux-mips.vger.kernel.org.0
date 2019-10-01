Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0668CC430A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfJAVxe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:34 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728158AbfJAVxe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4oAd3TwORqGAaoeZKwF7uVar4dD3eJ9sbjHwRDI5dY+3EaDC52TydqZ+wLxQNvqTFRtiijv5bkT03XW4g7txlknu5Ft+TO0ZQMOSvu3u0rOhNPqTZf/wvs3AGWV2Yfk+RLUVQHQx2afZ1orb3OI2qhBa27rWt3j5QIvTvwOJHQcIwc4ElVXNbJLcPE1xQWWicVyi/2UxTPkqSIRemYLx0RlnmtpnfNUMzK10FTsLXVIDvG0pEdi0bMjH+GLR+3zK5RhuvFmj7xqxL9Xh8YghKI/xeK0TjMR/d4odbVLz2P2TTzOakGiXpWs51zoWtOjyCaN8Ur+pa7TDsRYUhMECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfiRsDiQqxRk1eif9MMujcDB1YCLPcoEvYoKJruLovM=;
 b=iClaUV3jqnD/kRlwe1A33KUsRTvFqYtewfYKfNXHsaC5ITeZ1DYiDCHdQjMT4MEGSaVsey6EbaIttYN+BNxFevBrtpKwsels8PK/133fMxWoHm4HygXonkoJtqw4EIBlPeYF2kMUGWCYZ1mJVtvoOmkcp+WRxkoEYxZ6V9ITrHnvCYQZkb7DjWAXfvqiwMwWGlnFs08EsV8fHOPpnA7MHCbNggmuAfDjaGNIy+ybYDRhWBFrtVxx2u9yEMb1nH4zBD2Np2QNlIQIho25NAUBOjfGmu7hwJ2eXW/8Ejj364iv41OJD9dhpTWAbjOh94UZHUSr629okmguJf5Ys6GpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfiRsDiQqxRk1eif9MMujcDB1YCLPcoEvYoKJruLovM=;
 b=K9jTvt4k4vAmGTz3AvIBw9hmCJ9vznLZb0W5Aubdn5ebjSD91A0vxlNwkL7yZvIxSM4Cl5VDUGfkhwkey4NfXQRyNgR5PXWSDce+M1wLt6eBlMxqOV3nbLZ2Z1wxZiWExmmpopi+fpMN/buq0KPEI1yJ5ESAVts1NI4JrtIB+Ew=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:26 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:26 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 17/36] MIPS: bitops: Only use ins for bit 16 or higher
Thread-Topic: [PATCH v2 17/36] MIPS: bitops: Only use ins for bit 16 or higher
Thread-Index: AQHVeKKn4vPBf6q7eEKYatE8kpS2FQ==
Date:   Tue, 1 Oct 2019 21:53:26 +0000
Message-ID: <20191001215249.4157062-18-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 75f2181c-5fb9-4009-2844-08d746b9c9bc
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439632C07AB0288D213AF79C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwFmUgZRnN/fc2FQIqrdzqBOEWrULQgJflhTSoP83DIvAJaxlAVQRfTQyP5PuvNSSE7oyoZBeGyOHMgAGXNVBC70ECptFRr9UNV8iF0zq8Z1ny1eudSxSBE4jSTq3Hhz6c6MJgsaj0ANGNoenwja7tesH+LF6kj1gHN8RQ6/VDeDqcVa/sM7OgbzYUmm+JHAN9FPOCh38newSfua7lnc9krH6C5F4t8xhqyNFPdkHnV/ER4NjtSQWZmZTMxJ2yD5+S+7gGyig/3C+8RTL1otoX60LzgXFdk7CBYWd+uQBv4i8y+Am8jEu7PxToxvWqvnUdULPyqJIyUIoodx808lac5po5Tut/0ReWjgqozgKxRfWi/zDm+XNldXwM2WPuWkbNq78Z45TilDqIOdQ0DEHva/DFqVAgHjO6U4HbjKo2o=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f2181c-5fb9-4009-2844-08d746b9c9bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:26.5429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+0eaYBHxe5dgOc8tlNJe8CqCwyDQZvTo6lEmR+gAg19D5GChaYlUL10igXucTWi+giYgWuyxem9mL8OARnaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

set_bit() can set bits 0-15 using an ori instruction, rather than
loading the value -1 into a register & then using an ins instruction.

That is, rather than the following:

  li   t0, -1
  ll   t1, 0(t2)
  ins  t1, t0, 4, 1
  sc   t1, 0(t2)

We can have the simpler:

  ll   t1, 0(t2)
  ori  t1, t1, 0x10
  sc   t1, 0(t2)

The or path already allows immediates to be used, so simply restricting
the ins path to bits that don't fit in immediates is sufficient to take
advantage of this.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index e300960717e0..1e5739191ddf 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -77,7 +77,7 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 	}
=20
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
-	if (__builtin_constant_p(bit)) {
+	if (__builtin_constant_p(bit) && (bit >=3D 16)) {
 		loongson_llsc_mb();
 		do {
 			__asm__ __volatile__(
--=20
2.23.0

