Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50901B2573
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgDUL7w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 07:59:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34694 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728621AbgDUL7w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 07:59:52 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx790y4J5e5YgqAA--.41S4;
        Tue, 21 Apr 2020 19:59:48 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 2/3] MIPS: Cleanup code about plat_mem_setup()
Date:   Tue, 21 Apr 2020 19:59:45 +0800
Message-Id: <1587470386-27133-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1587470386-27133-1-git-send-email-yangtiezhu@loongson.cn>
References: <1587470386-27133-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx790y4J5e5YgqAA--.41S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww43Jw45uryUJFyxAFWkZwb_yoW8GF1fpa
        yDZwn7GrWUWryYvFyfAry8urW5Cwn5GF9I9anFg34kZ3Wa9F1DXrsaqw13CryqqFWrt3WF
        93WIgw45X3y0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUUiL05UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, plat_mem_setup() is called by arch_mem_init() instead
of setup_arch() and has been declared in asm/bootinfo.h, so modify the code
comment to reflect the reality and remove the useless duplicate declartion
in arch/mips/kernel/setup.c.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - remove the Fixes tag

v2:
  - no changes

 arch/mips/include/asm/bootinfo.h | 2 +-
 arch/mips/kernel/setup.c         | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 6172778..dcd6a75 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -121,7 +121,7 @@ extern unsigned long fw_passed_dtb;
 #endif
 
 /*
- * Platform memory detection hook called by setup_arch
+ * Platform memory detection hook called by arch_mem_init()
  */
 extern void plat_mem_setup(void);
 
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index b1e2d43..5481a0c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -654,8 +654,6 @@ static void __init bootcmdline_init(char **cmdline_p)
  */
 static void __init arch_mem_init(char **cmdline_p)
 {
-	extern void plat_mem_setup(void);
-
 	/* call board setup routine */
 	plat_mem_setup();
 	memblock_set_bottom_up(true);
-- 
2.1.0

