Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D6E28589E
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 08:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgJGG0C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 02:26:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:46006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgJGG0C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Oct 2020 02:26:02 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC69221531;
        Wed,  7 Oct 2020 06:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602051961;
        bh=9J6pd4Urt8nLaYajtW0xX9CVZZNmrwIcH02wFm6GCzo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cjP10fipeHTdrU/XdlnBVJ7nEBd1DP/mHTZ4wefjHHoLp9lxNvYU9bP5xkqznMJxe
         wdl3FjyjprNsFoIgfs4MvjUw8+2mX9yOGKdDx/q7PdKmPRqW4i18tmFXSJXv87xb/w
         jYTrYjlyVbMDlYgJfvP/m4NxZ5TcwBYezWVwQrWs=
Received: by mail-ed1-f53.google.com with SMTP id t21so925268eds.6;
        Tue, 06 Oct 2020 23:26:00 -0700 (PDT)
X-Gm-Message-State: AOAM530pnQbCX/Wfw4gFW4sJnl0D9pyL7OzzwdjDQTdcsuEfdSR6ObD4
        oavjcPDY2io3rAY8m8nUo3P5JNDVPiUI/ffdeZo=
X-Google-Smtp-Source: ABdhPJzlgSjYiE8Nro65NAUBEhu5or+8YJ/UtMdDrVp9y+cPmyFnaghXEP0Rg3rNv4h1igGfmvWPgDizOURlpLSk7PM=
X-Received: by 2002:a50:a452:: with SMTP id v18mr1834674edb.143.1602051959063;
 Tue, 06 Oct 2020 23:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de> <20201005203451.9985-8-post@lespocky.de>
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 7 Oct 2020 08:25:47 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] ARM: dts: exynos: Fix schema warnings for pwm-leds
To:     Alexander Dahl <post@lespocky.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 5 Oct 2020 at 22:36, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
>
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts      |  4 ++--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts      |  4 ++--
>  arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 11 ++++++-----
>  3 files changed, 10 insertions(+), 9 deletions(-)

Looks OK but it is too late for this cycle. I'll pick it up after merge window.

Best regards,
Krzysztof
