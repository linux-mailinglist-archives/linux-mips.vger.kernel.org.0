Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681292A62A1
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 11:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgKDKx7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 05:53:59 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37286 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729400AbgKDKx6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Nov 2020 05:53:58 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWtAfiKJfj6MFAA--.5757S2;
        Wed, 04 Nov 2020 18:53:19 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Modify the FLAGS attribute value of text segment in PHDRS
Date:   Wed,  4 Nov 2020 18:53:18 +0800
Message-Id: <1604487198-19365-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxWtAfiKJfj6MFAA--.5757S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4xtr4xCFyUtryxWF13CFg_yoWkZrX_KF
        4Svw4qk3yfAry3X3WrZrs5GF98G395G3Wrur1DZr1j9F98Ars8XFWvqay7uws8ArWjkw4r
        A3WfZrnrCFZFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7AYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw1l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
        vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uT5PUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The attribute of the text segment should be read-only and executable,
FLAGS(7) should be changed to FLAGS(5), like x86, s390 architecture.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/boot/compressed/ld.script | 2 +-
 arch/mips/kernel/vmlinux.lds.S      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 2ed08fb..35b0315 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -9,7 +9,7 @@
 OUTPUT_ARCH(mips)
 ENTRY(start)
 PHDRS {
-	text PT_LOAD FLAGS(7); /* RWX */
+	text PT_LOAD FLAGS(5); /* R_X */
 }
 SECTIONS
 {
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 5e97e9d..545c4a9 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -22,7 +22,7 @@
 OUTPUT_ARCH(mips)
 ENTRY(kernel_entry)
 PHDRS {
-	text PT_LOAD FLAGS(7);	/* RWX */
+	text PT_LOAD FLAGS(5);	/* R_X */
 #ifndef CONFIG_CAVIUM_OCTEON_SOC
 	note PT_NOTE FLAGS(4);	/* R__ */
 #endif /* CAVIUM_OCTEON_SOC */
-- 
2.1.0

