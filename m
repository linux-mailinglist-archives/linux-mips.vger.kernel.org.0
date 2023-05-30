Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25203715E4F
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 14:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjE3MDC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 08:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjE3MDC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 08:03:02 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C28B0;
        Tue, 30 May 2023 05:02:58 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685448177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7CSRmaE6JhiYga7TPE+m6X9B1ZhYPe18KEKuurrlc1s=;
        b=BnDg/KM0HCEuPhQEczxYX0epEE8tK793htPY2GFqK5/Zp6N1pp55AqFzdds8A2MVgNbG3o
        LtS0qTp+BfCFBxNYOxvMbTG8GMvMUhtwMcYT6qW2DLVqD+iZkVDiSbXYVH55bd9ucpY39i
        XAkYghCMdpcc8/yJIPrk+f3HgI/i4zTz5QkylYAiLCxUiyfUJOTl0qNj5+i/4pcYcH71OG
        BqKOkDbWZawF5wip3pJHa6ETSnkKGlJTAMQkKxLE6nAvGGKLe1aEw/17JSZXMZ+3mkPn4N
        kkjq7TjQp4mgLyzXT1y25E0Pl4Bwh1Is9VnANufeqx+LK57YnV3XdeVRshrzMw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76A4424000A;
        Tue, 30 May 2023 12:02:54 +0000 (UTC)
Date:   Tue, 30 May 2023 14:02:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
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
Message-ID: <20230530120254a7ee88f0@mail.local>
References: <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
 <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
 <CAMpQs4JLp3iUh6LkN6SND8O8wRZZcM04Shcq4rUa5QEOUAVsGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpQs4JLp3iUh6LkN6SND8O8wRZZcM04Shcq4rUa5QEOUAVsGg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/05/2023 19:39:50+0800, Binbin Zhou wrote:
> Hi Krzysztof:
> 
> LS7A bridge chip can be considered as a combination of South and North
> bridge. Generally, it will be connected to the Loongson-3 series CPUs.
> LS2K500/LS2K1000/LS2K2000 refers to the LS2K series embedded CPU chip.
> 
> Therefore, from the understanding of the driver code, I don't think it
> is appropriate to fallback them together. Please pardon me if this
> view does not apply to dt-binding.
> 
> If fallback is necessary, can we have this:
> 
> Let ls7a remain a separate item.
> 
> "loongson,ls1b-rtc"
> "loongson,ls1c-rtc", "loongson,ls1b-rtc"

Based on Keguang's feedback, "loongson,ls1b-rtc" is not a fallback for
"loongson,ls1c-rtc" as it is missing registers, keep it standalone.

> "loongson,ls7a-rtc"
> "loongson,ls2k0500-rtc"
> "loongson,ls2k2000-rtc", "loongson,ls2k0500-rtc"
> "loongson,ls2k1000-rtc"
> 
> { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config }
> { .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config }
> { .compatible = "loongson,ls2k0500-rtc", .data = &generic_rtc_config }
> { .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config }
> 
> Thanks.
> Binbin
> 
> >
> > >
> > > Which one do you think is more suitable for us?
> >
> > Use fallbacks for some. You pointed difference in alarm for ls1x, right?
> > If so, then they can stay separate.
> >
> > ls2k500 and ls2k2000 seem compatible with each other so should use fallback.
> >
> > Best regards,
> > Krzysztof
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
