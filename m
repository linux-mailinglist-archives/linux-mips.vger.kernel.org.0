Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549B123E6D8
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 06:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbgHGEfF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 00:35:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbgHGEfF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Aug 2020 00:35:05 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49D0421744;
        Fri,  7 Aug 2020 04:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596774904;
        bh=5O8qOqoxu6cXV6n8s+ir2UAXTbHifSn0FzcatJDVJZQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=meBb48lXMEMvszs9mFfHQbw+SAFTZepacdQ+fAduyOqNB85rAk9a/6JjN0PkyK9WM
         +5vk+BkcGUxBrePySKzDt7STTIXfL5zVC/ZFqPxXFHPIzqXM7HfZkUablsN2WfTGXt
         Tliwrf0i2fUD7DZxJVi+7iMfjjLcOpKKVZyl2zhQ=
Date:   Thu, 6 Aug 2020 21:35:03 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm/huge_memory.c: update tlb entry if pmd is
 changed
Message-Id: <20200806213503.58f40af5f2dd99e386b0f6cb@linux-foundation.org>
In-Reply-To: <ad67e08e-9da8-6123-2c14-c197d22ee27a@linux.ibm.com>
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
        <1592990792-1923-2-git-send-email-maobibo@loongson.cn>
        <07f78e99-6e59-0bce-8ac0-50d7c7600461@oracle.com>
        <87lfkbl5gz.fsf@linux.ibm.com>
        <6071df89-1438-1a25-136d-228b8863364e@oracle.com>
        <ad67e08e-9da8-6123-2c14-c197d22ee27a@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 26 Jun 2020 13:43:06 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> On 6/25/20 10:16 PM, Mike Kravetz wrote:
> > On 6/25/20 5:01 AM, Aneesh Kumar K.V wrote:
> >> Mike Kravetz <mike.kravetz@oracle.com> writes:
> >>
> >>> On 6/24/20 2:26 AM, Bibo Mao wrote:
> >>>> When set_pmd_at is called in function do_huge_pmd_anonymous_page,
> >>>> new tlb entry can be added by software on MIPS platform.
> >>>>
> >>>> Here add update_mmu_cache_pmd when pmd entry is set, and
> >>>> update_mmu_cache_pmd is defined as empty excepts arc/mips platform.
> >>>> This patch has no negative effect on other platforms except arc/mips
> >>>> system.
> >>>
> >>> I am confused by this comment.  It appears that update_mmu_cache_pmd
> >>> is defined as non-empty on arc, mips, powerpc and sparc architectures.
> >>> Am I missing something?
> >>>
> >>> If those architectures do provide update_mmu_cache_pmd, then the previous
> >>> patch and this one now call update_mmu_cache_pmd with the actual faulting
> >>> address instead of the huge page aligned address.  This was intentional
> >>> for mips.  However, are there any potential issues on the other architectures?
> >>> I am no expert in any of those architectures.  arc looks like it could be
> >>> problematic as update_mmu_cache_pmd calls update_mmu_cache and then
> >>> operates on (address & PAGE_MASK).  That could now be different.
> >>>
> >>
> >> Also we added update_mmu_cache_pmd to update a THP entry. That could be
> >> different from a hugetlb entry on some architectures. If we need to do
> >> hugetlb equivalent for update_mmu_cache, we should add a different
> >> function.
> > 
> > I do not know the mips architecture well enough or if the motivation for
> > this patch was based on THP or hugetlb pages.  However, it will change
> > the address passed to update_mmu_cache_pmd from huge page aligned to the
> > actual faulting address.  Will such a change in the passed address impact
> > the powerpc update_mmu_cache_pmd routine?
> > 
> 
> Right now powerpc update_mmu_cache_pmd() is a dummy function. But I 
> agree we should audit arch to make sure such a change can work with 
> architectures. My comment was related to the fact that mmu cache update 
> w.r.t THP and hugetlb can be different on some platforms. So we may
> want to avoid using the same function for both.

So I'll assume that this patch is stalled until such an audit has taken
place?

