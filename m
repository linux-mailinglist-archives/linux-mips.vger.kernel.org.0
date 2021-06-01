Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0A4397C0F
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 00:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhFAWHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 18:07:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234698AbhFAWHQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 18:07:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E2A660C40;
        Tue,  1 Jun 2021 22:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622585134;
        bh=8jUQRuRq7+XNs7eJRgPkH3E+fqJrNLYhQd8GuAAdJZU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GlRUA12fnB+nlD4JuD2hbQnzNtj5gO4J+pVpB2LhQMA5iRGcaA+fAKgafBBJUC9Xo
         /0mSPGx3lK3HLyGG4O/QIIlvazdcVPCu777Jg7E/BTEdodl+msGiSCYUZ4RHGCeYCr
         YKItQ4pXi5PkdjqIp7KhrfDsxSvMjF8ENQM0hCknhGgfbOpCX03affStPEFYNTkqqC
         zMP4XTVIt6SDFcLLFIxhkhIK78H/lcmaCK3HW24VVXk3wS9pyvRM052qle6B2iCNw+
         h22MS10HDr4EczuWlzFx0c/HPOwifn+P2I529Clc5gnuwuxDlbtLpztJo1TRjbbdqa
         F978NQeiHWtrA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAK8P3a2Ueg0UFZisrzrrL_MkBLnu6TbMtVGx4_wO0d6rj48weg@mail.gmail.com>
References: <20210531184749.2475868-1-arnd@kernel.org> <20210601095129.GF6961@alpha.franken.de> <CAK8P3a2Ueg0UFZisrzrrL_MkBLnu6TbMtVGx4_wO0d6rj48weg@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>, open list:
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Arnd Bergmann <arnd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Tue, 01 Jun 2021 15:05:33 -0700
Message-ID: <162258513314.4130789.12039373985147120919@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Arnd Bergmann (2021-06-01 05:24:59)
> On Tue, Jun 1, 2021 at 11:51 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Mon, May 31, 2021 at 08:47:42PM +0200, Arnd Bergmann wrote:
> > > As I noticed that the ar7 clock implementation and the ralink version
> > > are rather trivial, I ended up converting those to use the common-clk
> > > interfaces as well, though this is unrelated to the other changes.
> >
> > excellent, how is your plan for merging the series ?
>=20
> I have not decided yet. I think it would be best to keep the series toget=
her
> and merge it through the clk maintainer tree, or possibly my asm-generic
> tree, but as there is no rush, we could also do the mips and m68k bits
> through the architecture trees, and defer the rest for 5.15.
>=20

I'm happy to take the series through clk tree if that helps.
