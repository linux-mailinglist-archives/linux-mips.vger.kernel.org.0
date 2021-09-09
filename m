Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E17D404774
	for <lists+linux-mips@lfdr.de>; Thu,  9 Sep 2021 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhIIJE3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Sep 2021 05:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbhIIJE3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Sep 2021 05:04:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C66DC061575;
        Thu,  9 Sep 2021 02:03:20 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso921569pjb.3;
        Thu, 09 Sep 2021 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
        b=ow8B+4vt1F9pLfHYV9Ij+hl6+gQr9b6FrcTZp87zzgq1QFzurdhRot3GR615SQjlCw
         Zh4RokFDllDi62GMhO7kFspujGar5GxlzpGSBRNRsZfQbQVIAbEOyPCqPhV1TBKXPJ+s
         u9zasRNTyWq8lIbx1jH8+5ssE7WtjYRbI0SxC0XjXbWBG7dNmL5jDpm04aYaqCtEHPMd
         oLMLrY6dxdb9aYvbcIz452wViyDA59FwyRhJgVKZpONOjEDjVsaSYv3vx/vOrl7m0wyK
         ghHlPZ1M7WyydtleY3pZPxr+zKPmwqTqIBcA98XBRxv6yxV4tWBWRIp7oAV3uoS7xKav
         JWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
        b=gPM7WU2V9NTeKB1yNGagZhcS+0MdQ5+TyeV4jc15C4ERrG7nowPzMNuGYeFiRDn36g
         YdXpixH13B5TmiokfykBTfjNCwOID//1Ip4ejMySv8dFpaYWuDkTvMEY6R3WLNUZZAuk
         1vpdgGiFukGKNGLyUnfR6+TtZ/EF3Tvrw7ysZgRp8BBlW0uVnfYUGw+DSy9ZtHKUXYZA
         e9k7+TzLrGk6pB/jEP/yHBs6mMfPUfagf+jHZZ9vgBivHLETuhE3Jc25qyAalKk3ieUt
         DCMYt8X0LuUUyZD3385UyXfGbkIShzpgXwIuYiUtN2CDIklhaJnBr1pGEqkWqnU9UXV3
         td2g==
X-Gm-Message-State: AOAM533yZ3Gsiygf1F1ueN5Llc/wqMt+O84WWptKD7INTFxKfxXRA0kS
        VeLl9tihlS3yrdJvw049NUo=
X-Google-Smtp-Source: ABdhPJxHu9zJJ9FJUWJZJWQdpknTVzTkm8TBNRuaQJzThvN9YUYI4ouL8lSFHZOTHz+j9wwl1nI78w==
X-Received: by 2002:a17:902:d486:b0:135:9335:795b with SMTP id c6-20020a170902d48600b001359335795bmr1692439plg.73.1631178199865;
        Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
Received: from ownia.. ([173.248.225.217])
        by smtp.gmail.com with ESMTPSA id q126sm1600085pfc.156.2021.09.09.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
From:   Weizhao Ouyang <o451686892@gmail.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, Weizhao Ouyang <o451686892@gmail.com>
Subject: [PATCH v4] ftrace: Cleanup ftrace_dyn_arch_init()
Date:   Thu,  9 Sep 2021 17:02:16 +0800
Message-Id: <20210909090216.1955240-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
ftrace_dyn_arch_init() to cleanup them.

Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
Acked-by: Helge Deller <deller@gmx.de> (parisc)

---
Changes in v4:
-- revert the generic declaration

Changes in v3:
-- fix unrecognized opcode on PowerPC

Changes in v2:
-- correct CONFIG_DYNAMIC_FTRACE on PowerPC
-- add Acked-by tag

---
 arch/arm/kernel/ftrace.c        | 5 -----
 arch/arm64/kernel/ftrace.c      | 5 -----
 arch/csky/kernel/ftrace.c       | 5 -----
 arch/ia64/kernel/ftrace.c       | 6 ------
 arch/microblaze/kernel/ftrace.c | 5 -----
 arch/nds32/kernel/ftrace.c      | 5 -----
 arch/parisc/kernel/ftrace.c     | 5 -----
 arch/riscv/kernel/ftrace.c      | 5 -----
 arch/s390/kernel/ftrace.c       | 5 -----
 arch/sh/kernel/ftrace.c         | 5 -----
 arch/sparc/kernel/ftrace.c      | 5 -----
 arch/x86/kernel/ftrace.c        | 5 -----
 kernel/trace/ftrace.c           | 5 +++++
 13 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index 3c83b5d29697..a006585e1c09 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 7f467bd9db7a..fc62dfe73f93 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
index b4a7ec1517ff..50bfcf129078 100644
--- a/arch/csky/kernel/ftrace.c
+++ b/arch/csky/kernel/ftrace.c
@@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 				(unsigned long)func, true, true);
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
index b2ab2d58fb30..d6360fd404ab 100644
--- a/arch/ia64/kernel/ftrace.c
+++ b/arch/ia64/kernel/ftrace.c
@@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	flush_icache_range(addr, addr + 16);
 	return 0;
 }
-
-/* run from kstop_machine */
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
index 224eea40e1ee..188749d62709 100644
--- a/arch/microblaze/kernel/ftrace.c
+++ b/arch/microblaze/kernel/ftrace.c
@@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	return ret;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
index 0e23e3a8df6b..f0ef4842d191 100644
--- a/arch/nds32/kernel/ftrace.c
+++ b/arch/nds32/kernel/ftrace.c
@@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
 	/* restore all state needed by the compiler epilogue */
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 static unsigned long gen_sethi_insn(unsigned long addr)
 {
 	unsigned long opcode = 0x46000000;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75af5382..01581f715737 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	return 0;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 7f1e5203de88..4716f4cdc038 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 0a464d328467..3fd80397ff52 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return 0;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 void arch_ftrace_update_code(int command)
 {
 	if (ftrace_shared_hotpatch_trampoline(NULL))
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
index 295c43315bbe..930001bb8c6a 100644
--- a/arch/sh/kernel/ftrace.c
+++ b/arch/sh/kernel/ftrace.c
@@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	return ftrace_modify_code(rec->ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
index 684b84ce397f..eaead3da8e03 100644
--- a/arch/sparc/kernel/ftrace.c
+++ b/arch/sparc/kernel/ftrace.c
@@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	return ftrace_modify_code(ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 1b3ce3b4a2a2..23d221a9a3cd 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 /* Currently only x86_64 supports dynamic trampolines */
 #ifdef CONFIG_X86_64
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7efbc8aaf7f6..4c090323198d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
 	ftrace_free_mem(NULL, start, end);
 }
 
+int __init __weak ftrace_dyn_arch_init(void)
+{
+	return 0;
+}
+
 void __init ftrace_init(void)
 {
 	extern unsigned long __start_mcount_loc[];
-- 
2.30.2

