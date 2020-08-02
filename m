Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E232323594B
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 18:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgHBQqd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 12:46:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgHBQqb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Aug 2020 12:46:31 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A229C20738;
        Sun,  2 Aug 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596386791;
        bh=q8MbbbW36EMMgIj47Vr+zJcP7Ddn+q47moJuUNcQw4I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c0A87dvXeqWX1O66DbG8odRrfV4O5jfcDafRrFfPbTGRiG8Rr/ZZBOERmkSq1ngDI
         GG9Ywrq3IaJl/F5F2+IyNa+gMHlpYc0c5GKBBjPv2su8iwVdjT8QlJDSYGtsSf0GKj
         bd/vQ4LsrJDHm3VHe6l1Envn4bZTg+jZXE70hy+w=
Received: by mail-lj1-f173.google.com with SMTP id v4so27535042ljd.0;
        Sun, 02 Aug 2020 09:46:30 -0700 (PDT)
X-Gm-Message-State: AOAM532KbHIoysXyaemRfqNcapCpZPH8QQbpNR+/v+4JQ2XwimMwXksN
        4PBYoHgPdEGD0Iy5l+/rsx4g27VCqh/9sgopKyg=
X-Google-Smtp-Source: ABdhPJyG79cCeQzsf2oxy/QUSAIJBjM95f3ZKNwmKzFSAlruEAqDnOs2qbRyIKvsBj+NnDrqLdBiegEAVW+7Rd2pAXI=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr4176911ljj.341.1596386789040;
 Sun, 02 Aug 2020 09:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200726155559.4650-1-krzk@kernel.org> <alpine.LFD.2.21.2008012327070.24175@redsun52.ssa.fujisawa.hgst.com>
 <DGFFEQ.RMDW72DK0U5B1@crapouillou.net> <alpine.LFD.2.21.2008021339110.24175@redsun52.ssa.fujisawa.hgst.com>
In-Reply-To: <alpine.LFD.2.21.2008021339110.24175@redsun52.ssa.fujisawa.hgst.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Sun, 2 Aug 2020 18:46:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfHMzWeUAK30Q9VRn3VhStvQA4g30syBfFbbASXAgCysQ@mail.gmail.com>
Message-ID: <CAJKOXPfHMzWeUAK30Q9VRn3VhStvQA4g30syBfFbbASXAgCysQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2 Aug 2020 at 14:43, Maciej W. Rozycki <macro@wdc.com> wrote:
>
> On Sun, 2 Aug 2020, Paul Cercueil wrote:
>
> > >  FYI, the usual approach would be marking the entry "Orphan" rather
> > > than
> > > removing it entirely, so that the mapping remains and makes it easy
> > > for
> > > someone to pick it up.
> >
> > This is OK in this case, as the driver is also listed as part of the
> > "INGENIC JZ47xx SoCs".
>
>  Fair enough (and odd enough too to have two entries for one piece),
> though in this case I think the commit description ought to mention it.
> As it stands it makes one think the driver is not going to have a
> maintainer anymore: "[...] and no maintenance is provided."

Sure, the message could be improved. How about:

"The entry for MIPS Ingenic JZ4780 DMA driver is not up to date
anymore. Zubair Lutfullah Kakakhel's email bounces. The maintenance is
provided through Ingenic SoC maintainers entry."

If it is OK, I can either resend or it could be fixed up when applying.

Best regards,
Krzysztof
