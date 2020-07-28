Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328EB231450
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 22:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgG1U5T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 16:57:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:52456 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728202AbgG1U5T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 16:57:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0Wez-0007gK-01; Tue, 28 Jul 2020 22:57:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7636FC0A9B; Tue, 28 Jul 2020 22:51:55 +0200 (CEST)
Date:   Tue, 28 Jul 2020 22:51:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
Message-ID: <20200728205155.GB22052@alpha.franken.de>
References: <20200728104503.23655-1-krzk@kernel.org>
 <20200728104503.23655-2-krzk@kernel.org>
 <B4F6EQ.WB2WZOY40FDR@crapouillou.net>
 <20200728111935.GA26683@kozik-lap>
 <20200728113702.GB13443@alpha.franken.de>
 <20200728120035.GA28766@kozik-lap>
 <NPJ6EQ.I4K2FZ2BHH1E@crapouillou.net>
 <20200728125308.GA344@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200728125308.GA344@kozik-lap>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 02:53:08PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 28, 2020 at 02:51:23PM +0200, Paul Cercueil wrote:
> > 
> > 
> > Le mar. 28 juil. 2020 à 14:00, Krzysztof Kozlowski <krzk@kernel.org> a écrit
> > :
> > > On Tue, Jul 28, 2020 at 01:37:02PM +0200, Thomas Bogendoerfer wrote:
> > > >  On Tue, Jul 28, 2020 at 01:19:35PM +0200, Krzysztof Kozlowski wrote:
> > > >  > On Tue, Jul 28, 2020 at 01:12:11PM +0200, Paul Cercueil wrote:
> > > >  > > Hi Krzysztof,
> > > >  > >
> > > >  > > Le mar. 28 juil. 2020 à 12:45, Krzysztof Kozlowski
> > > > <krzk@kernel.org> a écrit
> > > >  > > :
> > > >  > > > The CONFIG_JZ4780_NEMC was previously a default on MIPS but
> > > > now it has
> > > >  > > > to be enabled manually.
> > > >  > > >
> > > >  > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >  > >
> > > >  > > I think you should swap the two so that there are no problems
> > > > when
> > > >  > > bisecting.
> > > >  >
> > > >  > Good point. I was thinking that it will go via some of MIPS trees
> > > > and
> > > >  > the patch #1 will just wait a cycle.  However with acks, I can
> > > > take it
> > > >  > through drivers/memory tree.
> > > > 
> > > >  I've acked the patch.
> > > > 
> > > >  Thomas.
> > > 
> > > Thanks but now I noticed that one of changed configs
> > > (arch/mips/configs/rs90_defconfig) is only in MIPS tree.
> > > 
> > > I think it is easier then to take the patch #2 (configs) via MIPS and
> > > wait with #1 for the next cycle or also take it via MIPS if it applies
> > > cleanly.
> > 
> > Why not take them both in the MIPS tree then? Would that conflict with
> > changes in your tree?
> 
> Exactly (last part of my sentence). There should be no conflicts.

I've applied both patches to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
