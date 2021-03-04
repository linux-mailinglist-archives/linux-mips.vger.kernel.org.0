Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C075332CBB0
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 05:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbhCDE57 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 23:57:59 -0500
Received: from rcdn-iport-3.cisco.com ([173.37.86.74]:26213 "EHLO
        rcdn-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhCDE5x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 23:57:53 -0500
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Mar 2021 23:57:52 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6395; q=dns/txt; s=iport;
  t=1614833872; x=1616043472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nvJpEND9kOGoIR+3S0EgBmAZax9IS2XBul8csiRffVQ=;
  b=RDRO0Wkx/DUuzFRwT2OtqcHI2gNl/OjlxkmBmYuK66aH9WRJ8ruSWgwG
   s03+DpfuOfP2+Rco6bF3KcNfrhZ6SKcUZK11yY+scFdjAyLfz2gIfBGmw
   EO3br9c5uLLWEVcADM2Ja/Lv+Q0oh7g2Rq6ViY/9otHqw+3n6qUi8v65s
   w=;
X-IronPort-AV: E=Sophos;i="5.81,221,1610409600"; 
   d="scan'208";a="843437001"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Mar 2021 04:48:10 +0000
Received: from zorba.cisco.com ([10.24.7.178])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 1244m4Wv015988;
        Thu, 4 Mar 2021 04:48:07 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     xe-linux-external@cisco.com, Ruslan Bilovol <rbilovol@cisco.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] CMDLINE: add generic builtin command line
Date:   Wed,  3 Mar 2021 20:47:58 -0800
Message-Id: <20210304044803.812204-1-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.178, [10.24.7.178]
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This code allows architectures to use a generic builtin command line.
The state of the builtin command line options across architecture is
diverse. On x86 and mips they have pretty much the same code and the
code prepends the builtin command line onto the boot loader provided
one. On powerpc there is only a builtin override and nothing else.

The code in this commit unifies the code into a generic
header file under the CONFIG_GENERIC_CMDLINE option. When this
option is enabled the architecture can call the cmdline_add_builtin()
to add the builtin command line.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 include/linux/cmdline.h | 75 +++++++++++++++++++++++++++++++++++++++++
 init/Kconfig            | 68 +++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 include/linux/cmdline.h

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..f44011d1a9ee
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,75 @@
+#ifndef _LINUX_CMDLINE_H
+#define _LINUX_CMDLINE_H
+
+/*
+ *
+ * Copyright (C) 2006,2021. Cisco Systems, Inc.
+ *
+ * Generic Append/Prepend cmdline support.
+ */
+
+#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_CMDLINE_BOOL)
+
+#ifndef CONFIG_CMDLINE_OVERRIDE
+/*
+ * This function will append or prepend a builtin command line to the command
+ * line provided by the bootloader. Kconfig options can be used to alter
+ * the behavior of this builtin command line.
+ * @dest: The destination of the final appended/prepended string
+ * @src: The starting string or NULL if there isn't one.
+ * @tmp: temporary space used for prepending
+ * @length: the maximum length of the strings above.
+ */
+static inline void
+__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
+		size_t (*strlcpy)(char *dest, const char *src, size_t size),
+		size_t (*strlcat)(char *dest, const char *src, size_t count)
+		)
+{
+	if (src != dest && src != NULL) {
+		strlcpy(dest, " ", length);
+		strlcat(dest, src, length);
+	}
+
+	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)
+		strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
+
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {
+		strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
+		strlcat(tmp, dest, length);
+		strlcpy(dest, tmp, length);
+	}
+}
+
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
+{ 												\
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
+		static label char cmdline_tmp_space[length]; 					\
+		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
+	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
+		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
+	} 											\
+}
+#define cmdline_add_builtin(dest, src, length)	                           \
+	cmdline_add_builtin_custom(dest, src, length, __initdata, &strlcpy, &strlcat)
+#else
+#define cmdline_add_builtin(dest, src, length)				   \
+{								  	   \
+	strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND,    \
+		length);		   				   \
+}
+#endif /* !CONFIG_CMDLINE_OVERRIDE */
+
+#else
+#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) { \
+	if (src != NULL) 							 \
+		strlcpy(dest, src, length);	 				 \
+}
+
+#define cmdline_add_builtin(dest, src, length) { 				\
+	cmdline_add_builtin_custom(dest, src, length, strlcpy, strlcat); 	\
+}
+#endif /* CONFIG_GENERIC_CMDLINE */
+
+
+#endif /* _LINUX_CMDLINE_H */
diff --git a/init/Kconfig b/init/Kconfig
index 29ad68325028..28363ab07cd4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2032,6 +2032,74 @@ config PROFILING
 config TRACEPOINTS
 	bool
 
+config GENERIC_CMDLINE
+	bool
+
+if GENERIC_CMDLINE
+
+config CMDLINE_BOOL
+	bool "Built-in kernel command line"
+	help
+	  Allow for specifying boot arguments to the kernel at
+	  build time.  On some systems (e.g. embedded ones), it is
+	  necessary or convenient to provide some or all of the
+	  kernel boot arguments with the kernel itself (that is,
+	  to not rely on the boot loader to provide them.)
+
+	  To compile command line arguments into the kernel,
+	  set this option to 'Y', then fill in the
+	  the boot arguments in CONFIG_CMDLINE.
+
+	  Systems with fully functional boot loaders (i.e. non-embedded)
+	  should leave this option set to 'N'.
+
+config CMDLINE_APPEND
+	string "Built-in kernel command string append"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Enter arguments here that should be compiled into the kernel
+	  image and used at boot time.  If the boot loader provides a
+	  command line at boot time, this string is appended to it to
+	  form the full kernel command line, when the system boots.
+
+	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  change this behavior.
+
+	  In most cases, the command line (whether built-in or provided
+	  by the boot loader) should specify the device for the root
+	  file system.
+
+config CMDLINE_PREPEND
+	string "Built-in kernel command string prepend"
+	depends on CMDLINE_BOOL
+	default ""
+	help
+	  Enter arguments here that should be compiled into the kernel
+	  image and used at boot time.  If the boot loader provides a
+	  command line at boot time, this string is prepended to it to
+	  form the full kernel command line, when the system boots.
+
+	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  change this behavior.
+
+	  In most cases, the command line (whether built-in or provided
+	  by the boot loader) should specify the device for the root
+	  file system.
+
+config CMDLINE_OVERRIDE
+	bool "Built-in command line overrides boot loader arguments"
+	depends on CMDLINE_BOOL
+	help
+	  Set this option to 'Y' to have the kernel ignore the boot loader
+	  command line, and use ONLY the built-in command line. In this case
+	  append and prepend strings are concatenated to form the full
+	  command line.
+
+	  This is used to work around broken boot loaders.  This should
+	  be set to 'N' under normal conditions.
+endif
+
 endmenu		# General setup
 
 source "arch/Kconfig"
-- 
2.25.1

