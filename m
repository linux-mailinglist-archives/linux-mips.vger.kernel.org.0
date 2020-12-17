Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AE32DD3BA
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 16:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgLQPFs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 10:05:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728680AbgLQPFr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Dec 2020 10:05:47 -0500
X-Gm-Message-State: AOAM531j+R0GiglB2SJ8r6p22BrIPwblFsJoIXPeyuSAle+GaFQ1X1es
        3mMMEP9ky5bDaUTCGLXKZwTwWc9MS3x//6ecTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608217507;
        bh=x+kFkV6mi3eV+XXNmnEffGS39avC8Zv4WGoxCR2wmr4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VT2czBgYdiIjvc69F/gaqcCIDqWRtfmbbMiRFs6PqOnVgptBPnTik4qEVKfinCoaX
         +VLXD/Pt7mNAkAtP4p/8jxuQO76gpMboztTiDxMyBvhLj3avY2Xb1c6Lrmv9IokXwX
         8mzhBpMrlEpa+hmo3eFZaOIC/scEpi1vvO9hdXP5IKfNaSPuZqLXhLScMe9rixRPse
         IpdqjM28vWzqnI6mIixGTQBfo6z9/FacA0+TQ0Ov2pEk4D2aHAA/RWQb2phKT991+e
         2uySsF6+Ve3BSWKoHZ0nc2+vMtBXxTEM4MhTD5JP9nOLBFZ6otq8hgEkvDU6SbGhKt
         lzjMnAIsBIcIw==
X-Google-Smtp-Source: ABdhPJx7OHxNWK+/OU12IHe444S7xF7UU/QplM5DDVfmKTAKODUk2jv0nUS2MVL39MLpvpTbC/cFXw1dyWSc8yEd/h0=
X-Received: by 2002:a17:906:1197:: with SMTP id n23mr35658521eja.359.1608217505488;
 Thu, 17 Dec 2020 07:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
 <20201122095556.21597-3-sergio.paracuellos@gmail.com> <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
In-Reply-To: <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Dec 2020 09:04:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLONxqAXRta2iuYNoJ=8wEFdYsiq_OFqgSW3aMLMhy94Q@mail.gmail.com>
Message-ID: <CAL_JsqLONxqAXRta2iuYNoJ=8wEFdYsiq_OFqgSW3aMLMhy94Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>, evicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 17, 2020 at 2:58 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2020-11-22 01:55:52)
> > Adds device tree binding documentation for clocks in the
> > MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> >
>
> Rob?

Send to the DT list please.

But I agree with Stephen's comment. Either make the syscon complete
(fully describe the h/w, not just what you need ATM) to show the need
for child nodes or get rid of the child nodes.

Rob
