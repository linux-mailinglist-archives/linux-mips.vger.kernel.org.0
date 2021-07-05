Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0793BBEA6
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 17:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhGEPMK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 11:12:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:41765 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231640AbhGEPMK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Jul 2021 11:12:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m0QDu-0001Ke-00; Mon, 05 Jul 2021 17:09:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B871EC07D6; Mon,  5 Jul 2021 17:08:23 +0200 (CEST)
Date:   Mon, 5 Jul 2021 17:08:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Xingxing Su <suxingxing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alban Bedel <albeu@free.fr>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: always link byteswap helpers into decompressor
Message-ID: <20210705150823.GA12584@alpha.franken.de>
References: <20210702142919.392532-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702142919.392532-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 02, 2021 at 04:28:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> My series to clean up the unaligned access implementation
> across architectures caused some mips randconfig builds to
> fail with:
> 
>    mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `decompress_kernel':
>    decompress.c:(.text.decompress_kernel+0x54): undefined reference to `__bswapsi2'
> 
> It turns out that this problem has already been fixed for the XZ
> decompressor but now it also shows up in (at least) LZO and LZ4.  From my
> analysis I concluded that the compiler could always have emitted those
> calls, but the different implementation allowed it to make otherwise
> better decisions about not inlining the byteswap, which results in the
> link error when the out-of-line code is missing.
> 
> While it could be addressed by adding it to the two decompressor
> implementations that are known to be affected, but as this only adds
> 112 bytes to the kernel, the safer choice is to always add them.
> 
> Fixes: c50ec6787536 ("MIPS: zboot: Fix the build with XZ compression on older GCC versions")
> Fixes: 0652035a5794 ("asm-generic: unaligned: remove byteshift helpers")
> Link: https://lore.kernel.org/linux-mm/202106301304.gz2wVY9w-lkp@intel.com/
> Link: https://lore.kernel.org/linux-mm/202106260659.TyMe8mjr-lkp@intel.com/
> Link: https://lore.kernel.org/linux-mm/202106172016.onWT6Tza-lkp@intel.com/
> Link: https://lore.kernel.org/linux-mm/202105231743.JJcALnhS-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/boot/compressed/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next (for second pull request).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
