Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318ED45AD14
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 21:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239420AbhKWUNa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 23 Nov 2021 15:13:30 -0500
Received: from aposti.net ([89.234.176.197]:37796 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236228AbhKWUN3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Nov 2021 15:13:29 -0500
Date:   Tue, 23 Nov 2021 20:10:00 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
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
Message-Id: <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
In-Reply-To: <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
        <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> We need to hook up
> * HDMI connector
> * HDMI power regulator
> * JZ4780_CLK_HDMI @ 27 MHz
> * DDC pinmux
> * HDMI and LCDC endpoint connections
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 83 
> +++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index b249a4f0f6b62..15cf03670693f 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -78,6 +78,18 @@ eth0_power: fixedregulator@0 {
>  		enable-active-high;
>  	};
> 
> +	hdmi_out: connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI OUT";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&dw_hdmi_out>;
> +			};
> +		};
> +	};
> +
>  	ir: ir {
>  		compatible = "gpio-ir-receiver";
>  		gpios = <&gpe 3 GPIO_ACTIVE_LOW>;
> @@ -102,6 +114,17 @@ otg_power: fixedregulator@2 {
>  		gpio = <&gpf 14 GPIO_ACTIVE_LOW>;
>  		enable-active-high;
>  	};
> +
> +	hdmi_power: fixedregulator@3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "hdmi_power";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&gpa 25 0>;
> +		enable-active-high;
> +	};
>  };
> 
>  &ext {
> @@ -114,11 +137,13 @@ &cgu {
>  	 * precision.
>  	 */
>  	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>,
> -			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>;
> +			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>,
> +			  <&cgu JZ4780_CLK_HDMI>;
>  	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>,
>  				 <&cgu JZ4780_CLK_MPLL>,
> -				 <&cgu JZ4780_CLK_SSIPLL>;
> -	assigned-clock-rates = <48000000>, <0>, <54000000>;
> +				 <&cgu JZ4780_CLK_SSIPLL>,
> +				 <0>;

Nit - you can remove the last <0>, it will be the default.

> +	assigned-clock-rates = <48000000>, <0>, <54000000>, <0>, <27000000>;
>  };
> 
>  &tcu {
> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
>  		bias-disable;
>  	};
> 
> +	pins_hdmi_ddc: hdmi_ddc {
> +		function = "hdmi-ddc";
> +		groups = "hdmi-ddc";
> +		bias-disable;
> +	};
> +
> +	/* switch to PF25 as gpio driving DDC_SDA low */
> +	pins_hdmi_ddc_unwedge: hdmi_ddc {
> +		function = "hdmi-ddc";
> +		groups = "hdmi-ddc";
> +		bias-disable;
> +	};

Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You 
could just use the former and pass it to both pinctrl-0 and pinctrl-1.

Cheers,
-Paul

> +
>  	pins_nemc: nemc {
>  		function = "nemc";
>  		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
> @@ -539,3 +577,42 @@ pins_mmc1: mmc1 {
>  		bias-disable;
>  	};
>  };
> +
> +&hdmi {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "unwedge";
> +	pinctrl-0 = <&pins_hdmi_ddc>;
> +	pinctrl-1 = <&pins_hdmi_ddc_unwedge>;
> +
> +	hdmi-5v-supply = <&hdmi_power>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			dw_hdmi_in: endpoint {
> +				remote-endpoint = <&lcd_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dw_hdmi_out: endpoint {
> +				remote-endpoint = <&hdmi_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&lcdc0 {
> +	status = "okay";
> +
> +	port {
> +		lcd_out: endpoint {
> +			remote-endpoint = <&dw_hdmi_in>;
> +		};
> +	};
> +};
> --
> 2.33.0
> 


