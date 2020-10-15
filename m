Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5207C28ECF8
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 08:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgJOGOu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 02:14:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35371 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJOGOt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Oct 2020 02:14:49 -0400
Received: by mail-ed1-f68.google.com with SMTP id cq12so1877028edb.2;
        Wed, 14 Oct 2020 23:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Yh1i1pVwz9B/Ey4Y4vzL4xLN24S+rgzxEnczu+jN+M=;
        b=s4utGE2ldX5A4a0Pabye4aUFh+rodihSo5V90mq5TuaevguMq+1u+OQSYmOmJk2JqU
         49hIzOVjeXRYk/QtASbnZ6Pf7kWu83V1UrrL6EQooJwfxkM95qbTBvZFfuNHVAEbVvyN
         IPVey0yuwXxSkvm7YrMaeWAfO4KxnTqlHewg62mxtAE5k2uCDM6dxj+GMTg/MUdflP97
         Invt/RQSdlsaJ7IV+icVE/FvbYsBeBJjnarv6lUVccdVFldA89Tvp7YMHFkYz6DjKZhs
         pC8iYc3pno4Mx26keMSdaUJi8drgdpxIwdMKsSP3RCI/ftgEHi7gCEtlLCTim+G5ediw
         xYbw==
X-Gm-Message-State: AOAM531fWTaX2HbH0BqBWdxQKK1sFdjoAsWeatGcbkEvbuEVJQ/voDkl
        Pt7I+WOJ80YPM2E5x2HjbRA=
X-Google-Smtp-Source: ABdhPJx/0Dmc4LC7mLB//wjFSeMp2WMfJCq3UaAMSzV7yKFc9sP2yaW4576pAgucyVbatWtI1/sCow==
X-Received: by 2002:a50:f613:: with SMTP id c19mr2718068edn.81.1602742484585;
        Wed, 14 Oct 2020 23:14:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id e7sm900601ejm.4.2020.10.14.23.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 23:14:43 -0700 (PDT)
Date:   Thu, 15 Oct 2020 08:14:39 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
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
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201015061439.GA2926@kozik-lap>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
 <20201014171640.bup52mgaz4jvhtsy@mobilestation>
 <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
 <20201014235105.kj4rtwiidph7gyen@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014235105.kj4rtwiidph7gyen@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 15, 2020 at 02:51:05AM +0300, Serge Semin wrote:
 > >
> > > So to speak thanks for suggesting it. I'll try it to validate the proposed
> > > changes.
> > >
> > > Two questions:
> > > 1) Any advise of a good inliner/command to compile all dtbs at once? Of course I
> > > can get all the updated dtsi'es, then find out all the dts'es which include
> > > them, then directly use dtc to compile the found dts'es... On the other hand I
> > > can just compile all dts'es, then compare old and new ones. The diff of the
> > > non-modified dtb'es will be just empty...
> > 
> 
> > make dtbs
> 
> It's not that easy.) "make dtbs" will build dtbs only for enabled boards, which
> first need to be enabled in the kernel config. So I'll need to have a config
> with all the affected dts. The later is the same as if I just found all the
> affected dts and built them one-by-one by directly calling dtc.

True. Sometimes allyesconfig for given arch might be helpful but not
always (e.g. for ARM it does not select all of ARMv4 and ARMv5 boards).
Most likely your approach is actually faster/more reliable.

> 
> > touch your dts or git stash pop
> > make dtbs
> > compare
> > diff for all unchanged will be simply empty, so easy to spot
> > 
> > > 2) What crosc64 is?
> > 
> > Ah, just an alias for cross compiling + ccache + kbuild out. I just
> > copied you my helpers, so you need to tweak them.
> > 
> > >
> > > >
> > > > 2. Split it per arm architectures (and proper subject prefix - not
> > > > "arch") and subarchitectures so maintainers can pick it up.
> > >
> > > Why? The changes are simple and can be formatted as a single patch. I've seen
> > > tons of patches submitted like that, accepted and then merged. What you suggest
> > > is just much more work, which I don't see quite required.
> > 
> 
> > DTS changes go separate between arm64 and arm. There is nothing
> > unusual here - all changes are submitted like this.
> > Second topic is to split by subarchitectures which is necessary if you
> > want it to be picked up by maintainers. It also makes it easier to
> > review.
> 
> The current patches are easy enough for review. The last three patches of the
> series is a collection of the one-type changes concerning the same type of
> nodes. So reviewing them won't cause any difficulty. But I assume that's not
> the main point in this discussion.
> 
> > Sure, without split ber subarchitectures this could be picked
> > up by SoC folks but you did not even CC them. So if you do not want to
> > split it per subarchitectures for maintainers and you do not CC SoC,
> > then how do you believe this should be picked up? Out of the regular
> > patch submission way? That's not how the changes are handled.
> 
> AFAIU there are another ways of merging comprehensive patches. If they get to collect
> all the Acked-by tags, they could be merged in, for instance, through Greg' or Rob'
> (for dts) repos, if of course they get to agree with doing that. Am I wrong?
> 
> My hope was to ask Rob or Greg to get the patches merged in when they get
> to collect all the ackes, since I thought it was an option in such cases. So if
> they refuse to do so I'll have no choice but to split the series up into a
> smaller patches as you say.

This is neither Rob's nor Greg's patch to pick up, but ARM SoC (which was
not CCed here). And most likely they won't pick it up because judging by
contents it is obvious it should go via ARM SoC.

Sure, if there are dependencies between some patches they can go with
acks through unrelated trees, but this not the usual way. This is an
exception in the process to solve particular dependency problem.  It has
drawbacks - increases the chances of annoying conflicts.

The case here does not fall into this criteria - there is no dependency
of this patch on the others  Therefore there is no reason to use the
unusual/exceptional way of handling patches.  There is no reason why
this shouldn't go via either specific ARM subarchitecture maintainers or
via ARM SoC.

> > > > 3. The subject title could be more accurate - there is no fix here
> > > > because there was no errors in the first place. Requirement of DWC
> > > > node names comes recently, so it is more alignment with dtschema.
> > > > Otherwise automatic-pickup-stable-bot might want to pick up... and it
> > > > should not go to stable.
> > >
> > > Actually it is a fix, because the USB DT nodes should have been named with "usb"
> > > prefix in the first place. Legacy DWC USB3 bindings didn't define the nodes
> > > naming, but implied to be "usb"-prefixed by the USB HCD schema. The Qualcomm
> > > DWC3 schema should have defined the sub-nodes as "dwc3@"-prefixed, which was
> > > wrong in the first place.
> > 
> 
> > Not following the naming convention of DT spec which was loosely
> > enforced is not an error which should be "fixed". Simply wrong title.
> > This is an alignment with dtschema or correcting naming convention.
> > Not fixing errors.
> 
> From your perspective it wasn't an error, from mine and most likely Rob' it
> was.) Anyway as I said I don't care that much about preserving the subject
> wording, so what about the next one:
> <arch>: <subarch>: Harmonize DWC USB3 nodes name with DT schema
> ?

Looks good.

Best regards,
Krzysztof

