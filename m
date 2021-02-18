Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE34731EA40
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 14:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBRNGA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 08:06:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:35489 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230375AbhBRLTl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Feb 2021 06:19:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lCh1t-0003dl-00; Thu, 18 Feb 2021 11:59:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5BF5AC01A0; Thu, 18 Feb 2021 11:57:10 +0100 (CET)
Date:   Thu, 18 Feb 2021 11:57:10 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Add basic support for ptrace single step
Message-ID: <20210218105710.GA5814@alpha.franken.de>
References: <1612939961-8827-1-git-send-email-yangtiezhu@loongson.cn>
 <20210211102905.GE7985@alpha.franken.de>
 <20210212163335.GA12558@alpha.franken.de>
 <alpine.DEB.2.21.2102161433520.1521@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102161433520.1521@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 16, 2021 at 02:55:36PM +0100, Maciej W. Rozycki wrote:
> On Fri, 12 Feb 2021, Thomas Bogendoerfer wrote:
> 
> > > IMHO ptrace single step is for CPUs supporting single stepping and not
> > > for emulating it in the kernel.
> > 
> > I've checked other arch how they implement single step, and looks like
> > I'm wrong. So I'm ok with applying your patch. Can you resend it again,
> > so I'll get the latest version in patchwork ?
> 
>  [..]
>  This is broken and belongs to the userland anyway.  See how complex the 
> handling is in GDB, specifically `mips16_next_pc', `micromips_next_pc' and 
> `mips32_next_pc' in gdb/mips-tdep.c.

I should have looked closer how other archs are implementing single
stepping. It's only alpha, which emulates it by setting breakpoints. All 
others have some type of cpu cupport for getting traps after a single
intstruction has been issued. So I'm reverting the commit and supporting
Maciej's statement about putting that stuff into userland (again).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
