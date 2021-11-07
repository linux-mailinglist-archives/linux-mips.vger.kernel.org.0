Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400F344751C
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 20:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbhKGTIi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 7 Nov 2021 14:08:38 -0500
Received: from aposti.net ([89.234.176.197]:54376 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhKGTIh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Nov 2021 14:08:37 -0500
Date:   Sun, 07 Nov 2021 19:05:35 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
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
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jon as Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Message-Id: <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
In-Reply-To: <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
        <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
        <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
        <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le dim., nov. 7 2021 at 14:45:37 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 05.10.2021 um 23:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi Paul,
>> 
>>  Le mar., oct. 5 2021 at 23:44:12 +0200, Paul Boddie 
>> <paul@boddie.org.uk> a écrit :
>>>  On Tuesday, 5 October 2021 22:50:12 CEST Paul Cercueil wrote:
>>>>  Hi Nikolaus & Paul,
>>>>  Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller
>>>  <hns@goldelico.com> a écrit :
>>>>  >
>>>>  > diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > index 9e34f433b9b5..c3c18a59c377 100644
>>>>  > --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>>  > @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
>>>>  >
>>>>  >  		status = "disabled";
>>>>  >
>>>>  >  	};
>>>>  >
>>>>  > +	hdmi: hdmi@10180000 {
>>>>  > +		compatible = "ingenic,jz4780-dw-hdmi";
>>>>  > +		reg = <0x10180000 0x8000>;
>>>>  > +		reg-io-width = <4>;
>>>>  > +
>>>>  > +		clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>>>>  > +		clock-names = "iahb", "isfr";
>>>>  > +
>>>>  > +		assigned-clocks = <&cgu JZ4780_CLK_HDMI>;
>>>>  > +		assigned-clock-rates = <27000000>;
>>>>  Any reason why this is set to 27 MHz? Is it even required? 
>>>> Because with
>>>>  the current ci20.dts, it won't be clocked at anything but 48 MHz.
>>>  EXCLK will be 48MHz, but the aim is to set the HDMI peripheral 
>>> clock to 27MHz,
>>>  which is supposedly required. I vaguely recall a conversation 
>>> about whether we
>>>  were doing this right, but I don't recall any conclusion.
>> 
>>  But right now your HDMI clock is 48 MHz and HDMI works.
> 
> Is it? How did you find out?
> 
> And have you tried to remove assigned-clocks from jz4780.dtsi?
> 
> 1. I read back:
> 
> root@letux:~# cat /sys/kernel/debug/clk/hdmi/clk_rate
> 26909090
> root@letux:~#
> 
> So for me it seems to be running at ~27 MHz.
> 
> 2. If I remove the assigned-clocks or assigned-clock-rates from DT
> the boot process hangs shortly after initializing drm.
> 
> 3. If I set assigned-clock-rates = <48000000>, HDMI also works.
> 
> I get it read back from /sys/kernel/debug/clk/hdmi/clk_rate
> of 46736842.
> 
> 4. Conclusions:
> * assigned-clocks are required
> * it does not matter if 27 or 48 MHz
> * I have no idea which value is more correct
> * so I'd stay on the safe side of 27 MHz
> 
> 5. But despite that found, please look into the programming
> manual section 18.1.2.16. There is an
> 
> "Import Note: The clock must be between 18M and 27M, it occurs
> fatal error if exceeding the range. "

Ok, that's the important information that was missing.

So 27 MHz is OK.

> 6. Therefore I think it *may* work overclocked with 48MHz
> but is not guaranteed or reliable above 27 MHz.
> 
> So everything is ok here.

One thing though - the "assigned-clocks" and "assigned-clock-rates", 
while it works here, should be moved to the CGU node, to respect the 
YAML schemas.

Cheers,
-Paul

> 
>> 
>>>>  > +
>>>>  > +		interrupt-parent = <&intc>;
>>>>  > +		interrupts = <3>;
>>>>  > +
>>>>  > +		/* ddc-i2c-bus = <&i2c4>; */
>>>>  > +
>>>>  > +		status = "disabled";
>>>>  > +	};
>>>>  > +
>>>>  > +	lcdc0: lcdc0@13050000 {
>>>>  > +		compatible = "ingenic,jz4780-lcd";
>>>>  > +		reg = <0x13050000 0x1800>;
>>>>  > +
>>>>  > +		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
>>>>  > +		clock-names = "lcd", "lcd_pclk";
>>>>  > +
>>>>  > +		interrupt-parent = <&intc>;
>>>>  > +		interrupts = <31>;
>>>>  > +
>>>>  > +		status = "disabled";
>>>>  I think you can keep lcdc0 enabled by default (not lcdc1 though), 
>>>> since
>>>>  it is highly likely that you'd want that.
>>>  As far as I know, the clock gating for the LCD controllers acts 
>>> like a series
>>>  circuit, meaning that they both need to be enabled. Some testing 
>>> seemed to
>>>  confirm this. Indeed, I seem to remember only enabling one clock 
>>> and not
>>>  getting any output until I figured this weird arrangement out.
>> 
>>  I'm not talking about clocks though, but about LCDC0 and LCDC1.
> 
> Ah, you mean status = "okay"; vs. status = "disabled";
> 
> Well, IMHO it is common practise to keep SoC subsystems disabled by
> default (to save power and boot time) unless a board specific DTS 
> explicitly
> requests the SoC feature to be active. See for example mmc0, mmc1 or 
> i2c0..i2c4.
> 
> All these are disabled in jz4780.dtsi and partially enabled in 
> ci20.dts.
> 
> Why should lcdc0 be an exception in jz4780.dtsi?
> 
> BR and thanks,
> Nikolaus
> 


