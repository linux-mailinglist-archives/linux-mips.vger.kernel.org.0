Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6F374D3E
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 04:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhEFCDz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 22:03:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55036 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229872AbhEFCDz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 May 2021 22:03:55 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxiclLTpNgm4sSAA--.29005S2;
        Thu, 06 May 2021 10:02:51 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args' undeclared under !SMP
Date:   Thu,  6 May 2021 10:02:50 +0800
Message-Id: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9CxiclLTpNgm4sSAA--.29005S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fKr1UZry3WrW7JFykuFg_yoW8WrWxpa
        15C348tFZ5Wr42yr4rZryDZ34ru398JrW7JFWfC3s5K3srtw1qqFyvvFnrXFykuw43KFWf
        XrsIgr48ZF13C37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4UMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc2-eUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On the Loongson64 platform, if CONFIG_SMP is not set, the following build
error will occur:
arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' undeclared

Because the definition and declaration of secondary_kexec_args are in the
CONFIG_SMP, the secondary_kexec_args variable should be used in CONFIG_SMP.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/loongson64/reset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index c97bfdc..758d5d2 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -126,11 +126,12 @@ static void loongson_kexec_shutdown(void)
 	for_each_possible_cpu(cpu)
 		if (!cpu_online(cpu))
 			cpu_device_up(get_cpu_device(cpu));
+
+	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
 #endif
 	kexec_args[0] = kexec_argc;
 	kexec_args[1] = fw_arg1;
 	kexec_args[2] = fw_arg2;
-	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
 	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
 	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
 }
@@ -141,7 +142,9 @@ static void loongson_crash_shutdown(struct pt_regs *regs)
 	kexec_args[0] = kdump_argc;
 	kexec_args[1] = fw_arg1;
 	kexec_args[2] = fw_arg2;
+#ifdef CONFIG_SMP
 	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
+#endif
 	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
 	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
 }
-- 
2.1.0

