Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB07159F7
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 11:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjE3JYJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 05:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjE3JXd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 05:23:33 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA701A5;
        Tue, 30 May 2023 02:22:34 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685438525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lDeMCws0siBZEnFYW0HPlqW6XjIAotmNt0sSp/ryskU=;
        b=O17IF2fNtRO5Hl91YjW7GViADXoYAzM4XlcnDh5I9spcj3HeRYv++HqEl9zxM3IXHaHq48
        WgX8OKwL2LY79HI9E+FIU+kjRmf5QP0wK7ns7F3KAvg0kuo/q2poa/YX1GbbrLjLu3O6FS
        ZBu2o/vpQXPWWAMTxmEeEhhbvaa46hmNNaKI4M5FNgLZTBDpGUAr3/sS6quQGUL7SESCE0
        f7PccbBC6nF4hj8iC5Asv/reeNq1Y+qT1eOkeyQVHk0HC+isYTmNRNaAZf+Jgz5E6O5VmK
        CUl/Yt/qZV9DC7qIvNar/vd4oFfnl+fiD+4SdKZlJmHiynbKokEn2FZ0XFDxmg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06F341BF208;
        Tue, 30 May 2023 09:22:00 +0000 (UTC)
Date:   Tue, 30 May 2023 11:22:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <2023053009220055969681@mail.local>
References: <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
 <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
 <202305300840203aa4ff4c@mail.local>
 <CAJhJPsXyS_+tTLJ1JSCNx6wXs8eGwwQ4khg=-0gRGZuJRDddoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsXyS_+tTLJ1JSCNx6wXs8eGwwQ4khg=-0gRGZuJRDddoQ@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/05/2023 17:13:12+0800, Keguang Zhang wrote:
> On Tue, May 30, 2023 at 4:40 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 30/05/2023 10:17:43+0200, Krzysztof Kozlowski wrote:
> > > On 29/05/2023 10:31, Binbin Zhou wrote:
> > > > Hi Krzysztof:
> > > >
> > > > Excuse me.
> > > > We have different opinions on how to better describe rtc-loongson compatible.
> > > >
> > > > Based on my previous communication with you, I think we should list
> > > > all the Socs in the driver and drop the wildcards.
> > >
> > > Suggestion was about the bindings. Not in the driver. I never said to
> > > list all compatibles in the driver...
> > >
> > > > This should be clearer and more straightforward:
> > > >
> > > >         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config
> > > > }, //ls1b soc
> > > >         { .compatible = "loongson,ls1c-rtc", .data = &ls1x_rtc_config
> > > > }, //ls1c soc
> > > >         { .compatible = "loongson,ls7a-rtc", .data =
> > > > &generic_rtc_config }, //ls7a bridge chip
> > > >         { .compatible = "loongson,ls2k0500-rtc", .data =
> > > > &generic_rtc_config }, // ls2k0500 soc
> > > >         { .compatible = "loongson,ls2k2000-rtc", .data =
> > > > &generic_rtc_config }, // ls2k2000 soc
> > > >         { .compatible = "loongson,ls2k1000-rtc", .data =
> > > > &ls2k1000_rtc_config }, // ls2k1000 soc
> > >
> > > I would suggest to use fallbacks as suggested by Conor at least for some
> > > of them. You referred to my previous comments about wildcards.
> > > Wildcard != fallback.
> > >
> > > >
> > > > And Conor thought it should be rendered using a fallback compatible
> > > > form based on ".data".
> > >
> > > Based on common (compatible) programming model unless you already have
> > > clear hardware differences making them incompatible.
> > >
> > > >
> > > >         "loongson,ls1b-rtc"
> > > >         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > > >         "loongson,ls7a-rtc"
> > > >         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > > >         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
> > > >         "loonson,ls2k1000-rtc"
> > > >
> > > >         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config }
> > > >         { .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config }
> > > >         { .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config }
> > > >
> > > > In this form,  I think it might not be possible to show very
> > > > graphically which chips are using the driver.
> > >
> > > ??? How is it impossible? For all other SoCs and architectures it is
> > > possible, so what is special for Loongson?
> > >
> > > > Also, for example, "ls7a" is a bridge chip, while
> > > > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> > > > integrate them into one item.
> > >
> > > Why it is inappropriate? I don't see the issue here... what is a
> > > "bridge" chip? Isn't this also an SoC?
> > >
> > >
> > > >
> > > > Which one do you think is more suitable for us?
> > >
> > > Use fallbacks for some. You pointed difference in alarm for ls1x, right?
> > > If so, then they can stay separate.
> >
> > From what I seen the IP and register set is the same, it is just the
> > integration on the SoC that differs.
> >
> Actually, ls1c RTC registers are not the same as ls1b.
> ls1c doesn't have the following resgisters.
> +#define TOY_MATCH0_REG         0x34 /* TOY timing interrupt 0 */
> +#define TOY_MATCH1_REG         0x38 /* TOY timing interrupt 1 */
> +#define TOY_MATCH2_REG         0x3c /* TOY timing interrupt 2 */
> 
> +#define RTC_CTRL_REG           0x40 /* TOY and RTC control register */
> +#define RTC_TRIM_REG           0x60 /* Must be initialized to 0 */
> +#define RTC_WRITE0_REG         0x64 /* RTC counters value (write-only) */
> +#define RTC_READ0_REG          0x68 /* RTC counters value (read-only) */
> +#define RTC_MATCH0_REG         0x6c /* RTC timing interrupt 0 */
> +#define RTC_MATCH1_REG         0x70 /* RTC timing interrupt 1 */
> +#define RTC_MATCH2_REG         0x74 /* RTC timing interrupt 2 */
> 
> As you can see, it doesn't support match function, which is why ls1c
> doesn't support RTC interrupt.

They are in the Loongson1C Processor User Manual I have which states:

21.2.6 SYS_TOYMATCH0/1/2 (no register in 1C2)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
