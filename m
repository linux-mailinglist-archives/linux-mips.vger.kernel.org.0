Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31554522BB
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 02:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345676AbhKPBP5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 15 Nov 2021 20:15:57 -0500
Received: from aposti.net ([89.234.176.197]:54654 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244006AbhKOTOt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Nov 2021 14:14:49 -0500
Date:   Mon, 15 Nov 2021 19:11:39 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 5/8] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Message-Id: <FZNM2R.PEN9N8R45O3F2@crapouillou.net>
In-Reply-To: <c9f9fc1d5b796b7a78e7e27849abb435c6bcbc43.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
        <c9f9fc1d5b796b7a78e7e27849abb435c6bcbc43.1636573413.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le mer., nov. 10 2021 at 20:43:30 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> A specialisation of the generic Synopsys HDMI driver is employed for 
> JZ4780
> HDMI support. This requires a new driver, plus device tree and 
> configuration
> modifications.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 40 
> ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 9e34f433b9b58..98cc3360bbbb9 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -424,6 +424,46 @@ i2c4: i2c@10054000 {
>  		status = "disabled";
>  	};
> 
> +	hdmi: hdmi@10180000 {
> +		compatible = "ingenic,jz4780-dw-hdmi";
> +		reg = <0x10180000 0x8000>;
> +		reg-io-width = <4>;
> +
> +		clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> +		clock-names = "iahb", "isfr";
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <3>;
> +
> +		status = "disabled";
> +	};
> +
> +	lcdc0: lcdc0@13050000 {
> +		compatible = "ingenic,jz4780-lcd";
> +		reg = <0x13050000 0x1800>;
> +
> +		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +		clock-names = "lcd", "lcd_pclk";
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <31>;
> +
> +		status = "disabled";
> +	};
> +
> +	lcdc1: lcdc1@130a0000 {
> +		compatible = "ingenic,jz4780-lcd";
> +		reg = <0x130a0000 0x1800>;
> +
> +		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
> +		clock-names = "lcd", "lcd_pclk";
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <31>;

You have the two LCD controllers wired to the same interrupt, that 
can't be right.

 From what I can read in the PM the LCD1 IRQ is number 23.

Cheers,
-Paul

> +
> +		status = "disabled";
> +	};
> +
>  	nemc: nemc@13410000 {
>  		compatible = "ingenic,jz4780-nemc", "simple-mfd";
>  		reg = <0x13410000 0x10000>;
> --
> 2.33.0
> 


