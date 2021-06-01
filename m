Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1213974A8
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 15:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbhFAN4A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 09:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbhFAN4A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 09:56:00 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B468FC061574;
        Tue,  1 Jun 2021 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7XhK7llXjchxp+a7TIgBxmkimmZHUZAa+hOWlZXnwvg=; b=KncBS8kthwg3/xy/MOY43kE0h
        GeNUvPLx3dDFs6+dHwh1EQOBgZeQ5IT1d6n3R/Tb9lm/DMGylf0lUWUfHQgt2DqU57BKJrjGLuvI7
        /vG8ZR1O/gMBxZmdlgxD7Q/TaSqixgY9cAfRnSEnXeV0PUNFEG3eNEL+1XBwizX7EYHRMzqQ43K/N
        CZ1f/ezxnSUS0YZXKaQIkgAlYsa3pzKPIqcnNjV3ovUf2LlvfMC3e4VdVzEcyf/0G8HWTl+HqgSjn
        IlpWwBowpE8lGcsTYVuz8eRYavqP0MF5t6cOubxsRlbYL2kfbZW4Aswfj/WFcqA+RlCKRKpGB+Sza
        FTmWKOfNA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44578)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lo4qW-0004A2-Hm; Tue, 01 Jun 2021 14:54:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lo4qV-0000Al-MC; Tue, 01 Jun 2021 14:54:15 +0100
Date:   Tue, 1 Jun 2021 14:54:15 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 2/5] memblock: introduce generic
 memblock_setup_resources()
Message-ID: <20210601135415.GZ30436@shell.armlinux.org.uk>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531122959.23499-3-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 31, 2021 at 03:29:56PM +0300, Mike Rapoport wrote:
> +	code_resource.start = __pa_symbol(_text);
> +	code_resource.end = __pa_symbol(_etext)-1;
> +	rodata_resource.start = __pa_symbol(__start_rodata);
> +	rodata_resource.end = __pa_symbol(__end_rodata)-1;
> +	data_resource.start = __pa_symbol(_sdata);
> +	data_resource.end = __pa_symbol(_edata)-1;
> +	bss_resource.start = __pa_symbol(__bss_start);
> +	bss_resource.end = __pa_symbol(__bss_stop)-1;

This falls short on 32-bit ARM. The old code was:

-       kernel_code.start   = virt_to_phys(_text);
-       kernel_code.end     = virt_to_phys(__init_begin - 1);
-       kernel_data.start   = virt_to_phys(_sdata);                             
-       kernel_data.end     = virt_to_phys(_end - 1);                           

If I look at one of my kernels:

c0008000 T _text
c0b5b000 R __end_rodata
... exception and unwind tables live here ...
c0c00000 T __init_begin
c0e00000 D _sdata
c0e68870 D _edata
c0e68870 B __bss_start
c0e995d4 B __bss_stop
c0e995d4 B _end

So the original covers _text..__init_begin-1 which includes the
exception and unwind tables. Your version above omits these, which
leaves them exposed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
