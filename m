Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45116D1C7A
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 01:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732501AbfJIXJt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 19:09:49 -0400
Received: from mail-eopbgr730096.outbound.protection.outlook.com ([40.107.73.96]:27322
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732216AbfJIXJt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 19:09:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDGng2xMgUd7X58f+VHcuT0lI8job2r9JGywGf8v0i1xnOaNi99rUZK6DzKxXPrLn9/UtTtUkgl0LN0PKGhfFek/r5Sk256erp6z5rhU1kHGCUj/VYVog0KMpXOfZ4AJ3P/seW16bMYk/8e+yKbp5HJ40WjoPsk6k8/W1vMQrm0f4JX2hqpk40y/RGeAgHu1kYSfLLnBsrZu+lyhQnGoa29YHOcRcSNOdz3gDBFmTK4CUg6jn7+gcqpu+448lLt74Ov/Onu3oWxiyLV7tR6ltAGQzoeNrMqiN4cY5nyklsran7PKQIUSPpkcKGxU3M5PYk0SZaSpYrMyGoRG6LIkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3WtRgVtHHCpYNguoCuqc8jJ6lNKYi/gTq8UlAi8m9M=;
 b=mYrF0qlKCVsEQZwhlvkPCAsX5aOq3EEP/ag/PYQuAE/zaZgAw5zH5ZsQZoPrCVhA7E8MpkdyLx6LADJRv+P4VGLqf8Dd0J1NKhHT5qlq5Hayt2TnTAw9e4H3vAJ3Po/sNYEGN2BUNo52BCBj7sjmpQlthmUiXWPBkgFsepjVzfSLF0emk9yc/0pO9iL0+gzEhLLVhTQ0UqKgFOfJO4AlhadmYu+gKre1y3JqXIzq9CJWGH7qBNinnFd17rxTWIfuYzYQ/rjRDzcscyOJqus9BVQjDIAlTVJ6LPqR6NcX8TI+qdkB1D09ONafi6O/+6+S+Jzlt2bzRmjO1iBWUWO5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3WtRgVtHHCpYNguoCuqc8jJ6lNKYi/gTq8UlAi8m9M=;
 b=OwT5uammg1SH8tai3zR63mwZK3evyk0LOFHM5iOPYiqir5/WBBd08c/vnCau2etelEIXHJsN5/h4cy+4CdWrOSxVYT1zpdXojU17jAAcWhQa3rPFLUAmjpV1cibWJwn1gYjLVcYMTAVsW+HLOwIec3bRtx9fN27FnArnUgQgFoI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1501.namprd22.prod.outlook.com (10.174.170.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 23:09:46 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 23:09:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2] MIPS: cmdline: Clean up boot_command_line initialization
Thread-Topic: [PATCH v2] MIPS: cmdline: Clean up boot_command_line
 initialization
Thread-Index: AQHVfvakEZWwkg8GUEarRbAGv/lFGQ==
Date:   Wed, 9 Oct 2019 23:09:45 +0000
Message-ID: <20191009230936.2290413-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:a03:100::37) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d53166a-37de-4b6d-accb-08d74d0dc66f
x-ms-traffictypediagnostic: MWHPR2201MB1501:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB15014A3A7CDFC7AEC3358126C1950@MWHPR2201MB1501.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39850400004)(376002)(366004)(346002)(189003)(199004)(36756003)(25786009)(50226002)(8676002)(81166006)(81156014)(8936002)(14444005)(6486002)(6436002)(2351001)(107886003)(4326008)(3846002)(6116002)(5640700003)(256004)(2501003)(386003)(102836004)(14454004)(6512007)(5660300002)(316002)(6506007)(42882007)(2616005)(476003)(64756008)(26005)(66446008)(66556008)(478600001)(66946007)(66066001)(66476007)(52116002)(486006)(44832011)(186003)(2906002)(305945005)(99286004)(1076003)(71190400001)(6916009)(71200400001)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1501;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k/QwQT4Ux7iAvo6zIrH4oLCQGzUf+c2UEJv416fPyGyhOjXf7fBds72lyhArDSlNdAeCcdxgr965ouHBuNIV8Q1U2fzEBHXEA8GlLn1wODllKz6M9HztMnxOWZ/68SjJp1YYal1zdOYruD/tr9D0hznNIFB8Jmwl/+Mwkq3ppDrdjfeWheViqgI63pUSTcVC3okwoFOae6RGnQeOo5Dn7+PBJC8YfuEO+IabwJw1DgrDtGaklmreioMStg6/obur3A2uVmyAXvMjI2OnGvDzUQg+Hq9mH8AeE7qNNBw+qFRDG769Zu1ynaf0HoguC+fbw58CAa9XJwWdqqoae9xk2voNGhRSoS16eK7benKptX9CPTeoaQbIz9scuRvuYiRJLWS/QTVfciJKeBdyMnyYf147QLlf+aM8rNHz0TEp6pE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d53166a-37de-4b6d-accb-08d74d0dc66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 23:09:45.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VdCBczzcmrXlNsz5h/Df0M66m3P6P5Z2zJyCJfnnvR1j02cebTJkn0HqRdehOzZJ13VvwAxprTNxraXG+QKjNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1501
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Our current code to initialize boot_command_line is a mess. Some of this
is due to the addition of too many options over the years, and some of
this is due to workarounds for early_init_dt_scan_chosen() performing
actions specific to options from other architectures that probably
shouldn't be in generic code.

