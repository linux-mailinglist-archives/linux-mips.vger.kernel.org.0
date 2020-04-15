Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DCC1AA8EA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 15:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633451AbgDONo0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 09:44:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38760 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730647AbgDONoW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Apr 2020 09:44:22 -0400
Received: by mail-ed1-f66.google.com with SMTP id e5so4874383edq.5;
        Wed, 15 Apr 2020 06:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ue1uYbSCM3f3qpA8DP0y7k1ImrV8BLgfQdpHr8wCsNY=;
        b=rpO9MnuZ7LUd/ZIOmj2qbKe0/TaEjah/TLCxkZpXoXGjK/A3yPVenorS7cbNxROyh7
         WfrRYLna0DDCJX9HtDBU9Tbt0TcWRQ7g8YIGVUmRNB1eT2VySRHIAPGFUzs0PR4ZDAM3
         gLwZzmwMxxNsOBlwzCj/81AChokwFjuV2BEmeZMVa5ONQ6B0lvkEe6dx11hrNXlKjPGB
         PVPGEVLBOgme4fJu727b3Zn4fVRmtzfApq6jFdwMacNwRK8TJ+XvKDO/eYML/ZW7EFD6
         bLqAhgpREjkbK5m8Mizjp0mlUttn56QaIDDyAcysI7ZO7EdXf/E8dQHxSEXAqJqhMagR
         Ahnw==
X-Gm-Message-State: AGi0Pua+I8RsrF+K0p94JD3SRwtP2Pa6sEZ4fTZ32X0fVJWvvwSE81v2
        6ujeTK0oP6HHd4LFsORbvwjpodqc
X-Google-Smtp-Source: APiQypKNYzTDTcjJXJkyJ1tW3CmeNRTTMuezBm45FxKlxDAUOBaCIldgd2OqLmdaCh5e2z6JTgFDtA==
X-Received: by 2002:a17:907:118b:: with SMTP id uz11mr4894575ejb.89.1586958259236;
        Wed, 15 Apr 2020 06:44:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id bs8sm2626297ejb.92.2020.04.15.06.44.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 06:44:18 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:44:15 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
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
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Message-ID: <20200415134415.GA21120@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 02:50:31PM +0200, H. Nikolaus Schaller wrote:
> 
> > Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> > 
> > On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> 
> >> From: Jonathan Bakker <xc-racer2@live.ca>
> >> 
> >> to add support for SGX540 GPU.
> > 
> > Do not continue the subject in commit msg like it is one sentence.
> > These are two separate sentences, so commit msg starts with capital
> > letter and it is sentence by itself.
> > 
> >> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> ---
> >> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
> >> 1 file changed, 15 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> >> index 2ad642f51fd9..e7fc709c0cca 100644
> >> --- a/arch/arm/boot/dts/s5pv210.dtsi
> >> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> >> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
> >>                        #interrupt-cells = <1>;
> >>                };
> >> 
> >> +               g3d: g3d@f3000000 {
> >> +                       compatible = "samsung,s5pv210-sgx540-120";
> >> +                       reg = <0xf3000000 0x10000>;
> >> +                       interrupt-parent = <&vic2>;
> >> +                       interrupts = <10>;
> >> +                       clock-names = "sclk";
> >> +                       clocks = <&clocks CLK_G3D>;
> > 
> > Not part of bindings, please remove or add to the bindings.
> 
> Well, the bindings should describe what is common for all SoC
> and they are quite different in what they need in addition.
> 
> Thererfore we have no "additionalProperties: false" in the
> bindings [PATCH v6 01/12].

If these properties are needed for Exynos-specific implementation, they
should be in the bindings. If they are not needed, they should not be
here.

Take a look at midgard bindings for example. This is a nice starting
point for these here.

Best regards,
Krzysztof
