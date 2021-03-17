Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC2833F4B2
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 16:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhCQPyg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 11:54:36 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37762 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhCQPyF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 11:54:05 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id E4ADF92009C; Wed, 17 Mar 2021 16:35:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id D98DE92009B;
        Wed, 17 Mar 2021 16:35:36 +0100 (CET)
Date:   Wed, 17 Mar 2021 16:35:36 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     David Laight <David.Laight@ACULAB.COM>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
In-Reply-To: <5ee86b3b-81d2-790c-f67b-e250f60272fd@loongson.cn>
Message-ID: <alpine.DEB.2.21.2103171541590.21463@angie.orcam.me.uk>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn> <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk> <bdfe753d-0ef2-8f66-7716-acadfc3917a5@loongson.cn> <913665e71fd44c5d810d006cd179725c@AcuMS.aculab.com>
 <5ee86b3b-81d2-790c-f67b-e250f60272fd@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Mar 2021, Tiezhu Yang wrote:

> > > The code produced by GCC remains the same between (1), (3) and (4),
> > > the last changes looks like better (with less changes based on commit
> > > 198688edbf77), so I will send v3 later.
> > Aren't those all the same - apart from register selection.

 I did a quick size check with my MIPS64 config between (1) and (2):

       text       data        bss      total filename
-   6129704    2997475     215280    9342459 vmlinux
+   6129752    2997475     215280    9342507 vmlinux

so obviously there's more to that and the code snippets quoted did not 
show the full picture.  The size difference is in `tcp_v4_send_reset' 
AFAICT, maybe elsewhere as well.

 FAOD the former binary is as at 198688edbf77^ and the latter is as at 
198688edbf77, and the command used was `size --format=gnu' to prevent 
`.rodata' from interfering with the text size.

> > Not that I grok the mips opcodes.
> > But that code has horridness on its side.

 It's a 32-bit one's-complement addition.  The use of 64-bit operations 
reduces the number of calculations as any 32-bit carries accumulate in the 
high 32-bit word allowing one instruction to be saved total compared to 
the 32-bit variant.  Nothing particularly unusual for me here; I've seen 
worse stuff with x86.

> Is this patch necessary? If no, we can ignore it.
> If yes, I will send v3 with the above (4) changes.

 I have also verified this patch directly on top of 198688edbf77 and it 
does not bring the old `vmlinux' size back (there's no difference in code 
produced at all here actually), so you need to investigate this further.  
This is with an older checkout of GCC 11.

 I've attached a stripped version of my .config that you can use for 
reference.

  Maciej
