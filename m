Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3641C3B46E1
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 17:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFYPuD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 25 Jun 2021 11:50:03 -0400
Received: from aposti.net ([89.234.176.197]:57616 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhFYPuD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Jun 2021 11:50:03 -0400
Date:   Fri, 25 Jun 2021 16:47:30 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 4/4] MIPS: CI20: Add second percpu timer for SMP.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <67L9VQ.H1SRDC272GKW@crapouillou.net>
In-Reply-To: <20210625231942.32945490@zhouyanjie-virtual-machine>
References: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624547189-61079-5-git-send-email-zhouyanjie@wanyeetech.com>
        <5C99VQ.EJKI9MPO7XXO1@crapouillou.net>
        <20210625231942.32945490@zhouyanjie-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le ven., juin 25 2021 at 23:19:42 +0800, 周琰杰 
<zhouyanjie@wanyeetech.com> a écrit :
> Hi Paul,
> 
> 于 Fri, 25 Jun 2021 12:31:17 +0100
> Paul Cercueil <paul@crapouillou.net> 写道:
> 
>>  Hi Zhou,
>> 
>>  Le jeu., juin 24 2021 at 23:06:29 +0800, 周琰杰 (Zhou Yanjie)
>>  <zhouyanjie@wanyeetech.com> a écrit :
>>  > 1.Add a new TCU channel as the percpu timer of core1, this is to
>>  >   prepare for the subsequent SMP support. The newly added channel
>>  >   will not adversely affect the current single-core state.
>>  > 2.Adjust the position of TCU node to make it consistent with the
>>  >   order in jz4780.dtsi file.
>> 
>>  That's a bit superfluous, the order matters when adding new nodes,
>>  but once they are added, moving them around only cause annoyance.
>> 
>>  >
>>  > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>  > ---
>>  >
>>  > Notes:
>>  >     v2:
>>  >     New patch.
>>  >
>>  >     v2->v3:
>>  >     No change.
>>  >
>>  >  arch/mips/boot/dts/ingenic/ci20.dts | 21 +++++++++++----------
>>  >  1 file changed, 11 insertions(+), 10 deletions(-)
>>  >
>>  > diff --git a/arch/mips/boot/dts/ingenic/ci20.dts
>>  > b/arch/mips/boot/dts/ingenic/ci20.dts
>>  > index 8877c62..70005cc 100644
>>  > --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>  > +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>  > @@ -118,6 +118,17 @@
>>  >  	assigned-clock-rates = <48000000>;
>>  >  };
>>  >
>>  > +&tcu {
>>  > +	/*
>>  > +	 * 750 kHz for the system timers and 3 MHz for the
>>  > clocksources,
>>  > +	 * use channel #0 and #1 for the per cpu system timers,
>>  > and use
>>  > +	 * channel #2 for the clocksource.
>>  > +	 */
>>  > +	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu
>>  > TCU_CLK_TIMER1>,
>>  > +					  <&tcu TCU_CLK_TIMER2>,
>>  > <&tcu TCU_CLK_OST>;
>>  > +	assigned-clock-rates = <750000>, <750000>, <3000000>,
>>  > <3000000>;
>> 
>>  Ideally you'd set TIMER1 to 3 MHz and TIMER2 to 750 kHz, otherwise 
>> it
>>  kind of breaks support for older kernels (they would still boot, but
>>  with a very slow clocksource). So in the new DTS you could use the
>>  timer0 clock for CPU #0, timer1 for the clocksource, and timer2+ for
>>  cpus > 0.
> 
> I checked the ingenic-timer driver, and it seems that the last TCU
> channel is always used as the clocksource in the driver, so it seems
> that we can only use timer2 as the clocksource in smp mode. Maybe we
> should add a note for smp is closed in the comment. And I found that I
> missed a problem, Nikolaus Schaller once reported that because the
> frequency of the tcu timer (only 16bit) used to provide the 
> clocksource
> is too high, there will be a chance that the system will get stuck
> before the clocksource is switched to ost. And reducing the 
> clocksource
> to 750kz can prevent it from happening. I will add this part to v4.
> When this part is added, both clockevent and clocksource will be
> 750kHz, but the 750kHz clocksource is only temporary, because it will
> then switch to the clocksource provided by ost, and ost works at 3MHz.

Ok, then first change the clocksource to 750 kHz, then update it with 
timer2.

Cheers,
-Paul

> 
> Thanks and best regards!
> 
>> 
>>  Cheers,
>>  -Paul
>> 
>>  > +};
>>  > +
>>  >  &mmc0 {
>>  >  	status = "okay";
>>  >
>>  > @@ -522,13 +533,3 @@
>>  >  		bias-disable;
>>  >  	};
>>  >  };
>>  > -
>>  > -&tcu {
>>  > -	/*
>>  > -	 * 750 kHz for the system timer and 3 MHz for the
>>  > clocksource,
>>  > -	 * use channel #0 for the system timer, #1 for the
>>  > clocksource.
>>  > -	 */
>>  > -	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu
>>  > TCU_CLK_TIMER1>,
>>  > -					  <&tcu TCU_CLK_OST>;
>>  > -	assigned-clock-rates = <750000>, <3000000>, <3000000>;
>>  > -};
>>  > --
>>  > 2.7.4
>>  >
>> 
> 


