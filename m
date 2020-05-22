Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252971DE0F9
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgEVHbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:31:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:34137 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728312AbgEVHbF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 03:31:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jc28x-0003HE-02; Fri, 22 May 2020 09:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EFB62C015D; Fri, 22 May 2020 09:28:18 +0200 (CEST)
Date:   Fri, 22 May 2020 09:28:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Paul Burton <paulburton@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/13] mips: Fix cpu_has_mips64r1/2 activation for
 MIPS32 CPUs
Message-ID: <20200522072818.GC7331@alpha.franken.de>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
 <20200521140725.29571-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521140725.29571-6-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 05:07:16PM +0300, Serge Semin wrote:
> Commit 1aeba347b3a9 ("MIPS: Hardcode cpu_has_mips* where target ISA
> allows") updated the cpu_has_mips* macro to be replaced with a constant
> expression where it's possible. By mistake it wasn't done correctly
> for cpu_has_mips64r1/cpu_has_mips64r2 macro. They are defined to
> be replaced with conditional expression __isa_range_or_flag(), which
> means either ISA revision being within the range or the corresponding
> CPU options flag was set at the probe stage or both being true at the
> same time. But the ISA level value doesn't indicate whether the ISA is
> MIPS32 or MIPS64. Due to this if we select MIPS32r1 - MIPS32r5
> architectures the __isa_range() macro will activate the
> cpu_has_mips64rX flags, which is incorrect. In order to fix the
> problem we make sure the 64bits CPU support is enabled by means of
> checking the flag cpu_has_64bits aside with proper ISA range and specific
> Revision flag being set.
> 
> Fixes: 1aeba347b3a9 ("MIPS: Hardcode cpu_has_mips* where target ISA allows")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  arch/mips/include/asm/cpu-features.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
