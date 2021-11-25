Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28B845D757
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 10:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354128AbhKYJkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 04:40:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:40429 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354150AbhKYJiq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 04:38:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mqBA6-00032R-00; Thu, 25 Nov 2021 10:35:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B8A25C2F25; Thu, 25 Nov 2021 10:32:56 +0100 (CET)
Date:   Thu, 25 Nov 2021 10:32:56 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net
Subject: Re: [PATCH] MIPS: boot/compressed/: add __ashldi3 to target for ZSTD
 compression
Message-ID: <20211125093256.GA6537@alpha.franken.de>
References: <20211119175052.401771-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119175052.401771-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 19, 2021 at 05:50:52PM +0000, Paul Cercueil wrote:
> Just like before with __bswapdi2(), for MIPS pre-boot when
> CONFIG_KERNEL_ZSTD=y the decompressor function will use __ashldi3(), so
> the object file should be added to the target object file.
> 
> Fixes these build errors:
> 
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_buildDTable_internal':
> decompress.c:(.text.FSE_buildDTable_internal+0x48): undefined reference to `__ashldi3'
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_decompress_wksp_body_default':
> decompress.c:(.text.FSE_decompress_wksp_body_default+0xa8): undefined reference to `__ashldi3'
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `ZSTD_getFrameHeader_advanced':
> decompress.c:(.text.ZSTD_getFrameHeader_advanced+0x134): undefined reference to `__ashldi3'
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 2861a05c2e0c..f27cf31b4140 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -52,7 +52,7 @@ endif
>  
>  vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
>  
> -vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o
> +vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o $(obj)/ashldi3.o
>  
>  targets := $(notdir $(vmlinuzobjs-y))
>  
> -- 
> 2.33.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
