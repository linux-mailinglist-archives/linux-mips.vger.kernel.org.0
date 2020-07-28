Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D625323086A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 13:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgG1LMc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 07:12:32 -0400
Received: from crapouillou.net ([89.234.176.41]:54234 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728699AbgG1LMc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 07:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595934749; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MmQj6eRea6iyuNFg5IchAc+jj4JkKEYDW/JJw4bGNXw=;
        b=dC0xTiuZq1kuj8lPhJ/Y1NFDScrIHbi/xsOFaHQpEDJQux10XaHiWbhHW9JEpEjOmYTZka
        0Y+wPCTK8UDmX+tpqwQQx72uuE+CojJsxcg0CS3Rb5l/N3GTIpwEgvk2AVCWthpaJEs8Dr
        Xu25r3KIw3061V6qehZmN03C4M9TRo4=
Date:   Tue, 28 Jul 2020 13:12:11 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Message-Id: <B4F6EQ.WB2WZOY40FDR@crapouillou.net>
In-Reply-To: <20200728104503.23655-2-krzk@kernel.org>
References: <20200728104503.23655-1-krzk@kernel.org>
        <20200728104503.23655-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Krzysztof,

Le mar. 28 juil. 2020 =E0 12:45, Krzysztof Kozlowski <krzk@kernel.org> a=20
=E9crit :
> The CONFIG_JZ4780_NEMC was previously a default on MIPS but now it has
> to be enabled manually.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I think you should swap the two so that there are no problems when=20
bisecting.

With that:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
>=20
> Changes since v3:
> 1. New patch
> ---
>  arch/mips/configs/ci20_defconfig    | 1 +
>  arch/mips/configs/qi_lb60_defconfig | 1 +
>  arch/mips/configs/rs90_defconfig    | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/arch/mips/configs/ci20_defconfig=20
> b/arch/mips/configs/ci20_defconfig
> index e511fe0243a5..0a46199fdc3f 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -128,6 +128,7 @@ CONFIG_DMA_JZ4780=3Dy
>  CONFIG_INGENIC_OST=3Dy
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_MEMORY=3Dy
> +CONFIG_JZ4780_NEMC=3Dy
>  CONFIG_PWM=3Dy
>  CONFIG_PWM_JZ4740=3Dm
>  CONFIG_EXT4_FS=3Dy
> diff --git a/arch/mips/configs/qi_lb60_defconfig=20
> b/arch/mips/configs/qi_lb60_defconfig
> index 97c9a69d1528..81bfbee72b0c 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -108,6 +108,7 @@ CONFIG_RTC_DRV_JZ4740=3Dy
>  CONFIG_DMADEVICES=3Dy
>  CONFIG_DMA_JZ4780=3Dy
>  CONFIG_MEMORY=3Dy
> +CONFIG_JZ4780_NEMC=3Dy
>  CONFIG_IIO=3Dy
>  CONFIG_INGENIC_ADC=3Dy
>  CONFIG_PWM=3Dy
> diff --git a/arch/mips/configs/rs90_defconfig=20
> b/arch/mips/configs/rs90_defconfig
> index 433ac5c0266a..de6752051ecc 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -145,6 +145,7 @@ CONFIG_DMA_JZ4780=3Dy
>  CONFIG_INGENIC_OST=3Dy
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_MEMORY=3Dy
> +CONFIG_JZ4780_NEMC=3Dy
>  CONFIG_IIO=3Dy
>  CONFIG_INGENIC_ADC=3Dy
>  CONFIG_IIO_RESCALE=3Dy
> --
> 2.17.1
>=20


