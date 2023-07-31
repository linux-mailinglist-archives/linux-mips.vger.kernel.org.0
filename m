Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6090A76A19B
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 21:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjGaT7I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 15:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjGaT7H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 15:59:07 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1E88F;
        Mon, 31 Jul 2023 12:59:05 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-48645045826so1804409e0c.2;
        Mon, 31 Jul 2023 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690833545; x=1691438345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZUTLiq4ztiz7isOwicgVn1yrySYaXh6uY6SY2kyAgc=;
        b=alub0lGpoNrEu8OhfNnTDBvCPSj1fLLYheu1NSkrdZBpAQF2064AvbHKWmUzslufOt
         YLbmv/TcCGYjgrvq4FRS6M9Devdql3Q2P/9rAVoRybjgi+kffYQQcVZMV2WEYizsOr2j
         BpXNHtgVetIAcGNhWkkx03vGGYpzA9ZHMcvgmI3ZOe9kQRjymhlNgRuOilfBt3UBsdLl
         7kW4WBonGTFZhUn6/mlIWDl6LSRqENUo0fbkIW9lN3zqVFnZ6fDFQSK0eFG8BS8nJDme
         CuPuGTgehfNxRLyhKRbEAW+Bg56YyqY+gh0K04pfKLwmKFpNb4K28NQR1KJZ8WogUkSd
         NjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690833545; x=1691438345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZUTLiq4ztiz7isOwicgVn1yrySYaXh6uY6SY2kyAgc=;
        b=gA74iNotS2V1mPwcNymg9o8cG2cv6Hs+0jtWfWSc+9m8bRDCV7W7knyzvVXxTNNPTr
         b0NcXXztWSZoeV66+m7dNJZznRcWFxv+NdtKODEG+uDF+CjAk/DMjK6ee13AynPSg7QM
         I9lvT9Jda7JeUnnP6jQJZtjBgXgtw+tkJ8dRStYUkiBP7HMJr1IuyojbO+zWBKI9j3Xd
         k//k+FaJD2qMpf41AsYPsf6iHwEVlfSXz1aEx8/KQYmRDclq86AlmVQYydvvTbCsVGw9
         RpfaNgL9vSYcIJ96bpMBdc6xK4vCh3dP3jtmuVsV8f8MpVCzFWWU/8jlUhTXzvAEIfjL
         KHxA==
X-Gm-Message-State: ABy/qLZZ54c9wNOtsWoY+1dzr6wvAh8apmbE99SEN0NeE7tzxkeJwR1w
        4SIvT7NYGhNiOakeIpDOURE=
X-Google-Smtp-Source: APBJJlHSqrneeA6ywQrgc7CJdlArRC0LDzjpwpRAo2sgvPLInS00+l5lLpxZfcAOQnXT689xDRSr7w==
X-Received: by 2002:a1f:5fd7:0:b0:47e:1105:1f5e with SMTP id t206-20020a1f5fd7000000b0047e11051f5emr984710vkb.1.1690833544731;
        Mon, 31 Jul 2023 12:59:04 -0700 (PDT)
Received: from errol.ini.cmu.edu ([72.95.245.133])
        by smtp.gmail.com with ESMTPSA id g22-20020a0caad6000000b006365b23b5dfsm4046264qvb.23.2023.07.31.12.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:59:04 -0700 (PDT)
Date:   Mon, 31 Jul 2023 15:59:01 -0400
From:   "Gabriel L. Somlo" <gsomlo@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Russell King <linux@armlinux.org.uk>,
        Richard Genoud <richard.genoud@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Joel Stanley <joel@jms.id.au>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Timur Tabi <timur@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH v2] tty: Explicitly include correct DT includes
Message-ID: <ZMgShZVvEyIN58/o@errol.ini.cmu.edu>
References: <20230724205440.767071-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724205440.767071-1-robh@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 24, 2023 at 02:54:38PM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Gabriel Somlo <gsomlo@gmail.com> # for liteuart

Thanks much,
--Gabriel

