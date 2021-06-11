Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9B43A4850
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 20:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhFKSFj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 14:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhFKSFi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 14:05:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6355C0613A4
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 11:03:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a11so6960852wrt.13
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 11:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYLwmjCTHF33i5yqWx/O3OoggeAPaHw6VpIz02xWpz8=;
        b=dg1yfvweDH7Ohc4ZcPw8rZm3cKoDt7Y0BajL/HUM0chkLplf1YLpGNz/gtc9PL9YV7
         VoJ6oR0mRvb8lbIfrg9ANTtPpmHZuy7Js8KjxjIKr5LZ6Ldj3OTpexgoZT6iTTVu3Oqj
         6dSIDuOgrwwqse6kuRmg4cKNO1ZBSu2lkQS9DT4aDkqAG/Ho0fa5IjkUjwcPW3Aom/lM
         SJ1sSBHgRhVuqhwHxw6YKH2PfpVhXXlc8QkqBDdL6VVSxVzqmFbTwXjsVLIqgTTwnKwH
         rq3M5q1op9bAuNS2j4mYmVsQ/0tzh6VzAQmVFfBLzeDE5P7zxV8apKKUeESq8vYsgIP/
         3NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYLwmjCTHF33i5yqWx/O3OoggeAPaHw6VpIz02xWpz8=;
        b=V4woMM2NslxHUGsAbst5zEjEUHgXse86eykuUyNxxzdFqJbeU0E9v5tQZH4vCrlUCY
         0IwDIyQLhp5njR1SLknuyWhbvGNviizzCrqO4bUC4kSpiRHn1ezojcjqxbsbIJ4vD1rH
         na5e6nEmP01gGEk3+7nD3KXl9Me05KdIe2nPraIjlyxpGiXwjIve7Swjgf2exwJ5LxjR
         PA0z0EYLXGS9VVcAU8/uAwSf0ZhH/ZYKlHyrIfaDLDAu6+b34O9UEN46mPFeButk2Mgl
         f+SeaB+One5uV9uDUpavAiV2uru5CeTw04KVb2aNchiqzNbfvBMW/3PGuA4ky7v/e+J5
         zQjA==
X-Gm-Message-State: AOAM533ON2694FRdiu8Q1jPkAzw1KbBQtB+DZFHvwsM3HvyZlKNFj5bJ
        P5w8YrdCM1r7Ge5OBQwrqPd7uQ==
X-Google-Smtp-Source: ABdhPJwt06ylqNBpLhnHuGE6z5ZQrDp2iDaHJRLrWmxVtzacGvWqbXyTHGXSV4pnhwe4Hak0vwVC1w==
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr5524829wrr.284.1623434605354;
        Fri, 11 Jun 2021 11:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id v15sm7425881wrw.24.2021.06.11.11.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 11:03:25 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v3 21/23] mips/vdso: Migrate to generic vdso_base
Date:   Fri, 11 Jun 2021 19:02:40 +0100
Message-Id: <20210611180242.711399-22-dima@arista.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611180242.711399-1-dima@arista.com>
References: <20210611180242.711399-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generic way to track the landing vma area.
As a bonus, after unmapping sigpage, kernel won't try to land on its
previous position (due to UNMAPPED_VDSO_BASE check instead of
context.vdso ?= 0 check).

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/mips/Kconfig           |  1 +
 arch/mips/include/asm/mmu.h |  2 --
 arch/mips/kernel/signal.c   | 11 +++++++----
 arch/mips/kernel/vdso.c     |  2 +-
 arch/mips/vdso/genvdso.c    |  8 --------
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 81096dd2c1ef..2bab0844f64b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -12,6 +12,7 @@ config MIPS
 	select ARCH_HAS_SETUP_ADDITIONAL_PAGES
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VDSO_BASE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_SUPPORTS_UPROBES
diff --git a/arch/mips/include/asm/mmu.h b/arch/mips/include/asm/mmu.h
index 5df0238f639b..928346a44eaf 100644
--- a/arch/mips/include/asm/mmu.h
+++ b/arch/mips/include/asm/mmu.h
@@ -12,8 +12,6 @@ typedef struct {
 		atomic64_t mmid;
 	};
 
-	void *vdso;
-
 	/* lock to be held whilst modifying fp_bd_emupage_allocmap */
 	spinlock_t bd_emupage_lock;
 	/* bitmap tracking allocation of fp_bd_emupage */
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index f1e985109da0..e0beaf2cdc0f 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -806,11 +806,13 @@ struct mips_abi mips_abi = {
 
 static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 {
+	void *land = (void *)current->mm->vdso_base;
 	sigset_t *oldset = sigmask_to_save();
-	int ret;
+	int ret = 1;
 	struct mips_abi *abi = current->thread.abi;
-	void *vdso = current->mm->context.vdso;
 
+	if (land == (void *)UNMAPPED_VDSO_BASE)
+		goto err;
 	/*
 	 * If we were emulating a delay slot instruction, exit that frame such
 	 * that addresses in the sigframe are as expected for userland and we
@@ -843,12 +845,13 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 	rseq_signal_deliver(ksig, regs);
 
 	if (sig_uses_siginfo(&ksig->ka, abi))
-		ret = abi->setup_rt_frame(vdso + abi->vdso->off_rt_sigreturn,
+		ret = abi->setup_rt_frame(land + abi->vdso->off_rt_sigreturn,
 					  ksig, regs, oldset);
 	else
-		ret = abi->setup_frame(vdso + abi->vdso->off_sigreturn,
+		ret = abi->setup_frame(land + abi->vdso->off_sigreturn,
 				       ksig, regs, oldset);
 
+err:
 	signal_setup_done(ret, ksig, 0);
 }
 
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 9b2e1d2250b4..3f76417e5aed 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -184,7 +184,7 @@ int arch_setup_additional_pages(unsigned long *sysinfo_ehdr)
 		goto out;
 	}
 
-	mm->context.vdso = (void *)vdso_addr;
+	mm->vdso_base = (void __user *)vdso_addr;
 	*sysinfo_ehdr = vdso_addr;
 	ret = 0;
 
diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index 0303d30cde03..8f581a2c8578 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -259,13 +259,6 @@ int main(int argc, char **argv)
 	fprintf(out_file, "#include <linux/linkage.h>\n");
 	fprintf(out_file, "#include <linux/mm.h>\n");
 	fprintf(out_file, "#include <asm/vdso.h>\n");
-	fprintf(out_file, "static void vdso_mremap(\n");
-	fprintf(out_file, "	const struct vm_special_mapping *sm,\n");
-	fprintf(out_file, "	struct vm_area_struct *new_vma)\n");
-	fprintf(out_file, "{\n");
-	fprintf(out_file, "	current->mm->context.vdso =\n");
-	fprintf(out_file, "	(void *)(new_vma->vm_start);\n");
-	fprintf(out_file, "}\n");
 
 	/* Write out the stripped VDSO data. */
 	fprintf(out_file,
@@ -290,7 +283,6 @@ int main(int argc, char **argv)
 	fprintf(out_file, "\t.mapping = {\n");
 	fprintf(out_file, "\t\t.name = \"[vdso]\",\n");
 	fprintf(out_file, "\t\t.pages = vdso_pages,\n");
-	fprintf(out_file, "\t\t.mremap = vdso_mremap,\n");
 	fprintf(out_file, "\t},\n");
 
 	/* Calculate and write symbol offsets to <output file> */
-- 
2.31.1

