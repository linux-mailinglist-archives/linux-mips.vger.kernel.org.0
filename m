Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD2D2D107E
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 13:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgLGMW2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 07:22:28 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57402 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726748AbgLGMW2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Dec 2020 07:22:28 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutBWHs5fUWAaAA--.43228S2;
        Mon, 07 Dec 2020 20:21:43 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL to enable sysfs memblock debug
Date:   Mon,  7 Dec 2020 20:21:42 +0800
Message-Id: <1607343702-28318-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxutBWHs5fUWAaAA--.43228S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1fuFyxJF45trWfKFyfWFg_yoWkGwb_Jw
        srtw1DGr1fJrW0kr4IgFs3XFyYq3yUur95AFsF9r13Z34xXa43W3yvkr95XrnxG3yDA3yr
        X3yFv3W5Gw4qgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5JwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUJ733UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, CONFIG_ARCH_KEEP_MEMBLOCK is not set for MIPS arch,
memblock_discard() will discard memory and reserved arrays if they were
allocated, select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL to give a chance to
track "memory" and "reserved" memblocks after early boot, with this patch,
we can see the following two sysfs interfaces under DEBUG_FS.

/sys/kernel/debug/memblock/memory
/sys/kernel/debug/memblock/reserved

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - select ARCH_KEEP_MEMBLOCK only if DEBUG_KERNEL

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b49a390..85c7b06 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -10,6 +10,7 @@ config MIPS
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
-- 
2.1.0

