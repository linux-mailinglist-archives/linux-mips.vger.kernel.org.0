Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A508B45F61F
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 21:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhKZVCX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 16:02:23 -0500
Received: from elvis.franken.de ([193.175.24.41]:43837 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230477AbhKZVAX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Nov 2021 16:00:23 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mqiHJ-0000ZN-00; Fri, 26 Nov 2021 21:57:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5ECA0C2F82; Fri, 26 Nov 2021 18:37:07 +0100 (CET)
Date:   Fri, 26 Nov 2021 18:37:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software
 nodes
Message-ID: <20211126173707.GA13686@alpha.franken.de>
References: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
 <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
 <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
 <YaDx/MaMuajAEp1H@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaDx/MaMuajAEp1H@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 26, 2021 at 04:41:00PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 26, 2021 at 01:16:22PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Nov 26, 2021 at 11:58 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Nov 26, 2021 at 11:23 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> 
> ...
> 
> > Probably all of this can be removed, given the SPI controller driver
> > itself was removed in commit 74523a5dae0c96d6 ("spi: txx9: Remove
> > driver")?
> 
> Even better! Let Thomas speak on this.

let's remove it then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
