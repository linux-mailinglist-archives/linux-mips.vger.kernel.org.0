Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B7C625DEA
	for <lists+linux-mips@lfdr.de>; Fri, 11 Nov 2022 16:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbiKKPJB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Nov 2022 10:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234900AbiKKPID (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Nov 2022 10:08:03 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC703663D1;
        Fri, 11 Nov 2022 07:06:46 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1otVcD-00037d-02; Fri, 11 Nov 2022 16:06:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BBB41C11F2; Fri, 11 Nov 2022 16:04:06 +0100 (CET)
Date:   Fri, 11 Nov 2022 16:04:06 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mips@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] mips: alchemy: gpio: Include the right header
Message-ID: <20221111150406.GC13465@alpha.franken.de>
References: <20221103101535.715956-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103101535.715956-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 03, 2022 at 11:15:35AM +0100, Linus Walleij wrote:
> The local GPIO driver in the MIPS Alchemy is including the legacy
> <linux/gpio.h> header but what it wants is to implement a GPIO
> driver so include <linux/gpio/driver.h> instead.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Collect Philippe's review tag
> - Resend to the right MIPS maintainer
> ---
>  arch/mips/alchemy/common/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
> index a17d7a8909c4..1b16daaa86ae 100644
> --- a/arch/mips/alchemy/common/gpiolib.c
> +++ b/arch/mips/alchemy/common/gpiolib.c
> @@ -31,7 +31,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <asm/mach-au1x00/gpio-au1000.h>
>  #include <asm/mach-au1x00/gpio-au1300.h>
>  
> -- 
> 2.34.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
