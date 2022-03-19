Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A7A4DE751
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 10:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240995AbiCSJls (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 05:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240092AbiCSJlo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 05:41:44 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6F9DCAA2
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 02:40:23 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id o23so6768511pgk.13
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSKAo9ygHvD7Q9p59ab1ni3UsATAZV/ndn3vT2xF4Zc=;
        b=JSn7c5+dRg+JsMMk7J0cqVYOgDfAMhmoLjCF1EBJnPkiKt9nt09Sr+Yz0xCcfc9cC1
         JowR7MUCZeA39ZVlyiW1/7XH4LLnDIDD0jd2TG3rdmTVly5OaR63PkMsmAKC2fjagAVD
         HY79GHeqshAKLpiecszpobAYU9+cSoxOFsQcnECXHEiopObntYG4303kMktoWKImpH1q
         w6MmTVdasbIzAAvWFk+Lh9JivAbNJ91J0OgC/ds8iAFtiXsotRDezlSY2dz0MrOF/Drj
         AHD7Se/MFj5SY6pwThPqWpZG24T/28+EMOKMTuUTYbniRM+c0sHgDhoJL2GzTTSzx0F9
         S7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSKAo9ygHvD7Q9p59ab1ni3UsATAZV/ndn3vT2xF4Zc=;
        b=maFGua8XZfdouJFJK6aDW0EvbJghokc0xPsvNevpFxvqYoH7Ds3eYX9YKHfoR8KeP0
         W7UwkfA1kd36iK6uD4P0b5NJ9UDB1uc6hBRRr5KMzsfp3DJIpw9mTRzwvjDY9X61lqn0
         hlG6nlALzzpX+ZUDZB8l0SdrFXY0rqzdejM6+N1mAOifJbFvOPJggyKFqUAm4K526nr1
         N7ZARP2ZsXGOZkuK2bxKQK+pX7L8+VezGhRkkTG2+4KBdliGLcvoUL2FnNseUeneYHjD
         dDxeZg/vD1+l10wIvvLlUKpjrkT5GHko+MNAecWbWrklCs133i2VwCFcoqpqK/yjU4ee
         9Bew==
X-Gm-Message-State: AOAM530oqQ/luhcjCpvaQmiu/OUunbIUB0418NSBR7LiG45IRb5Z41va
        E8wKssFCIGUqJQovkKNLHi/KxC5B8zw0Q4aAke8=
X-Google-Smtp-Source: ABdhPJxPOpxxYGRHkGFKmSYLbLhE9412ELEmIVKyrohOBNiWV7K+g8uBiefMM5uS6chWaxsMxnv2HA==
X-Received: by 2002:a05:6a00:c8a:b0:4f7:a02d:2706 with SMTP id a10-20020a056a000c8a00b004f7a02d2706mr14622777pfv.32.1647682823308;
        Sat, 19 Mar 2022 02:40:23 -0700 (PDT)
Received: from localhost.localdomain ([112.20.108.139])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090a398c00b001c5f926f293sm10491973pjb.3.2022.03.19.02.40.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Mar 2022 02:40:22 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, tangyouling@loongson.cn,
        chris.chenfeiyang@gmail.com, linux-mips@vger.kernel.org
Subject: [PATCH v2] MIPS: Fix build error for loongson64 and sgi-ip27
Date:   Sat, 19 Mar 2022 17:40:02 +0800
Message-Id: <78559205988aa1c0b42ee6ac20bb0fec3200f978.1647682458.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Select HAVE_ARCH_NODEDATA_EXTENSION for loongson64 to fix build error
when CONFIG_NUMA=y:

mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
(.init.text+0x1714): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_data'

Also, select HAVE_ARCH_NODEDATA_EXTENSION for sgi-ip27 to fix build error:

mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
page_alloc.c:(.init.text+0x1ba8): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bcc): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1be4): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: page_alloc.c:(.init.text+0x1bf4): undefined reference to `node_data'

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/mips/Kconfig                |  5 +++++
 arch/mips/loongson64/numa.c      | 10 ++++++++++
 arch/mips/sgi-ip27/ip27-memory.c | 10 ++++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0dae5f1e61cc..de3b32a507d2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -513,6 +513,7 @@ config MACH_LOONGSON64
 	select USE_OF
 	select BUILTIN_DTB
 	select PCI_HOST_GENERIC
+	select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -709,6 +710,7 @@ config SGI_IP27
 	select WAR_R10000_LLSC
 	select MIPS_L1_CACHE_SHIFT_7
 	select NUMA
+	select HAVE_ARCH_NODEDATA_EXTENSION
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
@@ -2708,6 +2710,9 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
+config HAVE_ARCH_NODEDATA_EXTENSION
+	bool
+
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index e8e3e48c5333..69a533148efd 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -197,3 +197,13 @@ void __init prom_init_numa_memory(void)
 	prom_meminit();
 }
 EXPORT_SYMBOL(prom_init_numa_memory);
+
+pg_data_t * __init arch_alloc_nodedata(int nid)
+{
+	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
+}
+
+void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
+{
+	__node_data[nid] = pgdat;
+}
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index adc2faeecf7c..f79c48393716 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -422,3 +422,13 @@ void __init mem_init(void)
 	memblock_free_all();
 	setup_zero_pages();	/* This comes from node 0 */
 }
+
+pg_data_t * __init arch_alloc_nodedata(int nid)
+{
+	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
+}
+
+void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
+{
+	__node_data[nid] = (struct node_data *)pgdat;
+}
-- 
2.27.0

