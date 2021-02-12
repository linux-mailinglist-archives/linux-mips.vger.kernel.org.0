Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC2231A61E
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 21:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhBLUhd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 15:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhBLUhc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 15:37:32 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88894C061574;
        Fri, 12 Feb 2021 12:36:52 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 83F339200BF; Fri, 12 Feb 2021 21:36:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7FCBB9200BC;
        Fri, 12 Feb 2021 21:36:49 +0100 (CET)
Date:   Fri, 12 Feb 2021 21:36:49 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] MIPS: Fix inline asm input/output type mismatch in
 checksum.h used with Clang
In-Reply-To: <20210127210757.GF21002@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2102122116230.35623@angie.orcam.me.uk>
References: <1611722507-12017-1-git-send-email-yangtiezhu@loongson.cn> <20210127210757.GF21002@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 Jan 2021, Thomas Bogendoerfer wrote:

> > Fix the following build error when make M=samples/bpf used with Clang:
> > 
> >   CLANG-bpf  samples/bpf/sockex2_kern.o
> > In file included from samples/bpf/sockex2_kern.c:7:
> > In file included from ./include/uapi/linux/if_tunnel.h:7:
> > In file included from ./include/linux/ip.h:16:
> > In file included from ./include/linux/skbuff.h:28:
> > In file included from ./include/net/checksum.h:22:
> > ./arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
> >         : "0" ((__force unsigned long)daddr),
> >                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 1 error generated.
> > 
> > This is a known issue on MIPS [1], the changed code can be compiled
> > successfully by both GCC and Clang.
> > 
> > [1] https://lore.kernel.org/linux-mips/CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com/
> > 
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/mips/include/asm/checksum.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> applied to mips-next.

 This is in a performance-critical path (otherwise it wouldn't have been 
in the form of inline assembly).  Has it been verified that it does not 
regress code quality with GCC?

 The semantics is clear here: output is in the same register as in input, 
but the register holds a different local variable in each case.  There's 
nothing odd about that and the variables can obviously be of a different 
type each; that's no different to register usage with code produced by the 
compiler directly itself from a high-level language.

 I seem to remember discussing the issue before, but I can't remember what 
the outcome has been WRT filing this as a Clang bug, and archives are not 
easily available at the moment (I know a mirror exists, but any old links 
are not relevant there).  Would someone be able to fill me in?

 I think ultimately with any critical piece where a Clang workaround does 
regress code produced with GCC we do want to go with `#ifdef __clang__' so 
that good use with GCC is not penalised on one hand and we know the places 
to revert changes at should Clang ever get fixed.

 Otherwise I'll start suspecting that Clang supporters try some kind of an 
unfair game to gain advantage over GCC, by modifying projects such that 
the competing compiler produces worse code than it could if Clang was not 
actively supported.

  Maciej
