Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57EE44B414
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 21:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244476AbhKIUjN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 9 Nov 2021 15:39:13 -0500
Received: from aposti.net ([89.234.176.197]:52358 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244036AbhKIUjN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 15:39:13 -0500
Date:   Tue, 09 Nov 2021 20:36:06 +0000
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
Message-Id: <6WNB2R.GJ2KT1BB7QOY1@crapouillou.net>
In-Reply-To: <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
        <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
        <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
        <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
        <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
        <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le mar., nov. 9 2021 at 21:19:17 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 07.11.2021 um 20:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>>  6. Therefore I think it *may* work overclocked with 48MHz
>>>  but is not guaranteed or reliable above 27 MHz.
>>>  So everything is ok here.
>> 
>>  One thing though - the "assigned-clocks" and 
>> "assigned-clock-rates", while it works here, should be moved to the 
>> CGU node, to respect the YAML schemas.
> 
> Trying to do this seems to break boot.
> 
> I can boot up to
> 
> [    8.312926] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare 
> HDMI I2C bus driver
> 
> and
> 
> [   11.366899] [drm] Initialized ingenic-drm 1.1.0 20200716 for 
> 13050000.lcdc0 on minor 0
> 
> but then the boot process becomes slow and hangs. Last sign of 
> activity is
> 
> [   19.347659] hub 1-0:1.0: USB hub found
> [   19.353478] hub 1-0:1.0: 1 port detected
> [   32.321760] wlan0_power: disabling
> 
> What I did was to just move
> 
> 		assigned-clocks = <&cgu JZ4780_CLK_HDMI>;
> 		assigned-clock-rates = <27000000>;
> 
> from
> 
> 	hdmi: hdmi@10180000 {
> 
> to
> 
> 	cgu: jz4780-cgu@10000000 {
> 
> Does this mean the clock is assigned too early or too late?
> 
> Do you have any suggestions since I don't know the details of CGU.

These properties are already set for the CGU node in ci20.dts:

&cgu {
	/*
	 * Use the 32.768 kHz oscillator as the parent of the RTC for a higher
	 * precision.
	 */
	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>;
	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>;
	assigned-clock-rates = <48000000>;
};

So you want to update these properties to add the HDMI clock setting, 
like this:

	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>, 
<&cgu JZ4780_CLK_HDMI>;
	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>;
	assigned-clock-rates = <48000000>, <0>, <27000000>;

Cheers,
-Paul


