Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 367A1CEEFC
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 00:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbfJGWUF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 18:20:05 -0400
Received: from mail-eopbgr730116.outbound.protection.outlook.com ([40.107.73.116]:58336
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728980AbfJGWUF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 18:20:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkP2ifFBtO905/z2YHHSAsM48oOQVlcY8vSXVinABy1VzCcVn9t5t1tTtsaPbnQzQbh6B2L2HV38/zEHl5mCN1HyZwOB/aixNWXdibsUm/TGcAQ6EGdf7+6KTqLLkLI0ELFAlrHqXsfLeyfptDk6hfPkf719pQLjW/EOo/rvfSz7EMPLTmxD+YhNEEGtnSLwTGyYtFMF7g3Y/Ig4B4OPY3irrUfriLyeAgs++alcZcRCTJlt8v97WO57cjhA4USSAYv+KFG1UxQqXKci2DNxW2NZdaHkDD8kSI75d1XBUybf0pioNQFTYJRgIvQTx22Sa8sIZps9lti1Y4XTtZ8WPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nArTmDDpuJi6tUS6FX0jU9l2nhqYUII9699qXqJ+37U=;
 b=Fn8UT0tRCSUNVT/hY/3JgYbLTnCzsTik/cXbeK2o3jeN8M1+uKPkykjSN1Xc9hniOiDY/a8MqwGWCzB1UAFoHanD1BfkvJ0OMTIhJtZWFfhqDhwO7VdHP6rDUT47sbFiSveJT4J4zaoYSj3p5RAdNyda9pHijXUFXFYkGRVVnRL3R4R5P3tIziHdkDH6VN5YxL2k5XbONKqEtiktUN4IMTi4BcYsR85DKfihmB1qrzNgi2cPDMuA7wVJMxxXb0wiem4i6q5hOIoseSi6aV+DlbFcy6Cfv5XLbgFHhVMu7ud1/E8e8Tt9TkLLD7N7TsjyXSnmMOu+V1rgHlIy6p0Luw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nArTmDDpuJi6tUS6FX0jU9l2nhqYUII9699qXqJ+37U=;
 b=cChb+SZRjmABao2/8S5j8gEMq3uCc8pQEXZDbucfFMOy/Lv/TbpsTK90lvfUcseVIl8s+ujKCA+fpeC3QR8eLnGBrA8fu1KcW9sD6TtbiwgHrT4iNjbtK4gZHfoV27CEeAtX3JNhi3jUYQZNQfbzlwQBSG9UlN4Wfd1lxghLhWY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1310.namprd22.prod.outlook.com (10.174.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 22:20:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 22:20:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/4] MIPS: cmdline: Remove CONFIG_MIPS_CMDLINE_DTB_EXTEND
Thread-Topic: [PATCH 2/4] MIPS: cmdline: Remove CONFIG_MIPS_CMDLINE_DTB_EXTEND
Thread-Index: AQHVfV1cj5Q8zAUdTUq6A98d97kCng==
Date:   Mon, 7 Oct 2019 22:20:02 +0000
Message-ID: <20191007221951.1889661-2-paul.burton@mips.com>
References: <20191007221951.1889661-1-paul.burton@mips.com>
In-Reply-To: <20191007221951.1889661-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 25c010e9-7d1c-43ac-a894-08d74b747f22
x-ms-traffictypediagnostic: MWHPR2201MB1310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1310EDF917773F978DFB4E26C19B0@MWHPR2201MB1310.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(346002)(39840400004)(136003)(189003)(199004)(1076003)(4326008)(8936002)(50226002)(186003)(44832011)(99286004)(102836004)(6506007)(6916009)(107886003)(76176011)(26005)(476003)(386003)(486006)(478600001)(305945005)(7736002)(25786009)(71200400001)(66556008)(2351001)(66946007)(66476007)(11346002)(71190400001)(66446008)(64756008)(81156014)(8676002)(2501003)(81166006)(5660300002)(446003)(36756003)(2616005)(66066001)(3846002)(316002)(256004)(2906002)(42882007)(52116002)(6436002)(6486002)(6512007)(14454004)(5640700003)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1310;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YdAzsFmXqY8CxeqSnHNCrXE5HzJc/N0By02V0I5ajss4Juk5AojYS/anI2cdY7lNZbJ8tGrDnMYCW4OLrQVT1I8Z0o8G/Lk+mokk/45uhxc1w7qHkm8znACTfUnp9Gb+a5z0GggZtSnOzdyeqj5VWayH39CWu6rn4L6Q8IKn3aVSjSvwNklaJfcUIxDAMg562RUx/VBuptvuS8z/B1aNdN4po35x/s/BBOOsJkaR8V+CN3hBr/vct0r9s4qhXexgt/7+PCoxbrtzW0i42NZtyKl/vaP/FPWCib5tPFbhhmYUK0D+J3VzSC34BIjVXIE+ofl69B9HnfOCuCg5FTOiPe4PtBPsA9kOc/b6n+IfBewlc95IJ1tnLWLIFQ7Xjn1aZRDn4BYJbihQertLL25PEuTruETgPbrwz5593PReTUg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c010e9-7d1c-43ac-a894-08d74b747f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 22:20:02.1220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igZpREIvCzhupO2GMYSxu2oQ1oPmV7d4t9fhCWKyycLxVJu4gZtFAwBEEi5kmyOVMwWjC/6Urz88DXFJJR+AFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1310
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_MIPS_CMDLINE_DTB_EXTEND is not selected by any of our defconfigs,
so remove it to simplify the messy command line logic in arch_mem_init()
a little.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig        | 4 ----
 arch/mips/kernel/setup.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ec922e6ff40b..736b691e7e5e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3028,10 +3028,6 @@ choice
 		depends on USE_OF
 		bool "Dtb kernel arguments if available"
=20
-	config MIPS_CMDLINE_DTB_EXTEND
-		depends on USE_OF
-		bool "Extend dtb kernel arguments with bootloader arguments"
-
 	config MIPS_CMDLINE_FROM_BOOTLOADER
 		bool "Bootloader kernel arguments if available"
 endchoice
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c2a09f082d88..273b26a81935 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -540,7 +540,6 @@ static void __init check_kernel_sections_mem(void)
=20
 #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
 #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
-#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
=20
 /*
  * arch_mem_init - initialize memory management subsystem
@@ -588,12 +587,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	    (USE_DTB_CMDLINE && !boot_command_line[0]))
 		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
=20
-	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
-
 #if defined(CONFIG_CMDLINE_BOOL)
 	if (builtin_cmdline[0]) {
 		if (boot_command_line[0])
--=20
2.23.0

