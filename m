Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C72A28E67D
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 20:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388617AbgJNSfe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 14:35:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388112AbgJNSfa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 14:35:30 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 322C122267;
        Wed, 14 Oct 2020 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602700529;
        bh=Pda5e4mTtOE+ZlY6hUmRRRDO7I+9vJoYWhBous9Gcls=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Pofh7UmO7iRQ6dIxMcM+BkYBtJ7jUuuDxYvnx45uCg3oTKCzplu1qgt32rENNlGE+
         6CbsGFGyyKtjPzOfwqXjDpOqeJ9TKaHnrisubMIcT108UpGEmLQHnQg3MzptTLo85b
         09GIwDh7G3BzSCkAOxH94vxwT2RuWvy6ESdGDHkk=
Received: by mail-ua1-f41.google.com with SMTP id x11so67387uav.1;
        Wed, 14 Oct 2020 11:35:29 -0700 (PDT)
X-Gm-Message-State: AOAM5339it8HidodmOJsfvSdSSyUjlEzrGhA1RS5MKiJtH7XFyV/0TVE
        CJOoiiX0vI++kId91FjpAg/bjYOjwwz6wCxHiA==
X-Google-Smtp-Source: ABdhPJxmywHYTJ4dMOU2YaRv5iUSZXhICQXEppzBvIlKDcu6yZMwhcqON/hhJlbOheAOzFbJbkRhHRpm3BOL3wbOkQ8=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr18868oti.107.1602700527584;
 Wed, 14 Oct 2020 11:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org> <20201014143720.yny3jco5pkb7dr4b@mobilestation>
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 14 Oct 2020 13:35:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >
> > Hi Serge,
> >
> > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> >
>
> > DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> which then registers the HCD device so the corresponding DT node is supposed
> to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> compatibility.
>
> >
> > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > >
> > > Note we don't change the DWC USB3-compatible nodes names of
> > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > in-source comment says that the nodes name need to be preserved as
> > > "^dwusb@.*" for some backward compatibility.
> >
>
> > interesting, compatibility with what? Some debugfs files, perhaps? :-)
>
> Don't really know.) In my experience the worst type of such compatibility is
> connected with some bootloader magic, which may add/remove/modify properties
> to nodes with pre-defined names.

I seriously doubt anyone is using the APM machines with DT (even ACPI
is somewhat doubtful). I say change them. Or remove the dts files and
see what happens. Either way it can always be reverted.

Rob
