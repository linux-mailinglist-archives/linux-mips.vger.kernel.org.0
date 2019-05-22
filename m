Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A328262D9
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 13:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbfEVLQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 07:16:08 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51226 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbfEVLQH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 07:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558523764; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sQdb4SEQMtDupMwnwP5hhbNOdCtEsnxGtObeHTAK/0M=;
        b=DTEguJ7zyqElohAzti93m/3BAwwsnCvQLJQky7KXrv4BOsGGbIYbbX06Tp0r+HHg8+gl/0
        FWjVWlCvoR7xSo7xFjdE2/Vf6nzOrlnChOVK0p0K+iyUU2qQgbIj3fK4H0fZH9m1wQQSRw
        6K5IwZT/5Mg1H0sT0geJn+xK/vO3ZQ0=
Date:   Wed, 22 May 2019 13:15:56 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 09/13] MIPS: jz4740: Add DTS nodes for the TCU drivers
To:     Mathieu Malaterre <malat@debian.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
Message-Id: <1558523756.3066.0@crapouillou.net>
In-Reply-To: <CA+7wUsxe4DLmAGNnnXZ3UokguMJ0cOGtu=opQpuAPvN_SH4KUw@mail.gmail.com>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-10-paul@crapouillou.net>
        <CA+7wUsxe4DLmAGNnnXZ3UokguMJ0cOGtu=opQpuAPvN_SH4KUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, May 22, 2019 at 11:21 AM, Mathieu Malaterre <malat@debian.org> 
wrote:
> On Tue, May 21, 2019 at 4:52 PM Paul Cercueil <paul@crapouillou.net> 
> wrote:
>> 
>>  Add DTS nodes for the JZ4780, JZ4770 and JZ4740 devicetree files.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> 
>>  Notes:
>>      v5: New patch
>> 
>>      v6: Fix register lengths in watchdog/pwm nodes
>> 
>>      v7: No change
>> 
>>      v8: - Fix wrong start address for PWM node
>>          - Add system timer and clocksource sub-nodes
>> 
>>      v9: Drop timer and clocksource sub-nodes
>> 
>>      v10-v11: No change
>> 
>>      v12: Drop PWM/watchdog/OST sub-nodes, for now.
>> 
>>   arch/mips/boot/dts/ingenic/jz4740.dtsi | 22 ++++++++++++++++++++++
>>   arch/mips/boot/dts/ingenic/jz4770.dtsi | 21 +++++++++++++++++++++
>>   arch/mips/boot/dts/ingenic/jz4780.dtsi | 21 +++++++++++++++++++++
>>   3 files changed, 64 insertions(+)
>> 
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi 
>> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  index 2beb78a62b7d..807d9702d4cf 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  @@ -53,6 +53,28 @@
>>                  clock-names = "rtc";
>>          };
>> 
>>  +       tcu: timer@10002000 {
>>  +               compatible = "ingenic,jz4740-tcu";
>>  +               reg = <0x10002000 0x1000>;
>>  +               #address-cells = <1>;
>>  +               #size-cells = <1>;
>>  +               ranges = <0x0 0x10002000 0x1000>;
>>  +
>>  +               #clock-cells = <1>;
>>  +
>>  +               clocks = <&cgu JZ4740_CLK_RTC
>>  +                         &cgu JZ4740_CLK_EXT
>>  +                         &cgu JZ4740_CLK_PCLK
>>  +                         &cgu JZ4740_CLK_TCU>;
>>  +               clock-names = "rtc", "ext", "pclk", "tcu";
>>  +
>>  +               interrupt-controller;
>>  +               #interrupt-cells = <1>;
>>  +
>>  +               interrupt-parent = <&intc>;
>>  +               interrupts = <23 22 21>;
>>  +       };
>>  +
>>          rtc_dev: rtc@10003000 {
>>                  compatible = "ingenic,jz4740-rtc";
>>                  reg = <0x10003000 0x40>;
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi 
>> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  index 49ede6c14ff3..70932fd90902 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  @@ -46,6 +46,27 @@
>>                  #clock-cells = <1>;
>>          };
>> 
>>  +       tcu: timer@10002000 {
>>  +               compatible = "ingenic,jz4770-tcu";
>>  +               reg = <0x10002000 0x1000>;
>>  +               #address-cells = <1>;
>>  +               #size-cells = <1>;
>>  +               ranges = <0x0 0x10002000 0x1000>;
>>  +
>>  +               #clock-cells = <1>;
>>  +
>>  +               clocks = <&cgu JZ4770_CLK_RTC
>>  +                         &cgu JZ4770_CLK_EXT
>>  +                         &cgu JZ4770_CLK_PCLK>;
>>  +               clock-names = "rtc", "ext", "pclk";
>>  +
>>  +               interrupt-controller;
>>  +               #interrupt-cells = <1>;
>>  +
>>  +               interrupt-parent = <&intc>;
>>  +               interrupts = <27 26 25>;
>>  +       };
>>  +
>>          pinctrl: pin-controller@10010000 {
>>                  compatible = "ingenic,jz4770-pinctrl";
>>                  reg = <0x10010000 0x600>;
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi 
>> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  index b03cdec56de9..495082ce7fc5 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  @@ -46,6 +46,27 @@
>>                  #clock-cells = <1>;
>>          };
>> 
>>  +       tcu: timer@10002000 {
> 
> With W=1, I see:
> 
> ../arch/mips/boot/dts/ingenic/jz4780.dtsi:64.22-83.4: Warning
> (unique_unit_address): /timer@10002000: duplicate unit-address (also
> used in node /watchdog@1000
> 2000)

That didn't happen in V11 because there I was also migrating the
watchdog and PWM drivers to children nodes of the TCU. It was more
atomic, but it also was a 27-patches bomb touching a lot of
subsystems that nobody was ever going to merge.

Is the address conflict OK, knowing that the watchdog node will
move out of the way as soon as this patchset is merged?

Should I add an extra patch to remove the watchdog node instead?

(and yes, devicetree ABI will break, which is sort-of OK in this
case - as on Ingenic boards the devicetree blobs are always
compiled within the kernel, so I think we should make this
much-needed change while we still can).


>>  +               compatible = "ingenic,jz4770-tcu";
>>  +               reg = <0x10002000 0x1000>;
>>  +               #address-cells = <1>;
>>  +               #size-cells = <1>;
>>  +               ranges = <0x0 0x10002000 0x1000>;
>>  +
>>  +               #clock-cells = <1>;
>>  +
>>  +               clocks = <&cgu JZ4780_CLK_RTCLK
>>  +                         &cgu JZ4780_CLK_EXCLK
>>  +                         &cgu JZ4780_CLK_PCLK>;
>>  +               clock-names = "rtc", "ext", "pclk";
>>  +
>>  +               interrupt-controller;
>>  +               #interrupt-cells = <1>;
>>  +
>>  +               interrupt-parent = <&intc>;
>>  +               interrupts = <27 26 25>;
>>  +       };
>>  +
>>          rtc_dev: rtc@10003000 {
>>                  compatible = "ingenic,jz4780-rtc";
>>                  reg = <0x10003000 0x4c>;
>>  --
>>  2.21.0.593.g511ec345e18
>> 


