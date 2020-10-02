Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE29280F9B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 11:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBJNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 05:13:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBJNE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 05:13:04 -0400
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF4222074B;
        Fri,  2 Oct 2020 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601629984;
        bh=8a9a2j+Q9TdoEDPH23Ae2HnjNbpRmIF9vtNV8rnH2vQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e2Ws41X+UNrnNFSTOb3hHvWb3YfjncnZQ59oCGnE7JOU6e7heO6JfoSLH5pHei0eg
         BC2b71jVluyqxGHJ0QR5kWnUooypgWbQFCErWr5684bzCO+XF6iFpwxtP7Y+nxZdxZ
         RpIRhmFkBimbov+669+iCgi5oldne2Y5z8G4dV28=
Received: by mail-ed1-f51.google.com with SMTP id t16so913601edw.7;
        Fri, 02 Oct 2020 02:13:03 -0700 (PDT)
X-Gm-Message-State: AOAM533bhUyNTzqj6FIBc7ggNOs45TVm+lKNinn8GSshSYsJEZYmiri4
        4up+B3qc6q12m/n58FmoW9WbaC+axTBMtJFW8XA=
X-Google-Smtp-Source: ABdhPJxBtB7fdjB7sO1ypylhPr0oi8dpib+2DW5jCMpkty90gseodUSNpkeVzNSqRvn/UxzjtCaV66+yk1Gc6ZLF7DA=
X-Received: by 2002:a05:6402:22b7:: with SMTP id cx23mr1353773edb.246.1601629982305;
 Fri, 02 Oct 2020 02:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-6-post@lespocky.de>
In-Reply-To: <20200930234637.7573-6-post@lespocky.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 11:12:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Message-ID: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6:
>       * added this patch to series
>
>  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
>  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
>  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
>  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
>  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
>  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
>  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
>  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--

Somehow you did not CC the maintainers... please use
scripts/get_maintainers.pl to obtain list of addresses.

All these should be separate patches per sub-architecture.

Best regards,
Krzysztof
