Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F103928DEF9
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 12:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgJNKdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 06:33:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:43762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbgJNKdl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 06:33:41 -0400
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9666120878;
        Wed, 14 Oct 2020 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602671619;
        bh=YTNSXcW0k5VpGDP+ALIpIyuW3iLRTmD54rqCQ1oyiyA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sBHnz1yyxbvpzxpccOns8mp5Of03gj29/RNRo3g82Ev+clfKBrk3KB5XrR8yt+GLl
         pmdEOB8h3WOAsY4KGNHM6cEFI07KwBf89dw+Gj6iqzCXZZziXMohhgdikBTZ5zGwnn
         ltFgloehCf+cN94VB8NVLy20CDewVMaT7n7srMMg=
Received: by mail-ej1-f45.google.com with SMTP id p5so1298911ejj.2;
        Wed, 14 Oct 2020 03:33:39 -0700 (PDT)
X-Gm-Message-State: AOAM532KgEJ3XGCmU0xda99mxHtSh9lVBBIHW/Ul6I67ftqQ/f3WdKhW
        YIcsf1kxnY5J9Tuqh6EyMMIdczSlsoucu0rJis0=
X-Google-Smtp-Source: ABdhPJxZBjfPkS/DAl69mvwOwG4fxUYT0dQEW6rrgGKRXDR2yPgf5o4BRFNdNiVveb84vPHaKXSGoZA2E31iHMoZKKE=
X-Received: by 2002:a17:906:1a11:: with SMTP id i17mr4430823ejf.381.1602671617348;
 Wed, 14 Oct 2020 03:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru> <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 14 Oct 2020 12:33:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
Message-ID: <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 at 12:23, Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the DWC USB3 bindings the corresponding node name is
> suppose to comply with Generic USB HCD DT schema, which requires the USB
> nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> the dtbs_check procedure failure. Let's fix the nodes naming to be
> compatible with the DWC USB3 DT schema to make dtbs_check happy.
>
> Note we don't change the DWC USB3-compatible nodes names of
> arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> in-source comment says that the nodes name need to be preserved as
> "^dwusb@.*" for some backward compatibility.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>
> ---
>
> Please, test the patch out to make sure it doesn't brake the dependent DTS
> files. I did only a manual grepping of the possible nodes dependencies.

1. It is you who should compare the decompiled DTS, not us. For example:
$ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done

$ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
fdtdump ${i} > ${i}.fdt ; crosc64 fdtdump dts-new/${i#dts-old/} >
dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt
dts-new/${i#dts-old/}.fdt ; done

2. Split it per arm architectures (and proper subject prefix - not
"arch") and subarchitectures so maintainers can pick it up.

3. The subject title could be more accurate - there is no fix here
because there was no errors in the first place. Requirement of DWC
node names comes recently, so it is more alignment with dtschema.
Otherwise automatic-pickup-stable-bot might want to pick up... and it
should not go to stable.

Best regards,
Krzysztof

>  arch/arm/boot/dts/armada-375.dtsi              | 2 +-
>  arch/arm/boot/dts/exynos5250.dtsi              | 2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi              | 4 ++--
>  arch/arm/boot/dts/keystone-k2e.dtsi            | 4 ++--
>  arch/arm/boot/dts/keystone.dtsi                | 2 +-
>  arch/arm/boot/dts/ls1021a.dtsi                 | 2 +-
>  arch/arm/boot/dts/omap5-l4.dtsi                | 2 +-
>  arch/arm/boot/dts/stih407-family.dtsi          | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   | 2 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 4 ++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi        | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi      | 2 +-
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   | 4 ++--
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi          | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi       | 2 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi           | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi           | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8150.dtsi           | 2 +-
>  25 files changed, 38 insertions(+), 38 deletions(-)
>
