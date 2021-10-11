Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EF4428783
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 09:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhJKHSF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 03:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbhJKHSE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Oct 2021 03:18:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B5C06161C
        for <linux-mips@vger.kernel.org>; Mon, 11 Oct 2021 00:16:05 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mZpXO-0000B1-1q; Mon, 11 Oct 2021 09:15:54 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mZpXN-0001N4-5g; Mon, 11 Oct 2021 09:15:53 +0200
Date:   Mon, 11 Oct 2021 09:15:53 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
Message-ID: <20211011071553.GA24717@pengutronix.de>
References: <20210902071951.28722-1-o.rempel@pengutronix.de>
 <20210902090324.GA6429@alpha.franken.de>
 <20210902101432.t3pmkb2od2j4kwth@pengutronix.de>
 <alpine.DEB.2.21.2110101148550.12214@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110101148550.12214@angie.orcam.me.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:13:54 up 235 days, 10:37, 136 users,  load average: 0.19, 0.25,
 0.22
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 10, 2021 at 11:58:24AM +0200, Maciej W. Rozycki wrote:
> On Thu, 2 Sep 2021, Marc Kleine-Budde wrote:
> 
> > > > Starting with following patch MIPS Malta is not able to boot:
> > > > | commit 79edff12060fe7772af08607eff50c0e2486c5ba
> > > > | Author: Rob Herring <robh@kernel.org>
> > > > | scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9
> > 
> > If the above patch broke malts, IMHO the fixes tag should be:
> > 
> > Fixes: 79edff12060f ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
> 
>  It's not clear either from this patch description or from the commit 
> referred what the actual *purpose* of the alignment check is and therefore 
> I think it's hard to say which of the two commits needs to be indicated as 
> the offender.  Without further data I tend to agree it's 79edff12060f that 
> ought to be referred, being the immediate cause of the regression, as 
> things obviously worked before, for 5+ years.

This patch was already taken. Do I need to do any thing?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
