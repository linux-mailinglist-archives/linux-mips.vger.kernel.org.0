Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66DF4B909C
	for <lists+linux-mips@lfdr.de>; Wed, 16 Feb 2022 19:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbiBPSox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Feb 2022 13:44:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237819AbiBPSov (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Feb 2022 13:44:51 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1DC222DDF;
        Wed, 16 Feb 2022 10:44:37 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D0C8A580DEA;
        Wed, 16 Feb 2022 13:44:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 16 Feb 2022 13:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; bh=UtEJAftqPvQNvO
        Clej1+Mse1oLVwQ9J15EJX/K1D8M8=; b=qn+nJoBEadhFokijMOvs8dp/xSXrDL
        Ouq3uUnCeqyyr31cvilhnokrTmMQoYWgDdVeGCOqx4+eDGBSfEssIhgf5uS364nE
        fAsvdLL20tdBOujUABUrYV7Rt8immg8/wTr0U4DgQPIG4WnczSgGQCXoXo79/IHY
        np8W2ohmCH8qKmI83LGOT+jy62rvQik8n+bRMm5sxamgEtRUCOjQA0fMk0UmmPkn
        WK+6cHruo+fama2NkBphGvR3Ob7PuNaMCUsGjnhXcXJTjKnpzhTYjzXfD9EIrAY5
        +vcU84tdcTgld+8waKEWdaDYE2ojG6vdQPlV1GmcqueVvh8hFcLwPvbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=UtEJAftqPvQNvOClej1+Mse1oLVwQ9J15EJX/K1D8
        M8=; b=fYdyp7ZQB3WO+ba4hZ3UyqxxIbrIaYc+UwEkkFxTahCB/5qtog9kngDfo
        0J9md1jPgpIXvTVDMh0/4fiuruBMr9GlkIgdzZBgnnsQ+dkvK+9PF8yXGbSn3O8t
        q2/1Gh+eJPxSFScqf7phHiZmm9tskkQCc4TNhecXMbzdN42Zk6OfKVtYXigjBvUk
        bHMtH9oVJDWLOQ0dmiN24DejDEfchF5tOfTCDAOKX1PbbFmMgtVlQFg+tdFg7Qjb
        MrCZ7f3tkcFJ2jhD0Aug+Lo/0VYRYUXnVuKWeK80LCUEECtqWbHWt87LTtFNJfN3
        okOkiyt3a7+GU8ijCEPZru13YpE/w==
X-ME-Sender: <xms:EEYNYiEV39KMAdGPBQX_eK1uXGVB8BOUoLg_ZBbm-zgX3oYunFYO6Q>
    <xme:EEYNYjXBWZbFRFceIL8Glf76OtMxPUAbnDJJdmju2cC7DfoXrcqhJBmxJnxJXS2Qy
    z1xVoljJ1WPYEfReag>
X-ME-Received: <xmr:EEYNYsI5CbLwmaTQnJpeRL4rulUP0T089uhjcMoZMPP0oqhxR-p2JzViHfgvtcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EEYNYsFPjdfP60uQp6VNa4CSPkBmd3Bq7KKrkb84cwJZn3whHr685w>
    <xmx:EEYNYoUfAt3IWJxvpXdHSYp5NqDHcpk744YBvAnU8YoU8lAtLY_tbw>
    <xmx:EEYNYvOFu-e2Jl0r-7JRuqj9JHK3K3QojzGVJkD5csVdq9u-EVfjaw>
    <xmx:EkYNYq1vKHtpVLUi9JW-_GQLU_K-f6D-6xhZlUFFMbLKDslNhO8Hkg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 13:44:29 -0500 (EST)
Message-ID: <76e3d3f2-c457-2940-10ea-834f13e526cb@flygoat.com>
Date:   Wed, 16 Feb 2022 18:44:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v8 2/3] MIPS: Loongson64: dts: update the display
 controller device node
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
        Qing Zhang <zhangqing@loongson.cn>, Li Yi <liyi@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220216181712.1493400-1-15330273260@189.cn>
 <20220216181712.1493400-3-15330273260@189.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220216181712.1493400-3-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2022/2/16 18:17, Sui Jingfeng 写道:
> From: suijingfeng <suijingfeng@loongson.cn>
>
> The display controller is a pci device, its PCI vendor id is 0x0014
> its PCI device id is 0x7a06.
>
> 1) In order to let the lsdc kms driver to know which chip the DC is
>     contained in, we add different compatible for different chip.
>
> 2) Add display controller device node for ls2k1000 SoC
>
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>   .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
>   .../display/loongson/loongson-drm.txt         |  16 +++
^ Is loongson-drm.txt intentional?
It seems irrelevant....

Thanks.
>   .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 ++
>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
>   4 files changed, 140 insertions(+), 5 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
[...]
- Jiaxun
