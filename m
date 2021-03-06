Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E64D32F937
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 10:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCFJyr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 04:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCFJyY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 04:54:24 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC636C06175F;
        Sat,  6 Mar 2021 01:54:23 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id b8so4293769oti.7;
        Sat, 06 Mar 2021 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3VJe+ZuS7Fy+8jhh+o3TzrnaFKjAbnnuNEMdGEuQ4E=;
        b=QuJn9ttAkQRO7rHC8UcuVjfI3su2spVFllMTP309N67RH4n1ImxdQ9iveaaMtGX5qd
         02bdzY929BsWffTrw8VuFhuY7uGMZZHubF4rBGfaiU+18Mdc7LGC+n2AQ91M2UqHw/4a
         YWudRWPV9tVmocf6M8vJr9G3dNP4QuGJtJU4y7JFoc0fN4d8qQfXVYPXwBDlIiu2vfuy
         KgDt55Ze+3Twr87NRaFinoFXHBwZL/PBKNDYcrgf3BvjhSSceF1PQCbai4f/DDeqzxWI
         +HobtGisW7Kizuk5oJqoe6QPJLAaJrtBC0yMnMKsK8ibezGst8Gn5KfUlZsSvX+NhzFq
         b2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3VJe+ZuS7Fy+8jhh+o3TzrnaFKjAbnnuNEMdGEuQ4E=;
        b=ex0Nj522jzKYa469SbSbpHvyaveTSh6eD4Je6RPtQgVkSD1mumzcT8s0CXec00nEcD
         axpTA9dqBvWII/3hKmtAXVf/sdRmlUeIgu6IelcWni0Og0hh2+RwrUcQ7OVHKG9iISxs
         cPPvcf615gDBxZNNxAFQXsTILS0105r2SYhfergTIlx5klkizPvutcnVEyDHNipT9Q5E
         iu0ViV8EgRvXtS52d5dSsVlwW8/qIh9Xw/3vaFtsX9+evnUzPJ0pRbbY7jHB7Q7+y+AC
         UqDUUPtuG29Hf5AV0qN6gSUJRwWGO0GvCceQ32eoJjf/Bp90y6ToTWB5zzQH/Aff5Pdc
         2kdg==
X-Gm-Message-State: AOAM531S8Gfo3fsXhTC6C1iPv31NPoJEy+D3odANcMbwWLgNRvECrA4+
        gcLL7Su7BEsCg7KtUQe4FGXQrK91lRCjQj53hnu78fLlpQmWWA==
X-Google-Smtp-Source: ABdhPJybzMi6Zw1D5o/q36FweHJTgQsEC4CUoErnRfmyhvEIJiB7hgtCgLLtx8z+JX/kKaXVdimIgJXII5x018M6qXQ=
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr11415112otr.74.1615024462779;
 Sat, 06 Mar 2021 01:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
 <20210218070709.11932-3-sergio.paracuellos@gmail.com> <20210305224756.GA777984@robh.at.kernel.org>
 <CAMhs-H_RoA-JvT9Q1K+8tEA1vqS6HWuE-D4=kWVsoOWTwjTGbw@mail.gmail.com>
In-Reply-To: <CAMhs-H_RoA-JvT9Q1K+8tEA1vqS6HWuE-D4=kWVsoOWTwjTGbw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 6 Mar 2021 10:54:11 +0100
Message-ID: <CAMhs-H9noK84G_PgLdL1kTS9YuEa=bKojrOojYTBtOeKy+L7RA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi again,

On Sat, Mar 6, 2021 at 8:12 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Rob,
>
> On Fri, Mar 5, 2021 at 11:47 PM Rob Herring <robh@kernel.org> wrote:
> [snip]
> > > +
> > > +  ralink,sysctl:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      phandle of syscon used to control system registers
> > > +
> > > +  ralink,memctl:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      phandle of syscon used to control memory registers
> >
> > I assume one of these phandles are the main registers for the clocks?
> > Make this a child node and drop that phandle.
>
> The 'ralink,sysctl' phandle is to read bootstrap register to be able
> to derive xtal and a clk gate register for the peripherals.
> The 'ralink,memctl' phandle is to read the cpu clock frequency from
> the memory controller.
>
> So there is not "main registers". I already put this as a child node
> in v4 and I was told to get rid of child nodes. I need this as a
> regmap to other DT node registers (sysctl, and memctl) to be able to
> use the driver without specific architecture operations and properly
> enable for COMPILE_TEST without dirty Makefile arch flags. Both sysctl
> and memctl has no other child nodes, and I think that's why I was told
> to avoid child nodes at the end. I explained here [0] current sysctl
> and memctl in the mt7621 device tree and my view of the need for this
> two syscons:
>
> [0]: https://lkml.org/lkml/2021/1/2/9
>
> So to avoid to send again "a previous version" on this patch, please
> guide me in the correct thing to do. Stephen, Rob, I will be really
> happy with your help :)

Since there are no other child nodes for this sysc, should merge clock
properties
with this node in the following way a valid approach:

 sysc: sysc@0 {
     compatible = "mediatek,mt7621-sysc", "syscon";
     reg = <0x0 0x100>;
     #clock-cells = <1>;
     ralink,memctl = <&memc>;
     clock-output-names = "xtal", "cpu", "bus",
                                        "50m", "125m", "150m",
                                        "250m", "270m";
};

Consumer clock:

node: node@0 {
  ...
  clocks = <&sysc MT7621_CLK_WHATEVER>;
 ...
};

If that is the case... and since 'sysc' is used as system control
registers for all the rest of the world, where should be the yaml file
with bindings placed?

Thanks in advance again for your help.

Best regards,
    Sergio Paracuellos

>
> Best regards,
>     Sergio Paracuellos
> >
> > > +
> > > +  clock-output-names:
> > > +    maxItems: 8
> > > +
> > > +required:
> > > +  - compatible
> > > +  - '#clock-cells'
> > > +  - ralink,sysctl
> > > +  - ralink,memctl
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt7621-clk.h>
> > > +
> > > +    pll {
> > > +      compatible = "mediatek,mt7621-clk";
> > > +      #clock-cells = <1>;
> > > +      ralink,sysctl = <&sysc>;
> > > +      ralink,memctl = <&memc>;
> > > +      clock-output-names = "xtal", "cpu", "bus",
> > > +                           "50m", "125m", "150m",
> > > +                           "250m", "270m";
> > > +    };
> > > --
> > > 2.25.1
> > >
