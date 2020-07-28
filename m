Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4931230BB7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 15:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbgG1NqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 09:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:57232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730149AbgG1NqT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 09:46:19 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93BC7206D7;
        Tue, 28 Jul 2020 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595943978;
        bh=2l4nZ5zEun3ITHFRFbhR5oj+u34Wm7h0bAZkj3TkoYU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EOlS+6JoJuSj9+Yx5l+IHRPcQCwPSoO9EgS/DmRloNif3HD9f1rUEmBmCqPuu4/1E
         IQ6MpBtNipOLmwcYStorTyMeevlXl39vouJJ1qOLOreKBTyzMSwBRuCCGvgd+AkpFD
         OQjl0fSdqVzY8uH3uz/Qagx8Ql8+OYCozBJu5LDA=
Received: by mail-ot1-f47.google.com with SMTP id a65so5736304otc.8;
        Tue, 28 Jul 2020 06:46:18 -0700 (PDT)
X-Gm-Message-State: AOAM533hhLvckwuiox2/2jKK41lwx3nFKtHlpdRYAuL3bKIyCX2N76dH
        d5GkFJJiu+whT9nC7DI20uMEIkKRhr8HHHGkjQ==
X-Google-Smtp-Source: ABdhPJyGMvLSy2o12/O4HMAGmyUT2I5c4ZQOAvLI2HQi1RCoYju+FyDtWZCrssFH21dUA3s0muQ53gKip1xGHsvcb+g=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr24620844otc.192.1595943977984;
 Tue, 28 Jul 2020 06:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
 <20200725014529.1143208-2-jiaxun.yang@flygoat.com> <CAL_JsqKePrUW3-HoSnQawqhgg23XJ7MxzawD7TKt-__q3jM55g@mail.gmail.com>
 <20200728083308.GD9062@alpha.franken.de>
In-Reply-To: <20200728083308.GD9062@alpha.franken.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Jul 2020 07:46:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+oswHvuF0BaM27CP0j9aHg1whAOv7bZneFjdkDX=MnSg@mail.gmail.com>
Message-ID: <CAL_Jsq+oswHvuF0BaM27CP0j9aHg1whAOv7bZneFjdkDX=MnSg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] of_address: Add bus type match for pci ranges parser
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 2:39 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Jul 27, 2020 at 11:50:14AM -0600, Rob Herring wrote:
> > On Fri, Jul 24, 2020 at 7:45 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > >
> > > So the parser can be used to parse range property of ISA bus.
> > >
> > > As they're all using PCI-like method of range property, there is no need
> > > start a new parser.
> > >
> > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >
> > > --
> > > v2: Drop useless check, fix some na for bus_addr
> > >         add define of of_range_parser_init according to
> > >         Rob's suggestion.
> > > v3: Abstract out has_flags. simplify define.
> > > ---
> > >  drivers/of/address.c       | 29 +++++++++++++++++------------
> > >  include/linux/of_address.h |  4 ++++
> > >  2 files changed, 21 insertions(+), 12 deletions(-)
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Rob, are you ok with merging this via the mips-next tree ?

That's my expectation hence the Reviewed-by.

Rob
