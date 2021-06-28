Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F0B3B5674
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 03:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhF1BI5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 21:08:57 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:33027 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231706AbhF1BI4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 21:08:56 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id DF2062B009B0;
        Sun, 27 Jun 2021 21:06:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 27 Jun 2021 21:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=P
        RaswZ5qlI2jc+vhwIg6RbL8e19UYG11rnfWNNUN5Ww=; b=rtQqygzsVWIKTM2Wz
        nbuW2cVd4BkWO+d+ygZx1wQmuHM40AM87yZ+im/mRkIP3Qqb3Qi7ZruE1VpFzflN
        tOqNi3bkH4BaHixbYOprtxkwU3hPRxJX2S0rVlw0MiAVMKvfWWMVWEzk+xorXqln
        w+JaXqSm4A2yOTu0LWZY+kjUrM1wGmxPtlNXREp9LoXRHW9qK2MfYAoeVYkccKyf
        PoL81hG4QuWSjAk6xmx/j3MBOvMY9NRXa9dkjr4pw7hOnQ4riGsReDEMLv8NG9iX
        D31qD545RTGEK2wFlGXXQlOGpExl88oh2jOJ/ro0WiUCF5n8r2TIpMmJ7P8q4juh
        DQVsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=PRaswZ5qlI2jc+vhwIg6RbL8e19UYG11rnfWNNUN5
        Ww=; b=YhAaq37YXqoddC48WCc2HRI74KjeXC9Aorc+wM7n7h+r1EARlSTPsHc9q
        nRzg1HiB9ZYD7YRTwqP3Hb7j9vMGqpufBykHcZBym5vqS47w7GBYIf5EeCdNOdH9
        LWzcHtoOm+usjGvfGGD523HUU912K15h2pM3AKqp6SUextoSrGe/jC0HPAPruBD9
        YsKIfpeWTpZe9VSLbLvvHREF1lUa8rxdv398bjGDUGt9Hp06tgatYorngH3kqznQ
        28GL5FNR8QGXr4qLA24oH3CSxkN0shRYUFwXQHFXzavv5J0c1r0zZdPpEAgRmuZ2
        SZrqjSjq/jzvIDwRCrkWUfrU3Dj1Q==
X-ME-Sender: <xms:lSDZYGvriqTvXG3CrplKdvcKu2uyywvAHxb-f3Uhk91xlUL6AK1vTw>
    <xme:lSDZYLd6QvdmJW5F4Ldy5_n3_EBQTVqxSXFCyzDkuNFAEH2uH0efUahRuNbOA5eun
    zO4Ueu19nDheelbiPQ>
X-ME-Received: <xmr:lSDZYBwCo8uePpYDkaG2R4OzF_sDQwA6eHFYi5hPAq9qgQD-gabLvwBrA1PKoHoG0qwpQ8j2QoZ2C4h_g-da_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:lSDZYBN6AKcIptkpjKqi-N-KsPj7ml_X6Oq02BikkZH0AgSRo1OcTg>
    <xmx:lSDZYG_QqMifRz3vMX8KD5A5ROHC4C3j_kypzwmU6cSX-W3JuvWy9w>
    <xmx:lSDZYJUVXwTZBVtyASTpLZw5BseZlJyHUWbb8A8Y3WgtYhl0oRC8ow>
    <xmx:liDZYH1cMOcmwy2L0U6wPT_c8VAsjp0DaKUTxZ9DaAlz5S7MBiZPZSpdaDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 21:06:25 -0400 (EDT)
Subject: Re: [PATCH 3/9] clk: pistachio: Make it selectable for generic MIPS
 kernel
To:     Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
 <20210627045631.2882-4-jiaxun.yang@flygoat.com>
 <162483712923.3259633.15640278024587375157@swboyd.mtv.corp.google.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <45a330c0-7b4d-d569-51eb-3eac8f53512a@flygoat.com>
Date:   Mon, 28 Jun 2021 09:06:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162483712923.3259633.15640278024587375157@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/6/28 上午7:38, Stephen Boyd 写道:
> Quoting Jiaxun Yang (2021-06-26 21:56:25)
>> diff --git a/drivers/clk/pistachio/Kconfig b/drivers/clk/pistachio/Kconfig
>> new file mode 100644
>> index 000000000000..efb7a7f45259
>> --- /dev/null
>> +++ b/drivers/clk/pistachio/Kconfig
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config COMMON_CLK_PISTACHIO
>> +       bool "Support for IMG Pistachio SoC clock controllers"
>> +       depends on MIPS
> Is anything MIPS specific? Or can this be
>
> 	depends on MIPS || COMPILE_TEST

No there are nothing MIPS specific.

Will fix in next revision.

Thanks.

- Jiaxun

>
>
>> +       help
>> +         Support for the IMG Pistachio SoC clock controller.
>> +         Say Y if you want to include clock support.
>> \ No newline at end of file
>> -- 
>> 2.32.0
>>
