Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E972AAB07
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 20:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388941AbfIESct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 14:32:49 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:36980 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730223AbfIESct (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 14:32:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 1D35E3FBD3;
        Thu,  5 Sep 2019 20:32:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Cgg9MphdKKTb; Thu,  5 Sep 2019 20:32:46 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A9A573F7C7;
        Thu,  5 Sep 2019 20:32:45 +0200 (CEST)
Date:   Thu, 5 Sep 2019 20:32:45 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: Re: [PATCH 000/120] Linux for the PlayStation 2
Message-ID: <20190905183245.GA3981@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <20190904141026.hwzibvauis5sizq6@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904141026.hwzibvauis5sizq6@pburton-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> Wow - you've been busy, this patchset is huge!

I started in 2017 with a 2.6.35.14 patchset[1] maintained by Jürgen Urban,
and ported it through 3.x, 4.x and 5.x to present day. The history goes
back to 2.2.1[2] when Sony released a Linux kit.

Maciej W. Rozycki and Jürgen Urban have been very helpful along the way.

Most of the drivers in the 2.6 series are not present in this initial
patchset. It is supposed to be fairly small, after all. Most of the other
parts from 2.6 were eventually removed, reworked or expanded.

For example, the 2.6 kernel uses BIOS routines for certain services. The
BIOS is discarded and the kernel handles the hardware directly in this
patchset. Arbitrary video mode lines are now supported. The 2.6 kernel
supported n32, and 128-bit GPRs, but this patchset supports only o32,
and only 32-bit GPRs although I very much hope we can retain the support
for 128-bit GPRs, as suggested in the patchset cover letter, as that is
a defining feature of the R5900.

The input/output processor (IOP) modules, handled as firmware by the
kernel, have also been reworked and updated for a modern compiler[3].

Some ideas and discussions on further development etc. can be found here:

https://github.com/frno7/linux/issues

> I think we may be best to split this up into 8 (or more) different
> patchsets along these lines. In my experience large patchsets that touch
> lots of different subsystems are very difficult to get merged, so I'd
> suggest maybe we start with just the CPU support for arch/mips/ & if you
> have the bandwidth you could submit drivers to other subsystem
> maintainers in parallel.

Sure!

> I see you already got a few comments including on some of the early
> CPU-related patches. I'll start looking through them in detail soon.

Great, thanks!

Fredrik

References:

[1] https://github.com/frno7/linux/tree/ps2-v2.6.35.14

[2] https://github.com/frno7/linux/tree/ps2-v2.2.1

[3] https://github.com/frno7/iopmod
