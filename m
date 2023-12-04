Return-Path: <linux-mips+bounces-491-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B78031E0
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17627B20956
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565322F10;
	Mon,  4 Dec 2023 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+jHt4x+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03022EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83113C43391;
	Mon,  4 Dec 2023 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691059;
	bh=f7mPCoikKyAxX+kfcbgmRu4ug6L+LPkQ+dYSgFSXlPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+jHt4x+nSEjuW01cDgKtc9kiRiD2SdnQ0deE6o2yur28Abjmd+mteEoC5EX5hGYl
	 WwFf/aGQVD7cK/QNkEYiN2WyIMOok0CAP+bRzshMJUq+JV8FxNybIS4RfUq9ps+DYs
	 b0KEPHDDdWJLzI/IlcQCKKmWHbUoW3AY07f8caszW3as77BaEC8i5d7Q+s7K1lf6U+
	 iJKZZdhyVcbP155OJL2U89uctz+E6AZSSAVd17wBQs6VU2MygoB4w9nuYd2s9dv4Cu
	 lPyBn7eLiYjo8ENI57IXmZLxMjO3KZKCvEmFJp2UyEQRiY6uwEj2+OQa6Ixd2T7fBI
	 ASP0AAnjxrYIQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 10/20] mips: fix setup_zero_pages() prototype
Date: Mon,  4 Dec 2023 12:57:00 +0100
Message-Id: <20231204115710.2247097-11-arnd@kernel.org>
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

setup_zero_pages() has a local declaration in a platform specific header,
but that is not seen in the file it is defined in:

arch/mips/mm/init.c:60:6: error: no previous prototype for 'setup_zero_pages' [-Werror=missing-prototypes]

Move it to the corresponding global header and include that where needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/mach-loongson64/mmzone.h | 1 -
 arch/mips/include/asm/mmzone.h                 | 2 ++
 arch/mips/mm/init.c                            | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index ebb1deaa77b9..a3d65d37b8b5 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -18,7 +18,6 @@ extern struct pglist_data *__node_data[];
 
 #define NODE_DATA(n)		(__node_data[n])
 
-extern void setup_zero_pages(void);
 extern void __init prom_init_numa_memory(void);
 
 #endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index 602a21aee9d4..14226ea42036 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -20,4 +20,6 @@
 #define nid_to_addrbase(nid) 0
 #endif
 
+extern void setup_zero_pages(void);
+
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 5dcb525a8995..c2e0e5aebe90 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -38,6 +38,7 @@
 #include <asm/dma.h>
 #include <asm/maar.h>
 #include <asm/mmu_context.h>
+#include <asm/mmzone.h>
 #include <asm/sections.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
-- 
2.39.2


