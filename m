Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9004E4AEA
	for <lists+linux-mips@lfdr.de>; Wed, 23 Mar 2022 03:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbiCWCbi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Mar 2022 22:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiCWCbh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Mar 2022 22:31:37 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB5566ACD;
        Tue, 22 Mar 2022 19:30:08 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2E9FD580273;
        Tue, 22 Mar 2022 22:30:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 22 Mar 2022 22:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=z448nDq6oePU/m
        QSH0x3hhq/M5ZKeqSdorKIcUafQmQ=; b=1cirzLxzmbufXSFnaOvbvxX7mx3EKS
        HVMeAJmDODCXBlm3DNszMIFlYWGhM96QRaDTs/MkRYWv66e8EoEHUIRQkS3x0oeI
        TE85TQOHjaYHQo4YFV9p4U/io7z+V7Lo4X+oikO6P+ijiiC/I+bxXC+VNIKoFBNr
        WLPpTX/drRez0pQvRhq7GzwDPfi0njrPNvi4vXgAOW8cUMhkbjVwmtUyYOWqCUyV
        xQXrpfhawIr0b7sHAmXrd+LHDtUCVvyiQBV/qFuLrWoyumfcjEJRoN6eXnVlKpgw
        hmCLRe+fscTRGdiKgLxLWRlzl7k66u7YXyKJ6s0ObYQ7ifEryfIfjS/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=z448nDq6oePU/mQSH0x3hhq/M5ZKeqSdorKIcUafQ
        mQ=; b=gfma0HoXMMYkAMu/STYjCpy0yb58vNWXI0wyrB8cvOHQqcQn5fU9fHkil
        o086v7oKaVrI7E9PzOjcW6gCJfBh7ua2GM7RaQS14AX2zirt47kI5+Vuz4QFBwHt
        SVCRiyWbCmhyQiOTrxRac5LcYr1rj1MXMaFPR8JefGc7Aw/IjgX+YMRoYbXmEvYj
        79NpP1pS3t1qRQqZqNQzMjD6CeTryzImTU3UxIuLM+30X9QwgAgxcjqbyejOJPG/
        xiuNeCU5FxaY35RbrF7B9vOhPyHIhFFkapOwiG9M5Nd5hfluMFVsmmo9ewtrbvI+
        LHe9syJFsAIjtj6lUuBbrM6le7k4w==
X-ME-Sender: <xms:LIY6Ym0BhdV2sC2kSQradoXRNqtzb2kC3P7dthRcZ_sX5LfP0t9mMg>
    <xme:LIY6YpGlW4edpX0xA6gKgjm7DBYZvl2oiUyBR31Hg7kNT-YFn2A5To-3mggMhLj2O
    2kfF1YugkAlJWEk6VA>
X-ME-Received: <xmr:LIY6Yu4c0k8IVs35qeZZnvNXWlHPLP2bHAR_BwnzeGvRQYNiPD5rsGNFkuqHh8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegiedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:LIY6Yn2RvxaO0WAw_nQ_zj3S2natVIJvHXJ0QUVibx__HL5VZ5W5yA>
    <xmx:LIY6YpEEx42Ukfd3i88up_UNwg5micsJX_zWmfaty-VTdKkab54Meg>
    <xmx:LIY6Yg_UaaAApUaapt0j_xI1k0l191Q4Whp8TqPgmlGMkFiUAORRsg>
    <xmx:LoY6YuuZ_u5thrRte02ss6sakFKjscOSU7gZZSG7uHUymaaBFlsNRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 22:30:01 -0400 (EDT)
Message-ID: <87d4f869-2ae8-f8d3-a55f-1a563cb21115@flygoat.com>
Date:   Wed, 23 Mar 2022 02:29:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
Content-Language: en-GB
To:     Sui Jingfeng <15330273260@189.cn>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        chenhuacai@kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        liyi@loongson.cn
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2022/3/23 1:53, Sui Jingfeng 写道:
> Hi, Jiaxun
>
> Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
> How does the kernel get the dtb is another big issue, either from 
> built-in
> dtb or pass from the firmware(pmon and uefi etc). This should be
> solved with another patch carefully. Providing board specific dts
> helps to code review, it helps reviewers understand that there are
> variant boards and have to be express with different OF graph.
Hi,

I insist my taste on those code. If the only intention is to demonstrate
the usage of the driver then please just leave them in dt document
or commit message.

>
> Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
> Suppose loongson have 1000+ different board, do you want built all
> of them into vmlinuz?
Note that we are supporting all those boards on "platform" bias. Which
means if they share similar design then they will use the same DTS.
If we have a new design then unfortunately our kernel binary must grow.

For those who intended to build a size-optimized kernel they will be
able to disable unused DTS in Kconfig.

If you want to blame somebody for the problem then please don't
blame us. We tried very hard to fit all those stuff into kernel's model
of devices. You should blame those who did the initial design of
Loongson's boot interface that failed to introduce a proper way
to describe the platform.

>
> Besides, ls7a1000 and ls2k1000 lack a i2c driver, gpio driver,
> pwm driver, clk driver, can you pay more attention to salve those
> problems, please ?
Are you trying to make a TODO list for your colleague :-)

We , community developers, don't owe you anything. So please
don't expect anything from us. I lost access to most Loongson
devices since I'm currently study abroad, but I'm determined to
keep platform code in a good shape. That's my duty as a maintainer.

Thanks.
- Jiaxun
