Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A589E44AD35
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 13:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241518AbhKIMNL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 9 Nov 2021 07:13:11 -0500
Received: from aposti.net ([89.234.176.197]:54412 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239237AbhKIMNG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 07:13:06 -0500
Date:   Tue, 09 Nov 2021 12:10:10 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mips: decompressor: do not copy source files while
 building
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Xingxing Su <suxingxing@loongson.cn>,
        linux-kernel@vger.kernel.org, zhaoxiao <zhaoxiao@uniontech.com>
Message-Id: <YG0B2R.AN2GMAOFSVCK1@crapouillou.net>
In-Reply-To: <20211105023815.85784-1-masahiroy@kernel.org>
References: <20211105023815.85784-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Masahiro,

Le ven., nov. 5 2021 at 11:38:14 +0900, Masahiro Yamada 
<masahiroy@kernel.org> a écrit :
> As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> builds") stated, copying source files during the build time may not
> end up with as clean code as expected.
> 
> Do similar for mips to clean up the Makefile and .gitignore.

What did you base this patch on?

It does not apply cleanly here. It tries to create ashldi3.c and 
bswapsi.c, which already exist.

Cheers,
-Paul

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/boot/compressed/.gitignore   |  3 ---
>  arch/mips/boot/compressed/Makefile     | 12 ------------
>  arch/mips/boot/compressed/ashldi3.c    |  2 ++
>  arch/mips/boot/compressed/bswapsi.c    |  2 ++
>  arch/mips/boot/compressed/uart-ath79.c |  2 ++
>  scripts/remove-stale-files             |  5 +++++
>  6 files changed, 11 insertions(+), 15 deletions(-)
>  delete mode 100644 arch/mips/boot/compressed/.gitignore
>  create mode 100644 arch/mips/boot/compressed/ashldi3.c
>  create mode 100644 arch/mips/boot/compressed/bswapsi.c
>  create mode 100644 arch/mips/boot/compressed/uart-ath79.c
> 
> diff --git a/arch/mips/boot/compressed/.gitignore 
> b/arch/mips/boot/compressed/.gitignore
> deleted file mode 100644
> index d358395614c9..000000000000
> --- a/arch/mips/boot/compressed/.gitignore
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -ashldi3.c
> -bswapsi.c
> diff --git a/arch/mips/boot/compressed/Makefile 
> b/arch/mips/boot/compressed/Makefile
> index 3548b3b45269..e6584dab2360 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -50,20 +50,8 @@ vmlinuzobjs-$(CONFIG_MIPS_ALCHEMY)		   += 
> $(obj)/uart-alchemy.o
>  vmlinuzobjs-$(CONFIG_ATH79)			   += $(obj)/uart-ath79.o
>  endif
> 
> -extra-y += uart-ath79.c
> -$(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
> -	$(call cmd,shipped)
> -
>  vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
> 
> -extra-y += ashldi3.c
> -$(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
> -	$(call if_changed,shipped)
> -
> -extra-y += bswapsi.c
> -$(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
> -	$(call if_changed,shipped)
> -
>  targets := $(notdir $(vmlinuzobjs-y))
> 
>  targets += vmlinux.bin
> diff --git a/arch/mips/boot/compressed/ashldi3.c 
> b/arch/mips/boot/compressed/ashldi3.c
> new file mode 100644
> index 000000000000..f7bf6a7aae31
> --- /dev/null
> +++ b/arch/mips/boot/compressed/ashldi3.c
> @@ -0,0 +1,2 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include "../../../../lib/ashldi3.c"
> diff --git a/arch/mips/boot/compressed/bswapsi.c 
> b/arch/mips/boot/compressed/bswapsi.c
> new file mode 100644
> index 000000000000..fdb9c6476904
> --- /dev/null
> +++ b/arch/mips/boot/compressed/bswapsi.c
> @@ -0,0 +1,2 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include "../../lib/bswapsi.c"
> diff --git a/arch/mips/boot/compressed/uart-ath79.c 
> b/arch/mips/boot/compressed/uart-ath79.c
> new file mode 100644
> index 000000000000..d686820921be
> --- /dev/null
> +++ b/arch/mips/boot/compressed/uart-ath79.c
> @@ -0,0 +1,2 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include "../../ath79/early_printk.c"
> diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> index eb630ee287c3..c534fe1eac16 100755
> --- a/scripts/remove-stale-files
> +++ b/scripts/remove-stale-files
> @@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
>  	do
>  		rm -f arch/arm/boot/compressed/${f}
>  	done
> +
> +	for f in uart-ath79.c ashldi3.c bswapsi.c
> +	do
> +		rm -f arch/mips/boot/compressed/${f}
> +	done
>  fi
> --
> 2.30.2
> 


