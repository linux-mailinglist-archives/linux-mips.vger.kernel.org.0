Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDC81B5FD4
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 17:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgDWPqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 11:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729176AbgDWPqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 11:46:44 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F720C09B040;
        Thu, 23 Apr 2020 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587656801;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ybxxfVp12h/EJrmfUJdRJSGTmKH3W7lZYEApLFlERWY=;
        b=DrKJ9fNz8WxLH/lxvzqH+AMSam9tu2FhRn1b+DxbazOFoXyS93+afrGgpwefT4t6QC
        /4k7b51LsSANcN/xVgHDnGc9MzXErXxCPQeHuiElt1upkXq+nvKp9tSqjV5+k1mBfxS3
        gAkvjEQjZJNlc0Yw5yj/hGkMx2dR3nhn+e4WqxPIVEcRt6S9melWvYcV+2h+8m47DJTF
        K+utEk2anK6Ms4Lb8UzV2Zj3a1+UkWzb9yq/ZlLTRil6UF5EXzHTWRMjAccLpfo3BT1D
        qJ7BmeYa+eOlmSQs2uTl6iNBaTpywNCpLK63P2AacOcUu0H5TmLKFwDnMPpJpV6cP8ls
        aO1A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCysOfl5tOw33QtdTbGcCRJGxnkq3ByzlXOnoXby"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2692:1500:61a3:e550:2224:7950]
        by smtp.strato.de (RZmta 46.6.2 AUTH)
        with ESMTPSA id R0acebw3NFjv7lw
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 23 Apr 2020 17:45:57 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
Date:   Thu, 23 Apr 2020 17:45:55 +0200
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <71F2F964-32C7-41E6-8F1A-A73161EA1BB3@goldelico.com>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan> <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com> <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com> <20200420073842.nx4xb3zqvu23arkc@gilmour.lan> <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan> <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com> <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan> <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com> <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Neil,

> Am 23.04.2020 um 17:00 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>> One thing we can learn is that "core" seems to be a de facto standard=20=

>> for the core clock-name. An alternative "gpu" is used by =
nvidia,gk20a.txt.
>=20
> Usually IPs needs a few clocks:
> - pclk or apb or reg: the clock clocking the "slave" bus to serve the =
registers
> - axi or bus or ahb: the bus clocking the the "master" bus to get data =
from system memory
> - core: the actual clock feeding the GPU logic

And the sgx544 seems to have two such clocks.

> Sometimes you have a single clock for slave and master bus.
>=20
> But you can also have separate clocks for shader cores, .. this =
depends on the IP and it's architecture.
> The IP can also have memories with separate clocks, etc...

Indeed.

> But all these clocks can be source by an unique clock on a SoC, but =
different on another
> SoC, this is why it's important to list them all, even optional.
>=20
> You'll certainly have at least a reset signal, and a power domain, =
these should exist and be optional.

Well, they exist only as hints in block diagrams of some SoC data sheets
(so we do not know if they represent the imagination definitions) and =
the
current driver code doesn't make use of it. Still the gpu core works.

So I do not see any urgent need to add a complete list to the bindings =
now.

Unless some special SoC integration makes use of them. Then it is IMHO =
easier
to extend the bindings by a follow-up patch than now thinking about all
potential options and bloating the bindings with things we (the open =
source
community) doesn't and can't know.

My goal is to keep the bindings as minimalistic as possible. And reset =
lines
and power domains are (at least for those we have in the works) not =
needed
to make working systems.

Therefore, for clocks I also would start with a minimalistic approach =
for
a single optional GPU core clock and leave out reset and power =
completely.

BR and thanks,
Nikolaus

