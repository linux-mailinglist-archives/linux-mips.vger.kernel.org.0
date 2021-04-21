Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9756336654B
	for <lists+linux-mips@lfdr.de>; Wed, 21 Apr 2021 08:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhDUGUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 02:20:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34126 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229536AbhDUGUP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 02:20:15 -0400
Received: from localhost.localdomain (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb8v6w39gdoULAA--.20179S2;
        Wed, 21 Apr 2021 14:19:39 +0800 (CST)
From:   xiaochuan mao <maoxiaochuan@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael <michael5hzg@gmail.com>,
        xiaochuan mao <maoxiaochuan@loongson.cn>
Subject: [PATCH] mips/bootinfo:correct some comments of fw_arg
Date:   Wed, 21 Apr 2021 14:19:17 +0800
Message-Id: <20210421061917.13953-1-maoxiaochuan@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9Dxb8v6w39gdoULAA--.20179S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gryftw47CrWftryUCrW3Wrg_yoWfuwc_C3
        W7ZanYgrs5Cry8Zr15XwnagFyxta4Uu3s7Cr4kXr1qyay3Zw45WFWjyry7Jw4DCryqyrZ5
        ZF9Yqrnxt3s29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8AwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkhLnUUUUU=
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

from arch/mips/kernel/head.S we know that use a0~a3 for fw_arg0~fw_arg3
there is some code from head.S:
	LONG_S		a0, fw_arg0		# firmware arguments
	LONG_S		a1, fw_arg1
	LONG_S		a2, fw_arg2
	LONG_S		a3, fw_arg3

Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
---
 arch/mips/include/asm/bootinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 5be10ece3ef0..4c2e8173e6ec 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -107,7 +107,7 @@ extern void (*free_init_pages_eva)(void *begin, void *end);
 extern char arcs_cmdline[COMMAND_LINE_SIZE];
 
 /*
- * Registers a0, a1, a3 and a4 as passed to the kernel entry by firmware
+ * Registers a0, a1, a2 and a3 as passed to the kernel entry by firmware
  */
 extern unsigned long fw_arg0, fw_arg1, fw_arg2, fw_arg3;
 
-- 
2.17.1

