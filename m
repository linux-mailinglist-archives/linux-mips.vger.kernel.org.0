Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1DD2BAB77
	for <lists+linux-mips@lfdr.de>; Fri, 20 Nov 2020 14:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgKTNnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Nov 2020 08:43:10 -0500
Received: from elvis.franken.de ([193.175.24.41]:45254 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgKTNnK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 20 Nov 2020 08:43:10 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kg6gt-0005PV-00; Fri, 20 Nov 2020 14:43:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3A2F7C0259; Fri, 20 Nov 2020 14:41:23 +0100 (CET)
Date:   Fri, 20 Nov 2020 14:41:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
Subject: Re: linux-next: Tree for Nov 20
Message-ID: <20201120134123.GA10351@alpha.franken.de>
References: <20201120165614.0830df43@canb.auug.org.au>
 <CADVatmPzUv4zzzHJx23rFJgop1dHZrr7ReVoh48+Q5NAOkhzXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVatmPzUv4zzzHJx23rFJgop1dHZrr7ReVoh48+Q5NAOkhzXA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 20, 2020 at 11:57:07AM +0000, Sudip Mukherjee wrote:
> Hi,
> 
> On Fri, Nov 20, 2020 at 5:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Changes since 20201119:
> 
> mips allmodconfig fails for next-20201120 with the error:
> /home/sudip/linux/drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_mmap':
> /home/sudip/linux/drivers/video/fbdev/udlfb.c:343:52: error:
> 'PAGE_SHARED' undeclared (first use in this function)
>   343 |   if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
> 
> Which has been caused by 0df162e1377a ("MIPS: mm: Clean up setup of
> protection map") which removed "PAGE_SHARED".

I'm working on it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
