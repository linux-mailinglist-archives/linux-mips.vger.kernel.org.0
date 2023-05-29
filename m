Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1247151BF
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 00:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjE2WUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 May 2023 18:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjE2WUP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 May 2023 18:20:15 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4CF92;
        Mon, 29 May 2023 15:20:11 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685398810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=piJwelwJzoOHS0zCI5Yv47Y6GkNNebOL6BgBOE2MHnk=;
        b=GYvMNZIwrEw+CKQccWlGAsp9/B0XQij1+v9eXoXg5b76awP6gyEfbvbMT1VctZQe9LWlHu
        amP8iVBM/ta9hE6C8GluIBXOUuJVwSjJPw9K++CmF39zf1xZlraWvQQ9qMD0mCe13t1lCZ
        91U8JVaWGi59WFSuX/6m9XxMUDasjru1Nhdd6ekoedFyRrH/N8uRDQ+M7ISDpRynjeIar+
        qwUTBdV9F1+a0q/rzPxAmLeSpcd9HcjLF6M6VwSayQMrBqJw4W5xf5BvQfmzspRcodd2Va
        20W+zWQmtTgKz9CzgRQJ9c4r0yfhZyIK7lnai8TW6+cQ4ocOH/Y3CBptt4Sxfg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id E736F240005;
        Mon, 29 May 2023 22:20:07 +0000 (UTC)
Date:   Tue, 30 May 2023 00:20:07 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Conor Dooley <conor@kernel.org>,
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
Message-ID: <2023052922200701b20517@mail.local>
References: <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
 <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Honestly, the list of compatibles is fine for me. I wouldn't go for
fallback. The improvement would be to drop "loongson,ls1c-rtc",
and probably "loongson,ls2k0500-rtc" and "loongson,ls2k2000-rtc".

loongson,ls1c-rtc is definitively not needed, the alarm may not be wired
but the registers are there.

For 2k0500 and 2k2000, I don't mind either way.

On 29/05/2023 16:31:42+0800, Binbin Zhou wrote:
> Hi Krzysztof:
> 
> Excuse me.
> We have different opinions on how to better describe rtc-loongson compatible.
> 
> Based on my previous communication with you, I think we should list
> all the Socs in the driver and drop the wildcards.
> This should be clearer and more straightforward:
> 
>         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config
> }, //ls1b soc
>         { .compatible = "loongson,ls1c-rtc", .data = &ls1x_rtc_config
> }, //ls1c soc
>         { .compatible = "loongson,ls7a-rtc", .data =
> &generic_rtc_config }, //ls7a bridge chip
>         { .compatible = "loongson,ls2k0500-rtc", .data =
> &generic_rtc_config }, // ls2k0500 soc
>         { .compatible = "loongson,ls2k2000-rtc", .data =
> &generic_rtc_config }, // ls2k2000 soc
>         { .compatible = "loongson,ls2k1000-rtc", .data =
> &ls2k1000_rtc_config }, // ls2k1000 soc
> 
> And Conor thought it should be rendered using a fallback compatible
> form based on ".data".
> 
>         "loongson,ls1b-rtc"
>         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>         "loongson,ls7a-rtc"
>         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
>         "loonson,ls2k1000-rtc"
> 
>         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config }
>         { .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config }
>         { .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config }
> 
> In this form,  I think it might not be possible to show very
> graphically which chips are using the driver.
> Also, for example, "ls7a" is a bridge chip, while
> "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> integrate them into one item.
> 
> Which one do you think is more suitable for us?
> 
> Here is the link to our discussion:
> 
> https://lore.kernel.org/linux-rtc/E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org/T/#m6c1ae9b74fceafc4042f7598b1bc594e68e5ec76
> 
> Thanks.
> Binbin
> 
> 
> On Mon, May 29, 2023 at 2:24 PM Conor Dooley <conor@kernel.org> wrote:
> >
> >
> >
> > On 29 May 2023 03:59:57 IST, Keguang Zhang <keguang.zhang@gmail.com> wrote:
> > >On Sun, May 28, 2023 at 6:22 AM Conor Dooley <conor@kernel.org> wrote:
> > >>
> > >> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> > >> > > 2023年5月27日 17:23，Conor Dooley <conor@kernel.org> 写道：
> > >> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
> > >>
> > >> > >> My recommendation is leaving compatible string as is.
> > >> > >
> > >> > > "as is" meaning "as it is right now in Linus' tree", or "as it is in
> > >> > > this patch"?
> > >> >
> > >> > Ah sorry I meant in this patch.
> > >> >
> > >> > Since there won’t be any new ls1x chip that will boot Linux any time soon (due to
> > >> > Loongson move away from MIPS but LoongArch32 is undefined for now), and
> > >> > rest compatible strings are wide enough to cover their family, I think the present
> > >> > compatible strings in this patch describes hardware best.
> > >>
> > >> I don't see why new bindings being written for old hardware should somehow
> > >> be treated differently than new bindings for new hardware.
> > >
> > >Let me add that ls1b RTC and ls1c RTC are not exactly the same.
> > >The former supports RTC interrupt, while the latter does not.
> > >So my suggestion is to leave the compatible string as it is in this patch.
> >
> > Just as a reminder, there are more than ls1b & c in the patch, lest we forget.
> > Also, fallback compatibles mean a compatible subset, not only that two devices are identical.
> > The interrupt is passed by the interrupts property.
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
