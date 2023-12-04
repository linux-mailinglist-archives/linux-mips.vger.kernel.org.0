Return-Path: <linux-mips+bounces-484-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0378031D8
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18931280F12
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EE422EFC;
	Mon,  4 Dec 2023 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5WjEPhO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6744114F9C
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AC6C433C8;
	Mon,  4 Dec 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691045;
	bh=GVPJo8uO9T+V60ClpxXsIQariQDInjL+tl05cbLyqws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5WjEPhOrZxIpNezsV3u/mxLcK7Hlo3/HZCu5+pDjyw6ptaF74uL9RVDwGkDMVor0
	 IBgGfGNu43qo+2Nz5Nwe6S3pJ6eGqcEp6wfpH2lQPcnfl7dWDkNEmFh5sMQo8LdBe4
	 /cNu7OXGtEXqtM5WTAQSy8Ae45cUF+QVK3dKvuA8d5nOL1zx3r6dJRowDoXqMJnIV/
	 aHUWTkM7i+MBIrm/vc4oxH7L0qg33oNbbRXYlgtLRh7be7tAAsEa42v95fyTk8R/Gl
	 f8RXvSy68dKBpvArRPQbhCllvCazfanqRt1cELSmlpKwd5/8fw4iksMGd4lt50xo5i
	 QiFCJ8zOsQUfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 03/20] mips: add missing declarations for trap handlers
Date: Mon,  4 Dec 2023 12:56:53 +0100
Message-Id: <20231204115710.2247097-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These exception handlers are all called from assembly code, so they don't
normally need a declaration, but without one we now get warnings:

arch/mips/mm/fault.c:323:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:447:17: error: no previous prototype for 'do_be' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:752:17: error: no previous prototype for 'do_ov' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:874:17: error: no previous prototype for 'do_fpe' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1027:17: error: no previous prototype for 'do_bp' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1114:17: error: no previous prototype for 'do_tr' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1151:17: error: no previous prototype for 'do_ri' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1402:17: error: no previous prototype for 'do_cpu' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1507:17: error: no previous prototype for 'do_msa_fpe' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1527:17: error: no previous prototype for 'do_msa' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1548:17: error: no previous prototype for 'do_mdmx' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1560:17: error: no previous prototype for 'do_watch' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1587:17: error: no previous prototype for 'do_mcheck' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1612:17: error: no previous prototype for 'do_mt' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1648:17: error: no previous prototype for 'do_dsp' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1656:17: error: no previous prototype for 'do_reserved' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1832:17: error: no previous prototype for 'cache_parity_error' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1880:17: error: no previous prototype for 'do_ftlb' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1909:17: error: no previous prototype for 'do_gsexc' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1944:6: error: no previous prototype for 'ejtag_exception_handler' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:1989:17: error: no previous prototype for 'nmi_exception_handler' [-Werror=missing-prototypes]
arch/mips/kernel/unaligned.c:1516:17: error: no previous prototype for 'do_ade' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/traps.h | 23 +++++++++++++++++++++++
 arch/mips/kernel/r4k-bugs64.c |  1 +
 arch/mips/kernel/unaligned.c  |  1 +
 arch/mips/mm/fault.c          |  1 +
 4 files changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index d4d9f8a8fdea..1e63d7d04404 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -41,5 +41,28 @@ extern char except_vec_nmi[];
 
 asmlinkage void do_page_fault(struct pt_regs *regs,
 	unsigned long write, unsigned long address);
+asmlinkage void do_ade(struct pt_regs *regs);
+asmlinkage void do_be(struct pt_regs *regs);
+asmlinkage void do_ov(struct pt_regs *regs);
+asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31);
+asmlinkage void do_bp(struct pt_regs *regs);
+asmlinkage void do_tr(struct pt_regs *regs);
+asmlinkage void do_ri(struct pt_regs *regs);
+asmlinkage void do_cpu(struct pt_regs *regs);
+asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr);
+asmlinkage void do_msa(struct pt_regs *regs);
+asmlinkage void do_mdmx(struct pt_regs *regs);
+asmlinkage void do_watch(struct pt_regs *regs);
+asmlinkage void do_mcheck(struct pt_regs *regs);
+asmlinkage void do_mt(struct pt_regs *regs);
+asmlinkage void do_dsp(struct pt_regs *regs);
+asmlinkage void do_reserved(struct pt_regs *regs);
+asmlinkage void do_ftlb(void);
+asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1);
+asmlinkage void do_daddi_ov(struct pt_regs *regs);
+
+asmlinkage void cache_parity_error(void);
+asmlinkage void ejtag_exception_handler(struct pt_regs *regs);
+asmlinkage void __noreturn nmi_exception_handler(struct pt_regs *regs);
 
 #endif /* _ASM_TRAPS_H */
diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index 6ffefb2c6971..1e300330078d 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -14,6 +14,7 @@
 #include <asm/fpu.h>
 #include <asm/mipsregs.h>
 #include <asm/setup.h>
+#include <asm/traps.h>
 
 static char bug64hit[] __initdata =
 	"reliable operation impossible!\n%s";
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index f4cf94e92ec3..db652c99b72e 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -91,6 +91,7 @@
 #include <asm/inst.h>
 #include <asm/unaligned-emul.h>
 #include <asm/mmu_context.h>
+#include <asm/traps.h>
 #include <linux/uaccess.h>
 
 #include "access-helper.h"
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index d7878208bd3f..aaa9a242ebba 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -26,6 +26,7 @@
 #include <asm/mmu_context.h>
 #include <asm/ptrace.h>
 #include <asm/highmem.h>		/* For VMALLOC_END */
+#include <asm/traps.h>
 #include <linux/kdebug.h>
 
 int show_unhandled_signals = 1;
-- 
2.39.2


