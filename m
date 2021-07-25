Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466233D4B09
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 04:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhGYCIz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 22:08:55 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35719 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbhGYCIy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 22:08:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id E91192B0117C;
        Sat, 24 Jul 2021 22:49:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 24 Jul 2021 22:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=0
        YArzRMEkZVJA7cx4IMbm2POjscEV83qSQ0fdLGzAw0=; b=saY3xF7HzgMi/nVhI
        F1/BAx64jTMHVxQpeOSLKh5TO9UvwCXrFxKcNWvd5Qj8OXQNBxnhkA7Grd5Z7S1K
        s9xstLG1mbM4y7MIRwMaqCV+PzSoQWBh2fq/4r6qHx3rWuuCDpPGfOly6dO9ObWQ
        N2u5VMbAh96WlWJMWAaWOw688LTlTdoz/Rwi44O+lTfR+XZA7409Lvi0JnXeJkOJ
        doJU0ROIazWsE2H6kM7ZcWFG52e1f9pDn6+9BtKdj8tDMdrG95Ww93hrTgi8LpSj
        efsm5gtOr8rKjq+3VWH0z14K2V9wiIK1OaIXDqAyPRprsEl7KjVSlSEipGqtV/PV
        QK2lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=0YArzRMEkZVJA7cx4IMbm2POjscEV83qSQ0fdLGzA
        w0=; b=COx2CF2PAKRb5oVFOhg9pjeu6TelQj1VStflNVvGSDlCKKesfZdXRED5P
        bzlr2pCqTWyBddhsriVxMPR9NWTFUQpFe+RnpYcJhDcpSBvntOXMutEAcXDxHMn8
        /RQkwNubMrjK7JsKyaKtCyh/uQyqv2pZVBtuTTSvZyUokqEi2RLvevT1MD07Tl5G
        P11KdeWutz5+zyQwMojrdrw9xylfgbv+JUdE7XtmILugwWHZhNJ+2d6KZ8HX3DAE
        h7fmUkSHVBo19xvXqONn68TFpAiEPGeA4QrohhSCJI1Y9H5RH1hSRmCkr+cv7xyz
        hALh7PLuDZSIY6mpCg7QTYQK20c6A==
X-ME-Sender: <xms:M9H8YDK8fYYcYnt64PUkhbYpnqBZrLA6JCS4fQaPrAl397GMGUt0UQ>
    <xme:M9H8YHIprFy81vo8iLnWCz9JAUZJ-tGcPDZlKuBcxLozMeHKnO7ghPampD1PbBizA
    GkLDPTwMECoeFu1lww>
X-ME-Received: <xmr:M9H8YLtpAivUe_UbBzp3pb6KqThR-rfmd5yiMavURt30gsVXxuA4O39_vOQlfeDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgedugdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:M9H8YMZyTGJrzxG5R33fZPERdX3k1bvx0lm5x6_D9podaM1RYDJQEQ>
    <xmx:M9H8YKaGdkjl__1vI6d8qqflWKE-vyOxBGBEW1dxfvtCdDH4HUfW9w>
    <xmx:M9H8YAAVX-29Dj75B7UKw_9uQ9F8xaGwKEgxRKgYd7F55PmH25wwQw>
    <xmx:NNH8YAnRG-3WFnv40ljg0az6dd3hWEIHVGcAMvp_IB4DAZpKhtVIgbYlrrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jul 2021 22:49:19 -0400 (EDT)
Subject: Re: [PATCH 6/9] pinctrl: pistachio: Make it as a option
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
 <20210627045631.2882-7-jiaxun.yang@flygoat.com>
 <CACRpkdZkvSg___ZxdE639SMbTs5rJbjHBq-HkTCuv0e645Rssg@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c7de97c3-196b-6bc3-a8b1-d6c6e6ab583d@flygoat.com>
Date:   Sun, 25 Jul 2021 10:49:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZkvSg___ZxdE639SMbTs5rJbjHBq-HkTCuv0e645Rssg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/7/24 上午12:13, Linus Walleij 写道:
> On Sun, Jun 27, 2021 at 6:57 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>> So it will be avilable for generic MIPS kernel.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Is this solved, or should I apply this patch?

I guess so, btw I think it should go via MIPS tree to avoid troubles.

Thanks.

- Jiaxun


>
> Yours,
> Linus Walleij
