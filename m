Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C0DD527D
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 22:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbfJLUnl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 16:43:41 -0400
Received: from mail-eopbgr740101.outbound.protection.outlook.com ([40.107.74.101]:53632
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729516AbfJLUnl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 16:43:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvkPsg5UnoRGnkKYcVxXdxrG4aHBFpYDgye5C9bzXveArYGps7LhBeWeKdBAW+ZNAfNqXiVn+t8TlSGBmeJVBLgdeXyoRDGjk4gCd5EsjTwLwVma7QpD0JLDSozevDMr0vlSyjXgHjCOYaMk/NIMVJzi95AXGjRlZj7Jf9JDph5Y+YUkfMtxZzgt2oB1xiZN2Zwbhr0suYIgtOoWhK3wDTUna/iJbtgRE15Pubahaf9b9HJIDsPdQgPKwEEjd8WTz9X3L+eSUAVBMq5DsdEZkh0rNVNv9SbFzqej4sVbZKrmep4X5IFPyAE+pH9k/E/LAMaX3yBiGDn2bzN5lNx74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGs50rnRhhh69vD4kz6lxRknb3HPAQeWn+FYNOPADjw=;
 b=UEmjUAemLMzE+/bnIA2+RW81Bm6huFCZ+LO2emsqOQ1mAUEVCdzxSUPaSKmFUNA47o5GMFBZEm78fsFoZeMDJSYzFpKmEPwjkmTpNd5An4fIfActWPZHII+Skh0P/dbO8iUv0RTFhKSxUuJeUQ9qFEeG+e8Ypa+mr5/T/kNPCXOV0SpDIHPvNONV6pnz8n9bVLS75GWAgwyRxl1e/i8RoaluObRMyK6DOVbyPVNKrjigUTwnowR8+tzLHJpczLdaOqHC4sCqoxkG+S2mYrQn0f0ex4rCusjyoaY94iNiTe5OPOXU/vJtp14c8a8fSnxD/CRh5+WAtBG+TMnrjZTGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGs50rnRhhh69vD4kz6lxRknb3HPAQeWn+FYNOPADjw=;
 b=n6eQMXgHlWA2wlrIlWksJvHFXXEuyXCq99Dtt5qV2BCHrPijb/thiTIwn0IWTeTrJ7+579xYXRLC+QCM6gHYZMqIolvPTGtf0HwiTCOmZncJYGTshNmRPuV47tY6DSBISP5B4fqwKiIFOqCAn8vPToXSch2MS7CDqxc03Akxi84=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1536.namprd22.prod.outlook.com (10.174.170.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Sat, 12 Oct 2019 20:43:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 20:43:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        kbuild test robot <lkp@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 1/3] MIPS: Always define builtin_cmdline
Thread-Topic: [PATCH 1/3] MIPS: Always define builtin_cmdline
Thread-Index: AQHVgT248msMlm/E7UGQ68Q2elJDbg==
Date:   Sat, 12 Oct 2019 20:43:36 +0000
Message-ID: <20191012204326.2564623-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37ee5bb3-20d1-4277-dad1-08d74f54da84
x-ms-traffictypediagnostic: MWHPR2201MB1536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1536B20821487547E514E0C2C1960@MWHPR2201MB1536.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(366004)(136003)(39840400004)(199004)(189003)(25786009)(71190400001)(2351001)(71200400001)(36756003)(256004)(305945005)(6916009)(14454004)(478600001)(4326008)(6116002)(7736002)(1076003)(99286004)(81166006)(81156014)(8676002)(46003)(316002)(5640700003)(42882007)(2616005)(52116002)(8936002)(50226002)(476003)(186003)(102836004)(54906003)(6506007)(386003)(6486002)(2906002)(6436002)(66476007)(66446008)(486006)(66946007)(64756008)(44832011)(2501003)(66556008)(5660300002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1536;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N6VWcbYOEhODZJf5O4WzW5AA9ljIu4E4hljyh5eQXrzKsMhA8L4JiltWt8Z6jrP02AatnKs0z+/0vFXyj4ijOiHt1R2u9bitLA3ylVqloQmqXZrybreUmb9dtHNmshaAA61WNzb7LdyzqU/mfFtEf41EaAbCNqESShA39X2UGItsoBdrQ+OajFmOUIyqR0SJJQcvD+nV2xD5SKD+JRfqwdY6ys92ZgfIeZp9w++tAehubFxNlmA+ae7X+U/M7/ZM1r5II6fWrPHLH4MBBQMpJvm4PHbi6q3BUfxI4EslF08fsbSUi8S8kTy3yo922fhsfDClIsvPe5wJNESz/cknb8Tn7cC+Glm2ph6PudR11cLvjENE/VdzkqVX2E89d3OI8sD2F1//+YtLcwUZMf4Zg5P46ZEEeD6qo6rJiT+8h5g=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ee5bb3-20d1-4277-dad1-08d74f54da84
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 20:43:36.1839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrbKfKU7s84U5F+arv8Ywo0RCsWuGqYipz+GL4Y27AR3gqtJRqb0BJ/XqcNs6nSaHg8VVI3yGvNXos5VL539DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1536
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line
initialization") made use of builtin_cmdline conditional upon plain C if
statements rather than preprocessor #ifdef's. This caused build failures
for configurations with CONFIG_CMDLINE_BOOL=3Dn where builtin_cmdline
wasn't defined, for example:

   arch/mips/kernel/setup.c: In function 'bootcmdline_init':
>> arch/mips/kernel/setup.c:582:30: error: 'builtin_cmdline' undeclared
    (first use in this function); did you mean 'builtin_driver'?
      strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
                                 ^~~~~~~~~~~~~~~
                                 builtin_driver
   arch/mips/kernel/setup.c:582:30: note: each undeclared identifier is
    reported only once for each function it appears in

Fix this by defining builtin_cmdline as an empty string in the affected
configurations. All of the paths that use it should be optimized out
anyway so the data itself gets optimized away too.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line initializat=
ion")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
---

 arch/mips/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 4aeba3122972..119999d31558 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -68,6 +68,8 @@ char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
=20
 #ifdef CONFIG_CMDLINE_BOOL
 static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] =3D CONFIG_CMDLI=
NE;
+#else
+static const char builtin_cmdline[] __initconst =3D "";
 #endif
=20
 /*
--=20
2.23.0

