Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9104D780
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfFTSTN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 14:19:13 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:38034 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfFTSTM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 14:19:12 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994574AbfFTSTIXLeUG (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Thu, 20 Jun 2019 20:19:08 +0200
Date:   Thu, 20 Jun 2019 19:19:08 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paul.burton@mips.com>
cc:     Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
In-Reply-To: <20190620174002.tgayzon7dc5d57fh@pburton-laptop>
Message-ID: <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org>
References: <20190614063341.1672-1-fancer.lancer@gmail.com> <20190620174002.tgayzon7dc5d57fh@pburton-laptop>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 20 Jun 2019, Paul Burton wrote:

> So this seems pretty reasonable. Build testing all our defconfigs only
> showed up one issue for decstation_defconfig & decstation_r4k_defconfig:
> 
>   drivers/net/fddi/defza.c: In function 'fza_reads':
>   drivers/net/fddi/defza.c:88:17: error: implicit declaration of
>     function 'readq_relaxed'; did you mean 'readw_relaxed'?
>     [-Werror=implicit-function-declaration]
>    #define readq_u readq_relaxed
>                    ^~~~~~~~~~~~~
>   drivers/net/fddi/defza.c:126:13: note: in expansion of macro 'readq_u'
>       *dst++ = readq_u(src++);
>                ^~~~~~~
>   drivers/net/fddi/defza.c: In function 'fza_writes':
>   drivers/net/fddi/defza.c:92:18: error: implicit declaration of
>     function 'writeq_relaxed'; did you mean 'writel_relaxed'?
>     [-Werror=implicit-function-declaration]
>    #define writeq_u writeq_relaxed
>                     ^~~~~~~~~~~~~~
>   drivers/net/fddi/defza.c:151:4: note: in expansion of macro 'writeq_u'
>       writeq_u(*src++, dst++);
>       ^~~~~~~~
>     CC      net/core/scm.o
>   cc1: some warnings being treated as errors
>   make[4]: *** [scripts/Makefile.build:279: drivers/net/fddi/defza.o] Error 1
> 
> These uses of readq_relaxed & writeq_relaxed are both conditional upon
> sizeof(unsigned long) == 8, ie. upon CONFIG_64BIT=y so they're not going
> to present a runtime issue but we need to provide some implementation of
> the *q accessors to keep the compiler happy.
> 
> I see a few options:
> 
> 1) We could just have defza.c include <io-64-nonatomic-lo-hi.h> to get
>    the appropriate declarations, which should then get optimized away by
>    the compiler anyway & never actually be used.

 This, definitely.

> 2) We could have defza.h #define its readq_u & writeq_u macros
>    differently for CONFIG_32BIT=y kernels, perhaps using
>    __compiletime_error to catch any bogus use of them.
> 
> 3) We could do the same in a generic header, though if nobody else has
>    needed it so far & this is the only place we need it then maybe it's
>    not worth it.
> 
> So I'm thinking option 2 might be best, as below. Having said that I
> don't mind option 1 either - it's simple. Maciej do you have any
> preference?

 The use of 64-bit operations to access option's packet memory, which is 
true SRAM, i.e. no side effects, is to improve throughput only and there's 
no need for atomicity here nor also any kind of barriers, except at the 
conclusion.  Splitting 64-bit accesses into 32-bit halves in software 
would not be a functional error here.

 I benchmarked it back in the day and the difference was noticeable with 
actual network transmissions between loops using 32-bit (LW/SW) and 64-bit 
(LD/SD) accesses respectively, though I may not be able to track down the 
figures anymore as it must have been some 18 years ago.  The performance 
of the MB ASIC used to interface the R4400 CPU to DRAM and TURBOchannel 
with the 5000/260 systems was stellar as it was specifically designed with 
high throughput in mind, as an upgrade to the exiting R3400-based 5000/240 
systems (the CPU and the ASIC are both on a daughtercard), though new such 
machines used to be sold as well.

 For the record the CPU and TURBOchannel run at 60MHz (40MHz with the 
R3400) and 25MHz respectively with these systems.

 Thanks for the heads-up!

  Maciej
