Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97265AFE57
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 16:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfIKOJl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 11 Sep 2019 10:09:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:50984 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726510AbfIKOJl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Sep 2019 10:09:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 667AAB7F7;
        Wed, 11 Sep 2019 14:09:39 +0000 (UTC)
Date:   Wed, 11 Sep 2019 16:09:39 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190911160939.19f776535770d12ff51a2af7@suse.de>
In-Reply-To: <20190910113243.GA19207@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
        <20190905152150.f7ff6ef70726085de63df828@suse.de>
        <20190905133251.GA3650@rapoport-lnx>
        <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
        <20190905154747.GB3650@rapoport-lnx>
        <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
        <20190906130223.GA17704@rapoport-lnx>
        <20190909182242.c1ef9717d14b20212ef75954@suse.de>
        <20190910113243.GA19207@rapoport-lnx>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 10 Sep 2019 12:32:44 +0100
Mike Rapoport <rppt@kernel.org> wrote:

> [..]

Patch below works on the same Origin.

Does memblocks_present() deal better with the one reserved page per node
than sparse_memory_present_with_active_regions() ? Or is there a better
explanation ? My debug prints didn't make sense out of it...

Thomas.

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..e4b02b5f3487 100644
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
index fb077a947575..370f2ba14a89 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -410,8 +410,6 @@ static void __init node_mem_init(cnodeid_t node)
 
 	memblock_reserve(slot_firstpfn << PAGE_SHIFT,
 			 ((slot_freepfn - slot_firstpfn) << PAGE_SHIFT));
-
-	sparse_memory_present_with_active_regions(node);
 }
 
 /*
@@ -444,6 +442,7 @@ void __init prom_meminit(void)
 		}
 		__node_data[node] = &null_node;
 	}
+	memblocks_present();
 }
 
 void __init prom_free_prom_memory(void)

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
