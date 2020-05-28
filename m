Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995831E701C
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 01:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391586AbgE1XQi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 19:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391508AbgE1XQh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 19:16:37 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D62CC08C5C6
        for <linux-mips@vger.kernel.org>; Thu, 28 May 2020 16:16:37 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so205798plv.9
        for <linux-mips@vger.kernel.org>; Thu, 28 May 2020 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRQrEWyLBsWy9WDUklC8lMWXefh4ZtlZOY28H4mSYsg=;
        b=QoNqFqVw8n1Vo/vHRzvubFPzEJve0aiWJH7E56ZMW28d/+oNTY9Xkt91MrABWvfdLO
         +XfsZ446V/LlTk1EbBjjQzVt+0MTHDk4cwuvpYXlhmQBJJse66FHRgCgfCZoc6ygUa1t
         NJ3pNgmGFfo7rGVDF2Zni33I/OFsRlqAwbOEvP0LDwXdu35U+F5QXQT87v4MsINfuOeH
         N0XzzfCDJQik58GyVUOFn+tfzn0mN37CXwqylfhjLyCsCfwB8/yXWIMYeYTVsP1dSZbr
         aLVLDja9SaYFGyddzjVnoxWA59vsYGtbgAKmoCCE556kPktZYdLZYmRgn/GsvTHY0x3L
         Bxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=PRQrEWyLBsWy9WDUklC8lMWXefh4ZtlZOY28H4mSYsg=;
        b=qtGndMxmG8xa85CsxWlIuBdh7LQvIWh86I7huQt+CZLeJSuKhqx2KhDm8KURtQXHx7
         ju8KFAWmQOxcfASMRuSGhM5GOFZY9TDHLV/7Ro5jjIHdPN6wnmUY4HPbV9QCnIe+00YA
         18spWIGWe6jKgmfg6pV4TpxGkIMflMKTk8Z4dbfxTk4tPiGPJgosQnp1zC8pCRa39/9u
         YLiLnpTF0XWnI+ZIYOfjFpwpbRzLRgGS2PC4wiUlRZ9f2iv4vC73ebOHu7BwkkOF/ofY
         CVGnLhgay8vG1jslwUpjlW4PN9wAChi2wsEd6xrwHeL57q6L7RPfMDOUec16XTnab26r
         lEBg==
X-Gm-Message-State: AOAM5333xAbl8LDdlB5Eiw9EuBvB89KcVBIEugquhkp+APH4yswSH758
        3gJMlswHXZ00JSwZPMHPHj4=
X-Google-Smtp-Source: ABdhPJz3C/gE7gNVCN2gFTOBSSyHOe+uX+276whyatyn63EAxZwEf6t2cjkIxQCehTb6mac7mRdl3w==
X-Received: by 2002:a17:902:5988:: with SMTP id p8mr6095329pli.146.1590707796617;
        Thu, 28 May 2020 16:16:36 -0700 (PDT)
Received: from 192.168.1.13 ([142.147.94.151])
        by smtp.gmail.com with ESMTPSA id w190sm5468431pfw.35.2020.05.28.16.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 16:16:35 -0700 (PDT)
From:   YunQiang Su <syq@debian.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>
Subject: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
Date:   Fri, 29 May 2020 07:16:28 +0800
Message-Id: <20200528231628.120171-1-syq@debian.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
is FPXX, we cannot run any FP32 binary.

Then we need to disable FP64 support temporarily with a boot param:
   o32_fp64=no/disable

Signed-off-by: YunQiang Su <syq@debian.org>
---
 arch/mips/include/asm/abi.h |  2 ++
 arch/mips/include/asm/elf.h |  4 +++-
 arch/mips/kernel/elf.c      |  5 +++--
 arch/mips/kernel/process.c  |  2 +-
 arch/mips/kernel/setup.c    | 15 +++++++++++++++
 arch/mips/math-emu/cp1emu.c |  3 ++-
 6 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/abi.h b/arch/mips/include/asm/abi.h
index dba7f4b6bebf..c5d297c67a9c 100644
--- a/arch/mips/include/asm/abi.h
+++ b/arch/mips/include/asm/abi.h
@@ -29,4 +29,6 @@ struct mips_abi {
 	struct mips_vdso_image *vdso;
 };
 
