Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A49312AF2
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 11:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfECJrj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 05:47:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52205 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfECJrj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 05:47:39 -0400
Received: by mail-wm1-f66.google.com with SMTP id t76so6344546wmt.1;
        Fri, 03 May 2019 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hKKanKzajc50t11Dd5aKaiR0AfOXx84AGrAuPRlKLjs=;
        b=UA17r3XTHeasbaxo2HgeTqh666U18nnHTjZ5rdfSeE6j4Td0LmvJ+Hr6LjoguBOcfN
         gCsq7dIZwojHe4/oa2YouOTZq3r9HgIHLFisQBXqX6sdJovW/mzgQG19n2GpScE0urd+
         ELDuxgmq/6seVyBww+ELyG1iFKsgqquCCLleMTF5IHTiL4DpcXqpZcXG6YJ9zkMRHTf9
         5iWv+M9luBRoCfqlaH9QN1tDpPVja3ZCXosLCwiB28KDVeYWn6l3o3Tyz+Ec3+kERcIr
         kCfIVK5m5gi4+fKAbK1i03VQBJmbZnXzonWg4rHYU42xQLHSyw9Lh3CtHt12ugcOaoBl
         f5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKKanKzajc50t11Dd5aKaiR0AfOXx84AGrAuPRlKLjs=;
        b=OELTGYV7YBPoQzdJc6UZPQv5x8zItMNeCm5pIO1akRCNxG2WVk44ckfDlENc1uKQHO
         DYOmaFIvpjwvcQYdklwSSZ2QFkDWIK+avnBGEpWWiCqIanC961pJFAJB1GWaoxWXtdoz
         ep0tQkaXvaB0ZsVr21IUOKScFT3GX6HmObXVL1p8Hcrbxb99Vl7yA98DRZaVn/qv3W2L
         vxG47ErGI0c1Xl8Fl+Ju1CGgDer4amKlZ70syav3VfTmSOiibWncVN2x45TcloTu1UQ8
         pTPK0az5QDfWmNpOuOjdF5zMwKCc/wJsEwJUnPy/V/0IEWGpGDA2i5xJwPZjnLfdkLJP
         AxEw==
X-Gm-Message-State: APjAAAWYBfe5vu7k4MMBqEATUZ+y/y1QtGvtAOY79ZMVcK0kqXqV++34
        LLM6NCGm2ryLKsRebXw7cYvJRLaiAMuyPmHYFsI=
X-Google-Smtp-Source: APXvYqzaVkmBVr6fBHeaBc5eruyEJ1T9FCYhw4WpOJERBXB50acBkUSBAvgkg4NlFT2Y3Brwgr0ZAB6Lzk1UlfZDHQs=
X-Received: by 2002:a1c:9941:: with SMTP id b62mr1460156wme.76.1556876857611;
 Fri, 03 May 2019 02:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com> <27a90951-9525-c9b2-2c61-1a5db345cd70@gmail.com>
In-Reply-To: <27a90951-9525-c9b2-2c61-1a5db345cd70@gmail.com>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Fri, 3 May 2019 11:47:55 +0200
Message-ID: <CAOiHx=mbvqN16NG-gEOjVcSm6rV0P7iZd4XfzPHNS+Ns03+V_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 3 May 2019 at 03:44, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/2/2019 5:26 AM, Jonas Gorski wrote:
> > Add binding documentation for the gated clock controller found on MIPS
> > based BCM63XX SoCs.
> >
> > Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

>
> > ---
> >  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> >
> > diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> > new file mode 100644
> > index 000000000000..3041657e2f96
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> > @@ -0,0 +1,22 @@
> > +Gated Clock Controller Bindings for MIPS based BCM63XX SoCs
> > +
> > +Required properties:
> > +- compatible: must be one of:
> > +      "brcm,bcm3368-clocks"
> > +      "brcm,bcm6328-clocks"
> > +      "brcm,bcm6358-clocks"
> > +      "brcm,bcm6362-clocks"
> > +      "brcm,bcm6368-clocks"
> > +      "brcm,bcm63268-clocks"
>
> We could always add 6348/6338 to that list later one.

That's the plan*. But currently neither one is supported by
BMIPS_GENERIC, which was my starting point. And making BCM63XX use the
driver is ... complicated, due to (important) consumers not being
platform drivers (the MPI/PCIe controller codes). And they can't be
just converted to platform drivers, as they should then be non-legacy
PCI controller drivers, so a full rewrite is needed.

So let's stick with BMIPS_GENERIC first, else we never get anything
done ;-). In the end BCM63XX should go away anyway, once BMIPS_GENERIC
has reached feature parity.


Regards
Jonas

* if it even makes sense, as these are quite old, and systems will
quite struggle running a modern kernel/OS.

Jonas
