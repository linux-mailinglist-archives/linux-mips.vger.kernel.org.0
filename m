Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7341E3B32
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 10:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbgE0IDb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 04:03:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:40852 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729052AbgE0IDb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 04:03:31 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdr1v-0007iQ-00; Wed, 27 May 2020 10:03:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 338BAC0458; Wed, 27 May 2020 09:10:46 +0200 (CEST)
Date:   Wed, 27 May 2020 09:10:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     maobibo <maobibo@loongson.cn>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 3/4] mm/memory.c: Add memory read privilege on page
 fault handling
Message-ID: <20200527071046.GA8600@alpha.franken.de>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
 <1590375160-6997-3-git-send-email-maobibo@loongson.cn>
 <20200525144413.8c13559ec87616aa2c77af41@linux-foundation.org>
 <4ca3c5b8-f695-c011-7e00-ef884a1c3d84@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ca3c5b8-f695-c011-7e00-ef884a1c3d84@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 09:05:41AM +0800, maobibo wrote:
> 
> 
> On 05/26/2020 05:44 AM, Andrew Morton wrote:
> > On Mon, 25 May 2020 10:52:39 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> > 
> >> Here add pte_sw_mkyoung function to make page readable on MIPS
> >> platform during page fault handling. This patch improves page
> >> fault latency about 10% on my MIPS machine with lmbench
> >> lat_pagefault case.
> >>
> >> It is noop function on other arches, there is no negative
> >> influence on those architectures.
> > 
> > Acked-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> > Should I take these, or would the mips tree be preferred?  I'm OK
> > either way, but probably the MIPS tree would be better?
> Thanks for reviewing again and again.
> This patch is based on mips-next, maybe MIPS tree will be better.

I'll take your next version then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