+extern bool o32_fp64_support;
+
 #endif /* _ASM_ABI_H */
diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index 5aa29ced6970..dc55815923b5 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -15,6 +15,7 @@
 #include <uapi/linux/elf.h>
 
 #include <asm/current.h>
+#include <asm/abi.h>
 
 /* ELF header e_flags defines. */
 /* MIPS architecture level. */
@@ -293,7 +294,8 @@ void mips_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 	if (((__h->e_flags & EF_MIPS_ABI) != 0) &&			\
 	    ((__h->e_flags & EF_MIPS_ABI) != EF_MIPS_ABI_O32))		\
 		__res = 0;						\
-	if (__h->e_flags & __MIPS_O32_FP64_MUST_BE_ZERO)		\
+	if ((__h->e_flags & __MIPS_O32_FP64_MUST_BE_ZERO) &&		\
+	    !o32_fp64_support)						\
 		__res = 0;						\
 									\
 	__res;								\
diff --git a/arch/mips/kernel/elf.c b/arch/mips/kernel/elf.c
index 7b045d2a0b51..3de15308971c 100644
--- a/arch/mips/kernel/elf.c
+++ b/arch/mips/kernel/elf.c
@@ -11,6 +11,7 @@
 
 #include <asm/cpu-features.h>
 #include <asm/cpu-info.h>
+#include <asm/abi.h>
 
 #ifdef CONFIG_MIPS_FP_SUPPORT
 
@@ -176,7 +177,7 @@ int arch_check_elf(void *_ehdr, bool has_interpreter, void *_interp_ehdr,
 			return -ELIBBAD;
 	}
 
-	if (!IS_ENABLED(CONFIG_MIPS_O32_FP64_SUPPORT))
+	if (!o32_fp64_support)
 		return 0;
 
 	fp_abi = state->fp_abi;
@@ -282,7 +283,7 @@ void mips_set_personality_fp(struct arch_elf_state *state)
 	 * not be worried about N32/N64 binaries.
 	 */
 
-	if (!IS_ENABLED(CONFIG_MIPS_O32_FP64_SUPPORT))
+	if (!o32_fp64_support)
 		return;
 
 	switch (state->overall_fp_mode) {
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index ff5320b79100..1bb93941c4c1 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -760,7 +760,7 @@ int mips_set_process_fp_mode(struct task_struct *task, unsigned int value)
 		return 0;
 
 	/* Only accept a mode change if 64-bit FP enabled for o32.  */
-	if (!IS_ENABLED(CONFIG_MIPS_O32_FP64_SUPPORT))
+	if (!o32_fp64_support)
 		return -EOPNOTSUPP;
 
 	/* And only for o32 tasks.  */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7b537fa2035d..2475843487aa 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -484,6 +484,21 @@ static int __init early_parse_elfcorehdr(char *p)
 early_param("elfcorehdr", early_parse_elfcorehdr);
 #endif
 
+#ifdef CONFIG_MIPS_O32_FP64_SUPPORT
+bool o32_fp64_support __read_mostly = true;
+static int __init early_parse_o32_fp64(char *p)
+{
+	if (strncmp(p, "no", 2) == 0 ||
+	    strncmp(p, "disable", 7) == 0
+	    strncmp(p, "off", 3) == 0)
+		o32_fp64_support = false;
+	return 0;
+}
+early_param("o32_fp64", early_parse_o32_fp64);
+#else
+bool o32_fp64_support __read_mostly;
+#endif
+
 #ifdef CONFIG_KEXEC
 static void __init mips_parse_crashkernel(void)
 {
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 587cf1d115e8..54d7a5122137 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -33,6 +33,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/cpu-info.h>
+#include <asm/abi.h>
 #include <asm/processor.h>
 #include <asm/fpu_emulator.h>
 #include <asm/fpu.h>
@@ -784,7 +785,7 @@ static inline int cop1_64bit(struct pt_regs *xcp)
 	if (IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_MIPS32_O32))
 		return 1;
 	else if (IS_ENABLED(CONFIG_32BIT) &&
-		 !IS_ENABLED(CONFIG_MIPS_O32_FP64_SUPPORT))
+		 !o32_fp64_support)
 		return 0;
 
 	return !test_thread_flag(TIF_32BIT_FPREGS);
-- 
2.26.2

