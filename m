Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419A1B2B03
	for <lists+linux-mips@lfdr.de>; Sat, 14 Sep 2019 12:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfINKlV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Sep 2019 06:41:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:43384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728546AbfINKlV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 14 Sep 2019 06:41:21 -0400
Received: from rapoport-lnx (unknown [87.71.71.249])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CC6020578;
        Sat, 14 Sep 2019 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568457680;
        bh=9/H5bRCdNvvCpmNx4Gw/GSYF6iabQyLsISVeNmZqhYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DL2w9gzAtsYQCurwg49AR0XlEL4OkIkKwNhLxkytBAiB4d3dhFaM6kPwIHruHNRTl
         fwefz2CqhmNiSJzh/AyXpCV0yCK76A0KYpsOBP+0NnCfQwVtAQ76ZXe//5JBsilmfh
         v/PXVgRP5YdVgokXhwmpvHVAmC0BIOwizkZ+q4V4=
Date:   Sat, 14 Sep 2019 11:41:13 +0100
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190914104112.GA12045@rapoport-lnx>
References: <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
 <20190905154747.GB3650@rapoport-lnx>
 <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
 <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
 <20190910113243.GA19207@rapoport-lnx>
 <20190911160939.19f776535770d12ff51a2af7@suse.de>
 <20190912105831.GA10677@rapoport-lnx>
 <20190912155539.6151b0811e858455be4c8d86@suse.de>
 <20190912140912.GA13137@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912140912.GA13137@alpha.franken.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Sep 12, 2019 at 04:09:12PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Sep 12, 2019 at 03:55:39PM +0200, Thomas Bogendoerfer wrote:
> > - reserved[0xd]	[0x000000035bff8000-0x000000035bffffff], 0x0000000000008000 bytes flags: 0x0
> > 
> > I have no idea which reservation this is, but it's not from one of the
> > node data.
> 
> that's sparsemem's mem_section. And 
> 
>  free_bootmem_with_active_regions(node, end_pfn);

It seems that the call to free_bootmem_with_active_regions() should have
been removed along with bootmem and it's not needed now.

Can you please test the below version of the patch?

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
index fb077a9..9db8692 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -406,12 +406,8 @@ static void __init node_mem_init(cnodeid_t node)
 	slot_freepfn += PFN_UP(sizeof(struct pglist_data) +
 			       sizeof(struct hub_data));
 
-	free_bootmem_with_active_regions(node, end_pfn);
-
 	memblock_reserve(slot_firstpfn << PAGE_SHIFT,
 			 ((slot_freepfn - slot_firstpfn) << PAGE_SHIFT));
-
-	sparse_memory_present_with_active_regions(node);
 }
 
 /*
@@ -444,6 +440,8 @@ void __init prom_meminit(void)
 		}
 		__node_data[node] = &null_node;
 	}
+
+	memblocks_present();
 }
 
 void __init prom_free_prom_memory(void)
 
> on the last node will free this reserved memory, when memory
> is added node by node. This explains it.
> 
> So when resending the patch add my
> 
> Tested-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

-- 
Sincerely yours,
Mike.
