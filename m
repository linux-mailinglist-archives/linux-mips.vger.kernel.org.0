Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6567A3B81F9
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 14:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhF3MX4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 30 Jun 2021 08:23:56 -0400
Received: from aposti.net ([89.234.176.197]:54664 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234510AbhF3MX4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 08:23:56 -0400
Date:   Wed, 30 Jun 2021 13:21:15 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 4/5] MIPS: CI20: Reduce clocksource to 750 kHz.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <FZKIVQ.1Y3JQ8K8BRMB3@crapouillou.net>
In-Reply-To: <1624688321-69131-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624688321-69131-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juin 26 2021 at 14:18:40 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The original clock (3 MHz) is too fast for the clocksource,
> there will be a chance that the system may get stuck.
> 
> Reported-by: Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Nikolaus Schaller <hns@goldelico.com> # on CI20
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v4:
>     New patch.
> 
>  arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 8877c62..3a4eaf1 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -525,10 +525,10 @@
> 
>  &tcu {
>  	/*
> -	 * 750 kHz for the system timer and 3 MHz for the clocksource,
> +	 * 750 kHz for the system timer and clocksource,
>  	 * use channel #0 for the system timer, #1 for the clocksource.
>  	 */
>  	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
>  					  <&tcu TCU_CLK_OST>;
> -	assigned-clock-rates = <750000>, <3000000>, <3000000>;
> +	assigned-clock-rates = <750000>, <750000>, <3000000>;
>  };
> --
> 2.7.4
> 


