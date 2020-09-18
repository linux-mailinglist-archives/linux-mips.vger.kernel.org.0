Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E66270008
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 16:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgIROlH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 10:41:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:44637 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIROlH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 10:41:07 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJHZL-0002r7-01; Fri, 18 Sep 2020 16:40:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 62FEBC0FE0; Fri, 18 Sep 2020 16:40:36 +0200 (CEST)
Date:   Fri, 18 Sep 2020 16:40:36 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/15] MIPS: Convert Ingenic to a generic board v3
Message-ID: <20200918144036.GA21654@alpha.franken.de>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 06, 2020 at 09:29:20PM +0200, Paul Cercueil wrote:
> Hi Thomas, list,
> 
> Here's a V3 of my patchset that updates the old jz4740 platform code to
> work with the generic MIPS board code base.
> 
> Noteworthy changes since V2:
> - Patch [01/15] is a fix to the LB60's defconfig, which expected a
>   symbol to be the default value of an enum, but the default changed in
>   kernel 5.7.
> 
> - Patch [11/15] has been modified to address the issue with
>   cpu-feature-overrides.h being dropped. Now, The Ingenic-specific
>   version of the file will be used when building a Ingenic-only kernel,
>   otherwise the generic dummy one will be used.
> 
> - Patch [13/15] is new, instead of doing code removal + rename in one
>   patch in v2, we now do code removal in patch [12/15] and rename in
>   [13/15]. It makes more sense to split since we have more files/folders
>   (as we keep the cpu-feature-overrides.h header around).
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (15):
>   MIPS: configs: lb60: Fix defconfig not selecting correct board
>   MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
>   MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
>   MIPS: cpu-probe: ingenic: Fix broken BUG_ON
>   MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
>   MIPS: generic: Allow boards to set system type
>   MIPS: generic: Init command line with fw_init_cmdline()
>   MIPS: generic: Support booting with built-in or appended DTB
>   MIPS: generic: Add support for zboot
>   MIPS: generic: Increase NR_IRQS to 256
>   MIPS: generic: Add support for Ingenic SoCs
>   MIPS: jz4740: Drop all obsolete files
>   MIPS: jz4740: Rename jz4740 folders to ingenic
>   MIPS: configs: Regenerate configs of Ingenic boards
>   MAINTAINERS: Update paths to Ingenic platform code
> 
>  MAINTAINERS                                   |   5 +-
>  arch/mips/Kbuild.platforms                    |   1 -
>  arch/mips/Kconfig                             |  43 ++++--
>  arch/mips/configs/ci20_defconfig              |   4 +-
>  arch/mips/configs/cu1000-neo_defconfig        |  15 +-
>  arch/mips/configs/cu1830-neo_defconfig        |  15 +-
>  arch/mips/configs/gcw0_defconfig              |   2 +-
>  arch/mips/configs/qi_lb60_defconfig           |   7 +-
>  arch/mips/configs/rs90_defconfig              |   4 +-
>  arch/mips/generic/Kconfig                     |   8 +-
>  arch/mips/generic/Makefile                    |   1 +
>  arch/mips/generic/Platform                    |   4 +
>  arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
>  arch/mips/generic/init.c                      |  11 +-
>  arch/mips/generic/proc.c                      |   5 +
>  arch/mips/include/asm/mach-generic/irq.h      |   2 +-
>  .../cpu-feature-overrides.h                   |   0
>  arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
>  arch/mips/include/asm/pgtable-bits.h          |   5 -
>  arch/mips/{jz4740 => ingenic}/Kconfig         |  16 +-
>  arch/mips/jz4740/Makefile                     |   9 --
>  arch/mips/jz4740/Platform                     |   3 -
>  arch/mips/jz4740/setup.c                      | 145 ------------------
>  arch/mips/kernel/cpu-probe.c                  |   8 +-
>  24 files changed, 191 insertions(+), 243 deletions(-)
>  create mode 100644 arch/mips/generic/board-ingenic.c
>  rename arch/mips/include/asm/{mach-jz4740 => mach-ingenic}/cpu-feature-overrides.h (100%)
>  delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
>  rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
>  delete mode 100644 arch/mips/jz4740/Makefile
>  delete mode 100644 arch/mips/jz4740/Platform
>  delete mode 100644 arch/mips/jz4740/setup.c

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
