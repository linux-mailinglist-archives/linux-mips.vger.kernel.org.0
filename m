Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B5436189B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 06:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238379AbhDPEKO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 00:10:14 -0400
Received: from rcdn-iport-7.cisco.com ([173.37.86.78]:34304 "EHLO
        rcdn-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238453AbhDPEKI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 00:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3912; q=dns/txt; s=iport;
  t=1618546184; x=1619755784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VP7PAoaR3l2w3et6aEwl6bAiAhFA9JKl6Z/MedxCeK8=;
  b=UDO5fTNGt6fMUB4MZ2SxCaCWoZhuGCByf5fDu1nrtDno/0T5iD/lyIKs
   cyvO1Jh3vUJPRhLw1G+PMcbJpj7p6+bumpRvzE4Acz7OiCwa+VO5WTOBT
   21vW2f+dHSEovcdCu7Cy6PAL8GdmSY0CCIdy5ML68kJ7R48F/RLRngqu7
   U=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AfmS0yqCf5eLAQ2PlHejxsceALOonbusQ8z?=
 =?us-ascii?q?AX/mp6ICY4TuWzkceykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhbU5EL++UG?=
 =?us-ascii?q?Dd1leAA5pl6eLZqQHIOyq7zeJF0LclTq4WMqySMXFfreLXpDa1CMwhxt7vyt?=
 =?us-ascii?q?HMuc77w212RQ9nL4Fshj0ZNi+hHkd7RBZLCPMCffL22uN9qzWtYngRZMigb0?=
 =?us-ascii?q?N1PdTrncHBl57tfHc9aCIP1Q/mt16VwY+/OwSE2FMkXylXx7A5/Sz+jxXh/a?=
 =?us-ascii?q?m4qZiAu3jh/l6Wy5xXndf7o+EiOOW8zu4INz7rlgGkIKNmVrHqhkFNnMifrH?=
 =?us-ascii?q?A3jdLLvxAse/5W1kqUVGS0rRzxsjOQtgoT1w=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BMAABLDXlg/4sNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBfgcBAQsBAYF6L4FNATkxjGeJTYEMlCyFNoF8CwEBAQ80BAE?=
 =?us-ascii?q?BhFACgXMCJTQJDgIDAQEMAQEFAQEBAgEGBHEThV1DFgGFawYyAUYQHTRJDgY?=
 =?us-ascii?q?BEoJxgwisB4IrgQGIM4FEFIElAYhrdIN1JxyBSUKBE4JsdIo5BIJABwaBCII?=
 =?us-ascii?q?6IwGRG41TnC2DFoEmm1EPI6R8LZRro2KBVDqBWTMaCBsVgyRQGQ6OKxaBAgE?=
 =?us-ascii?q?CjGYBWyEDLzgCBgoBAQMJiU6DQAEB?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; 
   d="scan'208";a="871030791"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Apr 2021 04:09:40 +0000
Received: from zorba.cisco.com ([10.24.7.67])
        by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHm016753;
        Fri, 16 Apr 2021 04:09:39 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     xe-linux-external@cisco.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] of: allow sending a NULL value to early_init_dt_scan_chosen
Date:   Thu, 15 Apr 2021 21:09:18 -0700
Message-Id: <20210416040924.2882771-8-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It's possible that an architecture may want to populate
boot_command_line before calling the device tree code.
Currently, early_init_dt_scan_chosen won't accept a NULL
in the data parameter and it returns immediately if you
send one.

I changed early_init_dt_scan_nodes() to send a NULL into
early_init_dt_scan_chosen() , then I made
early_init_dt_scan_chosen() to do the initrd checking, and
the rng-seed checking and skip all the command line related
code.

Given lots of changes to the command line, I think it makes sense
to allow the initrd code and rng-seed code to be run without
forcing the command line handling. I'm also submitting changes
to arm64 which populate boot_command_line much early and this
device tree code overwrites boot_command_line in that case.

This code depends on all architecture to have a NULL
boot_command_line at boot up when this function runs, unless
it's already populated.

This code was boot tested on powerpc 32bit, x86, and arm64.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/of/fdt.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index adb26aff481d..a1fda952ce60 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1052,36 +1052,38 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
 
-	if (depth != 1 || !data ||
-	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
+	if (depth != 1 || (strcmp(uname, "chosen") != 0
+				&& strcmp(uname, "chosen@0") != 0))
 		return 0;
 
 	early_init_dt_check_for_initrd(node);
 
-	/* Retrieve command line */
-	p = of_get_flat_dt_prop(node, "bootargs", &l);
-	if (p != NULL && l > 0)
-		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
+	if (data) {
+		/* Retrieve command line */
+		p = of_get_flat_dt_prop(node, "bootargs", &l);
+		if (p != NULL && l > 0)
+			strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
 
-	/*
-	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
-	 * is set in which case we override whatever was found earlier.
-	 */
+		/*
+		 * CONFIG_CMDLINE is meant to be a default in case nothing else
+		 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
+		 * is set in which case we override whatever was found earlier.
+		 */
 #ifdef CONFIG_CMDLINE
 #if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(data, " ", COMMAND_LINE_SIZE);
-	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+		strlcat(data, " ", COMMAND_LINE_SIZE);
+		strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #elif defined(CONFIG_CMDLINE_FORCE)
-	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#else
-	/* No arguments from boot loader, use kernel's  cmdl*/
-	if (!((char *)data)[0])
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#else
+		/* No arguments from boot loader, use kernel's  cmdl*/
+		if (!((char *)data)[0])
+			strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
 #endif /* CONFIG_CMDLINE */
 
-	pr_debug("Command line is: %s\n", (char *)data);
+		pr_debug("Command line is: %s\n", (char *)data);
+	}
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
 	if (rng_seed && l > 0) {
@@ -1202,7 +1204,11 @@ void __init early_init_dt_scan_nodes(void)
 	int rc = 0;
 
 	/* Retrieve various information from the /chosen node */
-	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	if (boot_command_line[0])
+		rc = of_scan_flat_dt(early_init_dt_scan_chosen, NULL);
+	else
+		rc = of_scan_flat_dt(early_init_dt_scan_chosen,
+					boot_command_line);
 	if (!rc)
 		pr_warn("No chosen node found, continuing without\n");
 
-- 
2.25.1

