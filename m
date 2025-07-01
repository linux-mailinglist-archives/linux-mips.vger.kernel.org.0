Return-Path: <linux-mips+bounces-9587-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3509FAEFB5C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 15:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE7216806C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 13:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D67278741;
	Tue,  1 Jul 2025 13:56:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0E52798E6;
	Tue,  1 Jul 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378211; cv=none; b=mFrnNVKNjWaGLBjVj+UpwaHTPKCbtHyLmA4IRFRDxaQBqN3NCOfiNvETdV3ABTUAqt5jVyBs3poM5vH/khP769fwaGxCwyvKxkxzkAdBubF5mmCFjVZRaf3HwP6TCZxW+CbMu6Saxlyiwq+uQ/hgi4x1RoyWrrFBTNuS8B/Zs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378211; c=relaxed/simple;
	bh=u99rUQTMdWLVEwxqQcav+sqGA2U6uY/gTG9CZE6Ajp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UFDUVh0xI1G5MfU27y1uguYnMYCqVB1tziwvsa//fstNEfOMVyCb3I2xqrOIPzw0M2wilnEzSIHblvy0geOZWGS+lzTzSk58p44tA2Bmdc8QnV7uY+KxYCJJ5P899vPLZYrGGbOVU4vAuPrHC4IkIrYWVfQSq3f9fOB25WrZydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 303DF2E99;
	Tue,  1 Jul 2025 06:56:34 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DE563F58B;
	Tue,  1 Jul 2025 06:56:48 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-mips@vger.kernel.org
Subject: [PATCH 11/23] MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:04 +0100
Message-Id: <20250701135616.29630-12-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/ptrace.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index b890d64d352c..3f4c94c88124 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -935,7 +935,7 @@ int regs_query_register_offset(const char *name)
 
 static const struct user_regset mips_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= ELF_NGREG,
 		.size		= sizeof(unsigned int),
 		.align		= sizeof(unsigned int),
@@ -943,7 +943,7 @@ static const struct user_regset mips_regsets[] = {
 		.set		= gpr32_set,
 	},
 	[REGSET_DSP] = {
-		.core_note_type	= NT_MIPS_DSP,
+		USER_REGSET_NOTE_TYPE(MIPS_DSP),
 		.n		= NUM_DSP_REGS + 1,
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
@@ -953,7 +953,7 @@ static const struct user_regset mips_regsets[] = {
 	},
 #ifdef CONFIG_MIPS_FP_SUPPORT
 	[REGSET_FPR] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= ELF_NFPREG,
 		.size		= sizeof(elf_fpreg_t),
 		.align		= sizeof(elf_fpreg_t),
@@ -961,7 +961,7 @@ static const struct user_regset mips_regsets[] = {
 		.set		= fpr_set,
 	},
 	[REGSET_FP_MODE] = {
-		.core_note_type	= NT_MIPS_FP_MODE,
+		USER_REGSET_NOTE_TYPE(MIPS_FP_MODE),
 		.n		= 1,
 		.size		= sizeof(int),
 		.align		= sizeof(int),
@@ -971,7 +971,7 @@ static const struct user_regset mips_regsets[] = {
 #endif
 #ifdef CONFIG_CPU_HAS_MSA
 	[REGSET_MSA] = {
-		.core_note_type	= NT_MIPS_MSA,
+		USER_REGSET_NOTE_TYPE(MIPS_MSA),
 		.n		= NUM_FPU_REGS + 1,
 		.size		= 16,
 		.align		= 16,
@@ -995,7 +995,7 @@ static const struct user_regset_view user_mips_view = {
 
 static const struct user_regset mips64_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= ELF_NGREG,
 		.size		= sizeof(unsigned long),
 		.align		= sizeof(unsigned long),
@@ -1003,7 +1003,7 @@ static const struct user_regset mips64_regsets[] = {
 		.set		= gpr64_set,
 	},
 	[REGSET_DSP] = {
-		.core_note_type	= NT_MIPS_DSP,
+		USER_REGSET_NOTE_TYPE(MIPS_DSP),
 		.n		= NUM_DSP_REGS + 1,
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
@@ -1013,7 +1013,7 @@ static const struct user_regset mips64_regsets[] = {
 	},
 #ifdef CONFIG_MIPS_FP_SUPPORT
 	[REGSET_FP_MODE] = {
-		.core_note_type	= NT_MIPS_FP_MODE,
+		USER_REGSET_NOTE_TYPE(MIPS_FP_MODE),
 		.n		= 1,
 		.size		= sizeof(int),
 		.align		= sizeof(int),
@@ -1021,7 +1021,7 @@ static const struct user_regset mips64_regsets[] = {
 		.set		= fp_mode_set,
 	},
 	[REGSET_FPR] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= ELF_NFPREG,
 		.size		= sizeof(elf_fpreg_t),
 		.align		= sizeof(elf_fpreg_t),
@@ -1031,7 +1031,7 @@ static const struct user_regset mips64_regsets[] = {
 #endif
 #ifdef CONFIG_CPU_HAS_MSA
 	[REGSET_MSA] = {
-		.core_note_type	= NT_MIPS_MSA,
+		USER_REGSET_NOTE_TYPE(MIPS_MSA),
 		.n		= NUM_FPU_REGS + 1,
 		.size		= 16,
 		.align		= 16,
-- 
2.34.1


