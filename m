Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164833056E
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2019 01:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfE3XXI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 May 2019 19:23:08 -0400
Received: from emh01.mail.saunalahti.fi ([62.142.5.107]:49166 "EHLO
        emh01.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3XXI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 May 2019 19:23:08 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-68-2-nat.elisa-mobile.fi [85.76.68.2])
        by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 6CF7D20013;
        Fri, 31 May 2019 02:23:05 +0300 (EEST)
Date:   Fri, 31 May 2019 02:23:05 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: MIPS/CI20: BUG: Bad page state
Message-ID: <20190530232305.GB4285@darkstar.musicnaut.iki.fi>
References: <20190424182012.GA21072@darkstar.musicnaut.iki.fi>
 <20190424192922.ilnn3oxc7ryzhd3l@pburton-laptop>
 <20190424204055.GB21072@darkstar.musicnaut.iki.fi>
 <20190424205016.yqtrlygqojii2rs6@pburton-laptop>
 <20190528233715.GB24195@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528233715.GB24195@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, May 29, 2019 at 02:37:15AM +0300, Aaro Koskinen wrote:
> On Wed, Apr 24, 2019 at 08:50:31PM +0000, Paul Burton wrote:
> > On Wed, Apr 24, 2019 at 11:40:55PM +0300, Aaro Koskinen wrote:
> > > On Wed, Apr 24, 2019 at 07:29:29PM +0000, Paul Burton wrote:
> > > > On Wed, Apr 24, 2019 at 09:20:12PM +0300, Aaro Koskinen wrote:
> > > > > I have been trying to get GCC bootstrap to pass on CI20 board, but it
> > > > > seems to always crash. Today, I finally got around connecting the serial
> > > > > console to see why, and it logged the below BUG.
> > > > > 
> > > > > I wonder if this is an actual bug, or is the hardware faulty?
> > > > > 
> > > > > FWIW, this is 32-bit board with 1 GB RAM. The rootfs is on MMC, as well
> > > > > as 2 GB + 2 GB swap files.
> > > > > 
> > > > > Kernel config is at the end of the mail.
> > > > 
> > > > I'd bet on memory corruption, though not necessarily faulty hardware.
> > > > 
> > > > Unfortunately memory corruption on Ci20 boards isn't uncommon... Someone
> > > > did make some tweaks to memory timings configured in the DDR controller
> > > > which improved things for them a while ago:
> > > > 
> > > >   https://github.com/MIPS/CI20_u-boot/pull/18
> > > > 
> > > > Would you be up for testing with those tweaks? I'd be happy to help with
> > > > updating U-Boot if needed.
> 
> I did some testing with CI20_u-boot ef995a1611f0, plus the timing fix
> cherry picked. Didn't help, I still get random crashes (every time
> different).

I have now ran memtester with 900M allocation for 10 hours (around 10
loops), then with two processes using 450M allocation each for 24 hours
(some 20 loops or so), and no errors or other issues are encountered.
I would guess if the timings were wrong, memtester would have failed
by now?

When trying GCC bootstrap the systems fails reliably... Usually within
few hours, but sometimes even within 30 minutes.

Maybe the issue is not memory/hardware. Since I build, and have also
swap, on MMC/SDcard perhaps we have some buggy code in the MMC or DMA
driver that results in memory corruption?

A.
