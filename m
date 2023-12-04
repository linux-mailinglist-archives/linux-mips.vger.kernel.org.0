Return-Path: <linux-mips+bounces-488-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C358031DC
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13CE3280F0F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6960C22F10;
	Mon,  4 Dec 2023 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cODGOLl9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54822EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEBBC433C9;
	Mon,  4 Dec 2023 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691053;
	bh=z4zTk3CFfY1MGmK1f12Tfq9m5AIiq4yOUL5+WPN+Gys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cODGOLl96hF2fMQuvWNXpIGHYoQzt9fWAatg6+BNPuHZnwJ68CuLR53MQL+varhML
	 GlBKYYHvIrAUXdJ8R9bGTKLkSuGuwg5u4dO96dIuofZL0rQXRzxDxRzB6pvVrFQ9V3
	 bWNLnEJrLD2v654rNAKTT5PZ9D2L5Z3B/kXuD6+1DAbc1Q28LlG2rHtj4iIOEpDgDF
	 o8vBqd1uB3MvkFFG0iZPGoNetO4Q7aUCGci9AZr8gKlNtKqeierpE2SGTYeMM+T2i9
	 P2hF8rd3l9mXz/uycj/77GeKbsrM/1EhBEVIw+nqnMiTt8tMkyDOWtCJNs8VwNxsLC
	 40ACTDpfKXtgA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 07/20] mips: move build_tlb_refill_handler() prototype
Date: Mon,  4 Dec 2023 12:56:57 +0100
Message-Id: <20231204115710.2247097-8-arnd@kernel.org>
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

Instead of having a declaration for each caller, have one that is shared
with the function definition, which avoids a warning:

arch/mips/mm/tlbex.c:2547:6: error: no previous prototype for 'build_tlb_refill_handler' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/tlbex.h | 1 +
 arch/mips/mm/tlb-r3k.c        | 3 +--
 arch/mips/mm/tlb-r4k.c        | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/tlbex.h b/arch/mips/include/asm/tlbex.h
index 6d97e23f30ab..24a2d06cc1c3 100644
--- a/arch/mips/include/asm/tlbex.h
+++ b/arch/mips/include/asm/tlbex.h
@@ -23,6 +23,7 @@ void build_update_entries(u32 **p, unsigned int tmp, unsigned int ptep);
 void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 			   struct uasm_reloc **r,
 			   enum tlb_write_entry wmode);
+void build_tlb_refill_handler(void);
 
 extern void handle_tlbl(void);
 extern char handle_tlbl_end[];
diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index 53dfa2b9316b..1fb2cf8c8bfa 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -23,11 +23,10 @@
 #include <asm/io.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
+#include <asm/tlbex.h>
 
 #undef DEBUG_TLB
 
-extern void build_tlb_refill_handler(void);
-
 /* CP0 hazard avoidance. */
 #define BARRIER				\
 	__asm__ __volatile__(		\
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 93c2d695588a..a542b255019a 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -22,10 +22,9 @@
 #include <asm/hazards.h>
 #include <asm/mmu_context.h>
 #include <asm/tlb.h>
+#include <asm/tlbex.h>
 #include <asm/tlbmisc.h>
 
-extern void build_tlb_refill_handler(void);
-
 /*
  * LOONGSON-2 has a 4 entry itlb which is a subset of jtlb, LOONGSON-3 has
  * a 4 entry itlb and a 4 entry dtlb which are subsets of jtlb. Unfortunately,
-- 
2.39.2


