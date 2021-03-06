Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09C532F8B5
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 08:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhCFHNS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 02:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCFHMz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 02:12:55 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F417C06175F;
        Fri,  5 Mar 2021 23:12:55 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id f3so5135509oiw.13;
        Fri, 05 Mar 2021 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTkltZ77nL3kaQcEgltQYwF2jxJLi5wxQebdJjXmF/k=;
        b=nYDeG1fly5e1DSLkyZ91GtQWjAeAyZggxB2youoPLZrI0GOi/kYvLhgjxp3do6jC8F
         nN+EnosdVjYb8V7/DDAlO8PKGtDMdEjL0CEPq25B4Tva+3LrR4tehxoYhDZ6jf8abEB2
         aYiRxkDaxSrdximMfsuCZvuKshsfp8dBpV5f3xhS0DC6Rk2U9UfwRDyWoOsuHPHo/Lsj
         td8Vgu3bI5AytpDwBHoPiJpgnMvpyclg1/LRiFTD2RW0KJoYUyrGxcrM5VKcd9j0tlmK
         t6+AuyOwCCdJPyIPghXe7u9QeNMbS0szafiVwxnh8VmsdT1QJDex4Y9tTKzZ28oVaWFp
         bN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTkltZ77nL3kaQcEgltQYwF2jxJLi5wxQebdJjXmF/k=;
        b=PCrBw2aGeeXH/3w97HYA/7HLDv/E7UqiFG9/suvmrbvMUpuMbf3jieNsFiBX8AI2GO
         VOUPq8+iw6stMh9Rysqxh8iaVHb/eN3oGYtkI1YN5g1t8UA+XvzZpXib3Hq1b5H6ehPl
         a+sw6+XzK8HaeBMcO0djaNmPnGC2NDths4pigMX7pbyOG2IHP4T9MnaHcQdrPQUCHhJU
         ZoaYI2NTPUh+c3YifXOXE9vtoy37N9g8y5LEHEYqgbpjOUTLeIXYgUaVSxPsWV+DYylT
         ybNf3QlF8+PBruIBU6+kYWljhO0TVGRFkEWmvDS4WAtSxV3/fPFI6fX4hCCmLUQvwG0d
         ObrQ==
X-Gm-Message-State: AOAM5320uY1tCHhGHr04SU+gEfkpT0t1ae/Wm0+2rPtHM9aYAq4p3JQ+
        PaqZpHoZWiiGFEq0ECPIztSYSXQuB8o/iH0A5HgleU98CEfRyA==
X-Google-Smtp-Source: ABdhPJzMrIW4Fxvb5eM7Cg7PpNPo2Ldi/VTWDPinGxzlo+n7ORohSk6mdfbm9pIhz6Eq8/ChP/NrOXh/Bm9mLwQx/4c=
X-Received: by 2002:a05:6808:97:: with SMTP id s23mr10041419oic.23.1615014774477;
 Fri, 05 Mar 2021 23:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
 <20210218070709.11932-3-sergio.paracuellos@gmail.com> <20210305224756.GA777984@robh.at.kernel.org>
In-Reply-To: <20210305224756.GA777984@robh.at.kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 6 Mar 2021 08:12:43 +0100
Message-ID: <CAMhs-H_RoA-JvT9Q1K+8tEA1vqS6HWuE-D4=kWVsoOWTwjTGbw@mail.gmail.com>
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

Hi Rob,

On Fri, Mar 5, 2021 at 11:47 PM Rob Herring <robh@kernel.org> wrote:
[snip]
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

The 'ralink,sysctl' phandle is to read bootstrap register to be able
to derive xtal and a clk gate register for the peripherals.
The 'ralink,memctl' phandle is to read the cpu clock frequency from
the memory controller.

So there is not "main registers". I already put this as a child node
in v4 and I was told to get rid of child nodes. I need this as a
regmap to other DT node registers (sysctl, and memctl) to be able to
use the driver without specific architecture operations and properly
enable for COMPILE_TEST without dirty Makefile arch flags. Both sysctl
and memctl has no other child nodes, and I think that's why I was told
to avoid child nodes at the end. I explained here [0] current sysctl
and memctl in the mt7621 device tree and my view of the need for this
two syscons:

[0]: https://lkml.org/lkml/2021/1/2/9

So to avoid to send again "a previous version" on this patch, please
guide me in the correct thing to do. Stephen, Rob, I will be really
happy with your help :)

Best regards,
    Sergio Paracuellos
>
> > +
> > +  clock-output-names:
> > +    maxItems: 8
> > +
> > +required:
> > +  - compatible
> > +  - '#clock-cells'
> > +  - ralink,sysctl
> > +  - ralink,memctl
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt7621-clk.h>
> > +
> > +    pll {
> > +      compatible = "mediatek,mt7621-clk";
> > +      #clock-cells = <1>;
> > +      ralink,sysctl = <&sysc>;
> > +      ralink,memctl = <&memc>;
> > +      clock-output-names = "xtal", "cpu", "bus",
> > +                           "50m", "125m", "150m",
> > +                           "250m", "270m";
> > +    };
> > --
> > 2.25.1
> >
