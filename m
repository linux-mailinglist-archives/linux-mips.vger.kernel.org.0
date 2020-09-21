Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C5C273533
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgIUVxK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 17:53:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:49923 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgIUVxK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 17:53:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-0B; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A0D27C0FE4; Mon, 21 Sep 2020 22:41:03 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:41:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kexec: Add crashkernel=YM handling
Message-ID: <20200921204103.GK29322@alpha.franken.de>
References: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 19, 2020 at 09:55:46AM +0800, Youling Tang wrote:
> When the kernel crashkernel parameter is specified with just a size,
> we are supposed to allocate a region from RAM to store the crashkernel.
> However, MIPS merely reserves physical address zero with no checking
> that there is even RAM there.
> 
> Fix this by lifting similar code from x86, importing it to MIPS with the
> MIPS specific parameters added. In the absence of any platform specific
> information, we allocate the crashkernel region from the first 512MB of
> physical memory (limited to CKSEG0 or KSEG0 address range).
> 
> When X is not specified, crash_base defaults to 0 (crashkernel=YM@XM).
> 
> E.g. without this patch:
> 
> The environment as follows:
> [    0.000000] MIPS: machine is loongson,loongson64c-4core-ls7a
> ...
> [    0.000000] Kernel command line: root=/dev/sda2 crashkernel=96M ...
> 
> The warning as follows:
> [    0.000000] Invalid memory region reserved for crash kernel
> 
> And the iomem as follows:
> 00200000-0effffff : System RAM
>   00200000-00b47f87 : Kernel code
>   00b47f88-00dfffff : Kernel data
>   00e60000-01f73c7f : Kernel bss
> 1a000000-1bffffff : pci@1a000000
> ...
> 
> With this patch:
> 
> After increasing crash_base <= 0 handling.
> 
> And the iomem as follows:
> 00200000-0effffff : System RAM
>   00200000-00b47f87 : Kernel code
>   00b47f88-00dfffff : Kernel data
>   00e60000-01f73c7f : Kernel bss
>   04000000-09ffffff : Crash kernel
> 1a000000-1bffffff : pci@1a000000
> ...
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/mips/kernel/setup.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
