Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47323A22F6
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 05:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhFJDwF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 23:52:05 -0400
Received: from [40.92.63.80] ([40.92.63.80]:2168 "EHLO
        AUS01-ME3-obe.outbound.protection.outlook.com"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229557AbhFJDwE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Jun 2021 23:52:04 -0400
X-Greylist: delayed 1928 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 23:52:04 EDT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STuccVpL/L6JP9MtZN21odqAacmmEz0K9aZ8IiHbAC4r+Opa1jKAZGrfoV5foKkMJYuoHGf8a+TW6f4xOjgnsFyNPpG3WsGVhbpPRwJ8VMYSVWZJ8tbRG+4v+hTFlx5chaQKd7lUS/qdtjoQg+J8eKgRW2eRHB4h4VzJEAMATyQj0htDlpjhlA8F/njvipFvkjsQOCy4Lkd6cAl9wa1cGHjc7TvvpjM5TNW0SU0LkIOfaoLrIAUcv7B/D+n3KIdfx6/kXREs8zo9UypZ/xNZIAHxNiNG1Um06ZXpZgPFA0G0hQjbkVEL9yJf4C8WWqKq5Mhrvdz/RwihJgy4D6dlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poRSzC+4FNPGTIBDrn2oFp3IHOcy3tRXbIUfKomKdSs=;
 b=eNvQLe5Kw6+3B1hO8/T2zKzn09tMeuTI13WIrP0owLmVoP1g//JIE1C9Stco+xtYSD+UT67C4msG7hFYN8GmS/P7LYdbadq5ft5pqe1+BDuQTT5GjFLrlL5y37la63XN/WmQp+CTv+BHKSMsNkeDgjrOoBFjtM0ARfLMYK3QZx3nMdMk0vrYR9j3K1vYIVlH7aRUQFDVo2PHiM24/CbTXQr/HXy11NNju79fTc0A8omjxYfTOACcuuFP6512FxdBSj3ZsrILSgaodZ29eb8uNMWXk9vojW3VvhbW2+Axtg7aeC6Ii0pxI7IltJBQd0Zf/5m1RH7Pr+oE6V49PUBCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poRSzC+4FNPGTIBDrn2oFp3IHOcy3tRXbIUfKomKdSs=;
 b=Pa9PhfizwfqteXTxLwUawTvLiBv7Nqf3CPuxaBCs+d8vbdAEGjNHsfyy8J1lFYs9kLRHMycVB4zqnGh0wNw+S8lNyl76HuDiE9wtWcCLzqfdRLjG3BoUSUEZcYH8Yt6GbE80EOEE4ERxiORshs3wdc9581ML5AJpxHSFY9FWBYzYlO04E0DjH+E+bEVl55yN9DElvo+jvbyXCKYkSdcKCB1o84WQpQomuDDIcaNz7DHirWYiufS+X0PySndzh0wLHcnpFJi5Ngw8JXjuKEXaoRkytGQ0cmRsGnKqFg3qO1Ps40TXOPBow/nmgzlEoD5pnOrjupvrAdaUqZNETA4WDQ==
Received: from ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a5::8) by
 ME4P282MB0982.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 10 Jun 2021 03:15:22 +0000
Received: from ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3424:8e:7191:6ed2]) by ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3424:8e:7191:6ed2%7]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 03:15:22 +0000
From:   Liu Yu <f78fk@live.com>
To:     f78fk@163.com
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Subject: MIPS: cmdline: Clean up boot_command_line initialization
Date:   Thu, 10 Jun 2021 11:14:54 +0800
Message-ID: <ME3P282MB1969135A6A8C47008E75A316C7359@ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-TMN:  [PMCBLnRPwUiapSBiDciYB4Gh5nmqve3h]
X-ClientProxiedBy: HK2PR02CA0139.apcprd02.prod.outlook.com
 (2603:1096:202:16::23) To ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a5::8)
X-Microsoft-Original-Message-ID: <20210610031454.24901-1-f78fk@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (123.235.214.42) by HK2PR02CA0139.apcprd02.prod.outlook.com (2603:1096:202:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 03:15:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 253ea2cb-a465-472b-3ed0-08d92bbdfb96
X-MS-TrafficTypeDiagnostic: ME4P282MB0982:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGV39l6e+XpVfeRTc+w5uyrYWgSosxygaunUiYo72PF7wafm6uqTUQqAm1DDh25EtRv39Xjcz8hGM5iFLwdQTnuy9jKz4QQK8fmi9CApHWkYELrVVjHLGwF+zlQrVkEbN2hBPranIgE3EHivbUMilEFt2UkoGJzHi5YsNvfoSunoUUHfWMCLLYtYHZyW5gVw36ybjzDBwk3CvycgPsNDSjzKC12WdzuQVzSNE9w5nQ2pS2X37+iO3i15Q/KKEspT1IYqZah/erS6onDTCqCObqgvmZIFfv0VrkchqEqufcn8ESNQMXrWSwlqF7WjCyaF36pVX95fhlErBKUCoFJHM3l9qSdYHS9+mRVdGFcWVzzgutK7mSXmOJIWzCumlbPcaODOSbOAkGBeqMRVF1u44yvH3orWvFzSPfiGEuDM5YmcL7TyVSJPyECrcyplT4F7PMRqfA9o0hiIF+uNTLvQuG368hrGg539Mvukgt8Qkc8=
X-MS-Exchange-AntiSpam-MessageData: 0TMaIdZzY+JtD7CQ8wMH87uT4PcBNP2a/QYKlBBgOapI9tMm4DwR9OyDSiQC6R5U2u6LIhZDSCNrCmhDXKR5A2dnfncULCDzk27XUkXpE+lDdGkRacq+av9qLzlNknkSndBcW1lFSAjjIBfSlO6Fqg==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-8dac2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 253ea2cb-a465-472b-3ed0-08d92bbdfb96
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB1969.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 03:15:22.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0982
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Burton <paul.burton@mips.com>

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

Origin: upstream, https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7784cac697351f0cc0a4bb619594c0c99348c5aa
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@vger.kernel.org

--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -538,11 +538,88 @@ static void __init check_kernel_sections
 	}
 }
 
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
+static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
+					  int depth, void *data)
+{
+	bool *dt_bootargs = data;
+	const char *p;
+	int l;
+
+	if (depth != 1 || !data ||
+	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
+		return 0;
+
+	p = of_get_flat_dt_prop(node, "bootargs", &l);
+	if (p != NULL && l > 0) {
+		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
+		*dt_bootargs = true;
+	}
+
+	return 1;
+}
+
+static void __init bootcmdline_init(char **cmdline_p)
+{
+	bool dt_bootargs = false;
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
+		boot_command_line[0] = 0;
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
 
 /*
  * arch_mem_init - initialize memory management subsystem
@@ -570,48 +647,12 @@ static void __init arch_mem_init(char **
 {
 	extern void plat_mem_setup(void);
 
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
 	*cmdline_p = command_line;
 
 	parse_early_param();
