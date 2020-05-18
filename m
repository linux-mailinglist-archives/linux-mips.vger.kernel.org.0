Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62C51D70BE
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 08:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgERGNn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 02:13:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40384 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726508AbgERGNn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 02:13:43 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39qRJ8Je+_s1AA--.5S2;
        Mon, 18 May 2020 14:13:38 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Remove useless parameter of the bootcmdline_init()
Date:   Mon, 18 May 2020 14:13:36 +0800
Message-Id: <1589782416-2130-1-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx39qRJ8Je+_s1AA--.5S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1rGr48try7Gr4rWF4kWFg_yoWDJrgEqr
        17Xw48C3y293WY9rW7Z34fWrWFyw4Fq3ZIvFnagw4Yy34fAw1UAr9xXFySqrn8ur4ayFya
        kFZayF4vgrZrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbx8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
        648v4I1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j
        6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUseO
        AUUUUU=
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The parameter "cmdline_p" is useless in bootcmdline_init(), remove it.

Signed-off-by: Zhi Li <lizhi01@loongson.cn>
---
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

