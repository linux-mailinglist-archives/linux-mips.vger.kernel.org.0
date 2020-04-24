Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA61B6AC4
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 03:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgDXBTo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 21:19:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41891 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbgDXBTo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 21:19:44 -0400
Received: by mail-io1-f66.google.com with SMTP id b12so8658615ion.8;
        Thu, 23 Apr 2020 18:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9OmgagrKCCt63SJ70DGo07Hs4DQPWadwIXDQwuPLQE=;
        b=N5q+YAEa+Z81vrN6qlRJJzmaLqVv5kuPLYcNPFAs3voarUKw6mTL0rr5s4xqMZLYsR
         nVbR6uQVFaPP65u303LfcpPNAmk02ID5dTKjhIUC7X5leog7ZHFM9zdj+dlNES96wA9n
         f6ABMEtHD6EWTIZZxZjLpVSmUkH2qBVVxyldV5OI9w7YeQB67BoFvj3g5huGbTvgpXce
         GfFkPryokZ4Lr61RK4nCDdIUi/mcJZtHlbkBN1qEmf86VwXq0UQj5b1DXwJw+w2E/gtL
         2UaC5HucLmIy2KDbL6MFhp5zJEQXeDQ+BWkxyPZ/MrvuZM+qGUtppvQMD7tfa196Vcnd
         96SQ==
X-Gm-Message-State: AGi0Pubb+8ES688TxjrTybKVOhobp1JG6zDZHGO5XJ6MapwVCi0TfEhs
        PYCbSeFNrO7wJHCn4Dj9n3J1LAUzMyRgAawEodJsQ3en
X-Google-Smtp-Source: APiQypJksG9oll5dR51HBA7PNJp709ixLzaxLqE939dazCKHiP4+Otceirx7G1e9uvPhD1GNV4UI1AGYmqyDRqNld2w=
X-Received: by 2002:a5e:8613:: with SMTP id z19mr6274962ioj.84.1587691181816;
 Thu, 23 Apr 2020 18:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200422142428.1249684-7-jiaxun.yang@flygoat.com> <CAAhV-H43ds5YnW+h3zpbwedT0Lksz_o5d=Sz0Uqn+--uuDHN1A@mail.gmail.com>
 <b645bfeba3c1c9d3167aef68868ef09f@kernel.org>
In-Reply-To: <b645bfeba3c1c9d3167aef68868ef09f@kernel.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 24 Apr 2020 09:27:07 +0800
Message-ID: <CAAhV-H4o4yFLu28y7ZoyEwd_YVdDQpOdHF=KVBF0o9s7yZ3RZQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: Add Loongson PCH MSI
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Marc,

On Thu, Apr 23, 2020 at 8:46 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Huacai,
>
> On 2020-04-23 06:55, Huacai Chen wrote:
> > Hi, Jiaxun,
> >
> > On Wed, Apr 22, 2020 at 10:28 PM Jiaxun Yang <jiaxun.yang@flygoat.com>
> > wrote:
> >>
> >> Add binding for Loongson PCH MSI controller.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  .../loongson,pch-msi.yaml                     | 56
> >> +++++++++++++++++++
> >>  1 file changed, 56 insertions(+)
> >>  create mode 100644
> >> Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> >> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> >> new file mode 100644
> >> index 000000000000..dfb9cecacba0
> >> --- /dev/null
> >> +++
> >> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> >> @@ -0,0 +1,56 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id:
> >> "http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Loongson PCH MSI Controller
> >> +
> >> +maintainers:
> >> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> +
> >> +description: |
> >> +  This interrupt controller is found in the Loongson-7A family of PCH
> >> for
> > Please use "Loongson's LS7A family" here.
>
> It's the fourth email you send on the same subject. I think the author
> has got the message already. Frankly, it is only a name, and if they
> want to call it Bob, so be it.
I'm sorry that make so much noise, and I will not do this again. Yes,
a name is just a name, but we can do something to avoid confusing as
much as possible.

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...

Thanks,
Huacai
