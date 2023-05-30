Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960CF7158D8
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 10:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjE3IlG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 04:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjE3Ikv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 04:40:51 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F74FA1;
        Tue, 30 May 2023 01:40:24 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685436023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sLHoLzcDxTMkNrSDWeQ9/VGo4UTTLUB5CXv7cjZfhig=;
        b=DEP9SKyahkuU0aI7s2GN1o1DcggFS80E80hbCBv9JGZmkh2dbvAONwP0QfjRvdfVuGnEXd
        FjcGhReFXEwJOL4iBBAKxWL7oy/41rMxCNpexmL+++qgCl2tThXiVYKo00YJ/ntjG2ztS7
        sOqriANMTAHVvuI8600XdlPQ3rKfIRMbm2G2xbgRZjDIief/iDQU82UxgnsA1AgSX1YHi3
        geWCnNIwQCavoGCJIsCz5z8GQ2oNB6A4E3aIBj4kkduQ6wnYx9BHTXpzA9sVaijm/EdWWd
        pqy3QMPlzlLHr9ajSi0T1xWeMy1pwmwEqmtIV7rJRZwj+mdgDv6cUhR+RxY7iQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 918554000D;
        Tue, 30 May 2023 08:40:20 +0000 (UTC)
Date:   Tue, 30 May 2023 10:40:20 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
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
Message-ID: <202305300840203aa4ff4c@mail.local>
References: <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
 <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/05/2023 10:17:43+0200, Krzysztof Kozlowski wrote:
> On 29/05/2023 10:31, Binbin Zhou wrote:
> > Hi Krzysztof:
> > 
> > Excuse me.
> > We have different opinions on how to better describe rtc-loongson compatible.
> > 
> > Based on my previous communication with you, I think we should list
> > all the Socs in the driver and drop the wildcards.
> 
> Suggestion was about the bindings. Not in the driver. I never said to
> list all compatibles in the driver...
> 
> > This should be clearer and more straightforward:
> > 
> >         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config
> > }, //ls1b soc
> >         { .compatible = "loongson,ls1c-rtc", .data = &ls1x_rtc_config
> > }, //ls1c soc
> >         { .compatible = "loongson,ls7a-rtc", .data =
> > &generic_rtc_config }, //ls7a bridge chip
> >         { .compatible = "loongson,ls2k0500-rtc", .data =
> > &generic_rtc_config }, // ls2k0500 soc
> >         { .compatible = "loongson,ls2k2000-rtc", .data =
> > &generic_rtc_config }, // ls2k2000 soc
> >         { .compatible = "loongson,ls2k1000-rtc", .data =
> > &ls2k1000_rtc_config }, // ls2k1000 soc
> 
> I would suggest to use fallbacks as suggested by Conor at least for some
> of them. You referred to my previous comments about wildcards.
> Wildcard != fallback.
> 
> > 
> > And Conor thought it should be rendered using a fallback compatible
> > form based on ".data".
> 
> Based on common (compatible) programming model unless you already have
> clear hardware differences making them incompatible.
> 
> > 
> >         "loongson,ls1b-rtc"
> >         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> >         "loongson,ls7a-rtc"
> >         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> >         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
> >         "loonson,ls2k1000-rtc"
> > 
> >         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config }
> >         { .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config }
> >         { .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config }
> > 
> > In this form,  I think it might not be possible to show very
> > graphically which chips are using the driver.
> 
> ??? How is it impossible? For all other SoCs and architectures it is
> possible, so what is special for Loongson?
> 
> > Also, for example, "ls7a" is a bridge chip, while
> > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> > integrate them into one item.
> 
> Why it is inappropriate? I don't see the issue here... what is a
> "bridge" chip? Isn't this also an SoC?
> 
> 
> > 
> > Which one do you think is more suitable for us?
> 
> Use fallbacks for some. You pointed difference in alarm for ls1x, right?
> If so, then they can stay separate.

From what I seen the IP and register set is the same, it is just the
integration on the SoC that differs.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
