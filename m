Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996A63624E4
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbhDPQAv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 12:00:51 -0400
Received: from foss.arm.com ([217.140.110.172]:45096 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238227AbhDPQAf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 12:00:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95E3C11B3;
        Fri, 16 Apr 2021 09:00:10 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747443F99C;
        Fri, 16 Apr 2021 09:00:10 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 3E537683966; Fri, 16 Apr 2021 17:00:09 +0100 (BST)
Date:   Fri, 16 Apr 2021 17:00:09 +0100
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [PATCH v2 5/8] MIPS: pci-legacy: stop using
 of_pci_range_to_resource
Message-ID: <YHm0iXB/XubJcw5H@e110455-lin.cambridge.arm.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
 <20210414031240.313852-6-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210414031240.313852-6-ilya.lipnitskiy@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ilya,

On Tue, Apr 13, 2021 at 08:12:37PM -0700, Ilya Lipnitskiy wrote:
> Mirror commit aeba3731b150 ("powerpc/pci: Fix IO space breakage after
> of_pci_range_to_resource() change").
> 
> Most MIPS platforms do not define PCI_IOBASE, nor implement
> pci_address_to_pio(). Moreover, IO_SPACE_LIMIT is 0xffff for most MIPS
> platforms. of_pci_range_to_resource passes the _start address_ of the IO
> range into pci_address_to_pio, which then checks it against
> IO_SPACE_LIMIT and fails, because for MIPS platforms that use
> pci-legacy (pci-lantiq, pci-rt3883, pci-mt7620), IO ranges start much
> higher than 0xffff.

I think defining PCI_IOBASE and implementing pci_address_to_pio() would be
easier in the long run as you will then let the core PCI code do most of
the work, but given that this is legacy code I can understand that testing
it would not be simple.

> 
> In fact, pci-mt7621 in staging already works around this problem, see
> commit 09dd629eeabb ("staging: mt7621-pci: fix io space and properly set
> resource limits")
> 
> So just stop using of_pci_range_to_resource, which does not work for
> MIPS.
> 
> Fixes PCI errors like:
>   pci_bus 0000:00: root bus resource [io  0xffffffff]
> 
> Fixes: 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO resources")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> ---
>  arch/mips/pci/pci-legacy.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
> index 39052de915f3..3a909194284a 100644
> --- a/arch/mips/pci/pci-legacy.c
> +++ b/arch/mips/pci/pci-legacy.c
> @@ -166,8 +166,13 @@ void pci_load_of_ranges(struct pci_controller *hose, struct device_node *node)
>  			res = hose->mem_resource;
>  			break;
>  		}
> -		if (res != NULL)
> -			of_pci_range_to_resource(&range, node, res);
> +		if (res != NULL) {
> +			res->name = node->full_name;
> +			res->flags = range.flags;
> +			res->start = range.cpu_addr;
> +			res->end = range.cpu_addr + range.size - 1;
> +			res->parent = res->child = res->sibling = NULL;
> +		}

Change looks reasonable to me.
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  	}
>  }
>  
> -- 
> 2.31.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
