Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D6645155A
	for <lists+linux-mips@lfdr.de>; Mon, 15 Nov 2021 21:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhKOUhb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 15 Nov 2021 15:37:31 -0500
Received: from aposti.net ([89.234.176.197]:56316 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245298AbhKOTUC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Nov 2021 14:20:02 -0500
Date:   Mon, 15 Nov 2021 19:16:51 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Message-Id: <38OM2R.QJECEBEZVSXU@crapouillou.net>
In-Reply-To: <141a4ea23dc19629fea983093348d9dfaedb1cae.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
        <141a4ea23dc19629fea983093348d9dfaedb1cae.1636573413.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus, Thomas,

Le mer., nov. 10 2021 at 20:43:31 +0100, H. Nikolaus Schaller 
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
>  arch/mips/boot/dts/ingenic/ci20.dts | 73 
> +++++++++++++++++++++++++++--
>  1 file changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index a688809beebca..a62557bede565 100644
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
> +		gpio = <&gpa 25 GPIO_ACTIVE_LOW>;

Just use 0 instead of GPIO_ACTIVE_LOW, since the flag is simply ignored 
(I know the other regulators do use it, but I'll clean that up soon).

> +		enable-active-high;
> +	};
>  };
> 
>  &ext {
> @@ -113,9 +136,9 @@ &cgu {
>  	 * Use the 32.768 kHz oscillator as the parent of the RTC for a 
> higher
>  	 * precision.
>  	 */
> -	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>;
> -	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>;
> -	assigned-clock-rates = <48000000>;
> +	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>, 
> <&cgu JZ4780_CLK_HDMI>;
> +	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>, <0>;
> +	assigned-clock-rates = <48000000>, <0>, <27000000>;

So drm-misc-next is based on a slightly older version (not v5.16-rc1 
yet), and these lines changed in linux master.

I think it would make sense to merge the DT changes (+ doc) into the 
MIPS tree, and the driver changes into drm-misc-next.

@Thomas: Is that OK for you?

Cheers,
-Paul

>  };
> 
>  &tcu {
> @@ -506,6 +529,12 @@ pins_i2c4: i2c4 {
>  		bias-disable;
>  	};
> 
> +	pins_hdmi_ddc: hdmi_ddc {
> +		function = "hdmi-ddc";
> +		groups = "hdmi-ddc";
> +		bias-disable;
> +	};
> +
>  	pins_nemc: nemc {
>  		function = "nemc";
>  		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
> @@ -536,3 +565,41 @@ pins_mmc1: mmc1 {
>  		bias-disable;
>  	};
>  };
> +
> +&hdmi {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pins_hdmi_ddc>;
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


