Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C3E2A62F3
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 12:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgKDLKs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 06:10:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40506 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726344AbgKDLKr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Nov 2020 06:10:47 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9MzjKJfnKYFAA--.14736S2;
        Wed, 04 Nov 2020 19:10:43 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Use the common RW_DATA macro in vmlinux.lds.S
Date:   Wed,  4 Nov 2020 19:10:43 +0800
Message-Id: <1604488243-21327-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr9MzjKJfnKYFAA--.14736S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW8KF13CFyrWw4DGrW3Wrg_yoWDCrb_WF
        4ag3WxGr4kCr15WrWUX34fXr98tas5GFySkr1vvrs2qFZIgrs0qaykXFW7ZwsYqw4Uur4r
        ZFy5GF9Fyw4IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7AYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0rgA5UUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the common RW_DATA rule for the linker script in an effort to
regularize the linker script.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/vmlinux.lds.S | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 5e97e9d..e2fa07e 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -84,18 +84,9 @@ SECTIONS
 	_sdata = .;			/* Start of data section */
 	RO_DATA(4096)
 
-	/* writeable */
-	.data : {	/* Data */
-		. = . + DATAOFFSET;		/* for CONFIG_MAPPED_KERNEL */
-
-		INIT_TASK_DATA(THREAD_SIZE)
-		NOSAVE_DATA
-		CACHELINE_ALIGNED_DATA(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
-		READ_MOSTLY_DATA(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
-		DATA_DATA
-		CONSTRUCTORS
-	}
-	BUG_TABLE
+	. = . + DATAOFFSET;             /* for CONFIG_MAPPED_KERNEL */
+	RW_DATA(1 << CONFIG_MIPS_L1_CACHE_SHIFT, PAGE_SIZE, THREAD_SIZE)
+
 	_gp = . + 0x8000;
 	.lit8 : {
 		*(.lit8)
-- 
2.1.0

