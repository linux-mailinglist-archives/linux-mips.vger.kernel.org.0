Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9C532F793
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 02:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCFBxZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 20:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCFBxA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 20:53:00 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5015C06175F;
        Fri,  5 Mar 2021 17:53:00 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u20so4016318iot.9;
        Fri, 05 Mar 2021 17:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKCLycYpc3HKoJmuKPBdeHcQJ9gEh+09JrAX4tJjuOo=;
        b=cHA5c3x+i5YpdF7NuMdeZOez2mxXfShWziiUFDPqrxH2zSdnXomtkyZWz5cthIvO22
         s7s9mWe44nPB0jvEnJPAMuDjQENwQJocVHeHIL44ea35Kr/6KChALv9HMbGZrHYVJM3P
         tJh4N6yQziZs+KFrQYAn7UUJNQoXCcgQu2qXKsiLHnepo6ZdkoAKdkPe0mlHLx9NE0o7
         Ls2jWUArF/X1tsGCL23QKaDXAtbRQUGrpFKAmKVARI3vf+1/vPYM64F3nhVsAIqWybFv
         s26KUHJmv4gG9/Khhgb+cOiMCO4F7GUEp5VgCYRthGKo4AdfJJ7aECMzveFsBwC5A8GE
         XTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKCLycYpc3HKoJmuKPBdeHcQJ9gEh+09JrAX4tJjuOo=;
        b=M1ho9KDA4lW9Imfl2mqOCMusWtAqgUuBcxDrdnZdBkDVslvYFj8CUUi8TkGkAycInb
         X/uf2Z1PVqbY79gtMIkVzLzQjIpPU9k2eVS8YWsuTbEoUZUWR/vxp9qLivyYsLqSyGHj
         FQCd2UocuRQaNZtkXOWZV97m5bfPmMIOuGwpFcABptDuvXtTbXLdYy4cwh8pC6PZNBUf
         FwR0Im4tGoQiTzLvN2tN31b3Q0jBLXZM6piU9NGcrDWDOaNDv6Rp5Xg6G9DtEzptDfi7
         3r2ru0k0DC6rGvZv6nQMp6PwBqRoxIN4eHUTRuDO0khEKFaQimc3zgoS3BYxRji5uvJn
         vmNw==
X-Gm-Message-State: AOAM530zjI6zvXE8+ZFMeXqfVUvVQ3En/o6FgfE8IwOkVlA+XJLxHpKp
        emFShekwyKQRo/lfkDfYJnzQ0eet3SdAlKNC+Ls=
X-Google-Smtp-Source: ABdhPJz1LKvjkKpi0mhhWNpQ/jhaYsdcSFGnQIHJxnvPcCnrRZkUL3VDIXLbOq9IltszwFxvj536k9ZaQDcbQggHQWs=
X-Received: by 2002:a5d:97c9:: with SMTP id k9mr10521371ios.45.1614995580001;
 Fri, 05 Mar 2021 17:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
 <20210218070709.11932-3-sergio.paracuellos@gmail.com> <20210305224756.GA777984@robh.at.kernel.org>
In-Reply-To: <20210305224756.GA777984@robh.at.kernel.org>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sat, 6 Mar 2021 09:52:48 +0800
Message-ID: <CAJsYDVLJy_F6HYbQUjFzB+YKnaNujBH_Fqo0rinvTfs-0o8xfA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob!

On Sat, Mar 6, 2021 at 6:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Feb 18, 2021 at 08:07:05AM +0100, Sergio Paracuellos wrote:
> > Adds device tree binding documentation for clocks in the
> > MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > new file mode 100644
> > index 000000000000..842a0f2c9d40
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT7621 Clock Device Tree Bindings
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +description: |
> > +  The MT7621 has a PLL controller from where the cpu clock is provided
> > +  as well as derived clocks for the bus and the peripherals. It also
> > +  can gate SoC device clocks.
> > +
> > +  Each clock is assigned an identifier and client nodes use this identifier
> > +  to specify the clock which they consume.
> > +
> > +  All these identifiers could be found in:
> > +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7621-clk
> > +
> > +  "#clock-cells":
> > +    description:
> > +      The first cell indicates the clock number, see [1] for available
> > +      clocks.
> > +    const: 1
> > +
> > +  ralink,sysctl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle of syscon used to control system registers
> > +
> > +  ralink,memctl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle of syscon used to control memory registers
>
> I assume one of these phandles are the main registers for the clocks?
> Make this a child node and drop that phandle.

On MT7621, CPU clock can be chosen from 3 sources: crystal clock,
a fixed 500MHz clock or a clock created by the memory controller.
sysctl contains a bootstrap register to determine crystal clock, a
clock mux for choosing between the 3 sources for CPU clock, and
a clock gate register for various peripherals. The ralink,memctl
phandle here is to read the cpu clock frequency from the memory
controller.
The original implementation hides this hardware detail to avoid
splitting the driver into three just for the CPU clock.
Is this approach okay and we can put it under sysctl node,
or this driver needs to be further splitted?

-- 
Regards,
Chuanhong Guo
