Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C16276E37
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 12:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgIXKIx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 06:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgIXKIx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 06:08:53 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D97C0613CE
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:08:53 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fa1so1444269pjb.0
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uvJYNtI3Hobw81o476oPUI52UEPmmVfBo/5Mfvs1zmE=;
        b=FTJlS9AA30Yk9rEl4YQrJIWLFTEgCG5otuRQQDxfLd6Cr9MgULoekakm+/jkUmSgzL
         jRJiT5mBPXxxdMuDxjCloYiNA6vFwEbTw1u6loNYoV5Z9UuyVHDhKdRm/lHFsP/rrKz8
         aDJndvVvLO6sKP/Sg5COnEI1w9HgTv+nqYBIvm6nL9paCLJ0VpzrsrpUdpnW8VuqOV30
         OPWJ9xjzxXjOpM/fWQif63eLt97tlS4c0KSRme2eSMW8tOeIJO4PWa2miZhXriaVzdYL
         fVqZhL3ItzkhuaMH6KHNi+Lr2flAHmeIIrXDv6cdP3neyCrkNeBjuDuoZOgHSQb5Y4j9
         Apfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=uvJYNtI3Hobw81o476oPUI52UEPmmVfBo/5Mfvs1zmE=;
        b=X7bjn/wE8wttKwKzIbd02R3duM4bfJ8q3PAaG2iL7AIPAqj2T60qafXJ/NLUCYiUtM
         +gkLEtO/qT2Be2aFo9ynJD7qmu99oIACvaPCSU4r3tId2W1SuBz3MGYXSCQz3Is83M3V
         mXLeDDfxqFNG3v6AHI+HqjKDRnk386F4kMxG1uiJVcggJjdaf86Y82C5lANk7o1t1EOq
         7DPDOVpoOwyHg3MW+xWsGkCAoXEWKqHpEKKQNjByE/bCgkl5400qsq5GbQ+M2LJsu64k
         Z6tpwWDKGWphKdWiRhJmSXumnVul4RBxryGlFjasa6vWmGOysLpQqmvqfAnYjkjJVuJ/
         5hzQ==
X-Gm-Message-State: AOAM530JLw5nv5oXvmEhVW2tQkJHK7g9Yk+Gf21BCMbMTam86IvpQKxn
        mEYQ68ClGXFX9J1BIwxobr0=
X-Google-Smtp-Source: ABdhPJzATR4q0OVFoghY2qt5SQqc2HlSLtpQbslZ1jTtUNRGbOZdbfdgGG01lcUhTyAd44cf4im/QA==
X-Received: by 2002:a17:90b:1642:: with SMTP id il2mr3169549pjb.93.1600942132920;
        Thu, 24 Sep 2020 03:08:52 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id p6sm2532716pfn.63.2020.09.24.03.08.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 03:08:52 -0700 (PDT)
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
Subject: [PATCH V2 2/3] MIPS: Reserve extra memory for crash dump
Date:   Thu, 24 Sep 2020 18:07:58 +0800
Message-Id: <1600942079-18652-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600942079-18652-1-git-send-email-chenhc@lemote.com>
References: <1600942079-18652-1-git-send-email-chenhc@lemote.com>
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

