Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C552C1A0B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Nov 2020 01:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbgKXAaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Nov 2020 19:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730066AbgKXAaE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Nov 2020 19:30:04 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7155AC0613CF
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2020 16:30:04 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so1202170wme.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2020 16:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvSskL9CFfY+vyKjEB+eZzrUkmIgIFnXEsJVZThZL2o=;
        b=NhIVxRwhs2JKWCnkvmLk8qDdTuPgqCuRqC9BFw50c/UatHZifVDioxia2kin4mYG+2
         70+zxCECC9iDFROTM4GUHRFLLnBZv8QFYH0lh4sGffgwenvfCoA6CaCscXIFiE5vHj+T
         w5R0CxyUnIV6VvZUXvCV/QMb5Fc1LgMGkon//kyAClI9H4Ln3MtlpvzZV/8mFv9wwFsI
         G2C92SY7ewyZjuLQz09DX9iqQR/RaaBouqMoKiPtXATQCbCNeQeLyAXT1xElWIeTFQYo
         xPSoaClEo2NBM4hhXZCJmOYZHNJa154nXKSgkgnOGZM6+nLym01WIgTzy0w/GbfqyJo/
         wLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvSskL9CFfY+vyKjEB+eZzrUkmIgIFnXEsJVZThZL2o=;
        b=rnoc8Tx+v8vzpgfGM3cOn8Bu9vukd4WtBErctdGL0O4P7OBQoOkJVvFhnwfiJVQjH8
         meUxE45QMHQm27AkwLLGhqSIdv3h3QSB+4JvkWbActQilwWagkNyFAy7+UJM74pB6WU9
         rJH+Z+wXU9IvzbuP1ea16cUkqbVuwd6xJbsTto9FouvEQl/TMlXTGqcY53lVRnsPNh4K
         tVr9KikFdzsO1rwK28Ou2ZKPdv1eGHCUqBFocS6FaWyO54JOc+HbtXgzgBWZ5vYs9xSl
         nfHdIB/DFdCyXGJB9JP6BAAWnhgK8D21OCMaSWB9DyYFLClCfPQg+sWSFF0LIGm3OR0d
         HKdw==
X-Gm-Message-State: AOAM5317msKq516/uVVx1HHZXlA1zZbJgpPgUAnAfhrzXXtQiWqw8TTI
        e7t5P9xAbEdTXDELgN/VnUgfrQ==
X-Google-Smtp-Source: ABdhPJxGmWySNqrrzht+Ri+YlkVyYZzqQ8flKPJdvTxRK5X9lKIZvpBQwD5F41nlU3qHaQc8hD+gWw==
X-Received: by 2002:a05:600c:4112:: with SMTP id j18mr1481054wmi.152.1606177803112;
        Mon, 23 Nov 2020 16:30:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id c6sm25047360wrh.74.2020.11.23.16.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:30:02 -0800 (PST)
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
Subject: [PATCH v2 19/19] mips/vdso: Migrate to generic vdso_base
Date:   Tue, 24 Nov 2020 00:29:32 +0000
Message-Id: <20201124002932.1220517-20-dima@arista.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124002932.1220517-1-dima@arista.com>
References: <20201124002932.1220517-1-dima@arista.com>
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
 arch/mips/Kconfig         |  1 +
 arch/mips/kernel/signal.c | 11 +++++++----
 arch/mips/kernel/vdso.c   |  2 +-
 arch/mips/vdso/genvdso.c  |  8 --------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 818a9b2c78f1..70424605710f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -10,6 +10,7 @@ config MIPS
 	select ARCH_HAS_SETUP_ADDITIONAL_PAGES
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VDSO_BASE
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
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
index e124c68322bb..b2b2e596f03b 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -183,7 +183,7 @@ int arch_setup_additional_pages(unsigned long *sysinfo_ehdr)
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
2.29.2

