Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9EA2CE117
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502048AbgLCVrb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389369AbgLCVrZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:25 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C86AC061A51;
        Thu,  3 Dec 2020 13:46:44 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwR0-00GJSZ-As; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 07/10] mips compat: don't bother with ELF_ET_DYN_BASE
Date:   Thu,  3 Dec 2020 21:46:38 +0000
Message-Id: <20201203214641.3887979-7-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

normal mips one is just fine - it's only used after we'd done
SET_PERSONALITY2() and by that point TASK_SIZE will yield the
right value

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/mips/include/asm/elf.h      | 2 --
 arch/mips/kernel/binfmt_elfn32.c | 4 ----
 arch/mips/kernel/binfmt_elfo32.c | 8 --------
 3 files changed, 14 deletions(-)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index 71c7622025d1..d29e43e4f9b1 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -469,9 +469,7 @@ extern const char *__elf_base_platform;
    the loader.	We need to make sure that it is out of the way of the program
    that it will "exec", and that there is sufficient room for the brk.	*/
 
-#ifndef ELF_ET_DYN_BASE
 #define ELF_ET_DYN_BASE		(TASK_SIZE / 3 * 2)
-#endif
 
 /* update AT_VECTOR_SIZE_ARCH if the number of NEW_AUX_ENT entries changes */
 #define ARCH_DLINFO							\
diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
index 4f8bfaf414f5..10fa9ccd92b7 100644
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ b/arch/mips/kernel/binfmt_elfn32.c
@@ -34,10 +34,6 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
  */
 #define elf_check_arch elfn32_check_arch
 
-#define TASK32_SIZE		0x7fff8000UL
-#undef ELF_ET_DYN_BASE
-#define ELF_ET_DYN_BASE		(TASK32_SIZE / 3 * 2)
-
 #include <asm/processor.h>
 #include <linux/elfcore.h>
 #include <linux/compat.h>
diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
index 9755ff12a9fe..54fe6a4dac6d 100644
--- a/arch/mips/kernel/binfmt_elfo32.c
+++ b/arch/mips/kernel/binfmt_elfo32.c
@@ -34,14 +34,6 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
  */
 #define elf_check_arch elfo32_check_arch
 
-#ifdef CONFIG_KVM_GUEST
-#define TASK32_SIZE		0x3fff8000UL
-#else
-#define TASK32_SIZE		0x7fff8000UL
-#endif
-#undef ELF_ET_DYN_BASE
-#define ELF_ET_DYN_BASE		(TASK32_SIZE / 3 * 2)
-
 #include <asm/processor.h>
 
 #include <linux/elfcore.h>
-- 
2.11.0

