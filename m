Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55796273B61
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 09:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgIVHEd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 03:04:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:50708 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729168AbgIVHEc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 03:04:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKcLl-00061j-00; Tue, 22 Sep 2020 09:04:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3A71DC0FE4; Tue, 22 Sep 2020 09:03:56 +0200 (CEST)
Date:   Tue, 22 Sep 2020 09:03:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Pei Huang <huangpei@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson-3: Fix fp register access if MSA enabled
Message-ID: <20200922070356.GA6275@alpha.franken.de>
References: <1598255043-11839-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H7hzoO6OfunBZ4R0dUDRNX=jyjhdurV6VdGhdtXZ4Mj5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7hzoO6OfunBZ4R0dUDRNX=jyjhdurV6VdGhdtXZ4Mj5g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 22, 2020 at 10:06:24AM +0800, Huacai Chen wrote:
> On Mon, Aug 24, 2020 at 3:40 PM Huacai Chen <chenhc@lemote.com> wrote:
> >
> > If MSA is enabled, FPU_REG_WIDTH is 128 rather than 64, then get_fpr64()
> > /set_fpr64() in the original unaligned instruction emulation code access
> > the wrong fp registers. This is because the current code doesn't specify
> > the correct index field, so fix it.
> >
> > Fixes: f83e4f9896eff614d0f2547a ("MIPS: Loongson-3: Add some unaligned instructions emulation")
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Signed-off-by: Pei Huang <huangpei@loongson.cn>
> > ---
> >  arch/mips/loongson64/cop2-ex.c | 24 ++++++++----------------
> >  1 file changed, 8 insertions(+), 16 deletions(-)

should this go via mips-fixes ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
