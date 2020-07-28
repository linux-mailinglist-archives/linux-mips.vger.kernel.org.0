Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9C023059A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 10:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgG1IjI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 04:39:08 -0400
Received: from elvis.franken.de ([193.175.24.41]:51663 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728104AbgG1IjI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 04:39:08 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0L8B-0000DV-03; Tue, 28 Jul 2020 10:38:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9994EC0A94; Tue, 28 Jul 2020 10:33:08 +0200 (CEST)
Date:   Tue, 28 Jul 2020 10:33:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rob Herring <robh+dt@kernel.org>
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
Subject: Re: [PATCH v3 1/5] of_address: Add bus type match for pci ranges
 parser
Message-ID: <20200728083308.GD9062@alpha.franken.de>
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
 <20200725014529.1143208-2-jiaxun.yang@flygoat.com>
 <CAL_JsqKePrUW3-HoSnQawqhgg23XJ7MxzawD7TKt-__q3jM55g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKePrUW3-HoSnQawqhgg23XJ7MxzawD7TKt-__q3jM55g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 27, 2020 at 11:50:14AM -0600, Rob Herring wrote:
> On Fri, Jul 24, 2020 at 7:45 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> > So the parser can be used to parse range property of ISA bus.
> >
> > As they're all using PCI-like method of range property, there is no need
> > start a new parser.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> > --
> > v2: Drop useless check, fix some na for bus_addr
> >         add define of of_range_parser_init according to
> >         Rob's suggestion.
> > v3: Abstract out has_flags. simplify define.
> > ---
> >  drivers/of/address.c       | 29 +++++++++++++++++------------
> >  include/linux/of_address.h |  4 ++++
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Rob, are you ok with merging this via the mips-next tree ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
