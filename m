Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F386267722
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 03:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgILB7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 21:59:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725562AbgILB7U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 21:59:20 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn95zK1xfArYUAA--.5105S2;
        Sat, 12 Sep 2020 09:59:15 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Remove unused BOOT_MEM_INIT_RAM
Date:   Sat, 12 Sep 2020 09:59:15 +0800
Message-Id: <1599875955-9207-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxn95zK1xfArYUAA--.5105S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFyDGrWxtFyfJw4rtF1kZrb_yoW3Xrc_C3
        W2vw4kWw4rWF1jvr98t3Wftryjqw1UA3s7uFn5Zw1DAasIyw45JFyDXry7Jw45u3yq9Fn8
        ZFWFqr9xK3ZFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_KwCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ZjjUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") left
the BOOT_MEM_INIT_RAM unused, remove it.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/include/asm/bootinfo.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 147c932..39196ae 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -91,7 +91,6 @@ extern unsigned long mips_machtype;
 #define BOOT_MEM_RAM		1
 #define BOOT_MEM_ROM_DATA	2
 #define BOOT_MEM_RESERVED	3
-#define BOOT_MEM_INIT_RAM	4
 #define BOOT_MEM_NOMAP		5
 
 extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
-- 
2.1.0

