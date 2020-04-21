Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035C51B2E71
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 19:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgDURjq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 13:39:46 -0400
Received: from muru.com ([72.249.23.125]:50688 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729234AbgDURjq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 13:39:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C057C8081;
        Tue, 21 Apr 2020 17:40:29 +0000 (UTC)
Date:   Tue, 21 Apr 2020 10:39:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200421173938.GZ37466@atomide.com>
References: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200421 17:31]:
> > Am 21.04.2020 um 16:15 schrieb Tony Lindgren <tony@atomide.com>:
> > Note that on omaps there are actually SoC module specific registers.
> 
> Ah, I see. This is of course a difference that the TI glue logic has
> its own registers in the same address range as the sgx and this can't
> be easily handled by a common sgx driver.
> 
> This indeed seems to be unique with omap.
> 
> > And there can be multiple devices within a single target module on
> > omaps. So the extra dts node and device is justified there.
> > 
> > For other SoCs, the SGX clocks are probably best handled directly
> > in pvr-drv.c PM runtime functions unless a custom hardware wrapper
> > with SoC specific registers exists.
> 
> That is why we need to evaluate what the better strategy is.
> 
> So we have
> a) omap which has a custom wrapper around the sgx
> b) others without, i.e. an empty (or pass-through) wrapper
> 
> Which one do we make the "standard" and which one the "exception"?
> What are good reasons for either one?

The wrapper is already handled by the ti-sysc binding, the sgx
binding should be standard with optional clocks.

See for example the standard 8250 uart for am335x with:

$ git grep -B20 -A10 uart0 arch/arm/boot/dts/am33xx-l4.dtsi

The 8250 device configuration is described in the standard 8250
dts binding, and the am335x module in the ti-sysc binding.
The are separate devices :)

So for the sgx binding, you can just leave out TI specific
module wrapper completely from the example.

> It also allows to handle different number of clocks (A31 seems to
> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
> or making big lists of conditionals. This variance would be handled
> outside the sgx core bindings and driver.

Well if other SoCs implement genpd domains etc, that's then
again part of a separate binding and not part of the sgx binding.

Regards,

Tony
