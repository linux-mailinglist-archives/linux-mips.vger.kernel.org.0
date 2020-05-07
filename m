Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0FD1C8768
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 12:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEGK6E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 06:58:04 -0400
Received: from elvis.franken.de ([193.175.24.41]:43501 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgEGK6E (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 06:58:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWeE6-0007du-00; Thu, 07 May 2020 12:58:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 12503C03B1; Thu,  7 May 2020 12:00:57 +0200 (CEST)
Date:   Thu, 7 May 2020 12:00:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ingenic: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Message-ID: <20200507100057.GA10965@alpha.franken.de>
References: <20200506090452.1290-1-geert+renesas@glider.be>
 <20200507084058.GA9624@alpha.franken.de>
 <CAMuHMdU=iZfBg9wkZ1JM_eLe8j-nVp0Q8761UM7p_UUEhuf1+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU=iZfBg9wkZ1JM_eLe8j-nVp0Q8761UM7p_UUEhuf1+w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 11:11:10AM +0200, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Thu, May 7, 2020 at 11:05 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > On Wed, May 06, 2020 at 11:04:52AM +0200, Geert Uytterhoeven wrote:
> > > The JZ4740 setup code is not a clock provider, and just needs to call
> > > of_clk_init().
> > >
> > > Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> > >
> > > Fixes: f932449c11dabb4b ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  arch/mips/jz4740/setup.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Does this need to go via mips-fixes ? Or is mips-next good enough ?
> 
> The commit fixed is not yet upstream, only in next, and the fix is
> non-critical.  It could even be merged into the original commit,
> depending on your rebase policy.

no rebase on mips-next. I've applied your patch to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
