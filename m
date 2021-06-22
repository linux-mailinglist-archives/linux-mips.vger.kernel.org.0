Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4991A3B0646
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 15:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhFVN5c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 22 Jun 2021 09:57:32 -0400
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:44444 "EHLO
        out28-124.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhFVN5b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 09:57:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07444444|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.442543-0.00291923-0.554538;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KWIc2vz_1624370112;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWIc2vz_1624370112)
          by smtp.aliyun-inc.com(10.147.40.2);
          Tue, 22 Jun 2021 21:55:12 +0800
Date:   Tue, 22 Jun 2021 21:55:10 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH 4/4] MIPS: CI20: Reduce MSC0 frequency and add second
 percpu timer for SMP.
Message-ID: <20210622215510.1eb3fe1d@zhouyanjie-virtual-machine>
In-Reply-To: <2HS3VQ.DXNKJZKKQIX81@crapouillou.net>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-5-git-send-email-zhouyanjie@wanyeetech.com>
        <2HS3VQ.DXNKJZKKQIX81@crapouillou.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

于 Tue, 22 Jun 2021 13:39:02 +0100
Paul Cercueil <paul@crapouillou.net> 写道:

> Hi Zhou,
> 
> Le mar., juin 22 2021 at 15:37:25 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
> > 1.On the hardware of CI20 v1, when the MSC0 clock is 50MHz, there is
> >   a certain probability that the communication with the SD card will
> >   be abnormal, and the file system will be damaged in severe cases.
> >   Limiting the maximum MSC0 clock frequency to 25MHz can solve this
> >   problem.  
> 
> That doesn't prevent anything, since you could very well use a recent 
> kernel with an older device tree.
> 
> Besides, the PM does say that 50 MHz bus clock is supported, so I 
> suspect that your problem is actually a driver issue.
> 
> The proper way to work around it, temporarily or not, would be to set 
> the max frequency to 25 MHz in the driver itself, if the board's 
> compatible strings matches ingenic,ci20.
> 

Sure, then let's focus on tcu first, I will send the v2 version.

Thanks and best regards!

> Cheers,
> -Paul
> 
> > 2.Add a new TCU channel as the percpu timer of core1, this is to
> >   prepare for the subsequent SMP support. The newly added channel
> >   will not adversely affect the current single-core state.
> > 3.Adjust the position of TCU node to make it consistent with the
> >   order in jz4780.dtsi file.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > ---
> >  arch/mips/boot/dts/ingenic/ci20.dts | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> > b/arch/mips/boot/dts/ingenic/ci20.dts
> > index 8877c62..58123e0 100644
> > --- a/arch/mips/boot/dts/ingenic/ci20.dts
> > +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> > @@ -118,11 +118,22 @@
> >  	assigned-clock-rates = <48000000>;
> >  };
> > 
> > +&tcu {
> > +	/*
> > +	 * 750 kHz for the system timers and 3 MHz for the
> > clocksources,
> > +	 * use channel #0 and #1 for the per cpu system timers,
> > and use
> > +	 * channel #2 for the clocksource.
> > +	 */
> > +	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu
> > TCU_CLK_TIMER1>,
> > +					  <&tcu TCU_CLK_TIMER2>,
> > <&tcu TCU_CLK_OST>;
> > +	assigned-clock-rates = <750000>, <750000>, <3000000>,
> > <3000000>; +};
> > +
> >  &mmc0 {
> >  	status = "okay";
> > 
> >  	bus-width = <4>;
> > -	max-frequency = <50000000>;
> > +	max-frequency = <25000000>;
> > 
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pins_mmc0>;
> > @@ -522,13 +533,3 @@
> >  		bias-disable;
> >  	};
> >  };
> > -
> > -&tcu {
> > -	/*
> > -	 * 750 kHz for the system timer and 3 MHz for the
> > clocksource,
> > -	 * use channel #0 for the system timer, #1 for the
> > clocksource.
> > -	 */
> > -	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu
> > TCU_CLK_TIMER1>,
> > -					  <&tcu TCU_CLK_OST>;
> > -	assigned-clock-rates = <750000>, <3000000>, <3000000>;
> > -};
> > --
> > 2.7.4
> >   
> 

