Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E5D1C2D29
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 17:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgECPBs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 11:01:48 -0400
Received: from muru.com ([72.249.23.125]:52668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbgECPBs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 May 2020 11:01:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5955480BF;
        Sun,  3 May 2020 15:02:34 +0000 (UTC)
Date:   Sun, 3 May 2020 08:01:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200503150143.GG37466@atomide.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
 <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
 <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
 <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
 <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
 <8EER9Q.C206SXNSICP7@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8EER9Q.C206SXNSICP7@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* Paul Cercueil <paul@crapouillou.net> [200503 14:19]:
> You have a new SoC with a SGX, and you only need to enable one clock to get
> it to work. So you create a devicetree node which receives only one clock.
> 
> Turns out, that the bootloader was enabling the other 3 clocks, and since
> the last release, it doesn't anymore. You're left with having to support a
> broken devicetree.
> 
> That's the kind of problem that can be easily avoided by enforcing the
> number of clocks that have to be provided.

The number of clocks depends on how it's wired for the SoC.

On omaps, there's are no controls for additinoal SGX clocks. Sure some
of the clocks may be routed to multple places internally by the wrapper
module. But we have no control over that.

If we wanted to specify just the "fck" clock on omaps, then we can
do it with something like this:

allOf:
  - if:
    properites:
      compatible:
        enum:
	  - "ti,omap4-sgx544-112"
	  - "ti,omap5-sgx544-116"
	  - "ti,dra7-sgx544-116"
    then:
      properties:
        clocks:
	  minItems: 1
	  maxItems: 1

        clock-names:
	  const: fck

    required:
      - clocks
      - clock-names

There's no need for the SGX driver to toggle the "fck" here, it's
all done by PM runtime alreaedy so we would be just tweaking
the usage count for it. But hey, showing the clock rate might
be nice. Or maybe we want to at some point scale it, so no problem
specifying it.

For omap3, we should then specify "fck" and "ick". On omap4 and
later, there's no separate control over the "ick".

Then for the other SoCs, you can specify whatever clocks you need
there.

Regards,

Tony
