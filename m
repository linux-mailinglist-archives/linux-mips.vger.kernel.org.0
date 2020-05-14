Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7791D2DF3
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 13:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgENLNd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 07:13:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:53225 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgENLNd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 07:13:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZBnu-000745-00; Thu, 14 May 2020 13:13:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5263AC0493; Thu, 14 May 2020 13:13:16 +0200 (CEST)
Date:   Thu, 14 May 2020 13:13:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] MIPS: Fix typos in arch/mips/Kbuild.platforms
Message-ID: <20200514111316.GA10639@alpha.franken.de>
References: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
 <20200513112101.GC7151@alpha.franken.de>
 <CAAhV-H4bsXyLmGH=pAism3R7Gup1fCMyAcE6fB+F=9cgS6uM-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4bsXyLmGH=pAism3R7Gup1fCMyAcE6fB+F=9cgS6uM-Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 01:52:14PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Wed, May 13, 2020 at 7:21 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Wed, May 13, 2020 at 04:38:40PM +0800, Huacai Chen wrote:
> > > Commit 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> > > misspelled "txx9" to "tx99", so fix it.
> > >
> > > Fixes: 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > ---
> > >  arch/mips/Kbuild.platforms | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > applied both patches to mips-next. Thank you for fixing.
> It seems like there are more problems caused by your patch, due to the
> lack of arch/mips/vr41xx/Makefile, all VR41XX configs cannot be build
> now, including:
> arch/mips/configs/workpad_defconfig
> arch/mips/configs/tb0219_defconfig
> arch/mips/configs/tb0287_defconfig
> arch/mips/configs/tb0226_defconfig
> arch/mips/configs/mpc30x_defconfig
> arch/mips/configs/capcella_defconfig
> arch/mips/configs/e55_defconfig
> 
> And I don't know how to fix...

adding a Makefile solves it ;-) I've sent a patch for that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
