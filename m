Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E063B8213
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbhF3M0u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 30 Jun 2021 08:26:50 -0400
Received: from aposti.net ([89.234.176.197]:54888 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234426AbhF3M0u (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 08:26:50 -0400
Date:   Wed, 30 Jun 2021 13:24:08 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 5/5] MIPS: CI20: Add second percpu timer for SMP.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <84LIVQ.EPXA43L4WLUK@crapouillou.net>
In-Reply-To: <1624688321-69131-6-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624688321-69131-6-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juin 26 2021 at 14:18:41 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> 1.Add a new TCU channel as the percpu timer of core1, this is to
>   prepare for the subsequent SMP support. The newly added channel
>   will not adversely affect the current single-core state.
> 2.Adjust the position of TCU node to make it consistent with the
>   order in jz4780.dtsi file.
> 
> Tested-by: Nikolaus Schaller <hns@goldelico.com> # on CI20
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Again, you should avoid moving nodes like that.

Not sure it's worth asking for a v5, so:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>     v2->v3:
>     No change.
> 
>     v3->v4:
>     Improve TCU related notes.
> 
>  arch/mips/boot/dts/ingenic/ci20.dts | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 3a4eaf1..61c153b 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -118,6 +118,20 @@
>  	assigned-clock-rates = <48000000>;
>  };
> 
> +&tcu {
> +	/*
> +	 * 750 kHz for the system timers and clocksource,
> +	 * use channel #0 and #1 for the per cpu system timers,
> +	 * and use channel #2 for the clocksource.
> +	 *
> +	 * 3000 kHz for the OST timer to provide a higher
> +	 * precision clocksource.
> +	 */
> +	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
> +					  <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_OST>;
> +	assigned-clock-rates = <750000>, <750000>, <750000>, <3000000>;
> +};
> +
>  &mmc0 {
>  	status = "okay";
> 
> @@ -522,13 +536,3 @@
>  		bias-disable;
>  	};
>  };
> -
> -&tcu {
> -	/*
> -	 * 750 kHz for the system timer and clocksource,
> -	 * use channel #0 for the system timer, #1 for the clocksource.
> -	 */
> -	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
> -					  <&tcu TCU_CLK_OST>;
> -	assigned-clock-rates = <750000>, <750000>, <3000000>;
> -};
> --
> 2.7.4
> 


