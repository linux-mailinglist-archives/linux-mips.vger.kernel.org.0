Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209F82CD1EC
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 10:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgLCI6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 03:58:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33514 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726366AbgLCI6e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 03:58:34 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx73+LqMhf01sZAA--.41290S3;
        Thu, 03 Dec 2020 16:57:48 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Remove unused memblock_set_node
Date:   Thu,  3 Dec 2020 16:57:46 +0800
Message-Id: <1606985867-9791-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn>
References: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dx73+LqMhf01sZAA--.41290S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4UArWUtr1kJrWxKrWktFb_yoWxurb_tF
        42vw1DCr10va10vrW7X3yfWFyYy39YgF4Skwnag3yYv343JF15GrZ8Aa43Xrn8Wws5ArZY
        yrs3Xr1Y9wsrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbfkYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUXVWUCwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxBOpDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Seting node for platforms which not need multiple nodes make no sence
after we abandoning DISCONTIGMEM.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ca579de..b3a711e 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -639,9 +639,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
 
-#ifndef CONFIG_NUMA
-	memblock_set_node(0, PHYS_ADDR_MAX, &memblock.memory, 0);
-#endif
 	bootmem_init();
 
 	/*
-- 
2.1.0

