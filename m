Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913851B2930
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 16:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUOPz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 10:15:55 -0400
Received: from muru.com ([72.249.23.125]:50572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728712AbgDUOPz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 10:15:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CD62F8081;
        Tue, 21 Apr 2020 14:16:33 +0000 (UTC)
Date:   Tue, 21 Apr 2020 07:15:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
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
Message-ID: <20200421141543.GU37466@atomide.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* Maxime Ripard <maxime@cerno.tech> [200421 11:22]:
> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
> > I had a look on genpd and I'm not really sure if that fits.
> > 
> > It is basically some bit that verify that the clocks should be enabled or
> > disabled.
> 
> No, it can do much more than that. It's a framework to control the SoCs power
> domains, so clocks might be a part of it, but most of the time it's going to be
> about powering up a particular device.

Note that on omaps there are actually SoC module specific registers.
And there can be multiple devices within a single target module on
omaps. So the extra dts node and device is justified there.

For other SoCs, the SGX clocks are probably best handled directly
in pvr-drv.c PM runtime functions unless a custom hardware wrapper
with SoC specific registers exists.

Regards,

Tony


