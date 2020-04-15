Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3E51A9E0B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 13:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409509AbgDOLuB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 07:50:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406447AbgDOLt6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 07:49:58 -0400
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4691F21744;
        Wed, 15 Apr 2020 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586951397;
        bh=wuXS7RCUYgyS51p4SeDx49zy51VkJGb5/qdr8yBZ0d4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xeYP5cgafRPn6YhT6fu/+txsms6Rtv2DIovKV6n2lrE++374gHweZw442o4eW6zsC
         0QPce/mOtpt2CYbuX3ZFAnyYNI2ZEwjJnhtikf8CEIIN6kqNvsnWY7Mv65g7qt/ye7
         uxrNjWBorfjR3nRfrgurBt9sUOOix1lQMqGuSVeE=
Received: by mail-lj1-f172.google.com with SMTP id l14so3320926ljj.5;
        Wed, 15 Apr 2020 04:49:57 -0700 (PDT)
X-Gm-Message-State: AGi0PuZjsKu6zf8LL5CFFTykBFz9Ow4IvwbcDnVlR60DqUO+zLPg55Wi
        Mn3f2JxQvMpWmfYUIWCrwd9HLJrKBdE/jlykFDA=
X-Google-Smtp-Source: APiQypJ6JgZvNxuPA2SlFZq3seBA6kaFPbk0RkqFDGIpIMdWvmYwpqEO8cmLBYYdZ/c1p1IHSS++MGMZGzTZDC6zHHI=
X-Received: by 2002:a2e:9845:: with SMTP id e5mr3131512ljj.201.1586951395296;
 Wed, 15 Apr 2020 04:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586939718.git.hns@goldelico.com> <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
In-Reply-To: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 15 Apr 2020 13:49:44 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Message-ID: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> From: Jonathan Bakker <xc-racer2@live.ca>
>
> to add support for SGX540 GPU.

Do not continue the subject in commit msg like it is one sentence.
These are two separate sentences, so commit msg starts with capital
letter and it is sentence by itself.

> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..e7fc709c0cca 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>                         #interrupt-cells = <1>;
>                 };
>
> +               g3d: g3d@f3000000 {
> +                       compatible = "samsung,s5pv210-sgx540-120";
> +                       reg = <0xf3000000 0x10000>;
> +                       interrupt-parent = <&vic2>;
> +                       interrupts = <10>;
> +                       clock-names = "sclk";
> +                       clocks = <&clocks CLK_G3D>;

Not part of bindings, please remove or add to the bindings.

> +
> +                       power-domains = <&pd S5PV210_PD_G3D>;

Ditto

> +
> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> +                       assigned-clock-rates = <0>, <66700000>;
> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;

Probably this should have status disabled because you do not set
regulator supply.

Best regards,
Krzysztof
