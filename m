Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A99046DE03
	for <lists+linux-mips@lfdr.de>; Wed,  8 Dec 2021 23:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhLHWMD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Dec 2021 17:12:03 -0500
Received: from elvis.franken.de ([193.175.24.41]:37076 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229604AbhLHWMD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Dec 2021 17:12:03 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mv56s-0006Wu-00; Wed, 08 Dec 2021 23:08:22 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C6F57C4E05; Wed,  8 Dec 2021 23:07:59 +0100 (CET)
Date:   Wed, 8 Dec 2021 23:07:59 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software
 nodes
Message-ID: <20211208220759.GA6406@alpha.franken.de>
References: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
 <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
 <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
 <20211129122052.GA7921@alpha.franken.de>
 <CAMuHMdWbvpzZCs4HOXErbVYQTiQAB0syuiR6Wd7=sTA2vFpXzw@mail.gmail.com>
 <YbDtiC5CJJGSL/9C@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbDtiC5CJJGSL/9C@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 08, 2021 at 07:38:16PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 29, 2021 at 01:30:17PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 29, 2021 at 1:21 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > > On Fri, Nov 26, 2021 at 01:16:22PM +0100, Geert Uytterhoeven wrote:
> 
> ...
> 
> > > are you ok with completly removing rbtx4938 support ? Can I rbtx4939
> > > board support, too ?
> > 
> > Fine for me, I only have rbtx4927.
> 
> Is there any news? I still see my patch well applied against latest Linux Next.
> If the removal is going to be postponed, consider applying this patch then. So
> we may move forward.

https://lore.kernel.org/all/20211130164558.85584-1-tsbogend@alpha.franken.de/

The second patch in that series touches drivers/mtd so I'm waiting for
a Acked-by. But I could apply the first patch...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
