Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC17203B8D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2020 17:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgFVPvR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jun 2020 11:51:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:33897 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729147AbgFVPvQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jun 2020 11:51:16 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jnOj4-0002AG-02; Mon, 22 Jun 2020 17:51:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3E785C06F0; Mon, 22 Jun 2020 17:48:55 +0200 (CEST)
Date:   Mon, 22 Jun 2020 17:48:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     maobibo <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Do not flush tlb when setting pmd entry
Message-ID: <20200622154855.GC17294@alpha.franken.de>
References: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
 <20200615101443.GA10075@alpha.franken.de>
 <4bef403d-baba-ddf8-c25c-3d6968897a53@loongson.cn>
 <20200617111403.GC9940@alpha.franken.de>
 <ea914a82-70c1-b9a3-f6f0-f92a6d6c6e7f@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea914a82-70c1-b9a3-f6f0-f92a6d6c6e7f@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 20, 2020 at 11:47:35AM +0800, maobibo wrote:
> 
> 
> On 06/17/2020 07:14 PM, Thomas Bogendoerfer wrote:
> > On Tue, Jun 16, 2020 at 06:34:21PM +0800, maobibo wrote:
> >>
> >>
> >> On 06/15/2020 06:14 PM, Thomas Bogendoerfer wrote:
> >>> On Wed, Jun 03, 2020 at 05:42:13PM +0800, Bibo Mao wrote:
> >>>> Function set_pmd_at is to set pmd entry, if tlb entry need to
> >>>> be flushed, there exists pmdp_huge_clear_flush alike function
> >>>> before set_pmd_at is called. So it is not necessary to call
> >>>> flush_tlb_all in this function.
> >>>
> >>> have you checked all set_pmd_at() calls ? I found a few case where
> >>> it's not clear to me, if tlb flushing is done... If you think this
> >>> is still the right thing to do, please change arch/mips/mm/pgtable-32.c
> >>> as well.
> >> well, I will double check this and do more testing about thp and hugepage.
> > 
> > I was more concerned about
> > 
> > fs/dax.c
> > fs/proc/task_mmu.c
> > mm/rmap.c
> 
> I think that flush_tlb_all should not be called in function set_pmd_at
> on mips platform. However update_mmu_cache_pmd() should be called __after__
> set_pmd_at() function to update tlb entry at some places, it is another issue.
> Here is my analysis in the three files where set_pmd_at is called.
> [..]

thank you for confirming that we are good with removing flush_tlb_all().

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
