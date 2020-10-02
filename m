Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855132810C6
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 12:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgJBKxJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 06:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgJBKxH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 06:53:07 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED1C520874;
        Fri,  2 Oct 2020 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601635986;
        bh=WUSRRX+XBvVTYHzBDRPQz4PtaU7zhX11OBofs03lu7w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yvX1A3cLWsjS1cWSyIRSg+WJmwZtSfrDcvyV/NeaKNl7GPsIy0voCxFZ/rOk4Gpmn
         2KaO/nUo6AwHYxAo8duM5tiz9TubUPDXXY5lD8rnJHuHCrD3KuX85XjN3soizDcz8B
         jOf84bE2XRGR0Trvh3UMgzg0dT6cjmceAFfHiP3o=
Received: by mail-ej1-f53.google.com with SMTP id qp15so1340345ejb.3;
        Fri, 02 Oct 2020 03:53:05 -0700 (PDT)
X-Gm-Message-State: AOAM531uTpfRhMMc+fyakJH6fjIgtpx0vsvhK0xfgJKCC4B/ZYBuPTAC
        MlIgMtYN4QKyeHjuqKKzXmT9MLkU/ep84CiL9zA=
X-Google-Smtp-Source: ABdhPJz2njtnLuaxs13sg4hhwWj46P8QK/G+8vH63FlRpE0n16xuRCvITpEi9m8uB+qnlenWJGhPhUHCNrXOYo6xhlo=
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr1573436ejd.119.1601635984516;
 Fri, 02 Oct 2020 03:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-3-post@lespocky.de>
 <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com> <9895379.VNsV0mSTfq@ada>
In-Reply-To: <9895379.VNsV0mSTfq@ada>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 12:52:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2 Oct 2020 at 12:46, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hei hei,
>
> Am Freitag, 2. Oktober 2020, 11:31:09 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
> > > The example was adapted in the following ways:
> > >
> > > - make use of the now supported 'function' and 'color' properties
> > > - remove pwm nodes, those are documented elsewhere
> > > - tweake node names to be matched by new dtschema rules
> >
> > tweak? or align?
>
> Depends on if schema actually checks it (child nodes) or if it's just DT
> policy (parent node).  I'll reword in v7.
>
> > > License was discussed with the original author.
> >
> > Since you relicense their work, you need an ack or signed off from
> > every author. You cannot just say "I discussed" and post it. That way
> > I could pretend (lie) I talked to Linus and try to relicense Linux to
> > BSD...
>
> I know.  Peter promised to give his Ack publicly on the list back when I
> worked on v2 or v3, so he is in Cc since then, but apparently he did not yet
> post it. ;-)
>
> > You need acks/SoB from Peter and Russel.
>
> Well, I should add Russel in v7, too, then.

Yes, please.

For the patch itself:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
