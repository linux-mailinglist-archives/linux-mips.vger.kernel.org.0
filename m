Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F50482B65
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jan 2022 14:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbiABNcz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Jan 2022 08:32:55 -0500
Received: from elvis.franken.de ([193.175.24.41]:52731 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbiABNcy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Jan 2022 08:32:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n40yi-0002m7-00; Sun, 02 Jan 2022 14:32:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C78FEC0A1D; Sun,  2 Jan 2022 14:26:02 +0100 (CET)
Date:   Sun, 2 Jan 2022 14:26:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <yunqiang.su@cipunited.com>
Cc:     linux-mips@vger.kernel.org, paul@crapouillou.net,
        zhouyanjie@wanyeetech.com, jiaxun.yang@flygoat.com, syq@debian.org,
        aaro.koskinen@iki.fi
Subject: Re: [PATCH 1/2] MIPS: enable both vmlinux.gz.itb and vmlinuz for
 generic
Message-ID: <20220102132602.GA3468@alpha.franken.de>
References: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 22, 2021 at 01:43:45PM +0000, YunQiang Su wrote:
> vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC)
> instead of replacing. Otherwise, no vmlinuz will be built.
> 
> Signed-off-by: YunQiang Su <yunqiang.su@cipunited.com>
> ---
>  arch/mips/generic/Platform | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index e1abc113b409..d7c8cff6de2c 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -14,7 +14,7 @@ cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
>  
>  load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
>  zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
> -all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
> +all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
>  
>  its-y					:= vmlinux.its.S
>  its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
> -- 
> 2.30.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
