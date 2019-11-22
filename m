Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7286107421
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 15:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVOhJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 09:37:09 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:56954 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVOhJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 09:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574433422; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YpCE21+fHqnut680I3BLvFteO+uKZOg8KIh9pmfWWCs=;
        b=WIgf9LcGZAwH1nAv5NPuNb/rjgRpVt+3Pv6gg/hScEEBrn1FPFWQNi0DGcwNwQzaottkh3
        BTRPRMZsU+owErj1h33Wz8DRFgJBSDroi+PesXxC444jKapSkuRtfQR3fae3S0qnUgEsEx
        ZnlRdAZiysVO49Ygyh3DQqHgqFxdSPg=
Date:   Fri, 22 Nov 2019 15:36:49 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/4] MIPS: Ingenic: initial X1000 support.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com
Message-Id: <1574433409.3.0@crapouillou.net>
In-Reply-To: <1574428289-21764-2-git-send-email-zhouyanjie@zoho.com>
References: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
        <1574428289-21764-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le ven., nov. 22, 2019 at 21:11, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Support the Ingenic X1000 SoC using the code under arch/mips/jz4740.
> This is left unselectable in Kconfig until a X1000 based board is
> added in a later commit.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 161=20
> ++++++++++++++++++++++++++++++++++
>  arch/mips/jz4740/Kconfig              |   6 ++
>  arch/mips/jz4740/time.c               |   4 +-
>  3 files changed, 170 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi
>=20
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> new file mode 100644
> index 0000000..b8658a6
> --- /dev/null
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/clock/x1000-cgu.h>
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "ingenic,x1000", "ingenic,x1000e";
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells =3D <0>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-controller;
> +		compatible =3D "mti,cpu-interrupt-controller";
> +	};
> +
> +	intc: interrupt-controller@10001000 {
> +		compatible =3D "ingenic,x1000-intc", "ingenic,jz4780-intc";
> +		reg =3D <0x10001000 0x50>;
> +
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		interrupt-parent =3D <&cpuintc>;
> +		interrupts =3D <2>;
> +	};
> +
> +	exclk: ext {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	rtclk: rtc {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +	};
> +
> +	cgu: x1000-cgu@10000000 {
> +		compatible =3D "ingenic,x1000-cgu";
> +		reg =3D <0x10000000 0x100>;
> +
> +		clocks =3D <&exclk>, <&rtclk>;
> +		clock-names =3D "ext", "rtc";
> +
> +		#clock-cells =3D <1>;
> +	};
> +
> +	apb {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <>;
> +
> +		uart0: serial@10030000 {
> +			compatible =3D "ingenic,x1000-uart";
> +			reg =3D <0x10030000 0x100>;
> +
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <51>;
> +
> +			clocks =3D <&exclk>, <&cgu X1000_CLK_UART0>;
> +			clock-names =3D "baud", "module";
> +
> +			status =3D "disabled";
> +		};
> +
> +		uart1: serial@10031000 {
> +			compatible =3D "ingenic,x1000-uart";
> +			reg =3D <0x10031000 0x100>;
> +
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <50>;
> +
> +			clocks =3D <&exclk>, <&cgu X1000_CLK_UART1>;
> +			clock-names =3D "baud", "module";
> +
> +			status =3D "disabled";
> +		};
> +
> +		uart2: serial@10032000 {
> +			compatible =3D "ingenic,x1000-uart";
> +			reg =3D <0x10032000 0x100>;
> +
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <49>;
> +
> +			clocks =3D <&exclk>, <&cgu X1000_CLK_UART2>;
> +			clock-names =3D "baud", "module";
> +
> +			status =3D "disabled";
> +		};
> +
> +		pinctrl: pin-controller@10010000 {
> +			compatible =3D "ingenic,x1000-pinctrl";
> +			reg =3D <0x10010000 0x800>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			gpa: gpio@0 {
> +				compatible =3D "ingenic,x1000-gpio";
> +				reg =3D <0>;
> +
> +				gpio-controller;
> +				gpio-ranges =3D <&pinctrl 0 0 32>;
> +				#gpio-cells =3D <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +
> +				interrupt-parent =3D <&intc>;
> +				interrupts =3D <17>;
> +			};
> +
> +			gpb: gpio@1 {
> +				compatible =3D "ingenic,x1000-gpio";
> +				reg =3D <1>;
> +
> +				gpio-controller;
> +				gpio-ranges =3D <&pinctrl 0 32 32>;
> +				#gpio-cells =3D <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +
> +				interrupt-parent =3D <&intc>;
> +				interrupts =3D <16>;
> +			};
> +
> +			gpc: gpio@2 {
> +				compatible =3D "ingenic,x1000-gpio";
> +				reg =3D <2>;
> +
> +				gpio-controller;
> +				gpio-ranges =3D <&pinctrl 0 64 32>;
> +				#gpio-cells =3D <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +
> +				interrupt-parent =3D <&intc>;
> +				interrupts =3D <15>;
> +			};
> +
> +			gpd: gpio@3 {
> +				compatible =3D "ingenic,x1000-gpio";
> +				reg =3D <3>;
> +
> +				gpio-controller;
> +				gpio-ranges =3D <&pinctrl 0 96 32>;
> +				#gpio-cells =3D <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +
> +				interrupt-parent =3D <&intc>;
> +				interrupts =3D <14>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
> index 4dd0c44..6b96844 100644
> --- a/arch/mips/jz4740/Kconfig
> +++ b/arch/mips/jz4740/Kconfig
> @@ -33,3 +33,9 @@ config MACH_JZ4780
>  	select MIPS_CPU_SCACHE
>  	select SYS_HAS_CPU_MIPS32_R2
>  	select SYS_SUPPORTS_HIGHMEM
> +
> +config MACH_X1000
> +	bool
> +	select MIPS_CPU_SCACHE
> +	select SYS_HAS_CPU_MIPS32_R2
> +	select SYS_SUPPORTS_HIGHMEM
> diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
> index cb768e5..3af6538 100644
> --- a/arch/mips/jz4740/time.c
> +++ b/arch/mips/jz4740/time.c
> @@ -101,7 +101,9 @@ static struct clock_event_device=20
> jz4740_clockevent =3D {
>  #ifdef CONFIG_MACH_JZ4740
>  	.irq =3D JZ4740_IRQ_TCU0,
>  #endif
> -#if defined(CONFIG_MACH_JZ4770) || defined(CONFIG_MACH_JZ4780)
> +#if defined(CONFIG_MACH_JZ4770) || \
> +    defined(CONFIG_MACH_JZ4780) || \
> +    defined(CONFIG_MACH_X1000)

That code was removed in the TCU patchset that was merged in time for=20
5.4-rc1.
Please rebase your patchset on top mips-next.

Cheers,
-Paul

=

