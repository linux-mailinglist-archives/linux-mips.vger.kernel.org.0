Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78F11C8611
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 11:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgEGJtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 05:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgEGJtN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 05:49:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDF1C061A10
        for <linux-mips@vger.kernel.org>; Thu,  7 May 2020 02:49:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f6so2473455pgm.1
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2020 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xOlQCh24cnNdb4KJtJxS/QawmmOuoLAnXmsvSiX1tng=;
        b=aX8PCAZucDLvVggv0K035rTScRJyAdeBnV28LFJGWtpHpoA9JfIxpe8cjEccudpjBx
         FqDrQiBVfGS2wNaqPtOg8bNTO9xdFa9uWOlBzfosLtvy4DtTBJ2EFEh3gkMzb70mv9LV
         7igRTUpq4gMna6ompczkCObi2Q9fGMxrnEz6/Ke5+dkblzLualy+Nn58EaKJtZquwc/Z
         Uu1sn+t9RUEHKBCQVs9kYo5kzy4hxuT2SjuepvjDSA9GNjIVDhxTWNQdkZCbuKs9Avrg
         nAF2kRQ07eCjxg+I4wmLFNx2K131BS3DoyWNdALCGFxEY0UL4Gg6/3C70HaNv24eSYNH
         3ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=xOlQCh24cnNdb4KJtJxS/QawmmOuoLAnXmsvSiX1tng=;
        b=qpnc+hql+7S51LF1zUxMzqjX4IjmPwVq4nTxsyLKsnZotcv9haJFgWOKebzP1WhMX3
         3iALwvFkXtaSnWHNWdNzDJSP7HlT8fS6eBhI4soSiTRL9qANA0/hPcEEal1Qgiu1r6Ft
         JzJXtdJXiMZyWMJB53Opjj+ArUenkTFVJ0EzQapWjviEEIB7I8TtH1e71wy1Q4wjuleT
         I6d4ha81mUK+bU2/kShuUvAfAe1C76oBeBu3KJqpsoDbxlkxr6iX7igpLThXeI9Yy2lG
         +j1yb9ZwZ5eKzIguK2hanISdMgo3UTeGalJzgQLUmjJ0oYlpaBLOKEREKrl9YwLKdg/1
         zLjg==
X-Gm-Message-State: AGi0PuYoif2N9xjyxF1BHKd9MHA9+TPiYW+dmrPstlDj8Ztm+bysQia3
        IvQ9oVS6SsBzF1XLeAyklKE=
X-Google-Smtp-Source: APiQypLG0YtSEAhTl4RXhejms5CTrVY3UsxYoL4UdKOyk9Ydbuv+NPqaK1o+vN4lcACGfDPcXjsh6A==
X-Received: by 2002:a63:e62:: with SMTP id 34mr9457278pgo.300.1588844952843;
        Thu, 07 May 2020 02:49:12 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id x4sm2374763pff.67.2020.05.07.02.49.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2020 02:49:12 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: asm: Rename some macros to avoid build errors
Date:   Thu,  7 May 2020 17:49:18 +0800
Message-Id: <1588844958-23077-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use ASM_ prefix to rename some macros (PANIC and PRINT), in order to
avoid build errors (all users are updated as well):

1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
   mac80211/debugfs_sta.c

Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/dec/int-handler.S    |  4 ++--
 arch/mips/include/asm/asm.h    | 20 ++++++++++----------
 arch/mips/kernel/genex.S       |  6 +++---
 arch/mips/kernel/scall64-o32.S |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/dec/int-handler.S b/arch/mips/dec/int-handler.S
index a25ef82..ea5b5a8 100644
--- a/arch/mips/dec/int-handler.S
+++ b/arch/mips/dec/int-handler.S
@@ -304,8 +304,8 @@ spurious:
  */
 		FEXPORT(dec_intr_unimplemented)
 		move	a1,t0			# cheats way of printing an arg!
-		PANIC("Unimplemented cpu interrupt! CP0_CAUSE: 0x%08x");
+		ASM_PANIC("Unimplemented cpu interrupt! CP0_CAUSE: 0x%08x");
 
 		FEXPORT(asic_intr_unimplemented)
 		move	a1,t0			# cheats way of printing an arg!
-		PANIC("Unimplemented asic interrupt! ASIC ISR: 0x%08x");
+		ASM_PANIC("Unimplemented asic interrupt! ASIC ISR: 0x%08x");
diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 934465d..3682d1a 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -74,10 +74,15 @@ symbol:		.insn
 		.globl	symbol;				\
 symbol		=	value
 
-#define PANIC(msg)					\
+#define TEXT(msg)					\
+		.pushsection .data;			\
+8:		.asciiz msg;				\
+		.popsection;
+
+#define ASM_PANIC(msg)					\
 		.set	push;				\
 		.set	reorder;			\
-		PTR_LA	a0, 8f;				 \
+		PTR_LA	a0, 8f;				\
 		jal	panic;				\
 9:		b	9b;				\
 		.set	pop;				\
@@ -87,22 +92,17 @@ symbol		=	value
  * Print formatted string
  */
 #ifdef CONFIG_PRINTK
-#define PRINT(string)					\
+#define ASM_PRINT(string)				\
 		.set	push;				\
 		.set	reorder;			\
-		PTR_LA	a0, 8f;				 \
+		PTR_LA	a0, 8f;				\
 		jal	printk;				\
 		.set	pop;				\
 		TEXT(string)
 #else
-#define PRINT(string)
+#define ASM_PRINT(string)
 #endif
 
-#define TEXT(msg)					\
-		.pushsection .data;			\
-8:		.asciiz msg;				\
-		.popsection;
-
 /*
  * Stack alignment
  */
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 0a43c91..8236fb2 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -501,17 +501,17 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.macro	__BUILD_silent exception
 	.endm
 
-	/* Gas tries to parse the PRINT argument as a string containing
+	/* Gas tries to parse the ASM_PRINT argument as a string containing
 	   string escapes and emits bogus warnings if it believes to
 	   recognize an unknown escape code.  So make the arguments
 	   start with an n and gas will believe \n is ok ...  */
 	.macro	__BUILD_verbose nexception
 	LONG_L	a1, PT_EPC(sp)
 #ifdef CONFIG_32BIT
-	PRINT("Got \nexception at %08lx\012")
+	ASM_PRINT("Got \nexception at %08lx\012")
 #endif
 #ifdef CONFIG_64BIT
-	PRINT("Got \nexception at %016lx\012")
+	ASM_PRINT("Got \nexception at %016lx\012")
 #endif
 	.endm
 
diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
index 41df822..50c9a57 100644
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@ -41,7 +41,7 @@ NESTED(handle_sys, PT_SIZE, sp)
 #if 0
  SAVE_ALL
  move a1, v0
- PRINT("Scall %ld\n")
+ ASM_PRINT("Scall %ld\n")
  RESTORE_ALL
 #endif
 
-- 
2.7.0

