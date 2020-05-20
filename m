Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D3A1DAEB0
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgETJ2c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 05:28:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:60182 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETJ2c (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 05:28:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jbL1a-0000ji-00; Wed, 20 May 2020 11:28:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AB680C014C; Wed, 20 May 2020 11:27:57 +0200 (CEST)
Date:   Wed, 20 May 2020 11:27:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: ingenic: Add missing include
Message-ID: <20200520092757.GA12701@alpha.franken.de>
References: <20200519212230.313365-1-paul@crapouillou.net>
 <20200520064520.GB7630@alpha.franken.de>
 <CAAdtpL4cZ4==07=kNJf6Xkhnzy6jiqgMc1XzG0NV6RZi1KqgXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL4cZ4==07=kNJf6Xkhnzy6jiqgMc1XzG0NV6RZi1KqgXA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 20, 2020 at 11:19:49AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On Wed, May 20, 2020 at 8:50 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, May 19, 2020 at 11:22:30PM +0200, Paul Cercueil wrote:
> > > Add missing include which adds the prototype to plat_time_init().
> > >
> > > Fixes: f932449c11da ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > ---
> > >  arch/mips/jz4740/setup.c | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > applied to mips-next.
> 
> Since mips-next is not merged, can you simply squash the fix to the
> incomplete f932449c11da please?

no, I don't rebase mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
