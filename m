Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A433108CA
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 11:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhBEKOZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 05:14:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40700 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230377AbhBEKMR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Feb 2021 05:12:17 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxadXPGR1gjT0FAA--.6705S3;
        Fri, 05 Feb 2021 18:11:28 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] MIPS: relocatable: Use __kaslr_offset in show_kernel_relocation
Date:   Fri,  5 Feb 2021 18:11:22 +0800
Message-Id: <1612519882-16480-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612519882-16480-1-git-send-email-hejinyang@loongson.cn>
References: <1612519882-16480-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxadXPGR1gjT0FAA--.6705S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XryrAw4kur13GFW5Ar1xuFg_yoWkWwc_G3
        Z0qw1DGa4rt3yjkwn0vws3XFyj9w15KFWfC3WvqrWYva9xAryj9FWfJrWFgrnxXrZ5Cry3
        Xr98uFsxKw4IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbfkYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUXVWUCwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
        1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
        xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqF1vDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The type of the VMLINUX_LOAD_ADDRESS macro is the (unsigned long long)
in 32bits kernel but (unsigned long) in the 64-bit kernel. Although there
is no error here, avoid using it to calculate kaslr_offset.

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
+		pr_cont("Kernel relocated by 0x%pK\n", (void *)__kaslr_offset);
 		pr_cont(" .text @ 0x%pK\n", _text);
 		pr_cont(" .data @ 0x%pK\n", _sdata);
 		pr_cont(" .bss  @ 0x%pK\n", __bss_start);
-- 
2.1.0

