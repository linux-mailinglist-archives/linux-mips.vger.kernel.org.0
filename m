Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6DDC2A96
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbfI3XKF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:10:05 -0400
Received: from mail-eopbgr820094.outbound.protection.outlook.com ([40.107.82.94]:14848
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732602AbfI3XIx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjE1sS7cZI4JqjaX2vfR+Hkj7pZ4y1eOmRBDmwZ+/YvZUZJw/UcEHhJOqioAMJkiZwc+CHGfTCzqoRSwgzzZDvS4pNwBRiSDUADDx4Xt6jA8Yf1IYyNpXhVsI0bXreZD8Y5NmIJJKL36iepaUXmJEiUWVsP/NSMz3cme2/yQ147uV8y6VTjrX1XkdhFGLkkkUR/UFSN4wesH4rXA4JLvRKT4rTViUjbJvtvR0z3l6Y2xwwNd+cwpBzyBE5o1Uep3AvpD1zrxKdYj0/MZFlXXe0FmvauGIxYJTRmbRd0ptpZ7HnrSGC+BaB4mL2S3aSyMu5SNtWpQKKwH8qLCi6/rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8h4x6IZHVrHGXCy+MhCVSH+owuj567idbwxbt7smwE=;
 b=WSfyA23i+yTuzlKbDFxJCwlWzb2JQttpZ//yeAt4GiDE9jRIL4zQoQuoQNkyYUfo10fPokfJBtURwBHvuHOHSQ2MKKzli4vbR3OcgUmM06riLOSdTUf5KF0ZynzRbKH/JO/yzHH/1PKpMvKgsFIy+qzaZeYBnvPetZ6d9QS48uGur6iZ7tJJDAWIBjI+zfaeQ9NVckqgUnmrob1CDY6oSJ6M5QpEptL1XmyR+Nvn3hbie2erh1ItzrI0lRzYsdDxkvz2iOzFjqj6+7OVX8tidHUVP/Co1ywcH6iXX6tgm4GfZNCCBq68aA9n2mLTwZAGm/oSly8MJSqlxh24xPdA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8h4x6IZHVrHGXCy+MhCVSH+owuj567idbwxbt7smwE=;
 b=K5sGSiuFgV+/2zXkF52DVuo+58J6ry9JNLAXk7a1eGTXsNdu33zvW6JUk97GMpmwJQk+cUL9Fb52keh1Sg73uW0LkG8zr6NP+5NeBJqJm6xV5fVjrKLyadFh9LV2yO3hNilYDViKmXvNmSttQlFRbYB5p0qacVHEsudJv985HZQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 18/37] MIPS: bitops: Only use ins for bit 16 or higher
Thread-Topic: [PATCH 18/37] MIPS: bitops: Only use ins for bit 16 or higher
Thread-Index: AQHVd+P52h8wulv6i0O0I9TbdXtkog==
Date:   Mon, 30 Sep 2019 23:08:29 +0000
Message-ID: <20190930230806.2940505-19-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 061f7950-b6b5-4f63-f002-08d745fb1b73
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022066B6DE0F806BB635FC8C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92ebSJFmhjWC3VgI5seaEqiaqHssWTHFtaxVlz1ezRxDWwVZDbZRl/VnivWAhaZbJfrLSJebNRgqvh9y6KjX19tk4YYZTqHGQDq/CpzAxOCjVLJM+1mUuSKxRt272wO66aG0s3HJq80t67FRvIDbuCPH/X+oq72HYPhke8SZ+rpCHy08FBXIYk/KWT3MigMMPx6u+gAMYObKD3T9raNtJommlzUlMGrSdPI/NLnquzV7HsS/pz0hb9m9VWv8VqaDPu1GrytWhYzdAoSXhs7IYOQ1dT8W5xI37swSHa1hKy1Tf8ZeV/fs8yNwj+hV2pQMnUfbVLGLkWZXSJlbK4c5OaTsm3e3AmuN5/85PifLcMsWrGh7lyN5IrShTZPra4YQ5hxbtnWJKp3dqr6snV+lq6XsbaGUMeTSxmZCVXyCBmg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061f7950-b6b5-4f63-f002-08d745fb1b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:29.7734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a160e0JPoppPtidL8UdBaZPxnT2cwn81VM+A9tY5poHwFBFpcf2pHh7Jq3bvkZ5o3HJPCiAb6zJeMMbkrlIJIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index d3f3f37ca0b1..3ea4f172ac08 100644
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

