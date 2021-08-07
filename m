Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D5F3E32DD
	for <lists+linux-mips@lfdr.de>; Sat,  7 Aug 2021 05:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhHGDGi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Aug 2021 23:06:38 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:43887 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230053AbhHGDGi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Aug 2021 23:06:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id DAFAE580BAE;
        Fri,  6 Aug 2021 23:06:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 06 Aug 2021 23:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=l
        5p2iTVXgItyA1T83tXDocQvr6XRmME6ifZj532EGj0=; b=ljQo8afraSpQx/8id
        7CfoqpVwr8D62kyoo+MmGoVRUnd7/sVr39no7ZD9FxDbScJUYMDGilPpIYuoeGRE
        iViJVfbVuJKClJbc70CdAd0Pm4Q44wngl36n8hmh37pPVHmCYNkONNEEQ7ziQpTI
        Fy9yEX42caoqcnF+WaK6B0Roead9Bah5qBw/eBadsFvdbwgNjMrC7ELdaAi4FMho
        tkBEtqbhDgWIUqb6ncXXqWTVd2NkVAUxVZuX6r9u9+xpGcGAi/oLiAa9jx5d4szu
        biGrYy2p3ZizaZ8nInGLezYBQQ3Q4ISWs+MX6SGqe8fP2pYeBUykmOYXfNev2wFI
        9FHmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=l5p2iTVXgItyA1T83tXDocQvr6XRmME6ifZj532EG
        j0=; b=MAEjfhjWn1aASr/8ov+9UITytKgDUETYzwVTeyrVRxcghYJZVFked+5Xe
        DPdIY+uNqUnb8vc+FkoeMalFSigI56uKsJneK1USC4coefv7enUjqiOyFGhPxl7d
        apeOTAlJ5dIIQoBHXPwc1j6I6AFjJo3uNokf56XDguP7vAVP3l6JLqm90KrqWwyP
        ptmBucuPiesKznlC2iBXkZAmwzcas8JIvha/3VA2gv0quYES1Cd09DIqba+p8IGf
        GiD1Uh1nXiIbOZ+yiRaDsatg1A7Keap3+ZV0WqI3AquKY0nHZvZeFOmxuNpAq6+m
        Tp1ThMWa4YcFEc9QmEMkKo6IB55xw==
X-ME-Sender: <xms:q_gNYXcRaawms8kHh0Fhufa6Rg_lbEyhojb71ihthde-eDRrb1yzxQ>
    <xme:q_gNYdN1F2Lg1rO_Me241_I9Ht2Ng7LokAo4dw_6ll_-x7np0wvFRlSKGxrCy-kzH
    kuOtEDq-nI4bBoQkB0>
X-ME-Received: <xmr:q_gNYQgVvWe-sUDHlTZgTw9w7iWEW1ZeG-bI_ko2LxWpOO35NeOKQRRxDzVfmdSMUlDxTUSKh08L6XB7Qpw4a1HmayXH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedvgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekre
    dttdeftfenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefheefudeugfeugeejtd
    fhuedujeekvddvhfeludfhvdektdeileeikefghfetvdenucffohhmrghinheptddurdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjh
    hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:q_gNYY-QqqTmDgQMAnUiOh5h1mz-9gtQT3SStK--fIjPSwwq-Y2bOA>
    <xmx:q_gNYTvLl9zeL7EGfx2USxvw7Fxk4rr9vLeUC1e18cTYilUhcqhUZg>
    <xmx:q_gNYXEmg1J142dHKaUE_wPP8ilpddMI_uTDpVNVqWELobG5_IbvDg>
    <xmx:rPgNYRLzUGI2CGhop4vWf8WG9tid9-nQmmjW6SgEsD80URuttonnJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 23:06:15 -0400 (EDT)
Subject: Re: [PATCH v4 0/9] MIPS: Migrate pistachio to generic kernel
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1bb80cdf-f7d5-f99f-a4f3-635552df916b@flygoat.com>
Date:   Sat, 7 Aug 2021 11:06:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/7/23 ÉÏÎç10:25, Jiaxun Yang Ð´µÀ:
> I'm lucky enough to get a Creator CI40 board from dusts.
> This patchset move it to gerneic kernel to reduce maintenance burden.
> It have been tested with SD Card boot.

Hi Thomas,

For the series, the pinctrl one have been applied by subsystem 
maintainer and
rests have been acked by subsystem maintainers, could you please apply them
to MIPS tree?

Thanks.

- Jiaxun

>
> --
> v2: Minor fixes
> v3: Typo fixes and 0day testbot warning fix (Thanks to Sergei!)
> v4: 01.org warning fix
>
> Jiaxun Yang (9):
>    MIPS: generic: Allow generating FIT image for Marduk board
>    MIPS: DTS: Pistachio add missing cpc and cdmm
>    clk: pistachio: Make it selectable for generic MIPS kernel
>    clocksource/drivers/pistachio: Make it selectable for MIPS
>    phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
>    pinctrl: pistachio: Make it as an option
>    MIPS: config: generic: Add config for Marduk board
>    MIPS: Retire MACH_PISTACHIO
>    MIPS: Make a alias for pistachio_defconfig
>
>   arch/mips/Kbuild.platforms                    |   1 -
>   arch/mips/Kconfig                             |  30 --
>   arch/mips/Makefile                            |   3 +
>   arch/mips/boot/dts/Makefile                   |   2 +-
>   arch/mips/boot/dts/img/Makefile               |   3 +-
>   arch/mips/boot/dts/img/pistachio.dtsi         |  10 +
>   arch/mips/configs/generic/board-marduk.config |  53 +++
>   arch/mips/configs/pistachio_defconfig         | 316 ------------------
>   arch/mips/generic/Kconfig                     |   6 +
>   arch/mips/generic/Platform                    |   1 +
>   arch/mips/generic/board-marduk.its.S          |  22 ++
>   arch/mips/pistachio/Kconfig                   |  14 -
>   arch/mips/pistachio/Makefile                  |   2 -
>   arch/mips/pistachio/Platform                  |   6 -
>   arch/mips/pistachio/init.c                    | 125 -------
>   arch/mips/pistachio/irq.c                     |  24 --
>   arch/mips/pistachio/time.c                    |  55 ---
>   drivers/clk/Kconfig                           |   1 +
>   drivers/clk/Makefile                          |   2 +-
>   drivers/clk/pistachio/Kconfig                 |   8 +
>   drivers/clocksource/Kconfig                   |   3 +-
>   drivers/phy/Kconfig                           |   2 +-
>   drivers/pinctrl/Kconfig                       |   5 +-
>   23 files changed, 114 insertions(+), 580 deletions(-)
>   create mode 100644 arch/mips/configs/generic/board-marduk.config
>   delete mode 100644 arch/mips/configs/pistachio_defconfig
>   create mode 100644 arch/mips/generic/board-marduk.its.S
>   delete mode 100644 arch/mips/pistachio/Kconfig
>   delete mode 100644 arch/mips/pistachio/Makefile
>   delete mode 100644 arch/mips/pistachio/Platform
>   delete mode 100644 arch/mips/pistachio/init.c
>   delete mode 100644 arch/mips/pistachio/irq.c
>   delete mode 100644 arch/mips/pistachio/time.c
>   create mode 100644 drivers/clk/pistachio/Kconfig
>

