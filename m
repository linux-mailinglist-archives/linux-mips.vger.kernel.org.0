Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D324CEEFE
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 00:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfJGWUJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 18:20:09 -0400
Received: from mail-eopbgr730116.outbound.protection.outlook.com ([40.107.73.116]:58336
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728980AbfJGWUJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 18:20:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehUdaqv7aTn8TtV+rX4vp7ixNLCVV63tdbCGfVahdIB5eL11ODnPq+jydN3W702HZLRiKNrK9phwzkiB7tZmV3aE7EmmGcVsXjz8+omuOv5AfN/Pz/Onhom4FiDhZZ7fRxLPuhJDof7IUWn2a6LQ/hIs+02ehQLg5AqBJmeh1/VgKtVJXHjxBlHh/nLr2sVJpxny9L9KuAzg9cLvjz+rLToXMSmdOVG/HCZuOeFPIEig1JX5MwsFJtoOzsbUnXMdvHmi/xe/T5ep/MauMT/QylcpdcNNeGG4jPB1JePh3PBdbwM1x98zqQT/VBuNd7hOcGJBXFGpcEKO3zMtFv6GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXUU+fDlHad4lkTEmYYUBb6BLpvdlmJOC53qJ8jrWnE=;
 b=QT99LUc6RajHWG+KbwvKbjBvLzXBLz2+OyzVDVM/puoMIj0MRfxewfomjsYRAtpyhygDgHPCf5nb+OSAEZesJiMxCtHQSbJVpDMMJIcfrk3kPOysFIF7SI7aEeCLWr98jRLh4JGBlfaEXuVkz/2WQGdOlx/0dbSAv51Myl8SI5wxsF/DJ9vh3WpSJ/a2N26hVKR+s7i7BP6jdZssSl5YX/jBbpcnOTgF+ODWPbQqlBznSqP0vfhTcmFEkADajenLZktGMiFju8V8CCZlLtLcxAQp5iaXdMjY8X5KguDwL1sV7X3k19vfCeewA6/OQ6MWx8izcot6glBF5PVRbM2DrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXUU+fDlHad4lkTEmYYUBb6BLpvdlmJOC53qJ8jrWnE=;
 b=F/UUeCIJ4c2Uuk8nWXh3ZbGNhDD08/5XJZ8HPdvGVO+ZVr4MMXmMgSFqvbtV/tAezOy/038JZp7vyjc7dY/pea2eavjYW7hM4FJUfl8oAOfnRpxHhmd8UIMjDFpLXqB8W7+edGT+HPZHuJJqTvBSJo2NTqJYymQbCgPpnDGjTnA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1310.namprd22.prod.outlook.com (10.174.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 22:20:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 22:20:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 4/4] MIPS: cmdline: Clean up boot_command_line initialization
Thread-Topic: [PATCH 4/4] MIPS: cmdline: Clean up boot_command_line
 initialization
Thread-Index: AQHVfV1eaofHWXwMI0K1hqDPjSCNNg==
Date:   Mon, 7 Oct 2019 22:20:04 +0000
Message-ID: <20191007221951.1889661-4-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 6a607064-b8b7-41f8-8a2c-08d74b748065
x-ms-traffictypediagnostic: MWHPR2201MB1310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13105F14016B55DB6AAF56E3C19B0@MWHPR2201MB1310.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(346002)(39840400004)(136003)(189003)(199004)(1076003)(4326008)(8936002)(50226002)(186003)(44832011)(99286004)(102836004)(6506007)(6916009)(107886003)(76176011)(26005)(476003)(386003)(486006)(478600001)(305945005)(7736002)(25786009)(71200400001)(66556008)(2351001)(66946007)(66476007)(11346002)(71190400001)(66446008)(64756008)(81156014)(8676002)(2501003)(81166006)(5660300002)(446003)(36756003)(2616005)(66066001)(3846002)(316002)(256004)(2906002)(42882007)(52116002)(6436002)(6486002)(6512007)(14454004)(5640700003)(14444005)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1310;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66gwQxvmQJuc+z5nkoSxZDXmDGI0fTjOIk9PRQCJwQbMnfqrZJSmIWhK/hTl1LqtGNrbeyqq2Xcq+uS9ujgo7ATlfVXozhcp7Rf9ug5rqoZs22sJzRXxZ6hASnR9BzXU6iWWRpFqkhDWr+M/iwBosemrH6ZgNbXQJx5vM00XYeSGGdzFrBq/ygju6WKY+EcrtOTa3fZeNnl6jEG7OhfmNdevHl3THyWZWtN29lLfDR24+8UzeNRXFWJMNHnq3GnkcmXq7z5IKRgn7UWuLul98vVWi0DI9lumh1lw5iJ+yr9zdt7/7m9j+fU3MBAZY46d5uVe3ta5iPbZjBgcT8lLwdR1meCcjJnXcrfcWDw9+ZAIF/KjuBr45C4+c7GgJPPaOLA3urxC3/2ZL47VwhPPBrjlhdw3w66hQ9zu5jfGtpo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a607064-b8b7-41f8-8a2c-08d74b748065
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 22:20:04.0501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ykji6DXiMCYNr6sT/lmfPTxlGEeofE8UrKGflg/8IE1TZw7iJEezm7bKUlwL0PmilqgCdMuGWBbGz/rPXGNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1310
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Our current code to initialize boot_command_line is a mess. Some of this
is due to the addition of too many options over the years, and some of
this is due to workarounds for early_init_dt_scan_chosen() performing
actions specific to options from other architectures that probably
shouldn't be in generic code.

Clean this up by introducing a new init_boot_cmdline() function that
simplifies the initialization somewhat. The major changes are:

- Because init_boot_cmdline() is a function it can return early in the
  CONFIG_CMDLINE_OVERRIDE case.

- We clear boot_command_line rather than inheriting whatever
  early_init_dt_scan_chosen() may have left us. This means we no longer
  need to set boot_command_line to a space character in an attempt to
  prevent early_init_dt_scan_chosen() from copying CONFIG_CMDLINE into
  boot_command_line without us knowing about it.

- Indirection via USE_PROM_CMDLINE & USE_DTB_CMDLINE macros is removed;
  they seemingly served only to obfuscate the code.

- The logic is cleaner, clearer & commented.

Two minor drawbacks of this approach are:

1) We call of_scan_flat_dt(), which means we scan through the DT again.
   The overhead is fairly minimal & shouldn't be noticeable.

