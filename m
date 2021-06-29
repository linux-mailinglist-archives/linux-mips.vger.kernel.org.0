Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05FE3B6CF4
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 05:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhF2D1e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 23:27:34 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34087 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231717AbhF2D1e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 23:27:34 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 706043200906;
        Mon, 28 Jun 2021 23:25:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 28 Jun 2021 23:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=C
        48dFdNJ496G0g8Z8y2ldEPFtgm21ziIsTq8b2xD0Ds=; b=VMmYsvfsQb1CxwC2A
        20INAg3dfKaCrgCG/mIErzFMTsNYr0UZsBg2PC6Pjx37xtg0Fw8Nz5VSRzM3jiDY
        QNBHtddPbxG+4rAoY8zbK4a+h0qDWt+akNVn6HVGzJV14Xr7/Cd0G2lt1HxwMQDB
        w5UKqRCWvT1QUiI0SICMZDQBSaGM41egy+TtGbUFb+JAP8Ik3FMvHAiRGbgamUVW
        DfW3Lxpks6g7xIir3tK3Q2QYCmb/2MgvPAEVbgaA9gPithGbu7grgvj2Sn95HyMs
        I4JDefYe8EAa/aT3RVixgUCv9WCbrV9CBngD3YzGT1ShGIfcuqggGteA1rm0XDEB
        DkDSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=C48dFdNJ496G0g8Z8y2ldEPFtgm21ziIsTq8b2xD0
        Ds=; b=mw4rfn5c4AHC61UxUPnp3IVOL3p0MzhLl1vFTprs+Mk8iZyx1Z46OpqIY
        2ymZEXXoNbHtrPgJMfmGRrxRmfCGgaWIL37FHNq5NG/mTynW3q40ioo007GMycbL
        RGvavFryBSVwZsi0OcsNu96nul3m8N1ZBUApGOPVMnRmBzvrPpv2pvTSJSXraWNU
        gk1n04lD37ew0pEb/2dQIrSLemKn8ujsaDjXfdbWTI6hVlwrD4PCk7Ht92Sx+hYJ
        UfLAUAOIG4dFyy/RSEHS3SyfkBEMWRM5lvA3a1ifChU8v1wsJXrbcLY5Y472LoG3
        e+tfgeyOU8D1OaPniIhvResRblrhQ==
X-ME-Sender: <xms:kpLaYDjkmfNVzGeBxPqzRsS4hR8VT9436yDeuB7Wjvcwyl7YXuKK_w>
    <xme:kpLaYACYJjdYKE24hzJLnsPhvMNh9Kwpug_1oe641tRoqAPPV-zBui1-mAhluo1IS
    J3bfZK4MU4gv2XX_DA>
X-ME-Received: <xmr:kpLaYDEQXz8rSrnrt8A1_8aNnu_JLDIreNZh3snFsUgXAg5sTeOd1cOs19P1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehhedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:kpLaYARXFRRHVthZTUBM_TEn3KueCOkD1MbYCcdrVQZ6hMu1i82f8g>
    <xmx:kpLaYAxpN6Vrt4kRcN6dzAQ01gCDMUkc5_1CBuy-PxXcviMY0wm4Tg>
    <xmx:kpLaYG4e7-AvtJHVYq2YOPZqLuWCsa0FXnI8xMAMAGSH55heNSEAOQ>
    <xmx:k5LaYM-jRyBDmoi4rF3eN0Fw36tQmcGOhA7h4CUAl4YFiQjawR2L5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 23:25:04 -0400 (EDT)
Subject: Re: [PATCH v4 3/6] MIPS: Loongson64: DTS: Add RTC support to LS7A
To:     WANG Xuerui <git@xen0n.name>, linux-rtc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210628164552.1006079-1-git@xen0n.name>
 <20210628164552.1006079-4-git@xen0n.name>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c55d1054-8536-a786-9687-da069faf9d1d@flygoat.com>
Date:   Tue, 29 Jun 2021 11:25:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628164552.1006079-4-git@xen0n.name>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/6/29 ÉÏÎç12:45, WANG Xuerui Ð´µÀ:
> The LS7A RTC module is now supported, enable it.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> index 2f45fce2cdc4..82035de4774f 100644
> --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> @@ -19,6 +19,11 @@ pic: interrupt-controller@10000000 {
>   			#interrupt-cells = <2>;
>   		};
>   
> +		rtc0: rtc@100d0100 {
> +			compatible = "loongson,ls2x-rtc";
> +			reg = <0 0x100d0100 0 0x78>;
> +		};
> +
>   		ls7a_uart0: serial@10080000 {
>   			compatible = "ns16550a";
>   			reg = <0 0x10080000 0 0x100>;

