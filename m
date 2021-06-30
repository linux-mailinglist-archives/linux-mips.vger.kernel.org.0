Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB13B7ED3
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 10:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbhF3IW7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Jun 2021 04:22:59 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51567 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232954AbhF3IW6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 04:22:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id E320B32008FD;
        Wed, 30 Jun 2021 04:20:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 30 Jun 2021 04:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
        rng5vQ9xEhy/55sVheiFX6YMfwmRBkRiTkkgCUzn8U=; b=Che3GtGF7eRc2l+6V
        ncGzCc3hO2sSS0G1q8OAh85sd68wB/HG78x62a7b0PYmNskiEfCXjtMEXC7dNYRX
        wJONVHLzX9LQr6I+rWSNRva6g63waNkf7zcf99CZdGfo5lnv2Yf06RAaetJOeoZZ
        ViPSZfnUlazMknnMVpLNaGz+lFSmGbKWGbg17NefGWeL1hi5OoDcw8ipxF/cERbf
        Ecjw8/m+4E177k6qmAxKLMc7DQbC//5AZpvEB04dqe8tK5CFRvMS2uoDu5sw2V5v
        TWmIJhBKJ7v8UarsHCQlduCoJ9DwCkXCQwEflwA3M908tmYVXOufd/cxxjDn1+uJ
        vZiDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Drng5vQ9xEhy/55sVheiFX6YMfwmRBkRiTkkgCUzn
        8U=; b=OlcCJDLjIWiScaPtav06jT7GMaJ2rNd6CD0XfwSCqSC2GaWmYs9TaWQX9
        luerQjBEMLssja1v39ibtpl329vFteEjg2KqgG4FWoxlJ6gopHtQd9BDjvum0NX7
        T53oGRT39XKrWrotoanMJGuJAl5uKaZW1u10VpD2/oGAVGUeOCjfb6uknHEKEAvZ
        nPNhJdR+q1V/5Bmrrmum05dHEWo5ZKNXc56aNjxuDzXE4XATHEfs/CuPqxDx0tbV
        O8HWxM0QdY/8yomesydHldDcFzCUtnanLJEibvY/epdn0LLRoOqYWBb+b2kSpRrn
        UTRdkHffzqP0M4987CSJHQ+ndFqcw==
X-ME-Sender: <xms:SSncYCEUh_RJI4Arm3cmnIA5X_3p_qIVjT4-z58AlOXzGuWHqYJ5KQ>
    <xme:SSncYDVU--35g_dj1JgDybjz7oq3DAD-LD3X7jiz3wlZBSbun4Zd6s5P182asit_n
    2nuD2aSPbzOP3wy22Y>
X-ME-Received: <xmr:SSncYMLQ5q8SmtBPjzQAJzZ7WWbQy7XnGhSx1b8G6RlI-vzDj6QbyZ0jn6w3LNV87_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeivddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:SSncYMGakDguxokZLmaT1ew85TJlqWuQ9tYyDQrVVpb2QdCB_bKcOA>
    <xmx:SSncYIUOy0REUQmsWlDI_gdfhGBoRoo7BBOTwhPdaNhsUrmp-4ie2A>
    <xmx:SSncYPNIA_MrWD37TxyjjR4h67cBrXvRLFv3rQPCzNiBpsJO_wjREw>
    <xmx:SincYGwEPic1n3-JvPTiEhmPH3bsqOizGU2JawgZmTk4kC4RpY_p3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Jun 2021 04:20:23 -0400 (EDT)
Subject: Re: [PATCH v6 2/2] MIPS: Loongson64: DTS: Add pm block node for
 Loongson-2K1000
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210630065103.23665-1-zhangqing@loongson.cn>
 <20210630065103.23665-2-zhangqing@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a69323fd-c770-89e2-d3a7-a0807ad831af@flygoat.com>
Date:   Wed, 30 Jun 2021 16:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630065103.23665-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/6/30 14:51, Qing Zhang Ð´µÀ:
> The module is now supported, enable it.

Oh, you forgot binding document.

Thanks.

- Jiaxun

>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..8f469b623740 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -52,6 +52,11 @@ package0: bus@10000000 {
>   			0 0x40000000 0 0x40000000 0 0x40000000
>   			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
>   
> +		pm: power-controller@1fe07000 {
> +			compatible = "loongson,ls2k-pm";
> +			reg = <0 0x1fe07000 0 0x422>;
> +		};
> +
>   		liointc0: interrupt-controller@1fe11400 {
>   			compatible = "loongson,liointc-2.0";
>   			reg = <0 0x1fe11400 0 0x40>,