2) cmdline_scan_chosen() duplicates a small amount of the logic from
   early_init_dt_scan_chosen(). Alternatives might be to allow the
   generic FDT code to keep & expose a copy of the arguments taken from
   the /chosen node's bootargs property, or to introduce a function like
   early_init_dt_scan_chosen() that retrieves them without modification
   to handle CONFIG_CMDLINE. Neither of these sounds particularly
   cleaner though, and this way we at least keep the extra work in
   arch/mips.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/setup.c | 87 +++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 273b26a81935..d3e2ae010859 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -538,8 +538,65 @@ static void __init check_kernel_sections_mem(void)
 	}
 }
=20
-#define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
-#define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
+static int __init cmdline_scan_chosen(unsigned long node, const char *unam=
e,
+				      int depth, void *data)
+{
+	const char *p;
+	int l;
+
+	if (depth !=3D 1 || !data ||
+	    (strcmp(uname, "chosen") !=3D 0 && strcmp(uname, "chosen@0") !=3D 0))
+		return 0;
+
+	/* Retrieve command line */
+	p =3D of_get_flat_dt_prop(node, "bootargs", &l);
+	if (p !=3D NULL && l > 0)
+		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
+
+	return 1;
+}
+
+static void __init init_boot_cmdline(char **cmdline_p)
+{
+	/*
+	 * If CMDLINE_OVERRIDE is enabled then initializing the command line is
+	 * trivial - we simply use the built-in command line unconditionally &
+	 * unmodified.
+	 */
+	if (IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
+		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+		return;
+	}
+
+	/*
+	 * If we're configured to take boot arguments from DT, look for those
+	 * now. Note that we clear boot_command_line, undoing anything
+	 * early_init_dt_scan_chosen() did to boot_command_line.
+	 */
+	boot_command_line[0] =3D 0;
+	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB))
+		of_scan_flat_dt(cmdline_scan_chosen, boot_command_line);
+
+	/*
+	 * If we didn't get any arguments from DT (regardless of whether that's
+	 * because we weren't configured to look for them, or because we looked
+	 * & found none) then we'll take arguments from the bootloader.
+	 * plat_mem_setup() should have filled arcs_cmdline with arguments from
+	 * the bootloader, so we simply copy them here.
+	 */
+	if (!boot_command_line[0])
+		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
+
+	/*
+	 * If the user specified a built-in command line, we append it to
+	 * boot_command_line here.
+	 */
+	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) && builtin_cmdline[0]) {
+		if (boot_command_line[0])
+			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	}
+}
=20
 /*
  * arch_mem_init - initialize memory management subsystem
@@ -567,36 +624,12 @@ static void __init arch_mem_init(char **cmdline_p)
 {
 	extern void plat_mem_setup(void);
=20
-	/*
-	 * Initialize boot_command_line to an innocuous but non-empty string in
-	 * order to prevent early_init_dt_scan_chosen() from copying
-	 * CONFIG_CMDLINE into it without our knowledge. We handle
-	 * CONFIG_CMDLINE ourselves below & don't want to duplicate its
-	 * content because repeating arguments can be problematic.
-	 */
-	strlcpy(boot_command_line, " ", COMMAND_LINE_SIZE);
-
 	/* call board setup routine */
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
=20
-#if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
-	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-#else
-	if ((USE_PROM_CMDLINE && arcs_cmdline[0]) ||
-	    (USE_DTB_CMDLINE && !boot_command_line[0]))
-		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-
-#if defined(CONFIG_CMDLINE_BOOL)
-	if (builtin_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
+	init_boot_cmdline(cmdline_p);
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
-
 	*cmdline_p =3D command_line;
=20
 	parse_early_param();
--=20
2.23.0

