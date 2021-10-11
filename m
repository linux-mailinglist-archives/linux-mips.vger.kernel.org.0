Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43888428858
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 10:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbhJKILM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 04:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhJKILJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Oct 2021 04:11:09 -0400
X-Greylist: delayed 79841 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Oct 2021 01:09:09 PDT
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1561C061570;
        Mon, 11 Oct 2021 01:09:09 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 1B0AB92009C; Mon, 11 Oct 2021 10:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 0C45192009B;
        Mon, 11 Oct 2021 10:09:09 +0200 (CEST)
Date:   Mon, 11 Oct 2021 10:09:08 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
In-Reply-To: <20211011071553.GA24717@pengutronix.de>
Message-ID: <alpine.DEB.2.21.2110111004510.12214@angie.orcam.me.uk>
References: <20210902071951.28722-1-o.rempel@pengutronix.de> <20210902090324.GA6429@alpha.franken.de> <20210902101432.t3pmkb2od2j4kwth@pengutronix.de> <alpine.DEB.2.21.2110101148550.12214@angie.orcam.me.uk> <20211011071553.GA24717@pengutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Oct 2021, Oleksij Rempel wrote:

> >  It's not clear either from this patch description or from the commit 
> > referred what the actual *purpose* of the alignment check is and therefore 
> > I think it's hard to say which of the two commits needs to be indicated as 
> > the offender.  Without further data I tend to agree it's 79edff12060f that 
> > ought to be referred, being the immediate cause of the regression, as 
> > things obviously worked before, for 5+ years.
> 
> This patch was already taken. Do I need to do any thing?

 No, unless Thomas chimes in, especially since you've posted v2 already (I 
hope he's sorted the stable part).  Overall we need better change 
descriptions though.

  Maciej
