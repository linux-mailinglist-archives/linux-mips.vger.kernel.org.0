Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F892AA935
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 06:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgKHFSU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 00:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgKHFSA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Nov 2020 00:18:00 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BC3C0613CF
        for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2020 21:17:59 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id g12so5320112wrp.10
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2020 21:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fExVMF3x849hpWEoXsiuAej0hbqK5p8nn8Jzl4zYU/s=;
        b=gw4/zFWoE7j3JEv2zAF276jCJTDR0h2WI8sPwNFAe9ncSoW5leIOk+G3Ntof1hJHUZ
         oK+kdnTQxDPwcF2Xz/lRhk9wsFuatVWjfEaknaHi+p1aCBgsR4PkP3lS0zJNEN0IgaCp
         97AaVlQnAkK2SXumNFHYS5q4e457wowEyo1vZ7c9JfdxFvRTNsL4x6sjBfczj6aWGB5h
         mlpeZPP3ABgak5zXPsyBczg7sHlHQnWwrJMSLXpn1o/HmYUrlqN8fBIzAO9qsIlZAWXv
         nKgjeUPIlh44fZGZ+OzDvTPD6kazMw9t7rgjw32wCrGCF4gVoxDf6hL+wQR2yDH3l4Mh
         gwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fExVMF3x849hpWEoXsiuAej0hbqK5p8nn8Jzl4zYU/s=;
        b=SMHCRzo5OIYQiqxUwycrOt0sAcQscmBu9nzqSZi+QekJikhfrLquzAmsheeJkcG74L
         0URUXK4qJ+3+X/iSgHLjFZdZuqd/OAzh2EPQr4F6O0ejY8BS206Rzaf9jN0BaziBDfYi
         hNubwgME0qx70k5eLTt+9B/oOFvfqr1yIIGNrMkZ3o10RU3XlqCO1RYzP9BySZz5butb
         /H3T5jXCv3933d5JL43vM9/walErfr3oG+dk2yAGIgJ+fCQ39v6Pay4my8PESHv7T3Na
         WPrSIKvaMVTcwTw0gUBivw+q3RgA+Uy6Rt03K4Bqlp114rgV7/2fOCB8nMJFdQ1uC0HS
         /ZrQ==
X-Gm-Message-State: AOAM532+km4ALmlRbqa1qUUjx5ph8fC9wmQK8Q3IeSpvHEnZk707OxHt
        xYovyCLs6fBidewROyEHZLftzQ==
X-Google-Smtp-Source: ABdhPJwR0RODupGrDkZO+RSFDSzVocvmZ/PZzvz2KApdsKzdEe+03QfRRlgX3a3ghm3Lk4zrdOuGvQ==
X-Received: by 2002:a5d:4207:: with SMTP id n7mr10868421wrq.76.1604812678587;
        Sat, 07 Nov 2020 21:17:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id r10sm8378462wmg.16.2020.11.07.21.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 21:17:58 -0800 (PST)
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
Subject: [PATCH 19/19] mips/vdso: Migrate to user_landing
Date:   Sun,  8 Nov 2020 05:17:29 +0000
Message-Id: <20201108051730.2042693-20-dima@arista.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108051730.2042693-1-dima@arista.com>
References: <20201108051730.2042693-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generic way to track the land vma area.
As a bonus, after unmapping sigpage, kernel won't try to land on its
previous position.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/mips/Kconfig         |  1 +
 arch/mips/kernel/signal.c | 11 +++++++----
 arch/mips/kernel/vdso.c   |  2 +-
 arch/mips/vdso/genvdso.c  |  8 --------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5e696ab80df4..eedb1683ec8e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -10,6 +10,7 @@ config MIPS
 	select ARCH_HAS_SETUP_ADDITIONAL_PAGES
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_USER_LANDING
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index f1e985109da0..eb79272d3cc2 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -806,11 +806,13 @@ struct mips_abi mips_abi = {
 
 static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 {
+	unsigned long land = (unsigned long)current->mm->user_landing;
 	sigset_t *oldset = sigmask_to_save();
-	int ret;
+	int ret = 1;
 	struct mips_abi *abi = current->thread.abi;
-	void *vdso = current->mm->context.vdso;
 
+	if (land == UNMAPPED_USER_LANDING)
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
index a4a321252df6..5523ba25ab3d 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -183,7 +183,7 @@ int arch_setup_additional_pages(unsigned long *sysinfo_ehdr)
 		goto out;
 	}
 
-	mm->context.vdso = (void *)vdso_addr;
+	mm->user_landing = (void __user *)vdso_addr;
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
2.28.0

