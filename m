Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C14E31683D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 14:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhBJNqx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 08:46:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:35175 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhBJNqx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 08:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1612964811; x=1644500811;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=ZK4J4t3KWKLxryUAQFN/kK0YWfWodwLhG+egShcVgjk=;
  b=C/RYe1PGyEfQwLoZSoqPrBndsM1OVPO443SHdQEEuCyR/aZHHk4NP2K+
   0nDTRLzRcVAOQ77eUz/GkeZM7BjAulHDBIW6lSMNGXkjR55CLr0wlXS0/
   kLDFet54oBP+3CHNv5Mut3j8TIHchi4m0xH5ruvi+pHHPD4VTHLbzop5h
   k+d7y2HfC9/a5Dyt7FRX3ubjavWN2xU8uuCEM4S6fRB9nf2/PXllhLHtO
   Ol1hou/9glFxzOPIRRU2FriYsulEwBAIVwsVIiEsFPaBmH6egB4oQiAFv
   eCYMLDzuGP/DRLJoHEShXLwEFHIasos90rnFov5HO+dozhtD90mj0ri25
   Q==;
IronPort-SDR: 0YM2d3k1fC5uD+d18/ORVHjsexLnkcU6bWKJubDijtuma1EpLElYgzgyBJqZ6bJseDv/VthiXn
 guCoa1Eh4gUaz7c/oZrloXPJH8FoS/lrz6wQqXwcHEsfM0ixnXx45amA4hyoL/KGmI1SjJnuAK
 k/OOWl/mTLMR6v5GXPbVi+RfEF+WeW4giC3X04RJT2i5zkn0uwu6+muiPLKOCYtUdwhKFA7t04
 CFv2RCDEu7QJCMZXPdrdg9xmZUaIcA9QR6blI4TdW25E3FIRT5mXlOIwkCzjAB5HIfwrUR20xf
 LEc=
X-IronPort-AV: E=Sophos;i="5.81,168,1610434800"; 
   d="scan'208";a="106116804"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2021 06:45:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 10 Feb 2021 06:45:35 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 10 Feb 2021 06:45:33 -0700
References: <20210210132751.1422386-1-geert+renesas@glider.be>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <UNGLinuxDriver@microchip.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on ARCH_SPARX5 || SOC_VCOREIII
In-Reply-To: <20210210132751.1422386-1-geert+renesas@glider.be>
Date:   Wed, 10 Feb 2021 14:45:31 +0100
Message-ID: <87mtwcujd0.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Geert Uytterhoeven writes:

> the Microsemi/Microchip Serial GPIO device is present only Microsemi
> VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
> ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
> driver when configuring a kernel without support for these SoCs.
>
> Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -353,8 +353,8 @@ config PINCTRL_OCELOT
>
>  config PINCTRL_MICROCHIP_SGPIO
>         bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> -       depends on OF
> -       depends on HAS_IOMEM
> +       depends on OF && HAS_IOMEM
> +       depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
>         select GPIOLIB
>         select GPIOLIB_IRQCHIP
>         select GENERIC_PINCONF

Geert,

Thank you for your patch. Unfortunately, it makes it impossible to use
the driver across PCIe - which is a specifically desired configuration.

Could you add CONFIG_PCI to the || chain?

Cheers,

-- 
Lars Povlsen,
Microchip
