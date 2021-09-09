Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D776405894
	for <lists+linux-mips@lfdr.de>; Thu,  9 Sep 2021 16:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351170AbhIIOFv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Sep 2021 10:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348224AbhIIOFM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Sep 2021 10:05:12 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E58C0355CC
        for <linux-mips@vger.kernel.org>; Thu,  9 Sep 2021 05:04:29 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n14-20020a05600c3b8e00b002f8bd2f8ab6so1272316wms.5
        for <linux-mips@vger.kernel.org>; Thu, 09 Sep 2021 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3vDDlqm04DaMwsoFUUJnAu6JgMCtAyVT1spCpUheAo=;
        b=sDD09AQopSiJ3AtxBztVP873sDOz/Dm0FAdJM+v1ON/192NsLFcT7+8c5fkhkTgGRi
         0Nd8zGb4B3fXELEQgOEbJKuJQrLwjie5Kl5kt/905SbdUrOuujw7TFNiWIzoW8hmDJuI
         /B0ZvV08VGU+EeQkhZLkbYcsNb9Zi3VPDX5NBmeKIx4NHaRZNeLehKe5LrdsDEHygrW4
         GrwVpG7zlf7ACbIZ+0ttCLiAuSA2XjfZfYzM/Q1uvzvIAR/XUa76+1HWzURzkqK3ZKm3
         jfhgVXaA/Cr4zJc4Dkvy01s+QMYr3vWpbS8vixpLf7TPigpzhiFOFksKy2njYYyJiT4U
         KKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3vDDlqm04DaMwsoFUUJnAu6JgMCtAyVT1spCpUheAo=;
        b=ptVXJQ2fuM21RsI4wIDAwRItxNM6es4dAbVrOUGlxzMHxH4pjl/l/bQl1rmKep+IKi
         PIoAv/vOn0P6Puq5X/ECf5tGU03itcUFTRVGjUMbFz8Oga/YuKIjLo3aYsDEqdF5A3Cx
         kQaX3DxkPAF+IwVu+5XQpDHuDDcSwAbpm8vKYSvxHZvqd22pH+yqtfQarUc3z7SXGQay
         PRH3gXq20QrgEJlUVQmdyQNdB0Psf/9rLCIG6A+0hWBYjpfqGk89+1t/c5o1fFZ0i6gL
         Nha6rSBppAG+LtHTreBRs82nH5OPkNjJXzfENH2prK7AtiDwBn112F/xFVzqfNP6Cn3D
         8kIg==
X-Gm-Message-State: AOAM5304AI8YSsXxR/cVoNS1J6qgRNZVWhyhSbNwQ6ZAcORNppHbVHLs
        2m6RYSMzBArZhjEDW14d38e8Ug==
X-Google-Smtp-Source: ABdhPJz0PFpr/wZU2BJPWEvtutySCqYGxgLOifcfTS5MAcWKT7qquZYWa46Z0XYFxy5mcPeu8yVcJQ==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr1301620wmd.55.1631189067647;
        Thu, 09 Sep 2021 05:04:27 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id n66sm1437498wmn.2.2021.09.09.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:04:27 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Michal Simek <monstr@monstr.eu>,
        John Crispin <john@phrozen.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v2 1/3] arch: Export machine_restart() instances so they can be called from modules
Date:   Thu,  9 Sep 2021 13:04:19 +0100
Message-Id: <20210909120421.1313908-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909120421.1313908-1-lee.jones@linaro.org>
References: <20210909120421.1313908-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A recent attempt to convert the Power Reset Restart driver to tristate
failed because of the following compile error (reported once merged by
Stephen Rothwell via Linux Next):

  ERROR: "machine_restart" [drivers/power/reset/restart-poweroff.ko] undefined!

