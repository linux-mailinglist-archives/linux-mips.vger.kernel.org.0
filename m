Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504EC274F05
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 04:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIWCbU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 22:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgIWCbT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 22:31:19 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D653DC061755
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 19:31:19 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id e4so6030635pln.10
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 19:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uvJYNtI3Hobw81o476oPUI52UEPmmVfBo/5Mfvs1zmE=;
        b=uVbQeG98umAElmrXaR4KoiJ3ilOG2sp2WzQyOVg5sesRW010JFdCAjIhDBUtrjTvhc
         swPinmEYvzoj4hlmJdNpUUIlknafv3hGpSXPJ6OmKLRTMplMAzCrss7kPiW4gl9soKYV
         wdNbt+TBlj1VZGjYNCn26iE+C+rl68zySGcmjtcNif+4RfzChJUjCNP4buslsOa+ou1W
         FLCBSgKpn9jiJUiEIESC503HktZIhp3GGrWAdYamG/hJH+2ikgnTgXBw3PIixdc/W9Dc
         KPZFCL81n7YaCc3fyGgW9XQcgweVjAPUKER95SSubVO8ww5mm67WVB3eotRDzErOP7ME
         P5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=uvJYNtI3Hobw81o476oPUI52UEPmmVfBo/5Mfvs1zmE=;
        b=tmxLSNKkl8P+baWELvCyg3bE4/0rCQ2HAuupPMZbzVyYn+KxWcwT1mnS6JWaDSbkqT
         7KFshCTD4753YHQQxIH7yquCtAoOZsURVM242NwXAAaFzie6b/XW4udxirs5tkeMy5Wj
         8LVBw/fof2XdeXsSp6/2+2HDWjLee8lKcaj4osECLRlVOywO14vAQJ9yT5KrWCxbWmD2
         0HBt4E5R0U8MIsei9o+LFVF+5r1HgxD+kTBzFpmOSnG/QehiJSs4gmMlhhPdWdt2st3H
         +Jskn/5DdHkBm+vWjSkh0h5gcrmlTWMqQSD7TwepqVAczC1lgDhBW3rUxoSA5LUpuuCW
         WqgQ==
X-Gm-Message-State: AOAM5321Dvawp9qXhz2mcqyGiaK2rmQS/ILCvcwxlvqTinrxGoFEef3T
        8oI06lf7mtKg98P7uXo/GOM=
X-Google-Smtp-Source: ABdhPJxTYVWUgcbr1MpdQ4poJBlMI6w3JTZTzweW3Zg1lzb0WF1gNAAsT8BvOqMtYxpuX2+RJ5POBw==
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr6032676pjb.233.1600828279416;
        Tue, 22 Sep 2020 19:31:19 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 72sm16019599pfx.79.2020.09.22.19.31.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 19:31:18 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/3] MIPS: Reserve extra memory for crash dump
Date:   Wed, 23 Sep 2020 10:30:56 +0800
Message-Id: <1600828257-31316-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Traditionally, MIPS's contiguous low memory can be as less as 256M, so
crashkernel=X@Y may be unable to large enough in some cases. Moreover,
for the "multi numa node + sparse memory model" case, it is attempt to
allocate section_mem_maps on every node. Thus, if the total memory of a
node is more than 1GB, we reserve the top 128MB for the crash kernel.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/setup.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index e2804a2..90d4a2e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -29,6 +29,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/dmi.h>
+#include <linux/crash_dump.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -55,6 +56,10 @@ EXPORT_SYMBOL(cpu_data);
 struct screen_info screen_info;
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+static phys_addr_t crashmem_start, crashmem_size;
+#endif
+
 /*
  * Setup information
  *
@@ -404,6 +409,13 @@ static int __init early_parse_mem(char *p)
 
 	add_memory_region(start, size, BOOT_MEM_RAM);
 
+#ifdef CONFIG_CRASH_DUMP
+	if (start && size) {
+		crashmem_start = start;
+		crashmem_size = size;
+	}
+#endif
+
 	return 0;
 }
 early_param("mem", early_parse_mem);
@@ -642,6 +654,48 @@ static void __init bootcmdline_init(void)
 		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
 }
 
+/* Traditionally, MIPS's contiguous low memory is 256M, so crashkernel=X@Y is
+ * unable to be large enough in some cases. Thus, if the total memory of a node
+ * is more than 1GB, we reserve the top 128MB for the crash kernel */
+static void reserve_crashm_region(int node, unsigned long s0, unsigned long e0)
+{
+#ifdef CONFIG_KEXEC
+	if (crashk_res.start == crashk_res.end)
+		return;
+
+	if ((e0 - s0) <= (SZ_1G >> PAGE_SHIFT))
+		return;
+
+	s0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+#endif
+}
+
+static void reserve_oldmem_region(int node, unsigned long s0, unsigned long e0)
+{
+#ifdef CONFIG_CRASH_DUMP
+	unsigned long s1, e1;
+
+	if (!is_kdump_kernel())
+		return;
+
+	if ((e0 - s0) > (SZ_1G >> PAGE_SHIFT))
+		e0 = e0 - (SZ_128M >> PAGE_SHIFT);
+
+	/* crashmem_start is crashk_res reserved by primary kernel */
+	s1 = PFN_UP(crashmem_start);
+	e1 = PFN_DOWN(crashmem_start + crashmem_size);
+
+	if (node == 0) {
+		memblock_reserve(PFN_PHYS(s0), (s1 - s0) << PAGE_SHIFT);
+		memblock_reserve(PFN_PHYS(e1), (e0 - e1) << PAGE_SHIFT);
+	} else {
+		memblock_reserve(PFN_PHYS(s0), (e0 - s0) << PAGE_SHIFT);
+	}
+#endif
+}
+
 /*
  * arch_mem_init - initialize memory management subsystem
  *
@@ -666,6 +720,9 @@ static void __init bootcmdline_init(void)
  */
 static void __init arch_mem_init(char **cmdline_p)
 {
+	unsigned int node;
+	unsigned long start_pfn, end_pfn;
+
 	/* call board setup routine */
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
@@ -711,6 +768,12 @@ static void __init arch_mem_init(char **cmdline_p)
 	if (crashk_res.start != crashk_res.end)
 		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
 #endif
+	for_each_online_node(node) {
+		get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
+		reserve_crashm_region(node, start_pfn, end_pfn);
+		reserve_oldmem_region(node, start_pfn, end_pfn);
+	}
+
 	device_tree_init();
 
 	/*
-- 
2.7.0

