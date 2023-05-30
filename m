Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C39F7158C5
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 10:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjE3IjK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 04:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjE3IjJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 04:39:09 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C256CBF;
        Tue, 30 May 2023 01:39:07 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1685435946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2zMAQurx6j5eJt60qxcRl7LgyeTAElgXySavg4WXE30=;
        b=SG8cB3IBdwzYA1YrzK4sNPTknENv6L1BK234JvN/fQQ549/HLGQChEV4sUhCJ1OfSIuHwB
        UY2LunyjvHAALHHOctFLXIsKJo382RJgKzV2LYF7DC6Hscn302ONMCx7nItzz8dMtUJXmP
        KxPn1HdKwizWQwEuZXWG8vbY1fVZ3CC6QkSccNwF954wKOTmB/TabNwn70HnOeoq8+97Z7
        fbwVpoOxKxA8ViT42ASJIRYvg1Nk3EJEx58PvIQfCG5wlKtOC8H3pvzIoLPT9SjVvRrc4D
        wtp/9VQXAtRfI+Q9Efu50UCqrzgcPQTtEOpncpQiQCPrO0WOK9bC58eDtjr9Mg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DBF8C0004;
        Tue, 30 May 2023 08:39:03 +0000 (UTC)
Date:   Tue, 30 May 2023 10:39:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V4 2/5] rtc: Remove the Loongson-1 RTC driver
Message-ID: <20230530083902f09c6b43@mail.local>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <98fc717871d3a39b18ad1a26780d0d2cf1fa0896.1684983279.git.zhoubinbin@loongson.cn>
 <2f883bad-2f8e-ef03-fc3f-c13980fb1536@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f883bad-2f8e-ef03-fc3f-c13980fb1536@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/05/2023 10:08:22+0200, Krzysztof Kozlowski wrote:
> On 25/05/2023 14:55, Binbin Zhou wrote:
> > Remove the ls1x-rtc driver as it is obsolete. We will continue to
> > support the ls1x RTC in the upcoming Loongson unified RTC driver
> > rtc-loongson.
> > 
> > Cc: Keguang Zhang <keguang.zhang@gmail.com>
> > Cc: zhao zhang <zhzhl555@gmail.com>
> > Cc: Yang Ling <gnaygnil@gmail.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/rtc/Kconfig    |  10 ---
> >  drivers/rtc/Makefile   |   1 -
> >  drivers/rtc/rtc-ls1x.c | 192 -----------------------------------------
> >  3 files changed, 203 deletions(-)
> 
> Removal in one commit and adding a new driver in second is not what we
> usually do. We expect code to be developed and to evolve.
> 

I'm fine with that, even if unusual.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
