Return-Path: <linux-mips+bounces-492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032128031DF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E079A1C209AB
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C60222F14;
	Mon,  4 Dec 2023 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0qjci0K"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E122EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726FFC43395;
	Mon,  4 Dec 2023 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691061;
	bh=TN+helZA3bPv2YjKOOvsbQc10ej/I0xDQI0yWDQmgfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0qjci0KWVyXGoGetwLAdxCbm3vMP8PwEkoyqEAI4sdba9umtQj+C0CjCz/+VCNHt
	 78dAPC0khV3FBaDdebhE5AVNwQldlJnkXvD8wa2BZ9TAkf+aHEpe9k7WZaU7z+Frsx
	 9ROjnLRKResu/hhZ8yh3uMJ1CexSrTKe+5vA6wbLE3SEG9eQgtfqTDfP0l5OVDLKOM
	 bvQwa5x1yXV5P03JcUcfXAoi8Lmrc8ufouFNwfD9IY7hc104mQdi0pYkv0fRESsPLg
	 R/REziphpRYuQNQ+t20SI/gYNxs0m/qKxr/a9mU0wGDJmMAKIeoDRF32GwZmHTNnqf
	 w3cn2BNnu8jLQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 11/20] mips: fix tlb_init() prototype
Date: Mon,  4 Dec 2023 12:57:01 +0100
Message-Id: <20231204115710.2247097-12-arnd@kernel.org>
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

There are two definitions for tlb_init(), but no global declaration:

arch/mips/mm/tlb-r4k.c:552:6: error: no previous prototype for 'tlb_init' [-Werror=missing-prototypes]
arch/mips/mm/tlb-r3k.c:244:6: error: no previous prototype for 'tlb_init' [-Werror=missing-prototypes]

Move the declaration to asm/setup.h and included it as needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/setup.h | 1 +
 arch/mips/kernel/traps.c      | 2 --
 arch/mips/mm/tlb-r3k.c        | 1 +
 arch/mips/mm/tlb-r4k.c        | 1 +
 4 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 8c56b862fd9c..4dce41138bad 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -27,5 +27,6 @@ extern unsigned long ebase;
 extern unsigned int hwrena;
 extern void per_cpu_trap_init(bool);
 extern void cpu_cache_init(void);
+extern void tlb_init(void);
 
 #endif /* __SETUP_H */
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 246c6a6b0261..c58c0c3c5b40 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2157,8 +2157,6 @@ void *set_vi_handler(int n, vi_handler_t addr)
 	return set_vi_srs_handler(n, addr, 0);
 }
 
-extern void tlb_init(void);
-
 /*
  * Timer interrupt
  */
diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index 1fb2cf8c8bfa..f6db65410c65 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -23,6 +23,7 @@
 #include <asm/io.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
+#include <asm/setup.h>
 #include <asm/tlbex.h>
 
 #undef DEBUG_TLB
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index a542b255019a..44411b20c7ec 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -24,6 +24,7 @@
 #include <asm/tlb.h>
 #include <asm/tlbex.h>
 #include <asm/tlbmisc.h>
+#include <asm/setup.h>
 
 /*
  * LOONGSON-2 has a 4 entry itlb which is a subset of jtlb, LOONGSON-3 has
-- 
2.39.2


