Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFF072B35B
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 13:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfE0Ljb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 07:39:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44041 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfE0Lja (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 May 2019 07:39:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id g18so14506656otj.11;
        Mon, 27 May 2019 04:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0OzTK0kT2ddqZaGr86QRO9HD6H6ELQHgY3vn9EoNSY=;
        b=nxBPaLcOHEMMdpZHLjXHOILUXYM8fTOI5bfBJJzIuPdm5mvL9uczAcDCZzKQcheqrN
         /sF7iVdTly8QcS37JohIugNQjMN+SdRwmaBlWSF/xXV+G21BU9sSG6IxvMYDy6VXPHka
         fFkS2JnNuppbI0A+djLSGEumGqTrDD273Rcea3ZL1j3XS8ACje+k2KImh+nLJXhy2qgQ
         7K+npPDh3CfHY22hHIYqECLOuBYeiWASF3C5kbgwIVMhNRZRDELzyr3e4j0wGdhtd3ch
         n/RTnCJSfoeoWo1JNkNo4d5wo6AO5aBK5s7Iq7mjEAM5BnDWeIoU1nH0ddDGyz98XP9Q
         4djg==
X-Gm-Message-State: APjAAAV89id1kqpUo8Ajpos7Z4do0GkQNSRoWc00IV5DeQI2NoTE3B0V
        qTmjmzwgYCtu+y4Fq030nQnnVHdu0JHoWMvMO34=
X-Google-Smtp-Source: APXvYqzRJPkCqJiOx+VOhGWb3xNSagzD3mXtVwSHX6dsr/mX9srOC/7Nko7rnVoMhplnBtrellrsrHboMJ8YmHsuPBA=
X-Received: by 2002:a9d:1a5:: with SMTP id e34mr44398857ote.59.1558957169445;
 Mon, 27 May 2019 04:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190521145141.9813-1-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
From:   Mathieu Malaterre <malat@debian.org>
Date:   Mon, 27 May 2019 13:39:18 +0200
Message-ID: <CA+7wUszagtyMV3oMxAi4VqpDeFcBY5ohXZ3PrXe-X5JV21bjBw@mail.gmail.com>
Subject: Re: Ingenic Timer/Counter Unit (TCU) patchset v12
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

On Tue, May 21, 2019 at 4:51 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> Here's the V12 of my patchset to add support for the Timer/Counter Unit
> (TCU) present on the JZ47xx SoCs from Ingenic.
>
> This patchset is much shorter at only 13 patches vs. 27 patches in V11;
> the remaining patches will be sent in parallel (if applicable) or as a
> follow-up patchset once this one is merged.
>
> In V11 the clocksource maintainers weren't happy with the size of the
> ingenic-timer driver, which included clocks and irqchip setup code.
> On the other hand, devicetree maintainers wanted one single node for
> the TCU hardware since it's effectively just one hardware block.
>
> In this patchset the functionality is cut in four different drivers:
> a MFD one to provide the regmap, probe the children and which provides
> several API functions; a clocks driver; a irqchip driver; a clocksource
> driver. All these drivers work with the same regmap, have the same
> compatible strings, and will probe _with the same devicetree node_.

For the series:

Tested-by: Mathieu Malaterre <malat@debian.org>

System: MIPS Creator CI20

For reference, here is my local patch:

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 1bfac58da5df..e7b7da32f278 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/jz4780-cgu.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/dma/jz4780-dma.h>

 / {
@@ -80,6 +81,15 @@

                interrupt-parent = <&intc>;
                interrupts = <27 26 25>;
+
+               watchdog: watchdog@0 {
+                       compatible = "ingenic,jz4780-watchdog";
+                       reg = <0x0 0xc>;
+
+                       clocks = <&tcu TCU_CLK_WDT>;
+                       clock-names = "wdt";
+               };
+
        };

        rtc_dev: rtc@10003000 {
@@ -287,14 +297,6 @@
                status = "disabled";
        };

-       watchdog: watchdog@10002000 {
-               compatible = "ingenic,jz4780-watchdog";
-               reg = <0x10002000 0x10>;
-
-               clocks = <&cgu JZ4780_CLK_RTCLK>;
-               clock-names = "rtc";
-       };
-
        nemc: nemc@13410000 {
                compatible = "ingenic,jz4780-nemc";
                reg = <0x13410000 0x10000>;



> Regards,
> -Paul
>
>
