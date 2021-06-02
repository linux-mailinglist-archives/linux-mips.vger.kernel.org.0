Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14A5398F43
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 17:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhFBPxa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 11:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhFBPxa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 11:53:30 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D62C061574;
        Wed,  2 Jun 2021 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7IkdlpHtUTiL7NyI10jOX4lLeaAEkAdMUSNcj/5+ey4=; b=O9V6Uv+/tG7yFlp7KfQdSdsfk
        ivWL4pxFbM13V/JpxEnffQWYxsFmenQknrx32FspNjUDAL3t/2zDvpzCuV5XxKUjwewvEi9dzPXhf
        /ZMR3YWTOqzPW006rqgaa4ahd1hfKNip9FjsABEagc7zVTE8EPQOftVlPR7NIxCZAoQCuz+KD5x2L
        qOuBn+gY72qeApOcIrzVA9rAcIVPEIU6/Fs3TwLDPgu9LRb/Ae/D9xWfzQcDiUA2gmzMOQ1XEV+hY
        Mqfan6yMboo/O+g4PYtwqUjHy4H/vGiIe6NRflosBWqxojN+hjYQbkRphgjusgexZt13u25SK9osX
        gRGC8h1rQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44632)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1loT9j-0001Rw-Vb; Wed, 02 Jun 2021 16:51:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1loT9h-0001FK-Py; Wed, 02 Jun 2021 16:51:41 +0100
Date:   Wed, 2 Jun 2021 16:51:41 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
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
Message-ID: <20210602155141.GM30436@shell.armlinux.org.uk>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
 <20210602101521.GD30436@shell.armlinux.org.uk>
 <YLeNiUkIw+aFpMcz@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLeNiUkIw+aFpMcz@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 04:54:17PM +0300, Mike Rapoport wrote:
> On Wed, Jun 02, 2021 at 11:15:21AM +0100, Russell King (Oracle) wrote:
> > On Wed, Jun 02, 2021 at 11:33:10AM +0300, Mike Rapoport wrote:
> > > On Tue, Jun 01, 2021 at 02:54:15PM +0100, Russell King (Oracle) wrote:
> > > > If I look at one of my kernels:
> > > > 
> > > > c0008000 T _text
> > > > c0b5b000 R __end_rodata
> > > > ... exception and unwind tables live here ...
> > > > c0c00000 T __init_begin
> > > > c0e00000 D _sdata
> > > > c0e68870 D _edata
> > > > c0e68870 B __bss_start
> > > > c0e995d4 B __bss_stop
> > > > c0e995d4 B _end
> > > > 
> > > > So the original covers _text..__init_begin-1 which includes the
> > > > exception and unwind tables. Your version above omits these, which
> > > > leaves them exposed.
> > > 
> > > Right, this needs to be fixed. Is there any reason the exception and unwind
> > > tables cannot be placed between _sdata and _edata? 
> > > 
> > > It seems to me that they were left outside for purely historical reasons.
> > > Commit ee951c630c5c ("ARM: 7568/1: Sort exception table at compile time")
> > > moved the exception tables out of .data section before _sdata existed.
> > > Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> > > _etext before the unwind tables and didn't bother to put them into data or
> > > rodata areas.
> > 
> > You can not assume that all sections will be between these symbols. This
> > isn't specific to 32-bit ARM. If you look at x86's vmlinux.lds.in, you
> > will see that BUG_TABLE and ORC_UNWIND_TABLE are after _edata, along
> > with many other undiscarded sections before __bss_start.
> 
> But if you look at x86's setup_arch() all these never make it to the
> resource tree. So there are holes in /proc/iomem between the kernel
> resources.

Also true. However, my point was to counter your claim that these
sections should be part of the .text/.data/.rodata etc sections in the
output vmlinux.

There is, however, a more important point. The __ex_table section
must exist and be separate from the .text/.data/.rodata sections in
the output ELF file, as sorttable (the exception table sorter) relies
on this to be able to find the table and sort it.

So, it isn't entirely "for historical reasons" as you said two messages
ago.

> > So it seems your assumptions in trying to clean this up are somewhat
> > false.
> 
> My assumption was that there is complete lack of consistency between what
> is reserved memory and how it is reported in /proc/iomem or
> /sys/firmware/memmap for that matter. I'm not trying to clean this up, I'm
> trying to make different views of the physical memory consistent.
> Consolidating several similar per-arch implementations is the first step in
> this direction.

It looks to me that there is quite a number of things that need fixing.
One glaring thing is the kernel's init memory - should that be counted
as reserved memory? It's marked as such in memblock and /proc/iomem,
yet we free these pages into the page allocator after boot meaning
they are just like any other page in the memory allocator - they are
most certainly not "reserved" at that point.

So, what is reported as reserved in firmware maps will be different
from memblock.  Memblock includes kernel boot-time allocations, which
count as "reserved" but are not part of the firmware maps - these will
be for things like early page tables and the struct page array. So,
you're never going to get consistency between memblock and firmware.

Memblock and /proc/iomem should be fairly consistent - areas marked
as reserved in memblock seem to be propagated into /proc/iomem,
including areas around the kernel image (the resources that you're
changing in your patch.) Here's an example:

/sys/kernel/debug/memblock/reserved:
   1: 0x0000000081210000..0x0000000082d6efff
   2: 0x0000000082d71000..0x0000000082d7ffff

  81210000-821cffff : Kernel code
  821d0000-8246ffff : reserved
  82470000-82d7ffff : Kernel data

This is aarch64, which isn't as accurate as 32-bit ARM in /proc/iomem:

/sys/kernel/debug/memblock/reserved:
   1: 0x0000000040200000..0x0000000040ea1c17

/proc/iomem:
  40008000-40bfffff : Kernel code
  40e00000-40ea1c17 : Kernel data

32-bit ARM doesn't forward the memblock reserved areas into /proc/iomem
because they are kernel allocations. In the example I show above for
32-bit ARM, there are no firmware reserved regions, yet there are 19
memblock "reserved" regions.

I think part of the problem here is understanding what "reserved" means
in these cases. For something passed to the kernel from firmware, it's
an area that firmware doesn't want the OS to use. For memblock, it is
those areas plus allocations made early on during kernel boot before
the page allocator is up and running, and includes areas of memory that
these allocations must avoid (e.g. due to initramfs or device tree
temporarily residing there.) Then there's differences in what should
be placed in /proc/iomem.

Now, bear in mind that /proc/iomem is a user API, one which userspace
depends on. If we start going around making /proc/iomem report stuff
like kernel boot time reservations as "reserved" memory, we will end up
breaking the kexec tooling on some platforms. For example, kexec
tooling for 32-bit ARM parses /proc/iomem, looking for "System RAM",
"System RAM (boot alias)" and "reserved" regions.

So, I think changes to make this "more consistent" come with high
risk.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
