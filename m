Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5CC4E43DF
	for <lists+linux-mips@lfdr.de>; Tue, 22 Mar 2022 17:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbiCVQIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Mar 2022 12:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238925AbiCVQIC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Mar 2022 12:08:02 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6440589CE8;
        Tue, 22 Mar 2022 09:06:34 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C5C443200A16;
        Tue, 22 Mar 2022 12:06:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 22 Mar 2022 12:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=njLfScwfSIsbRp
        wMMXOHvEwf47Gc3N9QuE3MOOyufO8=; b=mrSOWK9B2wHgPPy1DjT/rNR51S7XHT
        CkZ4vt2wVT5PXr3stz55S5GIETYKh6XAsh0YFBjz/R7Ytx9lrl31W84ccKHdPGbS
        OTzenxHaxJTbQ21k3XR9ibecctCZqlzw/G6Lkd+LZ3JO/+3Y4w9YY8BLLAI0Dv2y
        nOdhNkLl94o5RTUwRbQWAjxcSkewGZhPiDKZCnl0PNTrZQlGQXoN3oRyej41v6Sm
        4IxUFMLyY1YhVoT2/8BL1scF9z3sAVipc9m9wmiX3bI55VtFfxqzZ3hjF0idyFUQ
        KL8UzWfPvbV1BB+D40sDiOqJSCD+nTNarnJUG0yt2FjOaaJOmID01l/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=njLfScwfSIsbRpwMMXOHvEwf47Gc3N9QuE3MOOyuf
        O8=; b=T2z74KWnSjzmYsvP1FFaLsySkMOYkhg4dK5Hwn0Z7ZUogqIhBTfd+osc8
        u1lVrYcuSlGmWkdGao4yAmUYmh2GpPLAY+jCrEuRZbtLKWgOciulSywchyyYy1dr
        brKPp98QXd/3NNhAMfqNGFfcbF7SouTI8eGSd9MLYhK1jBeh7q087BQy1T7Jdlsd
        0V1SRFvKHEmSVGkrFHxP4/7sVzyQYT+eDPb4s7kT0R2y28WRaZatrLe01eOBsR30
        pG1QCeCurPaTj5TgE865iEzDMWXghyz3DrAGvFlKeqFXshwY1wTcB5B+dMdG0NNY
        ldOiOr6/UnmsBafFsjsOqDggP5tcQ==
X-ME-Sender: <xms:AfQ5YnSCAHTJqsAkcgC_Gk8HphAS02P0mHFSXDjvdqMeojxt46vAGQ>
    <xme:AfQ5YozfUfyZanc4v7379uYngHqaa96AR0bDm68oyx8r3i7kXE8ius3sA4lCqTdF6
    p7CoEASUdfPy4GSNlw>
X-ME-Received: <xmr:AfQ5Ys1OJHJYuq63v9YGmQmD4hoqy-3YYlQ7t76IHS_H_3HRT5JbAZ2f6_mc9YY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:AvQ5YnAnIeinxahWnfN-0m_a3Zif53vigXpLmye0-GlYbAndSNCURg>
    <xmx:AvQ5YggvEFfvOnO72nGuBKigfQl2fTqJE4VfdT4z-RlZyR-slW5Ggg>
    <xmx:AvQ5YrrSa2iP10W6NrEzz42nyPie965Z11_ec1NeMvkAs0_-HWxDRQ>
    <xmx:BfQ5YrTmy1c9Rg6aGLAQ6QcT2ssLU_tT9xeyFByrQ6xHA6u4lKjP-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 12:06:23 -0400 (EDT)
Message-ID: <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
Date:   Tue, 22 Mar 2022 16:06:21 +0000
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
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2022/3/22 13:38, Sui Jingfeng 写道:
>
> On 2022/3/22 21:05, Jiaxun Yang wrote:
>>
>>
>> 在 2022/3/21 16:29, Sui Jingfeng 写道:
>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>
>>> The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
>>> mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe GEN2 x8 slot,
>>> therefore can play with discrete graphics card.
>>
>> Hi Jingfeng,
>>
>> As we've discussed before if you are going to introduce new dts then 
>> you *MUST*
>> include it in makefile and wire it up in code.
>>
>> A dts file doing nothing lying in the tree is just suspicious.
>>
>> Thanks.
>> - Jiaxun
>>
> Hi, Jiaxun,
>
> I know what you means, but it is the kernel side developer's job.
> I am just a naive graphic driver developer,I can not care so much.
> Below is my private patch which can be used to built specific dts
> into the linux kernel, therefore make the verification easier.
Hi Jingfeng,

In kernel world we take care all the stuff we touched ourself :-)

If you are not confident with them please drop those DTS from the patchset
besides the generic one. I can do the rest for you after getting this 
set merged.

Thanks.
- Jiaxun

