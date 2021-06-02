Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9784F39861A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 12:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhFBKRM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 06:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFBKRK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Jun 2021 06:17:10 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44666C061574;
        Wed,  2 Jun 2021 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fmGY2nI0Vp6TsNVIwXBzebajJgSbQrncqCC+od0RbVA=; b=Bme3nUMcHhzLBe47U302hAVD7
        ncr3HnbXsgya5LaTfL5cUlqWe0l+aWayODB1FTdohKpCOvbRoQ9B5NnSQC1hUjNpypqjR1fN1PQQF
        EmLpbZonirz2e3YoyOSThY5E0lix2TkdHs3RvKZ0WGQcpvRJWo7jl7+Sd4pVhY9wMQGID428NDAfR
        tDLuzxegmwbAPhvf3aMw5EigGcS1DyMbXmGmpdGrXKm5On/nK+b3sKLInwrMzmYfvmfGD9qH1w87q
        T7nUNYMl8o6oRG4qxx6w4zkv0PQiQ1rzn5cCLH4uIl5EHEqyBrncopbDV0wF8U1cy2fU8CovyJrSN
        XzqrCiGYw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44608)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1loNuF-0000xC-Gl; Wed, 02 Jun 2021 11:15:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1loNuD-00011p-IK; Wed, 02 Jun 2021 11:15:21 +0100
Date:   Wed, 2 Jun 2021 11:15:21 +0100
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
Message-ID: <20210602101521.GD30436@shell.armlinux.org.uk>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLdCRoldZFYMZ0BG@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 11:33:10AM +0300, Mike Rapoport wrote:
> On Tue, Jun 01, 2021 at 02:54:15PM +0100, Russell King (Oracle) wrote:
> > On Mon, May 31, 2021 at 03:29:56PM +0300, Mike Rapoport wrote:
> > > +	code_resource.start = __pa_symbol(_text);
> > > +	code_resource.end = __pa_symbol(_etext)-1;
> > > +	rodata_resource.start = __pa_symbol(__start_rodata);
> > > +	rodata_resource.end = __pa_symbol(__end_rodata)-1;
> > > +	data_resource.start = __pa_symbol(_sdata);
> > > +	data_resource.end = __pa_symbol(_edata)-1;
> > > +	bss_resource.start = __pa_symbol(__bss_start);
> > > +	bss_resource.end = __pa_symbol(__bss_stop)-1;
> > 
> > This falls short on 32-bit ARM. The old code was:
> > 
> > -       kernel_code.start   = virt_to_phys(_text);
> > -       kernel_code.end     = virt_to_phys(__init_begin - 1);
> > -       kernel_data.start   = virt_to_phys(_sdata);                             
> > -       kernel_data.end     = virt_to_phys(_end - 1);                           
> > 
> > If I look at one of my kernels:
> > 
> > c0008000 T _text
> > c0b5b000 R __end_rodata
> > ... exception and unwind tables live here ...
> > c0c00000 T __init_begin
> > c0e00000 D _sdata
> > c0e68870 D _edata
> > c0e68870 B __bss_start
> > c0e995d4 B __bss_stop
> > c0e995d4 B _end
> > 
> > So the original covers _text..__init_begin-1 which includes the
> > exception and unwind tables. Your version above omits these, which
> > leaves them exposed.
> 
> Right, this needs to be fixed. Is there any reason the exception and unwind
> tables cannot be placed between _sdata and _edata? 
> 
> It seems to me that they were left outside for purely historical reasons.
> Commit ee951c630c5c ("ARM: 7568/1: Sort exception table at compile time")
> moved the exception tables out of .data section before _sdata existed.
> Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> _etext before the unwind tables and didn't bother to put them into data or
> rodata areas.

You can not assume that all sections will be between these symbols. This
isn't specific to 32-bit ARM. If you look at x86's vmlinux.lds.in, you
will see that BUG_TABLE and ORC_UNWIND_TABLE are after _edata, along
with many other undiscarded sections before __bss_start. So it seems
your assumptions in trying to clean this up are somewhat false.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
