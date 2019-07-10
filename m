Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1E964191
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2019 08:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfGJGqb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jul 2019 02:46:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33270 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfGJGqb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jul 2019 02:46:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so1097444otl.0;
        Tue, 09 Jul 2019 23:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=goA0pqDvekqqmxZQjkpFHCZBNwrKPP7M5GIjZbuPPQs=;
        b=Dn2ACj9EnzC10Mxhwl/GbLOGyx01LLVFuYvtNYMVexM46MKXlqDa9q/9MdvWqJVqR0
         Vew3p7VZxbyZm3YfmpGi1m8fdc9zcfTpDR44iiEoXqqm+hcrsMpdTQfXA5jXE9DK11gs
         JMZfBexPsnQDrKIwm6ZAYlN5xjMp5FYHYmBCl4V6scUR1Rx5aizZcK73SnaAqEv+ddZG
         PhMwoKIRBgqJuSSC8LdZu0ZyDLEQhpGqTKjPG5G7LemRHVBbrwC34CkuDM/e11H0dIyU
         cnNyIzFGj/RMZVldwOCXxkRfao+FWo4+CGQt7D60vcpk7dLEGnzgWfFOQy2IafyyOU2L
         1ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=goA0pqDvekqqmxZQjkpFHCZBNwrKPP7M5GIjZbuPPQs=;
        b=crHC6cjt9xtIA1B03GTiVnLof/zk8l8vLpC8jwOK68Xsr963o70GV9sW1cqzoliyfP
         w/C/Q42vmlkfVNTvve3iYE4Opwmz8KlBrAbUkIL4EEquKX/lHTfmQJwFaIfRxhfFVfML
         1H3VJzpiKPr3wIvgBHpnCiT7FGWAuMc7lb6fjTK6mh4APmxSQypT6nV0X8NND7qO+jFS
         Gy6a6zgXk9wDROs6TrcDHS9T1A7cKtuEQ2jf0kqaINUceZlGXsfcl52Y5lnDDwpuRt9u
         eiiieTi+CcYJXk+bKFqKMZxnkqiX8It0WGFLAdWolNoDDVjMqaWI/yvva62IZ7/KZrxK
         CQAw==
X-Gm-Message-State: APjAAAXoTW8QolsMVJYoVgfh4iwgTSrCvqegguWPBrY4NdVTw3EnrxLB
        sGrsMIs1Xp4w47jIeD6JS8jOlm2g7GxDnCVH16DE9g2GXB8=
X-Google-Smtp-Source: APXvYqwIcnkw7X8a0akZ3pqEHKADUO9UWrI7tCnP1Lkr6+Qi6xyfm75eWXyJ5YW6We8QcIF6f6RH7/N25eLs1jSfvKU=
X-Received: by 2002:a05:6830:1350:: with SMTP id r16mr21391473otq.84.1562741190094;
 Tue, 09 Jul 2019 23:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190709182018.23193-1-gch981213@gmail.com> <20190709182018.23193-5-gch981213@gmail.com>
In-Reply-To: <20190709182018.23193-5-gch981213@gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Wed, 10 Jul 2019 14:46:18 +0800
Message-ID: <CAJsYDVJ-qJppkuvbYLmkWU0SBE=UrOoNLrM0kcOzhSTqNTeaWQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] staging: mt7621-dts: add dt nodes for mt7621-pll
To:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 10, 2019 at 2:22 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> This commit adds device-tree node for mt7621-pll and use its clock
> accordingly.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Oops. Please ignore this single patch for now. I forgot to drop
cpuclock node in drivers/staging/mt7621-dts/gbpc1.dts
I'll resend this patch with changes for gbpc1.dts after the other four
patches are applied.

> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> index a4c08110094b..12717f570ceb 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -1,4 +1,5 @@
>  #include <dt-bindings/interrupt-controller/mips-gic.h>
> +#include <dt-bindings/clock/mt7621-clk.h>
>  #include <dt-bindings/gpio/gpio.h>
>
>  / {
> @@ -27,12 +28,11 @@
>                 serial0 = &uartlite;
>         };
>
> -       cpuclock: cpuclock@0 {
> -               #clock-cells = <0>;
> -               compatible = "fixed-clock";
> +       pll: pll {
> +               compatible = "mediatek,mt7621-pll", "syscon";
>
> -               /* FIXME: there should be way to detect this */
> -               clock-frequency = <880000000>;
> +               #clock-cells = <1>;
> +               clock-output-names = "cpu", "bus";
>         };
>
>         sysclock: sysclock@0 {
> @@ -155,7 +155,6 @@
>                         compatible = "ns16550a";
>                         reg = <0xc00 0x100>;
>
> -                       clocks = <&sysclock>;
>                         clock-frequency = <50000000>;
>
>                         interrupt-parent = <&gic>;
> @@ -172,7 +171,7 @@
>                         compatible = "ralink,mt7621-spi";
>                         reg = <0xb00 0x100>;
>
> -                       clocks = <&sysclock>;
> +                       clocks = <&pll MT7621_CLK_BUS>;
>
>                         resets = <&rstctrl 18>;
>                         reset-names = "spi";
> @@ -372,7 +371,7 @@
>                 timer {
>                         compatible = "mti,gic-timer";
>                         interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
> -                       clocks = <&cpuclock>;
> +                       clocks = <&pll MT7621_CLK_CPU>;
>                 };
>         };
>
> --
> 2.21.0
>