> v2:
>  - Add mpc52xx_uart
> ---
>  drivers/tty/hvc/hvc_opal.c             | 2 +-
>  drivers/tty/serial/8250/8250_early.c   | 1 -
>  drivers/tty/serial/8250/8250_ingenic.c | 1 -
>  drivers/tty/serial/8250/8250_omap.c    | 1 -
>  drivers/tty/serial/amba-pl011.c        | 2 +-
>  drivers/tty/serial/apbuart.c           | 3 ---
>  drivers/tty/serial/atmel_serial.c      | 1 -
>  drivers/tty/serial/fsl_linflexuart.c   | 2 +-
>  drivers/tty/serial/fsl_lpuart.c        | 2 +-
>  drivers/tty/serial/imx.c               | 1 -
>  drivers/tty/serial/lantiq.c            | 3 ++-
>  drivers/tty/serial/liteuart.c          | 3 +--
>  drivers/tty/serial/ma35d1_serial.c     | 2 +-
>  drivers/tty/serial/mpc52xx_uart.c      | 2 +-
>  drivers/tty/serial/mps2-uart.c         | 1 -
>  drivers/tty/serial/mxs-auart.c         | 2 +-
>  drivers/tty/serial/pic32_uart.c        | 1 -
>  drivers/tty/serial/qcom_geni_serial.c  | 1 -
>  drivers/tty/serial/serial-tegra.c      | 1 -
>  drivers/tty/serial/sh-sci.c            | 1 -
>  drivers/tty/serial/sunhv.c             | 4 ++--
>  drivers/tty/serial/sunsab.c            | 3 ++-
>  drivers/tty/serial/sunsu.c             | 4 ++--
>  drivers/tty/serial/sunzilog.c          | 4 ++--
>  drivers/tty/serial/tegra-tcu.c         | 1 -
>  drivers/tty/serial/uartlite.c          | 3 ---
>  drivers/tty/serial/ucc_uart.c          | 3 ++-
>  drivers/tty/serial/vt8500_serial.c     | 2 +-
>  28 files changed, 21 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 794c7b18aa06..992e199e0ea8 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -14,7 +14,7 @@
>  #include <linux/console.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/export.h>
>  #include <linux/interrupt.h>
>  
> diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/8250/8250_early.c
> index 4299a8bd83d9..9837a27739fd 100644
> --- a/drivers/tty/serial/8250/8250_early.c
> +++ b/drivers/tty/serial/8250/8250_early.c
> @@ -27,7 +27,6 @@
>  #include <linux/init.h>
>  #include <linux/console.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/serial_reg.h>
>  #include <linux/serial.h>
>  #include <linux/serial_8250.h>
> diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
> index 617b8ce60d6b..4c4c4da73ad0 100644
> --- a/drivers/tty/serial/8250/8250_ingenic.c
> +++ b/drivers/tty/serial/8250/8250_ingenic.c
> @@ -13,7 +13,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index d48a82f1634e..26dd089d8e82 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -18,7 +18,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index c5c3f4674459..a1e594b79890 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -20,6 +20,7 @@
>  #include <linux/ioport.h>
>  #include <linux/init.h>
>  #include <linux/console.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysrq.h>
>  #include <linux/device.h>
>  #include <linux/tty.h>
> @@ -36,7 +37,6 @@
>  #include <linux/delay.h>
>  #include <linux/types.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/sizes.h>
>  #include <linux/io.h>
> diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
> index 915ee4b0d594..f3defc6da3df 100644
> --- a/drivers/tty/serial/apbuart.c
> +++ b/drivers/tty/serial/apbuart.c
> @@ -22,9 +22,6 @@
>  #include <linux/kthread.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 3467a875641a..7ac477344aa3 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -21,7 +21,6 @@
>  #include <linux/tty_flip.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/atmel_pdc.h>
> diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
> index 6fc21b6684e6..f697751c2ad5 100644
> --- a/drivers/tty/serial/fsl_linflexuart.c
> +++ b/drivers/tty/serial/fsl_linflexuart.c
> @@ -11,7 +11,7 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
>  #include <linux/tty_flip.h>
> diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
> index 4d80fae20177..e1a8d5415718 100644
> --- a/drivers/tty/serial/fsl_lpuart.c
> +++ b/drivers/tty/serial/fsl_lpuart.c
> @@ -18,9 +18,9 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_dma.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 7341d060f85c..3ed5083a7108 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -25,7 +25,6 @@
>  #include <linux/rational.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/io.h>
>  #include <linux/dma-mapping.h>
>  
> diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
> index bcaa479608d8..3adb60c683f7 100644
> --- a/drivers/tty/serial/lantiq.c
> +++ b/drivers/tty/serial/lantiq.c
> @@ -17,7 +17,8 @@
>  #include <linux/ioport.h>
>  #include <linux/lantiq.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
> diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
> index 80de3a42b67b..d881cdd2a58f 100644
> --- a/drivers/tty/serial/liteuart.c
> +++ b/drivers/tty/serial/liteuart.c
> @@ -11,8 +11,7 @@
>  #include <linux/litex.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 2604b4d9fb78..789593495a80 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -8,7 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/iopoll.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
> diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
> index 384ca195e3d5..916507b8f31d 100644
> --- a/drivers/tty/serial/mpc52xx_uart.c
> +++ b/drivers/tty/serial/mpc52xx_uart.c
> @@ -40,7 +40,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/clk.h>
>  
>  #include <asm/mpc52xx.h>
> diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
> index 860d161fa594..5da88cbeec73 100644
> --- a/drivers/tty/serial/mps2-uart.c
> +++ b/drivers/tty/serial/mps2-uart.c
> @@ -16,7 +16,6 @@
>  #include <linux/console.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> -#include <linux/of_device.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
> index a368f4293967..3974ca6ad86c 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -30,7 +30,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  
> diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
> index 196a4e678451..e308d5022b3f 100644
> --- a/drivers/tty/serial/pic32_uart.c
> +++ b/drivers/tty/serial/pic32_uart.c
> @@ -11,7 +11,6 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_gpio.h>
>  #include <linux/init.h>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 444c74eeab7d..5607b668588b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -11,7 +11,6 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
> index 1cf08b33456c..cbe641727f2a 100644
> --- a/drivers/tty/serial/serial-tegra.c
> +++ b/drivers/tty/serial/serial-tegra.c
> @@ -20,7 +20,6 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 7c9457962a3d..115271d2f82d 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -35,7 +35,6 @@
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
> index 7d38c33ef506..c671d674bce4 100644
> --- a/drivers/tty/serial/sunhv.c
> +++ b/drivers/tty/serial/sunhv.c
> @@ -17,11 +17,11 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include <asm/hypervisor.h>
>  #include <asm/spitfire.h>
> -#include <asm/prom.h>
>  #include <asm/irq.h>
>  #include <asm/setup.h>
>  
> diff --git a/drivers/tty/serial/sunsab.c b/drivers/tty/serial/sunsab.c
> index 48b39fdb0397..40eeaf835bba 100644
> --- a/drivers/tty/serial/sunsab.c
> +++ b/drivers/tty/serial/sunsab.c
> @@ -33,7 +33,8 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include <linux/io.h>
>  #include <asm/irq.h>
> diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
> index fed052a0b931..58a4342ad0f9 100644
> --- a/drivers/tty/serial/sunsu.c
> +++ b/drivers/tty/serial/sunsu.c
> @@ -37,11 +37,11 @@
>  #include <linux/serial_reg.h>
>  #include <linux/init.h>
>  #include <linux/delay.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include <linux/io.h>
>  #include <asm/irq.h>
> -#include <asm/prom.h>
>  #include <asm/setup.h>
>  
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
> index 0fbeb3dbd843..c8c71c56264c 100644
> --- a/drivers/tty/serial/sunzilog.c
> +++ b/drivers/tty/serial/sunzilog.c
> @@ -33,11 +33,11 @@
>  #include <linux/serio.h>
>  #endif
>  #include <linux/init.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include <linux/io.h>
>  #include <asm/irq.h>
> -#include <asm/prom.h>
>  #include <asm/setup.h>
>  
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/tegra-tcu.c b/drivers/tty/serial/tegra-tcu.c
> index 23500b342da7..65069daf36ec 100644
> --- a/drivers/tty/serial/tegra-tcu.c
> +++ b/drivers/tty/serial/tegra-tcu.c
> @@ -7,7 +7,6 @@
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
> diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
> index 679574893ebe..b225a78f6175 100644
> --- a/drivers/tty/serial/uartlite.c
> +++ b/drivers/tty/serial/uartlite.c
> @@ -20,9 +20,6 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
>  
> diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
> index 404230c1ebb2..284b293fade6 100644
> --- a/drivers/tty/serial/ucc_uart.c
> +++ b/drivers/tty/serial/ucc_uart.c
> @@ -17,15 +17,16 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/serial.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
>  #include <linux/io.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_platform.h>
>  #include <linux/dma-mapping.h>
>  
>  #include <linux/fs_uart_pd.h>
> diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
> index cc9157df732f..32433e9b3e5f 100644
> --- a/drivers/tty/serial/vt8500_serial.c
> +++ b/drivers/tty/serial/vt8500_serial.c
> @@ -14,6 +14,7 @@
>  #include <linux/irq.h>
>  #include <linux/init.h>
>  #include <linux/console.h>
> +#include <linux/platform_device.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
>  #include <linux/serial_core.h>
> @@ -21,7 +22,6 @@
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/err.h>
>  
>  /*
> -- 
> 2.40.1
> 
