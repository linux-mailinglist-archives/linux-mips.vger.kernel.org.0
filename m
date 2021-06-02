Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C123992C0
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 20:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhFBSp3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 14:45:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:57488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229736AbhFBSp0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Jun 2021 14:45:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 974BE61359;
        Wed,  2 Jun 2021 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622659422;
        bh=PNatpOdGGG0QpSFk4pCtbC1etv95lkYpYdeUjO3mnaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s648wJOSbwYMNKfElAE9jbYgbFl2QdWu0EgbydpfkAm71bvLvgtxc7uaIOkY7deNG
         Zsh4/e9Km6kaetXm5peYnHfGGcYZaYOn6WGGhvLHa8o6kzyRt7fKpr/IxcAh6gyR/e
         VNbGfJWwj+Uibs5Z7cHQDpczTmjHYYq4nvbiLGSwY3JFdmMfKKZSxIgujPFVAEbakL
         W2L12EBsKZ2gSXbPodXONQjD3Fj04YlWdjL1wGDaEXgiGw04V9wOexJtqRQpR0Rg0h
         P7hQG7tv3IfmwhEnSHHyxEo4TNJ08ivYSiLG7mL/5t2mqsrHCLQMgmH+xnyptQI9Wl
         /Bc+f3AO3Wz1g==
Date:   Wed, 2 Jun 2021 21:43:32 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 2/5] memblock: introduce generic
 memblock_setup_resources()
Message-ID: <YLfRVGC+tq5L0TZ6@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
 <20210602101521.GD30436@shell.armlinux.org.uk>
 <YLeNiUkIw+aFpMcz@linux.ibm.com>
 <20210602155141.GM30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602155141.GM30436@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 04:51:41PM +0100, Russell King (Oracle) wrote:
> On Wed, Jun 02, 2021 at 04:54:17PM +0300, Mike Rapoport wrote:
> > On Wed, Jun 02, 2021 at 11:15:21AM +0100, Russell King (Oracle) wrote:
> > > On Wed, Jun 02, 2021 at 11:33:10AM +0300, Mike Rapoport wrote:
> > > > On Tue, Jun 01, 2021 at 02:54:15PM +0100, Russell King (Oracle) wrote:
> > > > > If I look at one of my kernels:
> > > > > 
> > > > > c0008000 T _text
> > > > > c0b5b000 R __end_rodata
> > > > > ... exception and unwind tables live here ...
> > > > > c0c00000 T __init_begin
> > > > > c0e00000 D _sdata
> > > > > c0e68870 D _edata
> > > > > c0e68870 B __bss_start
> > > > > c0e995d4 B __bss_stop
> > > > > c0e995d4 B _end
> > > > > 
> > > > > So the original covers _text..__init_begin-1 which includes the
> > > > > exception and unwind tables. Your version above omits these, which
> > > > > leaves them exposed.
> > > > 
> > > > Right, this needs to be fixed. Is there any reason the exception and unwind
> > > > tables cannot be placed between _sdata and _edata? 
> > > > 
> > > > It seems to me that they were left outside for purely historical reasons.
> > > > Commit ee951c630c5c ("ARM: 7568/1: Sort exception table at compile time")
> > > > moved the exception tables out of .data section before _sdata existed.
> > > > Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> > > > _etext before the unwind tables and didn't bother to put them into data or
> > > > rodata areas.
> > > 
> > > You can not assume that all sections will be between these symbols. This
> > > isn't specific to 32-bit ARM. If you look at x86's vmlinux.lds.in, you
> > > will see that BUG_TABLE and ORC_UNWIND_TABLE are after _edata, along
> > > with many other undiscarded sections before __bss_start.
> > 
> > But if you look at x86's setup_arch() all these never make it to the
> > resource tree. So there are holes in /proc/iomem between the kernel
> > resources.
> 
> Also true. However, my point was to counter your claim that these
> sections should be part of the .text/.data/.rodata etc sections in the
> output vmlinux.
> 
> There is, however, a more important point. The __ex_table section
> must exist and be separate from the .text/.data/.rodata sections in
> the output ELF file, as sorttable (the exception table sorter) relies
> on this to be able to find the table and sort it.
> 
> So, it isn't entirely "for historical reasons" as you said two messages
> ago.

Back then when __ex_table was moved from .data section, _sdata and _edata
were part of the .data section. Today they are not. So something like the
patch below will ensure for instance that __ex_table would be a part of
"Kernel data" in /proc/iomem without moving it to the .data section:

diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index f7f4620d59c3..2991feceab31 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -72,13 +72,6 @@ SECTIONS
 
 	RO_DATA(PAGE_SIZE)
 
-	. = ALIGN(4);
-	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
-		__start___ex_table = .;
-		ARM_MMU_KEEP(*(__ex_table))
-		__stop___ex_table = .;
-	}
-
 #ifdef CONFIG_ARM_UNWIND
 	ARM_UNWIND_SECTIONS
 #endif
@@ -143,6 +136,14 @@ SECTIONS
 	__init_end = .;
 
 	_sdata = .;
+
+	. = ALIGN(4);
+	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
+		__start___ex_table = .;
+		ARM_MMU_KEEP(*(__ex_table))
+		__stop___ex_table = .;
+	}
+
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
 
> Now, bear in mind that /proc/iomem is a user API, one which userspace
> depends on. If we start going around making /proc/iomem report stuff
> like kernel boot time reservations as "reserved" memory, we will end up
> breaking the kexec tooling on some platforms. For example, kexec
> tooling for 32-bit ARM parses /proc/iomem, looking for "System RAM",
> "System RAM (boot alias)" and "reserved" regions.
>
> So, I think changes to make this "more consistent" come with high
> risk.

I agree there is a risk but I don't think it's high. It does not look like
the minor changes in "reserved" reporting in /proc/iomem will break kexec
tooling. Anyway the amount of reserved and free memory depends on a
particular system, kernel version, configuration and command line.
I have no intention to report kernel boot time reservations
to /proc/iomem on architectures that do not report them there today,
although this also does not seem like a significant factor.

On the other hand, making /proc/iomem reporting consistent among
architectures will allow to reduce complexity of both the kernel and kexec
tools in the long run.

-- 
Sincerely yours,
Mike.
