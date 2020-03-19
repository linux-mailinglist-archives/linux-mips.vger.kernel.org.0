Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7708318B38C
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2020 13:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgCSMhu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Mar 2020 08:37:50 -0400
Received: from elvis.franken.de ([193.175.24.41]:51024 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgCSMht (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Mar 2020 08:37:49 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jEuQl-0004K1-02; Thu, 19 Mar 2020 13:37:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 99554C026A; Thu, 19 Mar 2020 13:36:16 +0100 (CET)
Date:   Thu, 19 Mar 2020 13:36:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <syq@debian.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3] Use ELF_BASE_PLATFORM to pass ISA level
Message-ID: <20200319123616.GB10783@alpha.franken.de>
References: <20200307023945.191663-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307023945.191663-1-syq@debian.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 07, 2020 at 10:39:45AM +0800, YunQiang Su wrote:
> Some userland application/program runtime/dynamic loaded need to
> know about the current ISA level to use the best runtime.
> While kernel doesn't provides this info.
> 
> ELF_PLATFORM only provides some info about the CPU, with very few info,
> for example, the value is "mips" for both 24Kc and P6600.
> 
> Currently ELF_BASE_PLATFORM is not used by MIPS (only by powerpc).
> So we cant set its value as:
>   mips2, mips3, mips4, mips5,
>   mips32, mips32r2, mips32r6
>   mips64, mips64r2, mips64r6
> Then in userland, we can get it by:
>   getauxval(AT_BASE_PLATFORM)
> 
> The only problem is that it seems has different defination than ppc:
>   on ppc, it is the mircoarchitecture
> while now we use it as ISA level on MIPS.
> 
> v2->v3:
>   no need to init static data with 0.
> v1->v2:
>   add Signed-off-by and Reviewer-by Jiaxun Yang.
> 
> Signed-off-by: YunQiang Su <syq@debian.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---

Applied to mips-next. BTW I prefer to have the changelog below the ---

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
