Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A39430D7A7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 11:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhBCKgO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 05:36:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55050 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233773AbhBCKgE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 05:36:04 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv_NffBpg_6MCAA--.3274S3;
        Wed, 03 Feb 2021 18:35:11 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] MIPS: relocatable: Use __kaslr_offset in show_kernel_relocation
Date:   Wed,  3 Feb 2021 18:35:10 +0800
Message-Id: <1612348510-29569-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612348510-29569-1-git-send-email-hejinyang@loongson.cn>
References: <1612348510-29569-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dxv_NffBpg_6MCAA--.3274S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Xry7CFWDKr18KFykGFy7trb_yoW8Jr1xpr
        srX34DtrsxWw1kJayqqa4v9ry3JayDW3yfuFsrK34rXasaqF15Jayfur1rW3yjvry09F4f
        Zr1YqrWIvw4kAF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bO739UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The type of the VMLINUX_LOAD_ADDRESS macro is the (unsigned long long)
in 32bits kernel but (unsigned long) in the 64-bit kernel. Although there
is no error here, avoid using it to calculate kaslr_offset. And here we
may need is that the address of __kaslr_offset rather than (void *)offset.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/relocate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 95abb9c..52018a3 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -430,13 +430,9 @@ void *__init relocate_kernel(void)
  */
 static void show_kernel_relocation(const char *level)
 {
-	unsigned long offset;
-
-	offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
-
-	if (IS_ENABLED(CONFIG_RELOCATABLE) && offset > 0) {
+	if (__kaslr_offset > 0) {
 		printk(level);
-		pr_cont("Kernel relocated by 0x%pK\n", (void *)offset);
+		pr_cont("Kernel relocated by 0x%pK\n", &__kaslr_offset);
 		pr_cont(" .text @ 0x%pK\n", _text);
 		pr_cont(" .data @ 0x%pK\n", _sdata);
 		pr_cont(" .bss  @ 0x%pK\n", __bss_start);
-- 
2.1.0

