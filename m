Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3941F267720
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 03:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgILByr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 21:54:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48738 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725681AbgILByq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 21:54:46 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxyMRfKlxf8LUUAA--.5028S2;
        Sat, 12 Sep 2020 09:54:39 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: netlogic: Remove unused code
Date:   Sat, 12 Sep 2020 09:54:39 +0800
Message-Id: <1599875679-8741-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxyMRfKlxf8LUUAA--.5028S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1UuFW5Zr1DWrWfAw15XFb_yoWftrb_C3
        y3Za17G3ySgr17WrW3Xr93JryDCr48Xwn7C3ZxZrs0yrnxAr45J3yUtw4xZ3y7uay2vrZ5
        Zay5K3yUtr1kWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_KwCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY_M3UUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove some unused code.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/include/asm/netlogic/psb-bootinfo.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/mips/include/asm/netlogic/psb-bootinfo.h b/arch/mips/include/asm/netlogic/psb-bootinfo.h
index 6878307..272544b 100644
--- a/arch/mips/include/asm/netlogic/psb-bootinfo.h
+++ b/arch/mips/include/asm/netlogic/psb-bootinfo.h
@@ -77,21 +77,6 @@ struct psb_info {
 	uint64_t avail_mem_map;
 };
 
-enum {
-	NETLOGIC_IO_SPACE = 0x10,
-	PCIX_IO_SPACE,
-	PCIX_CFG_SPACE,
-	PCIX_MEMORY_SPACE,
-	HT_IO_SPACE,
-	HT_CFG_SPACE,
-	HT_MEMORY_SPACE,
-	SRAM_SPACE,
-	FLASH_CONTROLLER_SPACE
-};
-
-#define NLM_MAX_ARGS	64
-#define NLM_MAX_ENVS	32
-
 /* This is what netlboot passes and linux boot_mem_map is subtly different */
 #define NLM_BOOT_MEM_MAP_MAX	32
 struct nlm_boot_mem_map {
-- 
2.1.0

