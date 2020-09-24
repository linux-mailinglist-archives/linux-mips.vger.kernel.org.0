Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646FF276E3B
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 12:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgIXKJV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 06:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgIXKJU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 06:09:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDD1C0613CE
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:09:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d13so1614880pgl.6
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nOV8GlHOD8b7mzNQ3cOBJ9wcBrpEO3kTmU3m09xJfuw=;
        b=fmSPXOXFzl0jTXj2wZGfOzST6oNowCt/rzpx//BzrNh4OdlJIZUFpO0qiUuOrAvTWO
         PIBODq7c/BATzP+CCOUi4hM2vIncGkE3JiH8RoUvwNQpVZU4yZ/Txy2WazQbcXqJ1m3G
         ldGl8xrDZWG/RJYArs7cAWfK5t3pkozXqqCUgrTrxjg4BRbGIqf2EdlNnqCXLg8f+CnS
         BWdLCy+IsUlXuqVqDbo52TgOJi+W1ZHEtC8wxa2kTHLgXVGoN+EczhJIXqMZaSO7H+l3
         nJqBl65WRHcO2kPmUO/kDybB0Ug3d8u2eMlfA/SQkAFUfWQISz3T3H41K652Dv1peCPT
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nOV8GlHOD8b7mzNQ3cOBJ9wcBrpEO3kTmU3m09xJfuw=;
        b=JLWMmx1V1pwRmReN+vpaouNZsn5v3ZqzPH0AUY5si6F1zb40dADxlRoG5iPqlylQD+
         KemhYHsVJ+oDT5clTnwpa5OKrycX9Qw7hWKCk94yb27fv76RBev8rtKkpeFyyRKHR49u
         nJwBjd9MUCRLKbXUvPCi2rj6v2Uv2keuME1AVdWoCak0ifhmuTpzIc9TClnD9TtYj/sj
         /2F5ayayEKdt7hAUh24bn5GoemELkG+owpcv7B8Hc64RE+UhMdgg3SdA1HfCapIQXqRL
         exONjnkrUTQzCTBa0GUSZTle2aZYrRf7Ky+ykzqg+Pc5z4eKS00m0RoAOY5sD50BJMQV
         xzMA==
X-Gm-Message-State: AOAM532mwqvK8XrcotnidYEiBSoYcCfKffDLmSlLE0NgtX8qnhyC5nqu
        ALLrh27kfxIIeD5bobJBsHk=
X-Google-Smtp-Source: ABdhPJx9OUYMGLF8wrTXXJRs4K8CstNt7YEZnfB2VCblLHmcUsPEesYhPtF202WDdeH1b/79/HJjCQ==
X-Received: by 2002:a63:c18:: with SMTP id b24mr3448829pgl.208.1600942160304;
        Thu, 24 Sep 2020 03:09:20 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id p6sm2532716pfn.63.2020.09.24.03.09.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 03:09:19 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>
Subject: [PATCH V2 3/3] MIPS: Loongson64: Add kexec/kdump support
Date:   Thu, 24 Sep 2020 18:07:59 +0800
Message-Id: <1600942079-18652-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600942079-18652-1-git-send-email-chenhc@lemote.com>
References: <1600942079-18652-1-git-send-email-chenhc@lemote.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add kexec/kdump support for Loongson64 by:
1, Provide Loongson-specific kexec functions: loongson_kexec_prepare(),
   loongson_kexec_shutdown() and loongson_crash_shutdown();
2, Provide Loongson-specific assembly code in kexec_smp_wait();

To start Loongson64, The boot CPU needs 3 parameters:
fw_arg0: the number of arguments in cmdline (i.e., argc).
fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
         (i.e., argv).
fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).

Non-boot CPUs do not need one parameter as the IPI mailbox base address.
They query their own IPI mailbox to get PC, SP and GP in a loopi, until
the boot CPU brings them up.

loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
cmdline comes from kexec's "append" option string. This structure will
be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
->control_code_page and the cmdline need to be in a safe memory region
(memory allocated by the old kernel may be corrupted by the new kernel).
In order to maintain compatibility for the old firmware, the low 2MB is
reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
/loongson_crash_shutdown().

loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
reboot_code_buffer. Pass the kexec parameters to kexec_args.

loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.

The assembly part in kexec_smp_wait provide a routine as BIOS does, in
order to keep secondary CPUs in a querying loop.

The layout of low 2MB memory in our design: 
0x80000000, the first MB, the first 64K, Exception vectors
0x80010000, the first MB, the second 64K, STR (suspend) data
0x80020000, the first MB, the third and fourth 64K, UEFI HOB
0x80040000, the first MB, the fifth 64K, RT-Thread for SMC
0x80100000, the second MB, the first 64K, KEXEC code
0x80108000, the second MB, the second 64K, KEXEC data

Cc: Eric Biederman <ebiederm@xmission.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/relocate_kernel.S |  27 +++++++++
 arch/mips/loongson64/reset.c       | 111 +++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)

diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index ac87089..91b2932 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -6,6 +6,7 @@
 
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
+#include <asm/cpu.h>
 #include <asm/regdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
@@ -133,6 +133,32 @@ LEAF(kexec_smp_wait)
 #else
 	sync
 #endif