Clean this up by introducing a new bootcmdline_init() function that
simplifies the initialization somewhat. The major changes are:

- Because bootcmdline_init() is a function it can return early in the
  CONFIG_CMDLINE_OVERRIDE case.

- We clear boot_command_line rather than inheriting whatever
  early_init_dt_scan_chosen() may have left us. This means we no longer
  need to set boot_command_line to a space character in an attempt to
  prevent early_init_dt_scan_chosen() from copying CONFIG_CMDLINE into
  boot_command_line without us knowing about it.

- Indirection via USE_PROM_CMDLINE, USE_DTB_CMDLINE, EXTEND_WITH_PROM &
  BUILTIN_EXTEND_WITH_PROM macros is removed; they seemingly served only
  to obfuscate the code.

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

Changes in v2:
- Keep CONFIG_MIPS_CMDLINE_DTB_EXTEND &
  CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND for now.
- Hoist bootcmdline_append() into a function to avoid duplicating its
  logic multiple times.

 arch/mips/kernel/setup.c | 125 ++++++++++++++++++++++++++-------------
 1 file changed, 83 insertions(+), 42 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 5eec13b8d222..4aeba3122972 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -538,11 +538,88 @@ static void __init check_kernel_sections_mem(void)
 	}
 }
=20
-#define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
-#define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
-#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
-#define BUILTIN_EXTEND_WITH_PROM	\
-	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
+static void __init bootcmdline_append(const char *s, size_t max)
+{
+	if (!s[0] || !max)
+		return;
+
+	if (boot_command_line[0])
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+
+	strlcat(boot_command_line, s, max);
+}
+
+static int __init bootcmdline_scan_chosen(unsigned long node, const char *=
uname,
+					  int depth, void *data)
+{
+	bool *dt_bootargs =3D data;
+	const char *p;
+	int l;
+
+	if (depth !=3D 1 || !data ||
+	    (strcmp(uname, "chosen") !=3D 0 && strcmp(uname, "chosen@0") !=3D 0))
+		return 0;
+
+	p =3D of_get_flat_dt_prop(node, "bootargs", &l);
+	if (p !=3D NULL && l > 0) {
+		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
+		*dt_bootargs =3D true;
+	}
+
+	return 1;
+}
+
+static void __init bootcmdline_init(char **cmdline_p)
+{
+	bool dt_bootargs =3D false;
+
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
+	 * If the user specified a built-in command line &
+	 * MIPS_CMDLINE_BUILTIN_EXTEND, then the built-in command line is
+	 * prepended to arguments from the bootloader or DT so we'll copy them
+	 * to the start of boot_command_line here. Otherwise, empty
+	 * boot_command_line to undo anything early_init_dt_scan_chosen() did.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
+		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
+	else
+		boot_command_line[0] =3D 0;
+
+	/*
+	 * If we're configured to take boot arguments from DT, look for those
+	 * now.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB))
+		of_scan_flat_dt(bootcmdline_scan_chosen, &dt_bootargs);
+
+	/*
+	 * If we didn't get any arguments from DT (regardless of whether that's
+	 * because we weren't configured to look for them, or because we looked
+	 * & found none) then we'll take arguments from the bootloader.
+	 * plat_mem_setup() should have filled arcs_cmdline with arguments from
+	 * the bootloader.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND) || !dt_bootargs)
+		bootcmdline_append(arcs_cmdline, COMMAND_LINE_SIZE);
+
+	/*
+	 * If the user specified a built-in command line & we didn't already
+	 * prepend it, we append it to boot_command_line here.
+	 */
+	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) &&
+	    !IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
+		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
+}
=20
 /*
  * arch_mem_init - initialize memory management subsystem
@@ -570,48 +647,12 @@ static void __init arch_mem_init(char **cmdline_p)
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
-	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
-
-#if defined(CONFIG_CMDLINE_BOOL)
-	if (builtin_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-
-	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
-		if (boot_command_line[0])
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
+	bootcmdline_init(cmdline_p);
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
-
 	*cmdline_p =3D command_line;
=20
 	parse_early_param();
--=20
2.23.0

