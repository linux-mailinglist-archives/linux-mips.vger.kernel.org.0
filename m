Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0391D407C4D
	for <lists+linux-mips@lfdr.de>; Sun, 12 Sep 2021 09:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhILH6l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 03:58:41 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52463 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229512AbhILH6k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Sep 2021 03:58:40 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8D075580B78;
        Sun, 12 Sep 2021 03:57:26 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Sun, 12 Sep 2021 03:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=aFdz8
        H3sBKPoaEugmXSbLi3VI3lOsRbk6BtRmdr4HR0=; b=xs6UVPxfQVCwQmqxbemQa
        J/hbqsfxfhYcKQqOt5+oGzk/e8QisTWIQ9RWUoXX7YsC7v7DJh3ReZvi+u3/Y3YP
        t4oGFEIw18dYIw/kOvqpU5cCSwI0bAaNao8dUrAcchF5/fr/SLM2IeHAjLWK5NG1
        l5C0ldBw44LzAUM7BqMk9zGgmdFeawrICNqUEprNdg3tmToOnTecouw8KzM9gyBe
        rSir7O7UGPyiJwv2LOqipoGgvCkXLO8SprcmjcLxq9Fl8B0je3teoAJ/n+HDYTqG
        LuIREJVfnEOlMVevn/fVRtchlkLE1fiQVxYtJ2iVgHnhtNAiiH8cgeWUfnmrLtnx
        A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=aFdz8H3sBKPoaEugmXSbLi3VI3lOsRbk6BtRmdr4H
        R0=; b=SVLdEP1r43NYSkW5araFiVXZk3FmPwBXmwaJQPaaBTRYJVJuNA4AIzwjG
        bRjKpWI1vV7mXzxC50oI4p/1SHnW5C2JwcrHDBhDJBFuqwzOaTQBT+GTTLjH7yWx
        Bf4YFOTxhqLmhtXE1VkIuCnm4xf8JZi8eNmxxmxi8pa8cTw3hMaA2dIk5NkcJqEz
        CXTWgblA8jQlq5qEh6h85VnHMIZBVHcD7PaK/YOnH6rVK5sQ1/4EmDdM2Avjnr9k
        HJmknu4jgT3JakRANP5BG1R9QZgqgpFa6VBZeW7zIwh98AB1BVtFAvvTJEPGuRy6
        5GMajzIddMfDm7LSW2xGp3nRUd/Wg==
X-ME-Sender: <xms:5bI9Yc8lya8DE7IO1bfWGoslq1rtpXmsZKeUKEKmjBop5cMprvZX1g>
    <xme:5bI9YUsvZzVYRnw8gAzdpX6wtsCzdW1G3dN-AcE4lv9RWj6uphp5W84XQkCdnJ58i
    nzoWkJmUkir7pbvOgk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdel
    hfefheekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:5bI9YSDd8AvbIfDoAiXhVeMLiBrjvdqRX4g8DNIBk6WfRc-n3FHVow>
    <xmx:5bI9YcdSnFrb0cqfAbZmYxR1TugcOfUuR2H2YfWLUCdG5x49GD7KAQ>
    <xmx:5bI9YRPNpSQiMm5tPqrVNWPLZU3BLh4W3uP1Ve46x-2aQUcwAxJfMg>
    <xmx:5rI9YSqJ-cWCZlQ0w-NGi3KwLjKpcZb8aMg_ZSYgPkJ8J6mXHom5LA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 30438FA0AA5; Sun, 12 Sep 2021 03:57:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1229-g7ca81dfce5-fm-20210908.005-g7ca81dfc
Mime-Version: 1.0
Message-Id: <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
In-Reply-To: <20210912061356.1723912-1-wanghaojun@loongson.cn>
References: <20210912061356.1723912-1-wanghaojun@loongson.cn>
Date:   Sun, 12 Sep 2021 08:57:03 +0100
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Wang Haojun" <jiangliuer01@gmail.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Wang Haojun" <wanghaojun@loongson.cn>,
        "Xuefeng Li" <lixuefeng@loongson.cn>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: loongson64: Fix no screen display during boot-up
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B49=E6=9C=8812=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8A=E5=
=8D=887:13=EF=BC=8CWang Haojun=E5=86=99=E9=81=93=EF=BC=9A
> This is no display on the screen during boot-up when using latest
> loongson3_defconfig, because CONFIG_FRAMEBUFFER_CONSOLE=3Dy depends
> on CONFIG_FB=3Dy in this file.

Hi Haojun,

It won't work unless you get LS7A dc driver upstreamed or amdgpu firmwar=
e resolved.

Thanks.

>=20
> Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/mips/configs/loongson3_defconfig=20
> b/arch/mips/configs/loongson3_defconfig
> index f02101ff04b3..25ecd15bc952 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -282,6 +282,7 @@ CONFIG_DRM=3Dy
>  CONFIG_DRM_RADEON=3Dm
>  CONFIG_DRM_QXL=3Dy
>  CONFIG_DRM_VIRTIO_GPU=3Dy
> +CONFIG_FB=3Dy
>  CONFIG_FB_RADEON=3Dy
>  CONFIG_LCD_CLASS_DEVICE=3Dy
>  CONFIG_LCD_PLATFORM=3Dm
> --=20
> 2.27.0
>=20
>=20


--=20
- Jiaxun
