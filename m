Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FD8408A32
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 13:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239489AbhIMLau (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 07:30:50 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38985 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239238AbhIMLat (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 07:30:49 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2C1AB580EAE;
        Mon, 13 Sep 2021 07:29:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 13 Sep 2021 07:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=v
        G78gf/CaL3bQ588C1vYpM4hPh0rNV78GelgrWxCew4=; b=nbmQms4KXSjCUv1Qx
        JZFKc+nMSLjBXWTIJKcuFgg+LUSk47zQovp0C3tHIHs69sW/Z5eQPgiS5tTMJ2xM
        J7NfQCJvOwOWFQj7zYAEIVcw152o49Fs+yp7VQhB0zDqzPhkhpP69rxxzLbrsQv3
        TTAyaGQiMhPjlAzyUjdTzIcCzilQJDw9HqZz8vlDp2ZQ6TSGGRWYqPybLdyohNzq
        9OEM4rW5xCB5AEJ75BdhUSuBdhjNFi2iqvJZTglLu5GfHT5qoe2GZYCWausB2kWv
        I6Sz2RDvVzE0iP1Ch+XsPviaKTCe158p4A/BKiH/UnZHStcqBlhMIG7NdUliy7kT
        /sadg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=vG78gf/CaL3bQ588C1vYpM4hPh0rNV78GelgrWxCe
        w4=; b=J2/vaNmrgOg6ciQDe5lON1Cc253vj5wf0PPGnJSwle62hiJ/993AOflyL
        jtlygr642r2PdjUgypDr7qfdyH1NA9saw7uNKSgswqdVlbng+p7c57jbZ6PXXFvp
        ogdtEbCRHyNkOYc5li0A9s+UdF5pT8SulRyqtgYoRScz0zkmCRUDREuzyfLBy9gp
        NH7vFJtYFI5pLUl01QgGeZRjGOJ6XvAQWP/6DHFDDoJku+w9vkfIb8TNb7pj4Iwd
        2JGItIKwxud0+6gYr+yLBOt8ywnj7C4FGaOhUhfenblPBpNowFEZiAxyuzrj3beo
        Z2L+z55adW/yiUaPk4S5CgnXtEbXg==
X-ME-Sender: <xms:GzY_YSULUjx6-4Lt1QJHdHyfK_1yU_FOde-CimQAEm4KD-A2HVThKQ>
    <xme:GzY_YekYBAme3KeZCAy8evvLnxsMMrHo0LCPrgy2ujChqtQ1y6g5yYKt-Zz9f372i
    otBLv2FVKjDfv-lL5A>
X-ME-Received: <xmr:GzY_YWZJTIF7HHu4ZnPWkMzUibG0dIBUTRhx6MY0DJyQFxyUCdc0BtRnMhSVs-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:GzY_YZVQWPpL-nq9GH6FYPZWxR5X3yP6CzXFF9epyVbDZTpGaC18lA>
    <xmx:GzY_Ycnxn6tOla4sV_jygFX8tjZcZBqbSd8R-UCgqCocH8GQaODxew>
    <xmx:GzY_Yeckh3q7_uF2VNJvISNTvxDuN1v7hnrd75FLgFxRi9wnPSgSxg>
    <xmx:HTY_YdBbj_H6hf6jn0zb_Yuc-D-dtRA5KjwGObYik1g2FErwlx9jsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 07:29:30 -0400 (EDT)
Message-ID: <6984ca2f-658f-cdf0-86a7-ccc57ace2622@flygoat.com>
Date:   Mon, 13 Sep 2021 12:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MIPS: loongson64: configs: Update loongson3_defconfig
To:     Wang Haojun <jiangliuer01@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
References: <20210913092856.3204631-1-wanghaojun@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20210913092856.3204631-1-wanghaojun@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2021/9/13 10:28, Wang Haojun 写道:
> The Framebuffer CONFIG_FB needs to be explicitly selected or we
> don't get any framebuffer anymore. DRM has stopped to select FB
> after commit f611b1e7624ccdbd495c19e98056 ("drm: Avoid circular
> dependencies for CONFIG_FB") because of circular dependency. So
> we should enable it in the default config file, otherwise there
> is no display before Xorg.
>
> Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Any readons for resending this patch?

Thanks.

- Jiaxun

> ---
>   arch/mips/configs/loongson3_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index f02101ff04b3..25ecd15bc952 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -282,6 +282,7 @@ CONFIG_DRM=y
>   CONFIG_DRM_RADEON=m
>   CONFIG_DRM_QXL=y
>   CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_FB=y
>   CONFIG_FB_RADEON=y
>   CONFIG_LCD_CLASS_DEVICE=y
>   CONFIG_LCD_PLATFORM=m

