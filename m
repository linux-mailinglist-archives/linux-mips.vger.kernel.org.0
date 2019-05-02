Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87691243B
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 23:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfEBVmo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 17:42:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbfEBVmo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 17:42:44 -0400
Received: from localhost (unknown [104.132.0.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3C902063F;
        Thu,  2 May 2019 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556833362;
        bh=OCcw8kmWfFL4OJ4vDfz0JAFzx/KSGmy5q3CFWyn1YUA=;
        h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
        b=I9nz6kect4Kkf8oxnz4HRnUeFZ+kp5/n+4iIer2lQBr6loIzVwxIipubu/SI+d1WP
         NPd3Ja2yIoDqBTYDFHaOYLhGYtGhzd1iHHqCzNpsKyeSe4K9je3QUvrw+08rstIPxR
         /mWlUvJrXWHl3jodvupHYetQZ2BU6quui//34KU4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1fe454d3-f24e-4169-5f57-97d516a16cc8@gmail.com>
References: <20190405000129.19331-1-drvlabo@gmail.com> <20190405000129.19331-3-drvlabo@gmail.com> <155622059236.15276.15417177789148260137@swboyd.mtv.corp.google.com> <1fe454d3-f24e-4169-5f57-97d516a16cc8@gmail.com>
To:     NOGUCHI Hiroshi <drvlabo@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC v2 2/5] dt-bindings: clk: add document for ralink clock driver
Message-ID: <155683336194.200842.626018072256859764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 02 May 2019 14:42:41 -0700
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting NOGUCHI Hiroshi (2019-05-01 04:33:24)
>=20
>=20
> On 2019/04/26 4:29, Stephen Boyd wrote:
> >> +Required properties:
> >> + - compatible: must be "ralink,rt2880-clock"
> >> + - #clock-cells: must be 1
> >> + - ralink,sysctl: a phandle to a ralink syscon register region
> >> + - clock-indices: identifying number.
> >> +       These must correspond to the bit number in CLKCFG1.
> >=20
> > These look like driver level details that we're putting in the DT so we
> > can compress the number space that consumers use. Is that right? If so,
> > I don't get it. Can we not use this property?
>=20
> I understand that the bit numbers in clock gating register are hardware=20
> resource informations.
> Therefore, it is not strange that they are described in DT, I think.
>=20
>=20
> >> +       Clock consumers use one of them as #clock-cells index.
> >> + - clock-output-names: array of gating clocks' names
> >> + - clocks: array of phandles which points the parent clock
> >> +       for gating clocks.
> >> +       If gating clock does not need parent clock linkage,
> >> +       we bind to dummy clock whose frequency is zero.
> >> +
> >> +
> >> +Example:
> >> +
> >> +/* dummy parent clock node */
> >> +dummy_ck: dummy_ck {
> >> +       #clock-cells =3D <0>;
> >> +       compatible =3D "fixed-clock";
> >> +       clock-frequency =3D <0>;
> >> +};
> >=20
> > Would this ever exist in practice? If not, please remove from the
> > example so we don't get the wrong idea.
>=20
> I referred to arch/arm/boot/dts/.
> omap24xx-clocks.dtsi : defines dummy_ck
> omap2420-clocks.dtsi : refers dummy_ck
>=20
>=20
> In practice, There is no problem in specifying another existing clock,
> eg MT7620_CLK_PERIPH which is always active.

Ok. Please don't add things that don't exist into the example like dummy
clks. Sometimes people copy the examples directly and this can lead to
errors in the resulting DTBs.

>=20
>=20
> >> +
> >> +clkctrl: clkctrl {
> >> +       compatible =3D "ralink,rt2880-clock";
> >> +       #clock-cells =3D <1>;
> >> +       ralink,sysctl =3D <&sysc>;
> >> +
> >> +       clock-indices =3D
> >> +                       <12>,
> >> +                       <16>, <17>, <18>, <19>,
> >> +                       <20>,
> >> +                       <26>;
> >> +       clock-output-names =3D
> >> +                       "uart0",
> >> +                       "i2c", "i2s", "spi", "uart1",
> >> +                       "uart2",
> >> +                       "pcie0";
> >> +       clocks =3D
> >> +                       <&pll MT7620_CLK_PERIPH>,
> >> +                       <&pll MT7620_CLK_PERIPH>, <&pll MT7620_CLK_PCM=
I2S>, <&pll MT7620_CLK_SYS>, <&pll MT7620_CLK_PERIPH>,
> >> +                       <&pll MT7620_CLK_PERIPH>,
> >> +                       <&dummy_ck>;
> >> +       };
> >> +};
> >> +
> >> +/* consumer which refers "uart0" clock */
> >> +uart0: uartlite@c00 {
> >> +       compatible =3D "ns16550a";
> >> +       reg =3D <0xc00 0x100>;
> >> +
> >> +       clocks =3D <&clkctrl 12>;
> >=20
> > So 12 matches in indices and then that is really "uart0" clk?
> >=20
> >> +       clock-names =3D "uart0";
> >> +
>=20
> That is right.
> rt2880-clock driver is implemented to let clock cell indices match=20
> indcies in "clock-indices" property.

Usually the binding has a bunch of #defines for the clks, instead of
using raw integers to indicate which clock it is. Then consumers point
to that clk via <&phandle DEFINE>, similar to your 'clocks' property
above in the clkctrl node. Then a clk provider driver will remap that
DEFINE to a clk_hw structure and the driver contains the register
offsets and bits to twiddle to control the clk.

It looks like here we put those register offsets and bits to twiddle in
DT as clock-indices, and then consumers are supposed to know what
clock-indices to match based on the register bits of the clk? That's a
novel approach that may work here but doesn't really scale. I guess it's
OK, but I'd prefer to see #defines even for the clock-indices like
RT2800_UART0 or RT2800_I2C.

After that, it seems risky to put the details of what bits to twiddle in
DT because it expresses driver level hardware details in a place where
we might not be able to as easily modify or fix those bits if certain
clks don't get tested. If we had only specified the provider/consumer
part of the binding (i.e. the numbers in the clk specifier) we wouldn't
need to worry as much because we could fix those driver details in the
driver.

