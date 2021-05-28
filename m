Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB65393C11
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 05:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhE1Dt5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 23:49:57 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:46138 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhE1Dt5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 May 2021 23:49:57 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 14S3lbQS031425;
        Fri, 28 May 2021 12:47:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 14S3lbQS031425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622173658;
        bh=ouG2b1fE1uCLF7gpYSY3y7RJx5hhaSNbq5IGxW6A6ig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FfAuFSXgb76TIHDcybdPDVmr0g+A32vj5PPFxgtEGst/IK5p3PU6/NZODD0k7jUw/
         EvT3PYf987Z0umL+lbjNToE9pf2xjpobOb4ggtBAm2D30DvZ2GrS/7Rp1icsnwPoQA
         qRVNU3zQrzopx47CgP2nU8SyZdHzMhyd/WQ5UhGruKtOHCSHTx2KdiwWtNaz7S7lcW
         yF3gTwwsBmN5H0+FGlmlzeFtqOf3jx/oLLT0AUJxoYLenX5CUImbVAtPxVeimm3mus
         9ZrNJYnKm29abVnmI2zPi0t9qMUr4zn+KfwD1Vb95pA3SCoHDmHK5KqSjPk6Rv3dhf
         zJA6SShnKtT7g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] mips: syscalls: use pattern rules to generate syscall headers
Date:   Fri, 28 May 2021 12:46:15 +0900
Message-Id: <20210528034615.2157002-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528034615.2157002-1-masahiroy@kernel.org>
References: <20210528034615.2157002-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use pattern rules to unify similar build rules among n32, n64, and o32.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/kernel/syscalls/Makefile | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 6eee6a3b85df..10bf90dc02c0 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,9 +5,6 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscalln32 := $(src)/syscall_n32.tbl
-syscalln64 := $(src)/syscall_n64.tbl
-syscallo32 := $(src)/syscall_o32.tbl
 syshdr := $(srctree)/scripts/syscallhdr.sh
 sysnr := $(srctree)/$(src)/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
@@ -23,34 +20,17 @@ quiet_cmd_sysnr = SYSNR   $@
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
-$(uapi)/unistd_n32.h: $(syscalln32) $(syshdr) FORCE
-	$(call if_changed,syshdr)
-
-$(uapi)/unistd_n64.h: $(syscalln64) $(syshdr) FORCE
-	$(call if_changed,syshdr)
-
-$(uapi)/unistd_o32.h: $(syscallo32) $(syshdr) FORCE
+$(uapi)/unistd_%.h: $(src)/syscall_%.tbl $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 sysnr_pfx_unistd_nr_n32 := N32
-$(kapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr) FORCE
-	$(call if_changed,sysnr)
-
 sysnr_pfx_unistd_nr_n64 := 64
-$(kapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr) FORCE
-	$(call if_changed,sysnr)
-
 sysnr_pfx_unistd_nr_o32 := O32
-$(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
-	$(call if_changed,sysnr)
-
-$(kapi)/syscall_table_n32.h: $(syscalln32) $(systbl) FORCE
-	$(call if_changed,systbl)
 
-$(kapi)/syscall_table_n64.h: $(syscalln64) $(systbl) FORCE
-	$(call if_changed,systbl)
+$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
+	$(call if_changed,sysnr)
 
-$(kapi)/syscall_table_o32.h: $(syscallo32) $(systbl) FORCE
+$(kapi)/syscall_table_%.h: $(src)/syscall_%.tbl $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_n32.h			\
-- 
2.27.0

