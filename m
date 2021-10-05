Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97828423259
	for <lists+linux-mips@lfdr.de>; Tue,  5 Oct 2021 22:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbhJEUwR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 5 Oct 2021 16:52:17 -0400
Received: from aposti.net ([89.234.176.197]:51698 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235545AbhJEUwR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Oct 2021 16:52:17 -0400
Date:   Tue, 05 Oct 2021 21:50:12 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
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
        Andrzej Hajda <a.hajda@samsung.com>,
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
Message-Id: <O7VI0R.CRIG8R7O0OOI3@crapouillou.net>
In-Reply-To: <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus & Paul,

Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller 
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
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 45 
> ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 9e34f433b9b5..c3c18a59c377 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
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
> +		assigned-clocks = <&cgu JZ4780_CLK_HDMI>;
> +		assigned-clock-rates = <27000000>;

Any reason why this is set to 27 MHz? Is it even required? Because with 
the current ci20.dts, it won't be clocked at anything but 48 MHz.

> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <3>;
> +
> +		/* ddc-i2c-bus = <&i2c4>; */
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

I think you can keep lcdc0 enabled by default (not lcdc1 though), since 
it is highly likely that you'd want that.

Cheers,
-Paul

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


