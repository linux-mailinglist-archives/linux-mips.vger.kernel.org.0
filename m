Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 587A52605C
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 11:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfEVJVN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 05:21:13 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35226 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbfEVJVN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 05:21:13 -0400
Received: by mail-ot1-f65.google.com with SMTP id n14so1448065otk.2;
        Wed, 22 May 2019 02:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/fnSZedKvA8Iqi6ZZvsXLPVwAkY8qUX0ojVQgRr2ec=;
        b=B4nCp9iwVFmDlnlJC3mpp9Nenucc4SJmlDyRV13lkG5kBZSrddXzsrURuvUQIeThZY
         Ehr3MLMmqeImqAVXm4MVg0w+eWo9Vbs/sZQtaZxZqpoe1koxkysbIkrSQNECIM6dhiR1
         fPDWm+O1vLzIkp7SM/gQTHak4gmNG++ugA69j6+h0mykjcXAdT+0wfLmGIQkbfJL1ZLY
         lSrceY8mHFRckl2VDgcEnKlVGibVKvsbCKciGAT+h2MWb4aDM0maoW/w3UCOIpRNMAHP
         6IlquCcvhUtV8EmXlQirw1K9rFuLYoItJjR3xubziMDu4IQKBebuob/lMpClAq6MK/3x
         ruyw==
X-Gm-Message-State: APjAAAVwfxxPYnQ0T+NNzYp61+mgMiw/KoaLOtEw7UuaE9M+ITn2zuta
        Y4RyMgMaYU2kayeYYgAZZd0n/YjBPU4NAfCFuUk=
X-Google-Smtp-Source: APXvYqyobpJ63a1iTpV/Vmzl3T4jPFpgqUHVdSsARI3lZgekWUpzNXifpDBaSAjDG4knVag0MFU8Mr62nKwVypF3Ci8=
X-Received: by 2002:a9d:6195:: with SMTP id g21mr4768otk.179.1558516871479;
 Wed, 22 May 2019 02:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190521145141.9813-1-paul@crapouillou.net> <20190521145141.9813-10-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-10-paul@crapouillou.net>
From:   Mathieu Malaterre <malat@debian.org>
Date:   Wed, 22 May 2019 11:21:00 +0200
Message-ID: <CA+7wUsxe4DLmAGNnnXZ3UokguMJ0cOGtu=opQpuAPvN_SH4KUw@mail.gmail.com>
Subject: Re: [PATCH v12 09/13] MIPS: jz4740: Add DTS nodes for the TCU drivers
To:     Paul Cercueil <paul@crapouillou.net>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 21, 2019 at 4:52 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add DTS nodes for the JZ4780, JZ4770 and JZ4740 devicetree files.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>
> Notes:
>     v5: New patch
>
>     v6: Fix register lengths in watchdog/pwm nodes
>
>     v7: No change
>
>     v8: - Fix wrong start address for PWM node
>         - Add system timer and clocksource sub-nodes
>
>     v9: Drop timer and clocksource sub-nodes
>
>     v10-v11: No change
>
>     v12: Drop PWM/watchdog/OST sub-nodes, for now.
>
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 22 ++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 21 +++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 21 +++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 2beb78a62b7d..807d9702d4cf 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -53,6 +53,28 @@
>                 clock-names = "rtc";
>         };
>
> +       tcu: timer@10002000 {
> +               compatible = "ingenic,jz4740-tcu";
> +               reg = <0x10002000 0x1000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10002000 0x1000>;
> +
> +               #clock-cells = <1>;
> +
> +               clocks = <&cgu JZ4740_CLK_RTC
> +                         &cgu JZ4740_CLK_EXT
> +                         &cgu JZ4740_CLK_PCLK
> +                         &cgu JZ4740_CLK_TCU>;
> +               clock-names = "rtc", "ext", "pclk", "tcu";
> +
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <23 22 21>;
> +       };
> +
>         rtc_dev: rtc@10003000 {
>                 compatible = "ingenic,jz4740-rtc";
>                 reg = <0x10003000 0x40>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index 49ede6c14ff3..70932fd90902 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -46,6 +46,27 @@
>                 #clock-cells = <1>;
>         };
>
> +       tcu: timer@10002000 {
> +               compatible = "ingenic,jz4770-tcu";
> +               reg = <0x10002000 0x1000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10002000 0x1000>;
> +
> +               #clock-cells = <1>;
> +
> +               clocks = <&cgu JZ4770_CLK_RTC
> +                         &cgu JZ4770_CLK_EXT
> +                         &cgu JZ4770_CLK_PCLK>;
> +               clock-names = "rtc", "ext", "pclk";
> +
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <27 26 25>;
> +       };
> +
>         pinctrl: pin-controller@10010000 {
>                 compatible = "ingenic,jz4770-pinctrl";
>                 reg = <0x10010000 0x600>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index b03cdec56de9..495082ce7fc5 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -46,6 +46,27 @@
>                 #clock-cells = <1>;
>         };
>
> +       tcu: timer@10002000 {

With W=1, I see:

../arch/mips/boot/dts/ingenic/jz4780.dtsi:64.22-83.4: Warning
(unique_unit_address): /timer@10002000: duplicate unit-address (also
used in node /watchdog@1000
2000)


> +               compatible = "ingenic,jz4770-tcu";
> +               reg = <0x10002000 0x1000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x10002000 0x1000>;
> +
> +               #clock-cells = <1>;
> +
> +               clocks = <&cgu JZ4780_CLK_RTCLK
> +                         &cgu JZ4780_CLK_EXCLK
> +                         &cgu JZ4780_CLK_PCLK>;
> +               clock-names = "rtc", "ext", "pclk";
> +
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +
> +               interrupt-parent = <&intc>;
> +               interrupts = <27 26 25>;
> +       };
> +
>         rtc_dev: rtc@10003000 {
>                 compatible = "ingenic,jz4780-rtc";
>                 reg = <0x10003000 0x4c>;
> --
> 2.21.0.593.g511ec345e18
>
