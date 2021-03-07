Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C758D32FF40
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 07:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhCGG2A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 01:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhCGG1g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 01:27:36 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427FDC06174A;
        Sat,  6 Mar 2021 22:27:36 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d9so6060912ote.12;
        Sat, 06 Mar 2021 22:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPRWwy3SL7jcLoSJyifJgoFoz/VF4yU3PDUSUbMzaaA=;
        b=iE1WxHNV/cAQQJFlugY+hOfG2m+juVr2ls7rZSssGr2po4ncWgx83fb8YwMUVv8szg
         mY55UPdH8fUrwKo8+tkSjRkI4z2ojQgSAeKf5RdxUn7FCFEv2atykcKPod/YZ0q1sHTZ
         1hafjxBp+mtY3iDmXrP0nHe47Cg/wfEECzhAoYp8z3ySrLFLIPaQB4B9P04N1bECSDC7
         1V5UoNgm23vNGgFRKC+gWem+QP+I6LIKeQEZMkdgA5Oa0iaQi/X8vDfQVOVlbyHWDEoT
         Z/6uwt9WMxe14JINfpwTRcyko9lb5FXKhydeabg4Ps7ra1pFZgkUwNbXx9Efpd2t9fUr
         a8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPRWwy3SL7jcLoSJyifJgoFoz/VF4yU3PDUSUbMzaaA=;
        b=VwrrWrOY8YpIn313hWH2uhU68DnW7GnZfMEY4nKE+bij+fkV+7LyU7aZR7+GuR4S48
         Twu+6kc/9O0SMGZqh/iriYnUg2A6UcFcizZwdU1oMu13cIWN9D3tVOO2wLlSzMcWxQm3
         sPxOG4zub7AAJYIFdeDac1uUeBopg9VjpM5lNQzJwlKwlc5TM0OdXxskcFBDLJLa7Tm+
         OsDnCcmrPNXyk6CS9G7o8HWXlwVcfEPomyF3LAlr36j7d3RNhKkcStiMbsj6sWyMeLiT
         TJ2wWeuQPyTliZ0Q8xn5NV8i39fUv837ZpSx1uMe0g0PjBVd7z8V5OwJDtJw1Qi3axcP
         KROQ==
X-Gm-Message-State: AOAM531RAHuQvmTMN2on0qxbiXrFPhVEitbdIttIxQiljc2uwHvMd8WM
        1QClKI4Fv2Bg1HCILtxL7Lca1g+y+DitXI44S4DPTT/+ra2E7g==
X-Google-Smtp-Source: ABdhPJznN+lTfux7Cc4YRNsPIKCO52lpic3NYapKNgcZC3QExZ+SX0v3mWaUsv7/zbK3TQIJuRa0ykn9H5hi3ijjJ5Q=
X-Received: by 2002:a9d:6013:: with SMTP id h19mr1366500otj.72.1615098455733;
 Sat, 06 Mar 2021 22:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
 <20210218070709.11932-3-sergio.paracuellos@gmail.com> <20210305224756.GA777984@robh.at.kernel.org>
 <CAMhs-H_RoA-JvT9Q1K+8tEA1vqS6HWuE-D4=kWVsoOWTwjTGbw@mail.gmail.com> <CAMhs-H9noK84G_PgLdL1kTS9YuEa=bKojrOojYTBtOeKy+L7RA@mail.gmail.com>
In-Reply-To: <CAMhs-H9noK84G_PgLdL1kTS9YuEa=bKojrOojYTBtOeKy+L7RA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 7 Mar 2021 07:27:24 +0100
Message-ID: <CAMhs-H_AgFdTd7r6sSz+=mXxCf9n5AjpxrRhkjGX-RYjhyzWrw@mail.gmail.com>
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

Hi,
On Sat, Mar 6, 2021 at 10:54 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi again,
>
> On Sat, Mar 6, 2021 at 8:12 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi Rob,
> >
> > On Fri, Mar 5, 2021 at 11:47 PM Rob Herring <robh@kernel.org> wrote:
> > [snip]
> > > > +
> > > > +  ralink,sysctl:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      phandle of syscon used to control system registers
> > > > +
> > > > +  ralink,memctl:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      phandle of syscon used to control memory registers
> > >
> > > I assume one of these phandles are the main registers for the clocks?
> > > Make this a child node and drop that phandle.
> >
> > The 'ralink,sysctl' phandle is to read bootstrap register to be able
> > to derive xtal and a clk gate register for the peripherals.
> > The 'ralink,memctl' phandle is to read the cpu clock frequency from
> > the memory controller.
> >
> > So there is not "main registers". I already put this as a child node
> > in v4 and I was told to get rid of child nodes. I need this as a
> > regmap to other DT node registers (sysctl, and memctl) to be able to
> > use the driver without specific architecture operations and properly
> > enable for COMPILE_TEST without dirty Makefile arch flags. Both sysctl
> > and memctl has no other child nodes, and I think that's why I was told
> > to avoid child nodes at the end. I explained here [0] current sysctl
> > and memctl in the mt7621 device tree and my view of the need for this
> > two syscons:
> >
> > [0]: https://lkml.org/lkml/2021/1/2/9
> >
> > So to avoid to send again "a previous version" on this patch, please
> > guide me in the correct thing to do. Stephen, Rob, I will be really
> > happy with your help :)
>
> Since there are no other child nodes for this sysc, should merge clock
> properties
> with this node in the following way a valid approach:
>
>  sysc: sysc@0 {
>      compatible = "mediatek,mt7621-sysc", "syscon";
>      reg = <0x0 0x100>;
>      #clock-cells = <1>;
>      ralink,memctl = <&memc>;
>      clock-output-names = "xtal", "cpu", "bus",
>                                         "50m", "125m", "150m",
>                                         "250m", "270m";
> };
>
> Consumer clock:
>
> node: node@0 {
>   ...
>   clocks = <&sysc MT7621_CLK_WHATEVER>;
>  ...
> };

I have been reviewing bindings review comments along the time and I
was already suggested to do this I am saying here (see [0]) but my
mind seems that filtered it for any reason I don't really understand.
Maybe I should sleep a bit more :).

I will send v10 with these changes that hopefully will be the correct ones.

Thanks and sorry for bothering you with already suggested things.

Best regards,
    Sergio Paracuellos

[0]: https://lkml.org/lkml/2020/12/31/206

>
> If that is the case... and since 'sysc' is used as system control
> registers for all the rest of the world, where should be the yaml file
> with bindings placed?
>
> Thanks in advance again for your help.
>
> Best regards,
>     Sergio Paracuellos
>
> >
> > Best regards,
> >     Sergio Paracuellos
> > >
> > > > +
> > > > +  clock-output-names:
> > > > +    maxItems: 8
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - '#clock-cells'
> > > > +  - ralink,sysctl
> > > > +  - ralink,memctl
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/mt7621-clk.h>
> > > > +
> > > > +    pll {
> > > > +      compatible = "mediatek,mt7621-clk";
> > > > +      #clock-cells = <1>;
> > > > +      ralink,sysctl = <&sysc>;
> > > > +      ralink,memctl = <&memc>;
> > > > +      clock-output-names = "xtal", "cpu", "bus",
> > > > +                           "50m", "125m", "150m",
> > > > +                           "250m", "270m";
> > > > +    };
> > > > --
> > > > 2.25.1
> > > >
