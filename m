Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9733A3C5B
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 08:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhFKG5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 02:57:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhFKG5j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Jun 2021 02:57:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C88861364;
        Fri, 11 Jun 2021 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623394541;
        bh=nV7qhZxOMEfwQw+aPrIeJJ1lJqNt38ET7V3fCL6+jJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L8QGtg7aKsKhYsb1x7turV895A0qPbBa4TKKWrkvA/G4SBhePyGaiBBHFDC03kK4S
         26Bxhnpo7qVhvjYqob7RWnD0h1C50sOy9YgFgMAcEPIkRVv71JgXfInYyURypvwb2C
         uWp1UPUbjZerHWEHuPYf3AIic+2A2Th6vVF9ldRA=
Date:   Fri, 11 Jun 2021 08:55:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] serial: 8250: Mask out floating 16/32-bit bus bits
Message-ID: <YMMI6TtSm91JeZNJ@kroah.com>
References: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk>
 <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
 <CAHp75VeGn_wCLevAvD3iyykA73y+mh8k7pjQ2TY-9mt5cqEFWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeGn_wCLevAvD3iyykA73y+mh8k7pjQ2TY-9mt5cqEFWg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 11, 2021 at 09:40:31AM +0300, Andy Shevchenko wrote:
> On Thursday, June 10, 2021, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> 
> 
> Please, find the history group repository (Git.kernel.org) and use proper
> hash of the real commit.

There is no real need to do that, I'll just put a "cc: stable" in here
and it will go back as far as we currently maintain.

thanks,

greg k-h
