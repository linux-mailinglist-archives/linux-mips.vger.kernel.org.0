Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1671724601
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jun 2023 16:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbjFFObc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jun 2023 10:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjFFObb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jun 2023 10:31:31 -0400
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F03CF186;
        Tue,  6 Jun 2023 07:31:29 -0700 (PDT)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
        by smtp.dudau.co.uk (Postfix) with SMTP id 92CF241D13A6;
        Tue,  6 Jun 2023 15:31:27 +0100 (BST)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation); Tue, 06 Jun 2023 15:31:27 +0100
Date:   Tue, 6 Jun 2023 15:31:27 +0100
From:   Liviu Dudau <liviu@dudau.co.uk>
To:     =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mips: dts: ralink: Add support for TP-Link HC220
 G5 v1 board
Message-ID: <ZH9DP+QdwRu/uS2D@bart.dudau.co.uk>
References: <20230605150114.601102-1-liviu@dudau.co.uk>
 <20230605150114.601102-2-liviu@dudau.co.uk>
 <552b4604-d1b3-0052-62aa-424944c5ecb1@arinc9.com>
 <ZH5NJsbY6ZLXYJYz@bart.dudau.co.uk>
 <43c95286-a3f4-6c68-c59c-0c86bbb74928@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43c95286-a3f4-6c68-c59c-0c86bbb74928@arinc9.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 06, 2023 at 08:24:48AM +0300, Arınç ÜNAL wrote:
> On 6.06.2023 00:01, Liviu Dudau wrote:
> > On Mon, Jun 05, 2023 at 07:35:44PM +0300, Arınç ÜNAL wrote:
> > > On 5.06.2023 18:01, Liviu Dudau wrote:
> > > > This WiFi AP is based on a MT7621 SoC with 128MiB RAM, 128MiB NAND,
> > > > a MT7603 2.4GHz WiFi and a MT7613 5GHz WiFi chips integrated on the board,
> > > > connected to the main SoC over PCIe.
> > > > 
> > > > The device uses NMBM over NAND, which is not currently supported in the
> > > > mainline, so NAND node is skipped in this revision.
> > > > 
> > > > Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
> > > > ---
> > > >    arch/mips/boot/dts/ralink/Makefile            |  3 +-
> > > >    .../dts/ralink/mt7621-tplink-hc220-g5-v1.dts  | 92 +++++++++++++++++++
> > > >    2 files changed, 94 insertions(+), 1 deletion(-)
> > > >    create mode 100644 arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dts
> > > > 
> > > > diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
> > > > index 11732b8c8163a..d27d7e8c700fe 100644
> > > > --- a/arch/mips/boot/dts/ralink/Makefile
> > > > +++ b/arch/mips/boot/dts/ralink/Makefile
> > > > @@ -8,6 +8,7 @@ dtb-$(CONFIG_DTB_VOCORE2)	+= vocore2.dtb
> > > >    dtb-$(CONFIG_SOC_MT7621) += \
> > > >    	mt7621-gnubee-gb-pc1.dtb \
> > > > -	mt7621-gnubee-gb-pc2.dtb
> > > > +	mt7621-gnubee-gb-pc2.dtb \
> > > > +	mt7621-tplink-hc220-g5-v1.dtb
> > > >    obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> > > > diff --git a/arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dts b/arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dts
> > > > new file mode 100644
> > > > index 0000000000000..859aaa1c1bc2b
> > > > --- /dev/null
> > > > +++ b/arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dts
> > > > @@ -0,0 +1,92 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +/dts-v1/;
> > > > +
> > > > +#include "mt7621.dtsi"
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/input.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +
> > > > +/ {
> > > > +	compatible = "tplink,hc220-g5-v1", "mediatek,mt7621-soc";
> > > > +	model = "TP-Link HC220 G5 v1";
> > > > +
> > > > +	memory@0 {
> > > > +		device_type = "memory";
> > > > +		reg = <0x00000000 0x8000000>;
> > > 
> > > Please use 8 digit addressing for the memory start and size offsets:
> > > 
> > > 0x00000000 0x08000000
> > 
> > Will do.
> > 
> > > 
> > > > +	};
> > > > +
> > > > +	chosen {
> > > > +		bootargs = "earlycon console=ttyS0,115200";
> > > > +	};
> > > > +
> > > > +	gpio-keys {
> > > > +		compatible = "gpio-keys";
> > > > +
> > > > +		key-reset {
> > > > +			label = "reset";
> > > > +			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
> > > > +			linux,code = <KEY_RESTART>;
> > > > +		};
> > > > +
> > > > +		key-wps {
> > > > +			label = "wps";
> > > > +			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
> > > > +			linux,code = <KEY_WPS_BUTTON>;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	leds {
> > > > +		compatible = "gpio-leds";
> > > > +
> > > > +		red {
> > > 
> > > Usually the led name would point to the component the LED is used for.
> > 
> > These are "generic" LEDs controlled from the userspace. The original firmware
> > uses GREEN for normal operations, RED for faults and BLUE for when WPS is
> > enabled. I'm not sure if there are any standard bindings that I can use here.
> 
> Looking at:
> 
> https://www.kernel.org/doc/html/latest/leds/leds-class.html#led-device-naming
> 
> You could use red:fault, green:power, and blue:wps. For node names,
> led-fault, led-power, and led-wps.

Without making any changes in the device tree, because of the use of 'function' property,
I get this:

# ls -al /sys/class/leds/
drwxr-xr-x    2 root     root             0 Jun  6 14:24 .
drwxr-xr-x   37 root     root             0 Jan  1  1970 ..
lrwxrwxrwx    1 root     root             0 Jun  6 14:24 blue:wps -> ../../devices/platform/leds/leds/blue:wps
lrwxrwxrwx    1 root     root             0 Jun  6 14:24 green:power -> ../../devices/platform/leds/leds/green:power
lrwxrwxrwx    1 root     root             0 Jun  6 14:24 red:fault -> ../../devices/platform/leds/leds/red:fault

May I suggest that I change only the node names and not add a label, keeping the 'function' property instead?

Best regards,
Liviu

> 
> Arınç

-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!
