Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E461D7184
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 09:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgERHIM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 03:08:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50554 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726676AbgERHIM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 03:08:12 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx391YNMJevgA2AA--.0S2;
        Mon, 18 May 2020 15:08:09 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Remove useless parameter of bootcmdline_init()
Date:   Mon, 18 May 2020 15:08:08 +0800
Message-Id: <1589785688-10426-1-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx391YNMJevgA2AA--.0S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1rGr48try7Gr4rXw4UXFb_yoWDZrXEqr
        17Jw4kC3y293WY9rW7Z343GrWFywsav3ZIqF1fKw4Yya4fAw1UArZ5Xa4Svrn8ur4ayFWa
        kFZayF40grZrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
        648v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUcZ2-UUUUU=
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The parameter "cmdline_p" is useless in bootcmdline_init()，remove it.

Signed-off-by: Zhi Li <lizhi01@loongson.cn>
---

v2:
   - Remove "the" before "bootcmdline_init()" in the patch subject.

 arch/mips/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 8db533c..7b537fa 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -575,7 +575,7 @@ static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
 
 #endif /* CONFIG_OF_EARLY_FLATTREE */
 
-static void __init bootcmdline_init(char **cmdline_p)
+static void __init bootcmdline_init(void)
 {
 	bool dt_bootargs = false;
 
@@ -658,7 +658,7 @@ static void __init arch_mem_init(char **cmdline_p)
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
 
-	bootcmdline_init(cmdline_p);
+	bootcmdline_init();
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.1.0

