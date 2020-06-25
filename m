Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF226209C5F
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 11:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390002AbgFYJ7n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 05:59:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:37041 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388485AbgFYJ7n (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Jun 2020 05:59:43 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1joOfV-0001nc-00; Thu, 25 Jun 2020 11:59:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1DCD5C0708; Thu, 25 Jun 2020 11:40:59 +0200 (CEST)
Date:   Thu, 25 Jun 2020 11:40:59 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mips-next 0/3] MIPS: fix the two most annoying sparse
 floods
Message-ID: <20200625094059.GA7660@alpha.franken.de>
References: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 20, 2020 at 09:33:38AM +0000, Alexander Lobakin wrote:
> This set addresses the two most annoying sparse floods when building the
> tree with C={1,2}: one in asm/io.h (in several mangle-port.h actually),
> and one in asm/checksum.h.
> Both of these comes from lack of forced typecasting and hence harmless,
> but complicates real bug hunting, as asm/io.h is included in almost
> every driver, while asm/checksum.h is included in lots of networking
> code.
> 
> I also fixed two wrong __mem_ioswabq() macros while was nearby.
> Tested on Generic MIPS platform -- no more flooding in console (there's
> one more source in mips-cm.h, but it's included in just a few files, so
> not a real problem. It can be issued separately anyway), while objdump
> doesn't see any difference at all.
> 
> Alexander Lobakin (3):
>   MIPS: generic/ip32: io: fix __mem_ioswabq()
>   MIPS: io: fix sparse flood on asm/io.h
>   MIPS: checksum: fix sparse flooding on asm/checksum.h
> 
>  arch/mips/include/asm/checksum.h                     |  4 ++--
>  .../include/asm/mach-cavium-octeon/mangle-port.h     | 12 +++++++++---
>  arch/mips/include/asm/mach-generic/mangle-port.h     | 12 ++++++------
>  arch/mips/include/asm/mach-ip27/mangle-port.h        |  6 +++---
>  arch/mips/include/asm/mach-ip30/mangle-port.h        |  6 +++---
>  arch/mips/include/asm/mach-ip32/mangle-port.h        |  6 +++---
>  arch/mips/include/asm/mach-tx39xx/mangle-port.h      |  6 +++---
>  arch/mips/include/asm/mach-tx49xx/mangle-port.h      |  6 +++---
>  8 files changed, 32 insertions(+), 26 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
