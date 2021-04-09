Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980D1359770
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 10:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhDIIQC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 9 Apr 2021 04:16:02 -0400
Received: from aposti.net ([89.234.176.197]:56432 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhDIIQC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 04:16:02 -0400
Date:   Fri, 09 Apr 2021 09:15:34 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <YXEARQ.LGKNU44HTZP01@crapouillou.net>
In-Reply-To: <20210408205858.51751-2-masahiroy@kernel.org>
References: <20210408205858.51751-1-masahiroy@kernel.org>
        <20210408205858.51751-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Masahiro,

Le ven. 9 avril 2021 à 5:58, Masahiro Yamada <masahiroy@kernel.org> a 
écrit :
> <linux/kconfig.h> is included from all the kernel-space source files,
> including C, assembly, linker scripts. It is intended to contain 
> minimal
> set of macros to evaluate CONFIG options.
> 
> IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> should not be included from assembly files or linker scripts.
> 
> Also, <linux/kconfig.h> is no longer self-contained because NULL is
> defined in <linux/stddef.h>.
> 
> Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF().
> 
> PTR_IF(IS_ENABLED(CONFIG_FOO), ...) is slightly longer than
> IF_ENABLED(CONFIG_FOO, ...), but it is not a big deal because
> sub-systems often define dedicated macros such as of_match_ptr(),
> pm_ptr() etc. for common use-cases.

What's the idea behind changing IF_ENABLED() to PTR_IF()? You didn't 
explain that. What's wrong with IF_ENABLED()?

Cheers,
-Paul

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 20 ++++++++++----------
>  include/linux/kconfig.h           |  6 ------
>  include/linux/kernel.h            |  2 ++
>  3 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index f2746125b077..b21e2ae4528d 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2496,43 +2496,43 @@ static int __init 
> ingenic_pinctrl_probe(struct platform_device *pdev)
>  static const struct of_device_id ingenic_pinctrl_of_match[] = {
>  	{
>  		.compatible = "ingenic,jz4740-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4740), &jz4740_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,jz4725b-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4725B), &jz4725b_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,jz4760-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4760), &jz4760_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,jz4760b-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4760), &jz4760_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,jz4770-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4770), &jz4770_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,jz4780-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_JZ4780), &jz4780_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,x1000-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_X1000), &x1000_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,x1000e-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_X1000), &x1000_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,x1500-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_X1500, &x1500_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_X1500), &x1500_chip_info)
>  	},
>  	{
>  		.compatible = "ingenic,x1830-pinctrl",
> -		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
> +		.data = PTR_IF(IS_ENABLED(CONFIG_MACH_X1830), &x1830_chip_info)
>  	},
>  	{ /* sentinel */ },
>  };
> diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
> index 24a59cb06963..cc8fa109cfa3 100644
> --- a/include/linux/kconfig.h
> +++ b/include/linux/kconfig.h
> @@ -70,10 +70,4 @@
>   */
>  #define IS_ENABLED(option) __or(IS_BUILTIN(option), 
> IS_MODULE(option))
> 
> -/*
> - * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is 
> set to 'y'
> - * or 'm', NULL otherwise.
> - */
> -#define IF_ENABLED(option, ptr) (IS_ENABLED(option) ? (ptr) : NULL)
> -
>  #endif /* __LINUX_KCONFIG_H */
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 5b7ed6dc99ac..8685ca4cf287 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -38,6 +38,8 @@
>  #define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned 
> long)(p), (a)))
>  #define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
> 
> +#define PTR_IF(cond, ptr)	((cond) ? (ptr) : NULL)
> +
>  /* generic data direction definitions */
>  #define READ			0
>  #define WRITE			1
> --
> 2.27.0
> 


