Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36FC9A9A28
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 07:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfIEFsH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 01:48:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfIEFsH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 01:48:07 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE76B2168B;
        Thu,  5 Sep 2019 05:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567662486;
        bh=eOH1W3sF8QeuaIDCOl/yaTiaMVmlndeK/f+Nowg2waU=;
        h=From:To:Cc:Subject:Date:From;
        b=oKDnQxlR2ZRt63Rag9IpuDyV8VkHumM0m6e8fsX9WpPCCPCSbpIGYY2TfHkGZ75Sb
         MzzOmfbjC7rEEJPHKU4W+soCy9YjujeBXCv6uMoLu8KhL5x7OLFcp7GzXsTaR2FdR1
         Nxja88GD7jyexlkVNWuQToJS6xoOG5+mlltrOnMM=
From:   Mike Rapoport <rppt@kernel.org>
To:     Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Date:   Thu,  5 Sep 2019 08:47:57 +0300
Message-Id: <1567662477-27404-1-git-send-email-rppt@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The memory initialization of SGI-IP27 is already half-way to support
SPARSEMEM and only a call to sparse_init() was missing. Add it to
prom_meminit() and adjust arch/mips/Kconfig to enable SPARSEMEM and
SPARSEMEM_EXTREME for SGI-IP27

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---

Thomas, could you please test this on your Origin machine?


 arch/mips/Kconfig                | 12 ++----------
 arch/mips/sgi-ip27/ip27-memory.c |  2 ++
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd..e4b02b5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -669,6 +669,7 @@ config SGI_IP22
 config SGI_IP27
 	bool "SGI IP27 (Origin200/2000)"
 	select ARCH_HAS_PHYS_TO_DMA
+	select ARCH_SPARSEMEM_ENABLE
 	select FW_ARC
 	select FW_ARC64
 	select BOOT_ELF64
@@ -2633,18 +2634,9 @@ config ARCH_FLATMEM_ENABLE
 	def_bool y
 	depends on !NUMA && !CPU_LOONGSON2
 
-config ARCH_DISCONTIGMEM_ENABLE
-	bool
-	default y if SGI_IP27
-	help
-	  Say Y to support efficient handling of discontiguous physical memory,
-	  for architectures which are either NUMA (Non-Uniform Memory Access)
-	  or have huge holes in the physical address space for other reasons.
-	  See <file:Documentation/vm/numa.rst> for more.
-
 config ARCH_SPARSEMEM_ENABLE
 	bool
-	select SPARSEMEM_STATIC
+	select SPARSEMEM_STATIC if !SGI_IP27
 
 config NUMA
 	bool "NUMA Support"
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index fb077a9..a8ddebc 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -444,6 +444,8 @@ void __init prom_meminit(void)
 		}
 		__node_data[node] = &null_node;
 	}
+
+	sparse_init();
 }
 
 void __init prom_free_prom_memory(void)
-- 
2.7.4

