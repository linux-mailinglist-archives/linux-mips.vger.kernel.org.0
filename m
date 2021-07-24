Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD0E3D477E
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 13:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhGXLOD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 24 Jul 2021 07:14:03 -0400
Received: from aposti.net ([89.234.176.197]:59196 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231511AbhGXLOD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 07:14:03 -0400
Date:   Sat, 24 Jul 2021 12:54:24 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] clocksource: Ingenic: Improve the code.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <OQZQWQ.MUGEDOGBXJW12@crapouillou.net>
In-Reply-To: <1627121407-131028-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627121407-131028-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Thanks! I actually had a similar patch locally that I was eventually 
going to send.


Le sam., juil. 24 2021 at 18:10:07 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Use "FIELD_GET()" and "FIELD_PREP()" to simplify the code.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  drivers/clocksource/ingenic-sysost.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/ingenic-sysost.c 
> b/drivers/clocksource/ingenic-sysost.c
> index a129840..1fbea59 100644
> --- a/drivers/clocksource/ingenic-sysost.c
> +++ b/drivers/clocksource/ingenic-sysost.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2020 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com>
>   */
> 
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> @@ -34,8 +35,6 @@
>  /* bits within the OSTCCR register */
>  #define OSTCCR_PRESCALE1_MASK	0x3
>  #define OSTCCR_PRESCALE2_MASK	0xc
> -#define OSTCCR_PRESCALE1_LSB	0
> -#define OSTCCR_PRESCALE2_LSB	2
> 
>  /* bits within the OSTCR register */
>  #define OSTCR_OST1CLR			BIT(0)
> @@ -98,7 +97,7 @@ static unsigned long 
> ingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
> 
>  	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
> 
> -	prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> 
> OSTCCR_PRESCALE1_LSB;
> +	prescale = FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
> 
>  	return parent_rate >> (prescale * 2);
>  }
> @@ -112,7 +111,7 @@ static unsigned long 
> ingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
> 
>  	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
> 
> -	prescale = (prescale & OSTCCR_PRESCALE2_MASK) >> 
> OSTCCR_PRESCALE2_LSB;
> +	prescale = FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
> 
>  	return parent_rate >> (prescale * 2);
>  }
> @@ -151,7 +150,7 @@ static int 
> ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
>  	int val;
> 
>  	val = readl(ost_clk->ost->base + info->ostccr_reg);
> -	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << 
> OSTCCR_PRESCALE1_LSB);
> +	val = (val & ~OSTCCR_PRESCALE1_MASK) | 
> FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);

Just one nitpick, I'd prefer this:

val ~= &OSTCCR_PRESCALE1_MASK;
val |= FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);

>  	writel(val, ost_clk->ost->base + info->ostccr_reg);
> 
>  	return 0;
> @@ -166,7 +165,7 @@ static int 
> ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
>  	int val;
> 
>  	val = readl(ost_clk->ost->base + info->ostccr_reg);
> -	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << 
> OSTCCR_PRESCALE2_LSB);
> +	val = (val & ~OSTCCR_PRESCALE2_MASK) | 
> FIELD_PREP(OSTCCR_PRESCALE2_MASK, prescale);

Same here.

Cheers,
-Paul

>  	writel(val, ost_clk->ost->base + info->ostccr_reg);
> 
>  	return 0;
> --
> 2.7.4
> 


