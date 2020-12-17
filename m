Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348572DD3DB
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 16:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgLQPNC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 10:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgLQPNB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Dec 2020 10:13:01 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5C1C06138C;
        Thu, 17 Dec 2020 07:12:21 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id 9so25371242oiq.3;
        Thu, 17 Dec 2020 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzMBmlibq76f5yv+/Tsnh17vM8pmr6p5zVG9gRqZBy0=;
        b=NcUkDAOvq3/UwiR+n9/KcC2mcBfR9g+zCs2oA6uj4/1A5UiP2gwXiZYWRaUVrsyVlU
         ucAmqXUrkGN+8OQXS7Myo5XkpQdbP18ebObo5UE/srkCxHQrzaO8yYKaMdxsaI9fNaqf
         xHIveI/VFOQ0lXC9lEuxmchxsl5YhT+jotTZeoxlTmhOSjdLRblDjGGtDdaFSgYdUItW
         Tj4zWnuJ2IG/QrE3dwoe1V1G8QNjlZeF23yS4162Wsz/GrXWU8sqebWiu5pEHdidLMWu
         DPEvPKRYAdIRYvb9irUubCNywe6tYK1p+6zW1Qvi3s6JGN2owoA+vtdxKNxYNuDsRPkE
         wXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzMBmlibq76f5yv+/Tsnh17vM8pmr6p5zVG9gRqZBy0=;
        b=pbTEa008UgslN3fu2A9o0LUnUErnwaRdEyhay8rxyrSL4kxSe1ZQ2izyJS5/yoc87C
         XNd9z8iuI7zba+hamqLL/BjAExgdpuD5LyYoXv2Le/ofKPa636CDyjCuYxqPOUhCyWMJ
         deZcZEjUYKFk4PlyX5TgmW0gTbbw+dRH/k17ex4QqzFbcQSnWk4tVc5jOtkPuOKWjWUq
         34IyQj6Qq5IzuNUGzhk3w8P0/ZJFgab0qJ4Sx0s7yI/4Az1gPOJxbzViyGDBWAO1uOza
         murkl2jxlybcc6sdmlmgFLpG/ZnxM9DhytjhPAPD+66Jl8XGRZSy6ma/niS9J2zoW3S5
         AFGA==
X-Gm-Message-State: AOAM531wVAlaxFTBrOHwUmwJWn+XQ8k8Q+qOryVi3qZXdu03Y8UG8jcH
        p84+zNEagEIw5x7sGFLFyb86zzHqZt8zjBNar7I=
X-Google-Smtp-Source: ABdhPJzbGX9yzZnSFnykiaAlgcvsaCJs08rhZzT4N1d2vC0OMg4FWero8eTWeiLWpCGnd/8ET6et5ZSBLDWYPCRYxZQ=
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr5090106oia.149.1608217940702;
 Thu, 17 Dec 2020 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
 <20201122095556.21597-3-sergio.paracuellos@gmail.com> <160819550615.1580929.14234996916739809712@swboyd.mtv.corp.google.com>
 <CAL_JsqLONxqAXRta2iuYNoJ=8wEFdYsiq_OFqgSW3aMLMhy94Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLONxqAXRta2iuYNoJ=8wEFdYsiq_OFqgSW3aMLMhy94Q@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 17 Dec 2020 16:12:09 +0100
Message-ID: <CAMhs-H_F5npCkxxHc4Pz+6Ptm=ML13adk6Kg_aHqatpZwAietA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Thu, Dec 17, 2020 at 4:05 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Dec 17, 2020 at 2:58 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Sergio Paracuellos (2020-11-22 01:55:52)
> > > Adds device tree binding documentation for clocks in the
> > > MT7621 SOC.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 67 +++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > >
> >
> > Rob?
>
> Send to the DT list please.

Sorry, there was a typo 'evicetree@vger.kernel.org' in CC list.

>
> But I agree with Stephen's comment. Either make the syscon complete
> (fully describe the h/w, not just what you need ATM) to show the need
> for child nodes or get rid of the child nodes.

Got it. Will try to do something better and send v5.

>
> Rob

Thanks,
    Sergio Paracuellos
