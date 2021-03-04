Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C7532CBB2
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 05:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbhCDE6b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 23:58:31 -0500
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:49435 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbhCDE6C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 23:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1665; q=dns/txt; s=iport;
  t=1614833882; x=1616043482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JPxIpWSiHwMYUhrJK0/YYj5eo6XXFdrmnrzClDHMFxg=;
  b=iFwTg7VLl8dV3lUL1YFrLdKVb6q+wkEhRJJ6PKGeSt2HvHp33ad5UQ6y
   8TX31H+sQhrntFgv0laLfpUoip6b6qqyUYzLK2Hfe+4WU9bEve2OBAali
   78jWDKICgLBVlyV2jVPPyIFJHAO4X5pA0qofkSQ9swsOJ0yezwc3CcyHz
   U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CaBABRZkBg/40NJK1iHQEBAQEJARI?=
 =?us-ascii?q?BBQUBgg+CK4FMATkxsmkLAQEBDzQEAQGETYF8AiU4EwIDAQELAQEFAQEBAgE?=
 =?us-ascii?q?GBHGFboZ9AUaBPgESgnCDCK4cgiiJH4FEFIEkiFx0hBkcgUlCgRGDWIozBIJ?=
 =?us-ascii?q?AB4EOgigSnimbe4MGgR+acg8io1aUVaJGgWsjgVczGggbFYMkUBkNnCsBXCA?=
 =?us-ascii?q?DLzgCBgoBAQMJjBMBAQ?=
X-IronPort-AV: E=Sophos;i="5.81,221,1610409600"; 
   d="scan'208";a="844460945"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Mar 2021 04:48:10 +0000
Received: from zorba.cisco.com ([10.24.7.178])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 1244m4Ww015988;
        Thu, 4 Mar 2021 04:48:09 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
Date:   Wed,  3 Mar 2021 20:47:59 -0800
Message-Id: <20210304044803.812204-2-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.178, [10.24.7.178]
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It looks like there's some seepage of cmdline stuff into
the generic device tree code. This conflicts with the
generic cmdline implementation so I remove it in the case
when that's enabled.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/of/fdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index feb0f2d67fc5..cfe4f8d3c9f5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 
+#ifdef CONFIG_GENERIC_CMDLINE
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
+
+	/*
+	 * The builtin command line will be added here, or it can override
+	 * with the DT bootargs.
+	 */
+	cmdline_add_builtin(data,
+			    ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */
+			    COMMAND_LINE_SIZE);
+#else
 	if (p != NULL && l > 0)
 		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
 
@@ -1070,6 +1081,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
 #endif /* CONFIG_CMDLINE */
+#endif /* CONFIG_GENERIC_CMDLINE */
 
 	pr_debug("Command line is: %s\n", (char *)data);
 
-- 
2.25.1

