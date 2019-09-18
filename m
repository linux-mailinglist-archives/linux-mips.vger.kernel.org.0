Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836CBB6F2C
	for <lists+linux-mips@lfdr.de>; Thu, 19 Sep 2019 00:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbfIRWDe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Sep 2019 18:03:34 -0400
Received: from mail-eopbgr730133.outbound.protection.outlook.com ([40.107.73.133]:12862
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731457AbfIRWDe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Sep 2019 18:03:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBjwQcsvNE4mUb389u8ot+4UEEzqv0ewhP/oc02Si2N0ade36buc/VdO3zsMZn2Fap1WXLoBInGm6cBfAAHlVkerc/5D8D83dNsXEa8pZun4KhJD0j0oEYaOEoS9TVgfAkWq+aMZVzdMEzHL5qDG58ROIcwZmonaWFiTjSyF54UEjPX1khdNj5MXY/o6x4bxDgxIUc4F7nKS6yUUZhlWlntbknLLy1trMbip2Jgw1psrtE9yZyoAimBW2CBt0j1uY/ibE2EV6cxC+N4IflvKCXtLEW/XBK3CVzG8K+yoaQBF33k7y7lCXlwOG1h5KfMJGC0ONIQOOgxLgT/ylGi7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQc7FmIcYqVVw9S1q8HEIqiJ4+9MrDbTMvtRdSxieA=;
 b=TFzWn0JbRFb9TeSI/lJmpOO9k3BdeqfY8H7u4lmpKPk5f6hXJxyXzWUzwDAbqPc8Mzz/gdrvUawWswQlv7FFX4qFTi3zuAzDiLEnEEFE1ysDd8g4TmOBiEn95oK2gZL4nLrmlXFQZHKexJBzGpQY2WT4Jlw+HGgpMklw1S0u1GYTZd3WPPQlMm8sxNduJ82bGYy1IMaoTO01gUkvQEv3IYsPotf9NoNbEyout+vCrnmikX1M6QNq1EVgNR1IdC52BzpXgs8Z1XVDsLRBy+FUhT0zl32XH0ZdZSEnXgfGfIfmaTlSsAyN44GsRcH0jItzx+mOQgFNRfHe1oKv8NRNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQc7FmIcYqVVw9S1q8HEIqiJ4+9MrDbTMvtRdSxieA=;
 b=MB6H152Bn/yPvO8n2Y5z6diyvdif4lf52xzS3XZKLBTroCypGm/2KCyWKxEaACj8un/xHQpoRY+kKQ1onF0juxlr75eyCqWvdHsoH0YnyE/i11K5OiJFZtQZflGdPaRNJ2BT1twKxz7Ug2pbWbb6HppofMNBznBG2Yv0CyzYvpU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Wed, 18 Sep 2019 22:03:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.009; Wed, 18 Sep
 2019 22:03:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 3/3] MIPS: Detect bad _PFN_SHIFT values
Thread-Topic: [PATCH 3/3] MIPS: Detect bad _PFN_SHIFT values
Thread-Index: AQHVbmznjOnIdvArA0mIzitgByHIKA==
Date:   Wed, 18 Sep 2019 22:03:30 +0000
Message-ID: <20190918220258.29428-3-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: b438b3db-0357-49db-7b37-08d73c840a4f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1088;
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB108822DB26DE288A6E23361BC18E0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(366004)(396003)(346002)(39840400004)(189003)(199004)(71200400001)(71190400001)(42882007)(2616005)(6506007)(26005)(50226002)(476003)(6916009)(76176011)(66946007)(66556008)(66476007)(102836004)(478600001)(7736002)(6116002)(14454004)(25786009)(2501003)(4326008)(8676002)(99286004)(186003)(81166006)(36756003)(64756008)(81156014)(3846002)(8936002)(6512007)(386003)(2906002)(6436002)(305945005)(11346002)(446003)(1076003)(52116002)(5640700003)(316002)(5660300002)(2351001)(107886003)(6486002)(66066001)(44832011)(486006)(256004)(66446008)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1088;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bACovr9j92EHNvLXN7nw4B81w5vSs/FFZ/pPyVkzAiLSdmelXoK7FLBVX+i8ISw5tzFkRYSpyqjzbM4YtdSZ32bcYElAWLJKClbGKuQcS9YxewhKR7Ed1ticW0V5YmVCxXT7DLx5X3H+Fzpn5h/eX4YoPGqWZCBBqQua/XWCjqQgZ0N1ZjvnOmuxb8I5fIl5jVUGabVmJnCSvjb+mE1/ibCjgvCVnIfR9qCvUlZJAWE7lwguRxOfqtVU2I5AytZZq5jyjzCHYJaNarXm9/wRaV4gAM4fIlGMmgj/YG7/WdLWoEf32idYo1hxNhOc28pCdE75CBp3KZDDLwvZ0PH6zPFwMY2wjchPXklvPItDqN/eMaDVxoQttyrWcYq9Pi6EyVhTXmPIywLZJpND389n3NZpOWWQeJSeFcSzCBgsXrw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b438b3db-0357-49db-7b37-08d73c840a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:03:30.4804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pIVG06hy41FQYIuDNpc0cCQHYdC0ydztwrvL/HKRFqi4OJX5S07jBlM/vQWWU1O5PQuoBWgm3lskWxkH/t/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

2 recent commits have fixed issues where _PFN_SHIFT grew too large due
to the introduction of too many pgprot bits in our PTEs for some MIPS32
kernel configurations. Tracking down such issues can be tricky, so add a
BUILD_BUG_ON() to help.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6fea3b54c961..090fa653dfa9 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -446,6 +446,12 @@ static inline void __init mem_init_free_highmem(void)
=20
 void __init mem_init(void)
 {
+	/*
+	 * When _PFN_SHIFT is greater than PAGE_SHIFT we won't have enough PTE
+	 * bits to hold a full 32b physical address on MIPS32 systems.
+	 */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
+
 #ifdef CONFIG_HIGHMEM
 #ifdef CONFIG_DISCONTIGMEM
 #error "CONFIG_HIGHMEM and CONFIG_DISCONTIGMEM dont work together yet"
--=20
2.23.0