+
+#ifdef CONFIG_CPU_LOONGSON64
+	/* s0:prid s1:initfn */
+	/* a0:base t1:cpuid t2:node t9:count */
+	mfc0		t1, CP0_EBASE
+	andi		t1, MIPS_EBASE_CPUNUM
+	dins		a0, t1, 8, 2       /* insert core id*/
+	dext		t2, t1, 2, 2
+	dins		a0, t2, 44, 2      /* insert node id */
+	mfc0		s0, CP0_PRID
+	andi		s0, s0, (PRID_IMP_MASK | PRID_REV_MASK)
+	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1), 1f
+	beq		s0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2), 1f
+	b		2f                 /* Loongson-3A1000/3A2000/3A3000/3A4000 */
+1:	dins		a0, t2, 14, 2      /* Loongson-3B1000/3B1500 need bit 15~14 */
+2:	li		t9, 0x100          /* wait for init loop */
+3:	addiu		t9, -1             /* limit mailbox access */
+	bnez		t9, 3b
+	ld		s1, 0x20(a0)       /* get PC via mailbox reg0 */
+	beqz		s1, 2b
+	ld		sp, 0x28(a0)       /* get SP via mailbox reg1 */
+	ld		gp, 0x30(a0)       /* get GP via mailbox reg2 */
+	ld		a1, 0x38(a0)
+	jr		s1                 /* jump to initial PC */
+#endif
+
 	j		s1
 	END(kexec_smp_wait)
 #endif
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 3bb8a1e..b1e71f37 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -6,9 +6,14 @@
  * Copyright (C) 2009 Lemote, Inc.
  * Author: Zhangjin Wu, wuzhangjin@gmail.com
  */
+#include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/kexec.h>
 #include <linux/pm.h>
+#include <linux/slab.h>
 
+#include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
@@ -47,12 +52,120 @@ static void loongson_halt(void)
 	}
 }
 
+#ifdef CONFIG_KEXEC
+
+/* 0X80000000~0X80200000 is safe */
+#define MAX_ARGS	64
+#define KEXEC_CTRL_CODE	0xFFFFFFFF80100000UL
+#define KEXEC_ARGV_ADDR	0xFFFFFFFF80108000UL
+#define KEXEC_ARGV_SIZE	COMMAND_LINE_SIZE
+#define KEXEC_ENVP_SIZE	4800
+
+static int kexec_argc;
+static int kdump_argc;
+static void *kexec_argv;
+static void *kdump_argv;
+static void *kexec_envp;
+
+static int loongson_kexec_prepare(struct kimage *image)
+{
+	int i, argc = 0;
+	unsigned int *argv;
+	char *str, *ptr, *bootloader = "kexec";
+
+	/* argv at offset 0, argv[] at offset KEXEC_ARGV_SIZE/2 */
+	if (image->type == KEXEC_TYPE_DEFAULT)
+		argv = (unsigned int *)kexec_argv;
+	else
+		argv = (unsigned int *)kdump_argv;
+
+	argv[argc++] = (unsigned int)(KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2);
+
+	for (i = 0; i < image->nr_segments; i++) {
+		if (!strncmp(bootloader, (char *)image->segment[i].buf,
+				strlen(bootloader))) {
+			/*
+			 * convert command line string to array
+			 * of parameters (as bootloader does).
+			 */
+			int offt;
+			str = (char *)argv + KEXEC_ARGV_SIZE/2;
+			memcpy(str, image->segment[i].buf, KEXEC_ARGV_SIZE/2);
+			ptr = strchr(str, ' ');
+
+			while (ptr && (argc < MAX_ARGS)) {
+				*ptr = '\0';
+				if (ptr[1] != ' ') {
+					offt = (int)(ptr - str + 1);
+					argv[argc] = KEXEC_ARGV_ADDR + KEXEC_ARGV_SIZE/2 + offt;
+					argc++;
+				}
+				ptr = strchr(ptr + 1, ' ');
+			}
+			break;
+		}
+	}
+
+	if (image->type == KEXEC_TYPE_DEFAULT)
+		kexec_argc = argc;
+	else
+		kdump_argc = argc;
+
+	/* kexec/kdump need a safe page to save reboot_code_buffer */
+	image->control_code_page = virt_to_page((void *)KEXEC_CTRL_CODE);
+
+	return 0;
+}
+
+static void loongson_kexec_shutdown(void)
+{
+#ifdef CONFIG_SMP
+	int cpu;
+
+	/* All CPUs go to reboot_code_buffer */
+	for_each_possible_cpu(cpu)
+		if (!cpu_online(cpu))
+			cpu_device_up(get_cpu_device(cpu));
+#endif
+	kexec_args[0] = kexec_argc;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
+	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+static void loongson_crash_shutdown(struct pt_regs *regs)
+{
+	default_machine_crash_shutdown(regs);
+	kexec_args[0] = kdump_argc;
+	kexec_args[1] = fw_arg1;
+	kexec_args[2] = fw_arg2;
+	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
+	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
+	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
+}
+
+#endif
+
 static int __init mips_reboot_setup(void)
 {
 	_machine_restart = loongson_restart;
 	_machine_halt = loongson_halt;
 	pm_power_off = loongson_poweroff;
 
+#ifdef CONFIG_KEXEC
+	kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
+	kdump_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);
+	kexec_envp = kmalloc(KEXEC_ENVP_SIZE, GFP_KERNEL);
+	fw_arg1 = KEXEC_ARGV_ADDR;
+	memcpy(kexec_envp, (void *)fw_arg2, KEXEC_ENVP_SIZE);
+
+	_machine_kexec_prepare = loongson_kexec_prepare;
+	_machine_kexec_shutdown = loongson_kexec_shutdown;
+	_machine_crash_shutdown = loongson_crash_shutdown;
+#endif
+
 	return 0;
 }
 
-- 
2.7.0

