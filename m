Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE2F2E6B98
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 00:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730813AbgL1Wzz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 17:55:55 -0500
Received: from elvis.franken.de ([193.175.24.41]:43952 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729632AbgL1W0V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 17:26:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ku0xP-00069Q-00; Mon, 28 Dec 2020 23:25:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8475EC05C4; Mon, 28 Dec 2020 23:25:32 +0100 (CET)
Date:   Mon, 28 Dec 2020 23:25:32 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: boot: Fix unaligned access with
 CONFIG_MIPS_RAW_APPENDED_DTB
Message-ID: <20201228222532.GA24926@alpha.franken.de>
References: <20201216233956.280068-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201216233956.280068-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 16, 2020 at 11:39:56PM +0000, Paul Cercueil wrote:
> The compressed payload is not necesarily 4-byte aligned, at least when
> compiling with Clang. In that case, the 4-byte value appended to the
> compressed payload that corresponds to the uncompressed kernel image
> size must be read using get_unaligned_le().
> 
> This fixes Clang-built kernels not booting on MIPS (tested on a Ingenic
> JZ4770 board).
> 
> Fixes: b8f54f2cde78 ("MIPS: ZBOOT: copy appended dtb to the end of the kernel")
> Cc: <stable@vger.kernel.org> # v4.7
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/compressed/decompress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
> index c61c641674e6..47c07990432b 100644
> --- a/arch/mips/boot/compressed/decompress.c
> +++ b/arch/mips/boot/compressed/decompress.c
> @@ -117,7 +117,7 @@ void decompress_kernel(unsigned long boot_heap_start)
>  		dtb_size = fdt_totalsize((void *)&__appended_dtb);
>  
>  		/* last four bytes is always image size in little endian */
> -		image_size = le32_to_cpup((void *)&__image_end - 4);
> +		image_size = get_unaligned_le32((void *)&__image_end - 4);

gives me following error

arch/mips/boot/compressed/decompress.c:120:16: error: implicit declaration of function ‘get_unaligned_le32’ [-Werror=implicit-function-declaration]
   image_size = get_unaligned_le32((void *)&__image_end - 4);

I've added

#include <asm/unaligned.h>

which fixes the compile error, but I'm wondering why the patch compiled
for you ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
