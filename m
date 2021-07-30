Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4293DBE9A
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 21:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhG3TAg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 30 Jul 2021 15:00:36 -0400
Received: from aposti.net ([89.234.176.197]:54948 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230475AbhG3TA2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Jul 2021 15:00:28 -0400
Date:   Fri, 30 Jul 2021 20:00:08 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2] clocksource: Ingenic: Improve the code.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <8GN2XQ.MOCZ4R16ZTRH1@crapouillou.net>
In-Reply-To: <1627638188-116163-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627638188-116163-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le ven., juil. 30 2021 at 17:43:08 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Use "FIELD_GET()" and "FIELD_PREP()" to simplify the code.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thanks!
-Paul

> ---
> 
> Notes:
>     v1->v2:
>     Split "val = (val & ~OSTCCR_PRESCALEx_MASK) | 
> FIELD_PREP(OSTCCR_PRESCALEx_MASK, prescale)"
>     into "val &= ~OSTCCR_PRESCALEx_MASK" and "val |= 
> FIELD_PREP(OSTCCR_PRESCALEx_MASK, prescale)"
>     as Paul Cercueil's suggestion.
> 
>  drivers/clocksource/ingenic-sysost.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/ingenic-sysost.c 
> b/drivers/clocksource/ingenic-sysost.c
> index a129840..cb6fc2f 100644
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
> @@ -151,7 +150,8 @@ static int 
> ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
>  	int val;
> 
>  	val = readl(ost_clk->ost->base + info->ostccr_reg);
> -	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << 
> OSTCCR_PRESCALE1_LSB);
> +	val &= ~OSTCCR_PRESCALE1_MASK;
> +	val |= FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);
>  	writel(val, ost_clk->ost->base + info->ostccr_reg);
> 
>  	return 0;
> @@ -166,7 +166,8 @@ static int 
> ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
>  	int val;
> 
>  	val = readl(ost_clk->ost->base + info->ostccr_reg);
> -	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << 
> OSTCCR_PRESCALE2_LSB);
> +	val &= ~OSTCCR_PRESCALE2_MASK;
> +	val |= FIELD_PREP(OSTCCR_PRESCALE2_MASK, prescale);
>  	writel(val, ost_clk->ost->base + info->ostccr_reg);
> 
>  	return 0;
> --
> 2.7.4
> 


