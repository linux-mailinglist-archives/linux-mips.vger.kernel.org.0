Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133EA6A3A90
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 06:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjB0Fjb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 00:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0Fja (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 00:39:30 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD46A976F;
        Sun, 26 Feb 2023 21:39:27 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A04741BF203;
        Mon, 27 Feb 2023 05:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677476366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HSUtZZZIsMOTcVvHu0tixFiyHTHL04pUAee04ApJQyU=;
        b=egUclZcQnQTw2I4NZ+GndWv94hAxJyCN5DHJ1mUawKqxqv8VA56PzKyWy6uj96Odo4q9X7
        X5T1l2IaFCg4WW2FqUqqkGZkXUDFNxT4c7AVfukix3A7sf7bjp1kuPR52Xs/h3hz0Cqyzx
        1wMipbSb0mzsWoNnJ/mggq2aOXMrMX73Tb7lgjSC4di0DbGdXiBGdmx16X+hRHXRvQ/369
        LJHIbEH+sPSS1HwYINJRLgWfYsn07h7RLEGtiqm8JYP7XT8TjC0dBXQR6YKIjyQDyyNQbO
        AHqtoh0hkXEPyp/KxnnagpO4CFNn9Zc8viF4tw/nRW6WwmLoBZFs0MbLhPyz8A==
Date:   Mon, 27 Feb 2023 06:39:23 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH V2 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Message-ID: <Y/xCC8cpGxG/8g97@mail.local>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
 <8cd5e1b763951d4ce69188cdff95d8adaf12755f.1673227292.git.zhoubinbin@loongson.cn>
 <Y88ZaWnh9ERRocPv@mail.local>
 <CAMpQs4+pWpw9bmCvKor+V41aMcLc-90aYz0QH-WS2KqkkFqMFA@mail.gmail.com>
 <Y+wVkl7r6HbriqA7@mail.local>
 <CAMpQs4Kx3E+MdE0naf-TM2_JMjwWr2f4+b0vP+adZNFOF1fLhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpQs4Kx3E+MdE0naf-TM2_JMjwWr2f4+b0vP+adZNFOF1fLhA@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/02/2023 10:26:09+0800, Binbin Zhou wrote:
> > > > > +static inline void ls2x_rtc_alarm_regs_to_time(struct ls2x_rtc_regs *regs,
> > > > > +                                      struct rtc_time *tm)
> > > > > +{
> > > > > +     tm->tm_sec = FIELD_GET(TOY_MATCH_SEC, regs->reg0);
> > > > > +     tm->tm_min = FIELD_GET(TOY_MATCH_MIN, regs->reg0);
> > > > > +     tm->tm_hour = FIELD_GET(TOY_MATCH_HOUR, regs->reg0);
> > > > > +     tm->tm_mday = FIELD_GET(TOY_MATCH_DAY, regs->reg0);
> > > > > +     tm->tm_mon = FIELD_GET(TOY_MATCH_MON, regs->reg0) - 1;
> > > > > +     /*
> > > > > +      * The rtc SYS_TOYMATCH0/YEAR bit field is only 6 bits, so it means 63
> > > > > +      * years at most. Therefore, The RTC alarm years can be set from 1900
> > > > > +      * to 1963. This causes the initialization of alarm fail during call
> > > > > +      * __rtc_read_alarm.
> > > > > +      * We add 64 years offset to ls2x_rtc_read_alarm. After adding the
> > > > > +      * offset, the RTC alarm clock can be set from 1964 to 2027.
> > > > > +      */
> > > > > +     tm->tm_year = FIELD_GET(TOY_MATCH_YEAR, regs->reg0) + 64;
> > > >
> > > > This is not symmetric with ls2x_rtc_time_to_alarm_regs, how can it work?
> > >
> > > This is to avoid an "invalid alarm value" at boot time, which of
> > > course should not be a good solution.
> > > When the alarm value is read at boot time, "year" is not yet set to
> > > the proper value so the year is always set to 1900.
> >
> > Why isn't it set at boot time? Isn't the register persisting after a
> > reboot?
> > Setting a bogus alarm is not a solution.
> >
> 
> Hi, Alexandre:
> 
> Sorry, I seem to have misled the issue.
> This is a hardware bug, as we know from the datasheet, the year field
> in the TOY_MATCH register has only 6 bits (bit[31:26]), so the maximum
> value is 63. For example, 2023 can only be read here as 1959,
> resulting in an invalid alarm.
> The current workaround: after reading the year field in
> ls2x_rtc_read_alarm(), manually add 64 or a multiple of 64 (equivalent
> to completing the high bits), which also ensures that the reading and
> writing is consistent.

My first complain was that this is not symmetric with
ls2x_rtc_time_to_alarm_regs. If you are adding 64 when reading the
alarm, you need to remove 64 when setting the alarm.

Now I get that FIELD_PREP will drop the overflowing bits.
Instead of having support for the 1964 to 2027 range, you should
probably aim for 2000 to 2064.

Also, this makes me realize that you are not setting the year properly,
the datasheet I have says that the supported year goes from 00 to 99.
This is also what you set in .probe.
Removing 100 from tm_year when setting and adding it back when reading
would fix all of that.

> > > The LS7A and Loongson-2K datasheets also do not mention any latching
> > > happening. Reading TOY_READ1_REG first is probably just a matter of
> > > habit.
> > > I tried using regmap_bulk_xxx() and it also reads and writes time
> > > properly. In the next version I will rewrite this part of the code.
> > >
> > > Example:
> > >
> > > #define LS2X_NUM_TIME_REGS      2
> > >
> > > u32 rtc_data[LS2X_NUM_TIME_REGS];
> > > struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > >
> > > ret = regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> > > LS2X_NUM_TIME_REGS);
> > >
> >
> > Doing a bulk read doesn't guarantee the atomicity of the operation. You
> > really must check whether a register changed while reading the other
> > one.
> >
> 
> How about protecting with mutex?
> 

No, this would fix multiple processes accessing a variable, here what
you have are two unsynchronized hardware registers.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
