Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B18331B44
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 01:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhCIADO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 19:03:14 -0500
Received: from alln-iport-6.cisco.com ([173.37.142.93]:53562 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbhCIACx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 19:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1606; q=dns/txt; s=iport;
  t=1615248173; x=1616457773;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5nfrAdR24COgZBWF2wEri9D+5QFCKExgHngLXOOCcpM=;
  b=J8LuGh5Hwk2+J+/B080+2bcE2InyNvEllK9FPucOJQb0KfqRg5zXvawO
   OmEIAphLcDscQ2++grWWEE5hjFXFgvjgAtp7RiEOUH8iJq0dI/NMG0z9/
   pfQepMlOAkzYYb7WM8XhiptrXKULrFrPw2t0/S4wLZ/IfeRcXVCpqaR6k
   Y=;
X-IPAS-Result: =?us-ascii?q?A0AvAgCwuUZgkIcNJK1iHQEBAQEJARIBBQUBgg+DdwE5M?=
 =?us-ascii?q?bJsCwEBAQ80BAEBhE2BfAIlOBMCAwEBAQMCAwEBAQEFAQEBAgEGBBQBAQEBA?=
 =?us-ascii?q?QGGRYZ9AUaBPgESgnCDCKwkgiiJCoFFFIEliFx0hBgcgUlCgRGDWIozBIJAB?=
 =?us-ascii?q?4EOgigSnjWcAoMIgR+aeA8io2yUXaJVgWshgVkzGggbFYMkUBkNjjiNcwFcI?=
 =?us-ascii?q?AMvOAIGCgEBAwmPJgEB?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,233,1610409600"; 
   d="scan'208";a="698440084"
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Mar 2021 00:02:52 +0000
Received: from zorba.cisco.com ([10.24.7.91])
        by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12902mKc014497;
        Tue, 9 Mar 2021 00:02:51 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xe-linux-external@cisco.com, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] CMDLINE: drivers: of: ifdef out cmdline section
Date:   Mon,  8 Mar 2021 16:02:38 -0800
Message-Id: <20210309000247.2989531-3-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.91, [10.24.7.91]
X-Outbound-Node: alln-core-2.cisco.com
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
index feb0f2d67fc5..e25240d84632 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1050,6 +1051,16 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
+
+#ifdef CONFIG_GENERIC_CMDLINE
+	/*
+	 * The builtin command line will be added here, or it can override
+	 * with the DT bootargs.
+	 */
+	cmdline_add_builtin(data,
+			    (l > 0 ? p : NULL), /* This is sanity checking */
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

