Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8023EEB0
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 16:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgHGOIS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 10:08:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:37705 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgHGOCV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Aug 2020 10:02:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k42wu-0004yP-00; Fri, 07 Aug 2020 16:02:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F25D0C0C85; Fri,  7 Aug 2020 15:36:06 +0200 (CEST)
Date:   Fri, 7 Aug 2020 15:36:06 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200807133606.GA12704@alpha.franken.de>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 07, 2020 at 09:25:25PM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/8/7 21:13, Thomas Bogendoerfer 写道:
> >On Wed, Aug 05, 2020 at 09:51:44PM +0800, Jiaxun Yang wrote:
> >>>yes there is. Since this COP2 is a total black box to me, it would be
> >>>really helpfull to get some docs for it or at least some information what
> >>>it exactly does and how you want to use it in kernel code.
> >>FYI:
> >>Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 opcode
> >>to define some load & store instructions (e.g. 128bit load to two GPRs).
> >>
> >>I have a collection of these instructions here[1].
> >>
> >> From GS464E (3A2000+), execuating these instruction won't produce COP2
> >>unusable
> >>exception. But older Loongson cores (GS464) will still produce COP2
> >>exception, thus
> >>we should have CU2 enabled in kernel. That would allow us use to these
> >>instructions
> >>to optimize kernel.
> >thank you that makes things a little bit clearer.
> >
> >How will this be used in kernel code ? Special assembler routines or
> >by enabling gcc options ?
> 
> Via special assembly routines, as -msoft-float will disable generation of
> these instructions in GCC.
> 
> I knew Huacai have out-of-tree memcpy optimization and Xuerui have
> RAID5 optimiztion with these instructions.
> 
> >
> >>>And finally what I stil don't like is the splittering of more
> >>>#ifdef LOONGSON into common code. I'd prefer a more generic way
> >>>to enable COPx for in kernel usage. Maybe a more generic config option
> >>>or a dynamic solution like the one for user land.
> >>Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.
> >let's see whether this really is needed.
> >
> >To me it looks like the COP2 exception support for loongson makes
> >thing worse than it helps. How about the patch below ? There is still
> >a gap between starting the kernel and COP2 enabled for which I'm not
> >sure, if we are hitting COP2 instructions.
> 
> Yes, the exception does not really make sense.
> What's your opinion Huacai?
> 
> For in-kernel usage, we still have to enable it in genex.

you shouldn't need any other changes. ST0_CU2 will be set in
configure_status() and not touched after that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
