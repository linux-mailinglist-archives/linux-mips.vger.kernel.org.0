Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B3A339D51
	for <lists+linux-mips@lfdr.de>; Sat, 13 Mar 2021 10:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhCMJaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Mar 2021 04:30:00 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:30934 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233110AbhCMJ3h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Mar 2021 04:29:37 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4DyHSp14h4z9tvr3;
        Sat, 13 Mar 2021 10:29:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id zaAMf4DmfJvl; Sat, 13 Mar 2021 10:29:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4DyHSn63HLz9tvr2;
        Sat, 13 Mar 2021 10:29:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D50A08B769;
        Sat, 13 Mar 2021 10:29:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Wc7bhFyTgWK9; Sat, 13 Mar 2021 10:29:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E04948B75B;
        Sat, 13 Mar 2021 10:29:29 +0100 (CET)
Subject: Re: [PATCH v2 4/7] CMDLINE: powerpc: convert to generic builtin
 command line
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        Ruslan Bilovol <rbilovol@cisco.com>,
        linux-kernel@vger.kernel.org
References: <20210309000247.2989531-5-danielwa@cisco.com>
 <c5c8b57e-7954-ec02-188a-7f85cb0af731@csgroup.eu>
 <20210309214051.GS109100@zorba>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3cabc11d-96d1-962c-ab11-43a8c6d00657@csgroup.eu>
Date:   Sat, 13 Mar 2021 10:29:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309214051.GS109100@zorba>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 09/03/2021 à 22:40, Daniel Walker a écrit :
> On Tue, Mar 09, 2021 at 08:56:47AM +0100, Christophe Leroy wrote:
>>
>> So we are referencing a function that doesn't exist (namely prom_strlcat).
>> But it works because cmdline_add_builtin_custom() looks like a function but
>> is in fact an obscure macro that doesn't use prom_strlcat() unless
>> GENERIC_CMDLINE_NEED_STRLCAT is defined.
>>
>> IMHO that's awful for readability and code maintenance.
> 
> powerpc is a special case, there's no other users like this. The reason is
> because of all the difficulty in this prom_init.c code. A lot of the generic
> code has similar kind of changes to work across architectures.
> 

I'd suggest the following (sorry if Thunderbird damages whitespaces, you'll get the idea anyway)



diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
new file mode 100644
index 000000000000..30b9eefc802f
--- /dev/null
+++ b/include/linux/cmdline.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CMDLINE_H
+#define _LINUX_CMDLINE_H
+
+#ifdef CONFIG_GENERIC_CMDLINE
+
+#ifndef cmdline_strlcpy
+#define cmdline_strlcpy strlcpy
+#endif
+#ifndef cmdline_strlcat
+#define cmdline_strlcat strlcat
+#endif
+
+static __always_inline void
+cmdline_add_builtin_custom(char *dest, const char *src, char *tmp, unsigned long length)
+{
+	if (WARN_ON(sizeof(CONFIG_CMDLINE_PREPEND) > 1 &&
+		    !IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) &&
+		    !tmp && src == dest))
+		return;
+
+	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1 &&
+	    !IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) && src == dest)
+		cmdline_strlcpy(tmp, src, length);
+	else
+		tmp = (char *)src;
+
+	cmdline_strlcpy(dest, CONFIG_CMDLINE_PREPEND " ", length);
+	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) && tmp)
+		cmdline_strlcat(dest, tmp, length);
+	cmdline_strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
+}
+
+#define cmdline_add_builtin(dest, src, length) do {			\
+	static __init char cmdline_tmp[length];				\
+									\
+	cmdline_add_builtin_custom(dest, src, cmdline_tmp, length);	\
+} while (0)
+
+#endif /* CONFIG_GENERIC_CMDLINE */
+
+#endif /* _LINUX_CMDLINE_H */
diff --git a/init/Kconfig b/init/Kconfig
index 22946fe5ded9..aeb134f0703b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2035,6 +2035,27 @@ config PROFILING
  config TRACEPOINTS
  	bool

+config GENERIC_CMDLINE
+	bool
+
+if GENERIC_CMDLINE
+
+config CMDLINE_BOOL
+	bool "Built-in kernel command line"
+
+config CMDLINE_APPEND
+	string "Built-in kernel command string append" if CMDLINE_BOOL
+	default ""
+
+config CMDLINE_PREPEND
+	string "Built-in kernel command string prepend" if CMDLINE_BOOL
+	default ""
+
+config CMDLINE_OVERRIDE
+	bool "Built-in command line overrides boot loader arguments" if CMDLINE_BOOL
+
+endif
+
  endmenu		# General setup

  source "arch/Kconfig"
-- 

Then on powerpc you do:

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 2c2f33155317..1649787c3953 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -152,7 +152,7 @@ static struct prom_t __prombss prom;
  static unsigned long __prombss prom_entry;

  static char __prombss of_stdout_device[256];
-static char __prombss prom_scratch[256];
+static char __prombss prom_scratch[COMMAND_LINE_SIZE];

  static unsigned long __prombss dt_header_start;
  static unsigned long __prombss dt_struct_start, dt_struct_end;
@@ -770,6 +770,12 @@ static unsigned long prom_memparse(const char *ptr, const char **retptr)
   * Early parsing of the command line passed to the kernel, used for
   * "mem=x" and the options that affect the iommu
   */
+
+#define cmdline_strlcpy prom_strlcpy
+#define cmdline_strlcat prom_strlcat
+
+#include <linux/cmdline.h>
+
  static void __init early_cmdline_parse(void)
  {
  	const char *opt;
@@ -780,12 +786,11 @@ static void __init early_cmdline_parse(void)
  	prom_cmd_line[0] = 0;
  	p = prom_cmd_line;

-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
+	if ((long)prom.chosen > 0)
  		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);

-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
-		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
-			     sizeof(prom_cmd_line));
+	cmdline_add_builtin_custom(prom_cmd_line, (l > 0 ? p : NULL),
+				   prom_scratch, sizeof(prom_cmd_line));

  	prom_printf("command line: %s\n", prom_cmd_line);

-- 
2.25.0



Christophe
