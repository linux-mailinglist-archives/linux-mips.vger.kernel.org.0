Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCE523D18B
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 22:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgHEUCW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 16:02:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:35621 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbgHEQii (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Aug 2020 12:38:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k3IFd-0001jV-00; Wed, 05 Aug 2020 14:10:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 821FEC0C25; Wed,  5 Aug 2020 14:10:21 +0200 (CEST)
Date:   Wed, 5 Aug 2020 14:10:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200805121021.GA12598@alpha.franken.de>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 01, 2020 at 03:59:41PM +0800, Huacai Chen wrote:
> On Wed, May 6, 2020 at 1:30 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > 于 2020年5月2日 GMT+08:00 下午12:55:43, Huacai Chen <chenhc@lemote.com> 写到:
> > >Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
> > >mode by default. However, gslq/gssq (16-bytes load/store instructions)
> > >overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
> > >gssq for optimization in kernel, we should enable COP2 usage in kernel.
> > >
> > >Please pay attention that in this patch we only enable COP2 in kernel,
> > >which means it will lose ST0_CU2 when a process go to user space (try
> > >to use COP2 in user space will trigger an exception and then grab COP2,
> > >which is similar to FPU). And as a result, we need to modify the context
> > >switching code because the new scheduled process doesn't contain ST0_CU2
> > >in its THERAD_STATUS probably.
> > >
> > >Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >
> > Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> Does this patch have some unresolved problems, or there is something unclear?

yes there is. Since this COP2 is a total black box to me, it would be
really helpfull to get some docs for it or at least some information what
it exactly does and how you want to use it in kernel code.

Looking closer at the patch I realized, that there is already support
for usage of COP2 in user land, which I thought isn't the case (at least
I understood that from one of your mails). So is there enough state
saving to support this ?

And finally what I stil don't like is the splittering of more
#ifdef LOONGSON into common code. I'd prefer a more generic way
to enable COPx for in kernel usage. Maybe a more generic config option
or a dynamic solution like the one for user land.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