This error occurs since some of the machine_restart() instances are
not currently exported for use in modules.  This patch aims to rectify
that.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: John Crispin <john@phrozen.org>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Rich Felker <dalias@libc.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/arc/kernel/reset.c            | 1 +
 arch/arm/kernel/reboot.c           | 1 +
 arch/arm64/kernel/process.c        | 1 +
 arch/csky/kernel/power.c           | 1 +
 arch/h8300/kernel/process.c        | 1 +
 arch/hexagon/kernel/reset.c        | 1 +
 arch/m68k/kernel/process.c         | 1 +
 arch/microblaze/kernel/reset.c     | 1 +
 arch/mips/kernel/reset.c           | 1 +
 arch/mips/lantiq/falcon/reset.c    | 1 +
 arch/mips/sgi-ip27/ip27-reset.c    | 1 +
 arch/nds32/kernel/process.c        | 2 +-
 arch/nios2/kernel/process.c        | 1 +
 arch/openrisc/kernel/process.c     | 1 +
 arch/parisc/kernel/process.c       | 1 +
 arch/powerpc/kernel/setup-common.c | 1 +
 arch/riscv/kernel/reset.c          | 1 +
 arch/s390/kernel/setup.c           | 1 +
 arch/sh/kernel/reboot.c            | 1 +
 arch/sparc/kernel/process_32.c     | 1 +
 arch/sparc/kernel/reboot.c         | 1 +
 arch/um/kernel/reboot.c            | 1 +
 arch/x86/kernel/reboot.c           | 1 +
 arch/xtensa/kernel/setup.c         | 1 +
 24 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/reset.c b/arch/arc/kernel/reset.c
