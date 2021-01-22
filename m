Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBAC301E4E
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 20:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbhAXTCh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 14:02:37 -0500
Received: from elvis.franken.de ([193.175.24.41]:36788 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbhAXTCf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 14:02:35 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l3kdz-0001qW-00; Sun, 24 Jan 2021 20:01:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C8D23C0BF1; Fri, 22 Jan 2021 14:05:55 +0100 (CET)
Date:   Fri, 22 Jan 2021 14:05:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: jazz: always allow little-endian builds
Message-ID: <20210122130555.GA10580@alpha.franken.de>
References: <20210122110307.934543-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122110307.934543-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 12:02:50PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The kernel test robot keeps reporting the same bug when it
> shows up in new files after random unrelated patches:
> 
> In file included from arch/mips/include/uapi/asm/byteorder.h:13,
>                  from arch/mips/include/asm/bitops.h:20,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/linux/clk.h:13,
>                  from drivers/base/regmap/regmap-mmio.c:7:
> include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
>     8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
>       |  ^~~~~~~
> drivers/base/regmap/regmap-mmio.c: In function 'regmap_mmio_gen_context':
> >> drivers/base/regmap/regmap-mmio.c:274:2: error: duplicate case value
>   274 |  case REGMAP_ENDIAN_NATIVE:
>       |  ^~~~
> drivers/base/regmap/regmap-mmio.c:246:2: note: previously used here
>   246 |  case REGMAP_ENDIAN_NATIVE:
> 
> The problem is that some randconfig builds end up on the MIPS jazz
> platform with neither CONFIG_CPU_BIG_ENDIAN nor CONFIG_CPU_LITTLE_ENDIAN
> because no specific machine is selected. As it turns out, all jazz
> machines support little-endian kernels, so this can simply be allowed
> globally.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> The configuration used by lkp here showed two other unrelated bugs,
> one of which I'm addressing in another patch. The one I'm not
> addressing is that 32-bit JAZZ with hugepages and 4K pages triggers
> BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)).
> ---
>  arch/mips/Kconfig      | 1 +
>  arch/mips/jazz/Kconfig | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
