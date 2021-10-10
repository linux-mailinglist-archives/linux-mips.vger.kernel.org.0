Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D8D428059
	for <lists+linux-mips@lfdr.de>; Sun, 10 Oct 2021 11:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhJJKA1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Oct 2021 06:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhJJKA0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 Oct 2021 06:00:26 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86206C061570
        for <linux-mips@vger.kernel.org>; Sun, 10 Oct 2021 02:58:28 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id F3BA692009C; Sun, 10 Oct 2021 11:58:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E7E5092009B;
        Sun, 10 Oct 2021 11:58:24 +0200 (CEST)
Date:   Sun, 10 Oct 2021 11:58:24 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Marc Kleine-Budde <mkl@pengutronix.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
In-Reply-To: <20210902101432.t3pmkb2od2j4kwth@pengutronix.de>
Message-ID: <alpine.DEB.2.21.2110101148550.12214@angie.orcam.me.uk>
References: <20210902071951.28722-1-o.rempel@pengutronix.de> <20210902090324.GA6429@alpha.franken.de> <20210902101432.t3pmkb2od2j4kwth@pengutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 2 Sep 2021, Marc Kleine-Budde wrote:

> > > Starting with following patch MIPS Malta is not able to boot:
> > > | commit 79edff12060fe7772af08607eff50c0e2486c5ba
> > > | Author: Rob Herring <robh@kernel.org>
> > > | scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9
> 
> If the above patch broke malts, IMHO the fixes tag should be:
> 
> Fixes: 79edff12060f ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")

 It's not clear either from this patch description or from the commit 
referred what the actual *purpose* of the alignment check is and therefore 
I think it's hard to say which of the two commits needs to be indicated as 
the offender.  Without further data I tend to agree it's 79edff12060f that 
ought to be referred, being the immediate cause of the regression, as 
things obviously worked before, for 5+ years.

> > > The reason is the alignment test added to the fdt_ro_probe_(). To fix
> > > this issue, we need to make sure that fdt_buf is aligned.
> > > 
> > > Since the dtc patch was designed to uncover potential issue, I handle
> > > initial MIPS Malta patch as initial bug.
> > > 
> > > Fixes: e81a8c7dabac ("MIPS: Malta: Setup RAM regions via DT")
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >  arch/mips/mti-malta/malta-dtshim.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > applied to mips-next.
> 
> Please add stable on Cc, as Malta is broken since v5.12
> (79edff12060f == v5.12-rc1~104^2~10^2~3).

 That for sure.

  Maciej