index fd6c3eb930bad..1f5d8ce532e2f 100644
--- a/arch/arc/kernel/reset.c
+++ b/arch/arc/kernel/reset.c
@@ -20,6 +20,7 @@ void machine_restart(char *__unused)
 	pr_info("Put your restart handler here\n");
 	machine_halt();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d0736..95cdcb17251af 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -146,3 +146,4 @@ void machine_restart(char *cmd)
 	printk("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index c8989b999250d..d7557f649dbd6 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -148,6 +148,7 @@ void machine_restart(char *cmd)
 	printk("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 #define bstr(suffix, str) [PSR_BTYPE_ ## suffix >> PSR_BTYPE_SHIFT] = str
 static const char *const btypes[] = {
diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
index 923ee4e381b81..1787de5b13ba6 100644
--- a/arch/csky/kernel/power.c
+++ b/arch/csky/kernel/power.c
@@ -28,3 +28,4 @@ void machine_restart(char *cmd)
 	do_kernel_restart(cmd);
 	asm volatile ("bkpt");
 }
+EXPORT_SYMBOL_GPL(machine_restart);
diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
index 2ac27e4248a46..f92f473a1934a 100644
--- a/arch/h8300/kernel/process.c
+++ b/arch/h8300/kernel/process.c
@@ -66,6 +66,7 @@ void machine_restart(char *__unused)
 	local_irq_disable();
 	__asm__("jmp @@0");
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/hexagon/kernel/reset.c b/arch/hexagon/kernel/reset.c
index da36114d928f0..ed79e0e5a0318 100644
--- a/arch/hexagon/kernel/reset.c
+++ b/arch/hexagon/kernel/reset.c
@@ -19,6 +19,7 @@ void machine_halt(void)
 void machine_restart(char *cmd)
 {
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void (*pm_power_off)(void) = NULL;
 EXPORT_SYMBOL(pm_power_off);
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index db49f90917112..f891d9b4bdf2f 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -57,6 +57,7 @@ void machine_restart(char * __unused)
 		mach_reset();
 	for (;;);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index 5f4722908164d..7f47e59914c0d 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -41,3 +41,4 @@ void machine_restart(char *cmd)
 	pr_emerg("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e7..4fe2edc2d06d6 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -99,6 +99,7 @@ void machine_restart(char *command)
 	pr_emerg("Reboot failed -- System halted\n");
 	machine_hang();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/mips/lantiq/falcon/reset.c b/arch/mips/lantiq/falcon/reset.c
index 261996c230cf6..70259dd09aaea 100644
--- a/arch/mips/lantiq/falcon/reset.c
+++ b/arch/mips/lantiq/falcon/reset.c
@@ -51,6 +51,7 @@ static void machine_restart(char *command)
 		(void *)WDT_REG_BASE);
 	unreachable();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 static void machine_halt(void)
 {
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index 5ac5ad6387343..35084653022ea 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -29,6 +29,7 @@
 #include "ip27-common.h"
 
 void machine_restart(char *command) __noreturn;
+EXPORT_SYMBOL_GPL(machine_restart);
 void machine_halt(void) __noreturn;
 void machine_power_off(void) __noreturn;
 
diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 391895b54d13c..f60b70fcfaf3d 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -91,7 +91,7 @@ void machine_restart(char *cmd)
 	while (1) ;
 }
 
-EXPORT_SYMBOL(machine_restart);
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void show_regs(struct pt_regs *regs)
 {
diff --git a/arch/nios2/kernel/process.c b/arch/nios2/kernel/process.c
index 9ff37ba2bb603..ebc4940059de5 100644
--- a/arch/nios2/kernel/process.c
+++ b/arch/nios2/kernel/process.c
@@ -51,6 +51,7 @@ void machine_restart(char *__unused)
 	: "r" (cpuinfo.reset_addr)
 	: "r4");
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index eb62429681fc8..fba2aa6ae8470 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -61,6 +61,7 @@ void machine_restart(char *cmd)
 	pr_emerg("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 /*
  * Similar to machine_power_off, but don't shut off power.  Add code
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 184ec3c1eae44..f39f7620d715d 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -96,6 +96,7 @@ void machine_restart(char *cmd)
 	while (1) ;
 
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void (*chassis_power_off)(void);
 
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index aa9c2d01424af..dfd875d4f8478 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -158,6 +158,7 @@ void machine_restart(char *cmd)
 
 	machine_hang();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index ee5878d968cc1..5fd0aa3e12766 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -20,6 +20,7 @@ void machine_restart(char *cmd)
 	do_kernel_restart(cmd);
 	while (1);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index ff0f9e8389162..ce8afa1cf8645 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -278,6 +278,7 @@ void machine_restart(char *command)
 		console_unblank();
 	_machine_restart(command);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418be..ea4b1bdada41a 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -83,6 +83,7 @@ void machine_restart(char *cmd)
 {
 	machine_ops.restart(cmd);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 93983d6d431de..de9106e386919 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -104,6 +104,7 @@ void machine_restart(char * cmd)
 	prom_feval ("reset");
 	panic("Reboot failed!");
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/sparc/kernel/reboot.c b/arch/sparc/kernel/reboot.c
index 69c1b6c047d53..faebf958c4b5a 100644
--- a/arch/sparc/kernel/reboot.c
+++ b/arch/sparc/kernel/reboot.c
@@ -52,4 +52,5 @@ void machine_restart(char *cmd)
 	prom_reboot("");
 	panic("Reboot failed!");
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
diff --git a/arch/um/kernel/reboot.c b/arch/um/kernel/reboot.c
index 48c0610d506e0..7ca141cf4a0af 100644
--- a/arch/um/kernel/reboot.c
+++ b/arch/um/kernel/reboot.c
@@ -47,6 +47,7 @@ void machine_restart(char * __unused)
 	uml_cleanup();
 	reboot_skas();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index ebfb911082326..d378e80a60a1b 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -733,6 +733,7 @@ static void native_machine_restart(char *__unused)
 		machine_shutdown();
 	__machine_emergency_restart(0);
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 static void native_machine_halt(void)
 {
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index ed184106e4cf9..a70c1351cd59e 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -564,6 +564,7 @@ void machine_restart(char * cmd)
 {
 	platform_restart();
 }
+EXPORT_SYMBOL_GPL(machine_restart);
 
 void machine_halt(void)
 {
-- 
2.33.0.153.gba50c8fa24-goog

