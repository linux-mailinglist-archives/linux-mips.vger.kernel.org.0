Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483322D274
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 01:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfE1XhR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 19:37:17 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:48476 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfE1XhR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 May 2019 19:37:17 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-68-2-nat.elisa-mobile.fi [85.76.68.2])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id 7D5E4B00BE;
        Wed, 29 May 2019 02:37:15 +0300 (EEST)
Date:   Wed, 29 May 2019 02:37:15 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: MIPS/CI20: BUG: Bad page state
Message-ID: <20190528233715.GB24195@darkstar.musicnaut.iki.fi>
References: <20190424182012.GA21072@darkstar.musicnaut.iki.fi>
 <20190424192922.ilnn3oxc7ryzhd3l@pburton-laptop>
 <20190424204055.GB21072@darkstar.musicnaut.iki.fi>
 <20190424205016.yqtrlygqojii2rs6@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424205016.yqtrlygqojii2rs6@pburton-laptop>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Apr 24, 2019 at 08:50:31PM +0000, Paul Burton wrote:
> On Wed, Apr 24, 2019 at 11:40:55PM +0300, Aaro Koskinen wrote:
> > On Wed, Apr 24, 2019 at 07:29:29PM +0000, Paul Burton wrote:
> > > On Wed, Apr 24, 2019 at 09:20:12PM +0300, Aaro Koskinen wrote:
> > > > I have been trying to get GCC bootstrap to pass on CI20 board, but it
> > > > seems to always crash. Today, I finally got around connecting the serial
> > > > console to see why, and it logged the below BUG.
> > > > 
> > > > I wonder if this is an actual bug, or is the hardware faulty?
> > > > 
> > > > FWIW, this is 32-bit board with 1 GB RAM. The rootfs is on MMC, as well
> > > > as 2 GB + 2 GB swap files.
> > > > 
> > > > Kernel config is at the end of the mail.
> > > 
> > > I'd bet on memory corruption, though not necessarily faulty hardware.
> > > 
> > > Unfortunately memory corruption on Ci20 boards isn't uncommon... Someone
> > > did make some tweaks to memory timings configured in the DDR controller
> > > which improved things for them a while ago:
> > > 
> > >   https://github.com/MIPS/CI20_u-boot/pull/18
> > > 
> > > Would you be up for testing with those tweaks? I'd be happy to help with
> > > updating U-Boot if needed.

I did some testing with CI20_u-boot ef995a1611f0, plus the timing fix
cherry picked. Didn't help, I still get random crashes (every time
different).

> > It's a purple one. Based on quick look all printings are identical to this
> > one:
> > https://images.anandtech.com/doci/8958/purple%20ci20_smaller_678x452.jpg
> 
> OK good to know - so it's a revision B board, which changed from Hynix
> to Samsung DDR:
> 
>   https://elinux.org/CI20_Hardware#Board_Revisions_and_changes
> 
> That's also the revision Gabriele who submitted the U-Boot pull request
> linked above has.

When checking the serial console with the original U-boot on NAND,
it prints:

	U-Boot SPL 2013.10-rc3-gb2e1fea (Dec 24 2014 - 10:24:52)
	SDRAM H5TQ2G83CFR initialization... done

That would suggest Hynix memory? But when checking the small print on
the chips, they clearly say K4B2G0846Q. The new U-Boot prints (for some
reason SPL printouts are missing):

	U-Boot 2013.10-rc3-g54c6a4817 (May 25 2019 - 14:37:07)

	Board: ci20 (r1) (Ingenic XBurst JZ4780 SoC)

So looks like both old and new U-boot are misdetecting the board as r1
board, and then probably using the wrong timings?

A.
