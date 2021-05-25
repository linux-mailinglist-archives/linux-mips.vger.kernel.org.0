Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F49A3902B6
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhEYNsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 09:48:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:48749 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233345AbhEYNsO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 May 2021 09:48:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1llXO3-00079x-03; Tue, 25 May 2021 15:46:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 59886C1109; Tue, 25 May 2021 15:40:39 +0200 (CEST)
Date:   Tue, 25 May 2021 15:40:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-mips@vger.kernel.org,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH] MIPS: launch.h: add include guard to prevent build errors
Message-ID: <20210525134039.GD11166@alpha.franken.de>
References: <20210521051343.20059-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521051343.20059-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 20, 2021 at 10:13:43PM -0700, Randy Dunlap wrote:
> arch/mips/include/asm/mips-boards/launch.h needs an include guard
> to prevent it from being #included more than once.
> Prevents these build errors:
> 
> In file included from ../arch/mips/mti-malta/malta-amon.c:16:
> ../arch/mips/include/asm/mips-boards/launch.h:8:8: error: redefinition of 'struct cpulaunch'
>     8 | struct cpulaunch {
>       |        ^~~~~~~~~
> In file included from ../arch/mips/include/asm/mips-cps.h:13,
>                  from ../arch/mips/include/asm/smp-ops.h:16,
>                  from ../arch/mips/include/asm/smp.h:21,
>                  from ../include/linux/smp.h:114,
>                  from ../arch/mips/mti-malta/malta-amon.c:12:
> ../arch/mips/include/asm/mips-boards/launch.h:8:8: note: originally defined here
>     8 | struct cpulaunch {
>       |        ^~~~~~~~~
> make[3]: [../scripts/Makefile.build:273: arch/mips/mti-malta/malta-amon.o] Error 1 (ignored)
> 
> Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-boards/launch.h |    5 +++++
>  1 file changed, 5 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
