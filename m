Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC6373D541
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jun 2023 01:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjFYXUM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jun 2023 19:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjFYXUL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jun 2023 19:20:11 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074F9E48;
        Sun, 25 Jun 2023 16:20:07 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687735206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wbt8/LPyP1QYCii04eX43/1rWu6vVqxs0wktrfwj45w=;
        b=khC7XwlsJPiQDFeqHoN1xgYMLC2qb0R9ENHYHTQ8XexNK22rrHJHbN8aSw6Z6CtEU13eCt
        pt1ewXoIIqFyNDdiLWzxThwO0dVEu5/3uYx0pZJ4h4HZEZHNLCHIeQB9Mou8e7+0CmdC0G
        KnrdU8YF31vJwmvwRHzc1ZtpO01YDcLULHsY7BDCgl6ajWew9eGafOzRy5832w3JthkYp0
        1e1deFjCO02fz+vMGcFJ+ccA+zuXoLHfFo75xjWAbxtDWWOkICQ7Za7fIS8a9t1+AaF1rb
        c0tp6M8E2WfRhbY0RmIRCn/3RxNZRjP5SpjraHLcEYxyM09155uBV2N2hNTGkQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C33C3240002;
        Sun, 25 Jun 2023 23:20:03 +0000 (UTC)
Date:   Mon, 26 Jun 2023 01:20:03 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>, Yang Ling <gnaygnil@gmail.com>
Subject: Re: (subset) [PATCH V5 0/5] Add rtc driver for the Loongson family
 chips
Message-ID: <168773516435.124871.682738752755283483.b4-ty@bootlin.com>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1685693501.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On Fri, 02 Jun 2023 17:50:19 +0800, Binbin Zhou wrote:
> The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> released five versions of patchset before, and all related mail records
> are shown below if you are interested:
> 
> https://lore.kernel.org/all/?q=ls2x-rtc
> 
> In this series of patches, based on the code above, I have added the
> following support:
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
      commit: 487ef32caebe010f0ff0f17267230ebaf2177e67
[2/5] rtc: Remove the Loongson-1 RTC driver
      commit: 9fb23090658adbd7f8f44bf5c38aa3fc4b1699bd
[3/5] rtc: Add rtc driver for the Loongson family chips
      commit: 1b733a9ebc3d8011ca66ec6ff17f55a440358794

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
