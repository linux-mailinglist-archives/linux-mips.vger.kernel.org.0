Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E7BCEEFB
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 00:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfJGWUF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 18:20:05 -0400
Received: from mail-eopbgr730116.outbound.protection.outlook.com ([40.107.73.116]:58336
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728654AbfJGWUE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 18:20:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Hz3a/UWUyiZYagQNri9hIR/ntqY8GP9fgRV2G3h7el6kPyS4rqWXDpWI3RIEfxVqSC4AR6vbUsN19optMF1yAaIAtvxdIsndqoxlqOZTwnaSBrxGFIQLI7XqvNLALh135Ox42I96fUbupfD6612yth89EEeS3pXu7WodtJkogBKG7jwir89KIl8qEMjSKlcIvxOiIfhAcIAeDYa6OHO0n+4vfX4CGzwAtmB0MUON6uaotdnQN8I1aN6aZBQOXtvgZEPbYE+jOaO0Rpzs03p6oPR2n7aj6ghNprmN/qgNdrp0GWni124oKET7EzhZPXxgt3D+7XlBvR8vj6W0Zw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvuCt8fizbvf/UnFLUN+kHgLlX8D5me4RAYIFAw53H4=;
 b=a+us1nD4XRfQt7Y4pai2Ep4/IzxzuJ3DBgHaokFRieWHA7zktlz+SHl+XK4L40MbDa5ZvutwdFe0eQnIlYVO08P4PL3uQEjVWVdgw/DLk8lx/mTI3S84PsBvBM7/NMIGGIbvIFx1EWeUoIcj3vDOKFshDgu9CXAOFePUKXaPkzJtRFbQkImMFBQvht7uN4BsZDYOebnpZS1wuIdK2cjuCg/GFuG2Vo3cN7LCWVRM/inliqKNpBTdhoiRu+ZkHrW+Zlt4c8KFBF7hsYOaU6di5vMbSjw7cxQo6WjGvjvknYMT0/xIxv4iOntWCrOQCJZOHcoHqvAK3Dvw0MwIcXxOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvuCt8fizbvf/UnFLUN+kHgLlX8D5me4RAYIFAw53H4=;
 b=O1bQE97pGodx1ZTvBQ1PdsS5WVhSpcACxqqSp/xId5L9VQCmCfOeuv88Cp8LJUwCQIMk1cXIXEAOS63feS1RjujoOMsMB0l9XXuQxBJEMeViWJTVvqw7+UDSs7BwHcciqaLwTw2MQQhx7xWOYmTChbNZF4vZaTtlF5GfZR7jBo4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1310.namprd22.prod.outlook.com (10.174.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 22:20:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 22:20:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 1/4] MIPS: cmdline: Remove CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
Thread-Topic: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
Thread-Index: AQHVfV1cKvTopIeE5EOEEl/ItiIYAg==
Date:   Mon, 7 Oct 2019 22:20:01 +0000
Message-ID: <20191007221951.1889661-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f830cd2-90bc-4707-3c9d-08d74b747eab
x-ms-traffictypediagnostic: MWHPR2201MB1310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13107B73A9C9E08B77BDD133C19B0@MWHPR2201MB1310.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(376002)(366004)(346002)(39840400004)(136003)(189003)(199004)(1076003)(4326008)(8936002)(50226002)(186003)(44832011)(99286004)(102836004)(6506007)(6916009)(107886003)(26005)(476003)(386003)(486006)(478600001)(305945005)(7736002)(25786009)(71200400001)(66556008)(2351001)(66946007)(66476007)(71190400001)(66446008)(64756008)(81156014)(8676002)(2501003)(81166006)(5660300002)(36756003)(2616005)(66066001)(3846002)(316002)(256004)(2906002)(42882007)(52116002)(6436002)(6486002)(6512007)(14454004)(5640700003)(6116002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1310;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YMbZTD39xalDpt7b34VU7CROZ9ui0dUk13XAylaJrbltMt8DpRil/TrRu3xV3MjlNuzHKXXLuxBEF6H9hsZYNKbfTIFC7ObBdluPWTdTZXsgysMsb3VCGFr6PNgJTM7Cdu3lxalwIISaKXTfNJhWbzU6uiQWI9FUyMpxcVTvChBRl7HkwQ0AEalyK0AyyeQv6La4vNpLsBNnF+0AqReggbCYKSPimNgRN97sND3GFxIZgZaLJ19IB7tKbrOyHMq4jwzVvdeEpW2CupFrJm0AWiMAwi0va5a8YthJPRDif7pQG+8MqD1VSmOEOas4ZUJM95OzvQSPuRRsz5klXRjbyoPAlWuBLfud9T0QVV6ibFBQo0xEz066EwQVzrDMPRTKDiDdEMIFfikzDZ+7RfZx1XK+L55mC4mgVreDDW//F7s=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f830cd2-90bc-4707-3c9d-08d74b747eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 22:20:01.2204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiZeWcvZ8CIYtORxqyrSOrmC9OM1pqBavEGzsvynqwrVVkI7tWzSfDGSzCS8ZfVUpcZvDqclRFryyHt8SUnExQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1310
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND is not selected by any of our
defconfigs, so remove it to simplify the messy command line logic in
arch_mem_init() a little.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig        | 4 ----
 arch/mips/kernel/setup.c | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a0bd9bdb5f83..ec922e6ff40b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3034,10 +3034,6 @@ choice
=20
 	config MIPS_CMDLINE_FROM_BOOTLOADER
 		bool "Bootloader kernel arguments if available"
-
-	config MIPS_CMDLINE_BUILTIN_EXTEND
-		depends on CMDLINE_BOOL
-		bool "Extend builtin kernel arguments with bootloader arguments"
 endchoice
=20
 endmenu
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 5eec13b8d222..c2a09f082d88 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -541,8 +541,6 @@ static void __init check_kernel_sections_mem(void)
 #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
 #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
 #define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
-#define BUILTIN_EXTEND_WITH_PROM	\
-	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
=20
 /*
  * arch_mem_init - initialize memory management subsystem
@@ -602,12 +600,6 @@ static void __init arch_mem_init(char **cmdline_p)
 			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
 		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
 	}
-
-	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
 #endif
 #endif
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
--=20
2.23.0

