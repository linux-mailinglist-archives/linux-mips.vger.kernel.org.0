Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975413C69E0
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jul 2021 07:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhGMFtB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 01:49:01 -0400
Received: from verein.lst.de ([213.95.11.211]:57348 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhGMFtA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Jul 2021 01:49:00 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6DA2F67373; Tue, 13 Jul 2021 07:46:06 +0200 (CEST)
Date:   Tue, 13 Jul 2021 07:46:06 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: flush_kernel_dcache_page fixes and removal
Message-ID: <20210713054606.GA6036@lst.de>
References: <20210712060928.4161649-1-hch@lst.de> <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 12, 2021 at 12:24:11PM -0700, Linus Torvalds wrote:
> I think architectures that have virtual caches might want to think
> about this patch a bit more, but on the whole I can't argue against
> the "it's badly documented and misused".
> 
> No sane architecture will care, since dcache will be coherent (there
> are more issues on the I$ side, but that's a different issue)

Yeah.  Once the arch maintainers look it it it might be worth to check
if there is optimization potential for pages that are not in highmem
and not in the page cache, as most architectures should be able to
just do nothing in that case.

Either way, I think getting patches 1-4 into 5.14 as bug fixes would
be useful, 6 is a trivial cleanup and 5 is something we can chew on
for a bit.
