Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E52C3B4C6D
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jun 2021 06:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhFZEOn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Jun 2021 00:14:43 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:60080 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFZEOm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Jun 2021 00:14:42 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EE0AD92009C; Sat, 26 Jun 2021 06:12:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E80E592009B;
        Sat, 26 Jun 2021 06:12:19 +0200 (CEST)
Date:   Sat, 26 Jun 2021 06:12:19 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] serial: 8250: Mask out floating 16/32-bit bus bits
In-Reply-To: <YMMI6TtSm91JeZNJ@kroah.com>
Message-ID: <alpine.DEB.2.21.2106260513010.37803@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk> <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk> <CAHp75VeGn_wCLevAvD3iyykA73y+mh8k7pjQ2TY-9mt5cqEFWg@mail.gmail.com> <YMMI6TtSm91JeZNJ@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 11 Jun 2021, Greg Kroah-Hartman wrote:

> On Fri, Jun 11, 2021 at 09:40:31AM +0300, Andy Shevchenko wrote:
> > > Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> > 
> > 
> > Please, find the history group repository (Git.kernel.org) and use proper
> > hash of the real commit.

 Thanks for making me aware of that repo, it can be helpful.

> There is no real need to do that, I'll just put a "cc: stable" in here
> and it will go back as far as we currently maintain.

 I've posted v2 then, with Jiri's concern addressed and a "cc: stable" 
annotation.  Originally I didn't think this series is worth backporting, 
but if you'd rather do so, then of course I'm fine with that.

  Maciej
