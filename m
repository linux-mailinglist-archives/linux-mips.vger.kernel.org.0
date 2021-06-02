Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CB2399460
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 22:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhFBUQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 16:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhFBUQw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 16:16:52 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A85CC061756;
        Wed,  2 Jun 2021 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hg1i1lJUDI2dbeh2/KVZj893kEGRfKzlm3YByZ5waG8=; b=pw5LtsnUBCH9bK2J0dEulMays
        omr8kMIj1brZGBhcbDHrAae/h+L4FnbWtFLgTbPNrmeMqEkbEcgl4Vz7SE8RqRsvtZ6UbqRIVF0Qq
        iVX2dypzeNwFOS7Px9gyAZA0B0cGjui2nj9yoXNL6zBKZcwA1okNTEnf6qTDQz0h0QIugSNpDBxlQ
        BCoYuqDSMNOafq7kf12tLMf+P7f6DryHtuIjU1b5dWa5tD21VEwQbqwQFL81W8vebifiK8hc5Szfy
        EPHT3nsn+EYbrK5t/g8EAFQt2VIIKN7AEZEMInO4I1pJxIKvV5srYPBdZ/+CRQjiSMoxOKI6LVow9
        XqvY+jujw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44646)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1loXGa-0001mw-OQ; Wed, 02 Jun 2021 21:15:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1loXGY-0001QE-UG; Wed, 02 Jun 2021 21:15:02 +0100
Date:   Wed, 2 Jun 2021 21:15:02 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20210602201502.GP30436@shell.armlinux.org.uk>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
 <20210602101521.GD30436@shell.armlinux.org.uk>
 <YLeNiUkIw+aFpMcz@linux.ibm.com>
 <20210602155141.GM30436@shell.armlinux.org.uk>
 <YLfRVGC+tq5L0TZ6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLfRVGC+tq5L0TZ6@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 09:43:32PM +0300, Mike Rapoport wrote:
> Back then when __ex_table was moved from .data section, _sdata and _edata
> were part of the .data section. Today they are not. So something like the
> patch below will ensure for instance that __ex_table would be a part of
> "Kernel data" in /proc/iomem without moving it to the .data section:
> 
> diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
> index f7f4620d59c3..2991feceab31 100644
> --- a/arch/arm/kernel/vmlinux.lds.S
> +++ b/arch/arm/kernel/vmlinux.lds.S
> @@ -72,13 +72,6 @@ SECTIONS
>  
>  	RO_DATA(PAGE_SIZE)
>  
> -	. = ALIGN(4);
> -	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
> -		__start___ex_table = .;
> -		ARM_MMU_KEEP(*(__ex_table))
> -		__stop___ex_table = .;
> -	}
> -
>  #ifdef CONFIG_ARM_UNWIND
>  	ARM_UNWIND_SECTIONS
>  #endif
> @@ -143,6 +136,14 @@ SECTIONS
>  	__init_end = .;
>  
>  	_sdata = .;
> +
> +	. = ALIGN(4);
> +	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
> +		__start___ex_table = .;
> +		ARM_MMU_KEEP(*(__ex_table))
> +		__stop___ex_table = .;
> +	}
> +
>  	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
>  	_edata = .;

This example has undesirable security implications. It moves the
exception table out of the read-only mappings into the read-write
mappings, thereby providing a way for an attacker to bypass the
read-only protection on the kernel and manipulate code pointers at
potentially known addresses for distro built kernels.

> I agree there is a risk but I don't think it's high. It does not look like
> the minor changes in "reserved" reporting in /proc/iomem will break kexec
> tooling.

What makes you come to that conclusion? The kexec tools architecture
backends get to decide what they do when parsing /proc/iomem.
Currently, only firmware areas are marked reserved in /proc/iomem on
32-bit ARM.

This is read by kexec, and entered into its memory_range[] table as
either RAM, or RESERVED.

kexec uses this to search for a suitable hole in the memory map to
place the kernel in physical memory. The addition of what I will call
ficticious "reserved" areas by the host kernel because the host kernel
happened to use them _will_ have an impact on this.

They _are_ ficticious, because they are purely an artifact of the host
kernel being run, and are of no consequence to tooling such as kexec.
What such tooling is interested in is which areas it needs to avoid
because of firmware.

I think what isn't helping here is that you haven't adequately
described what your overall objective actually is. Framing it in
terms of wanting the reserved memory to be consistent between the
various kernel "interfaces" such as /proc/iomem, the memblock debugfs
and firmware is very ambiguous and open to different interpretations,
whcih I think is what the problem is here.

> Anyway the amount of reserved and free memory depends on a
> particular system, kernel version, configuration and command line.
> I have no intention to report kernel boot time reservations
> to /proc/iomem on architectures that do not report them there today,
> although this also does not seem like a significant factor.

You seem to be missing the point I've tried to make. The areas in
memblock that are marked "reserved" are the areas of reserved memory
from the firmware _plus_ the areas that the kernel has made during
boot which are of no consequence to userspace.

Wanting /proc/iomem, memblock and firmware to all agree on the values
that they mark as "reserved" is IMHO unrealistic.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
