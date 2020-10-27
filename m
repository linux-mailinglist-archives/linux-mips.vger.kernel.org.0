Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E9429BC00
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 17:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368505AbgJ0Qah (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 12:30:37 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:32772 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751685AbgJ0Qag (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Oct 2020 12:30:36 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 5A8CE80766;
        Tue, 27 Oct 2020 17:30:31 +0100 (CET)
Date:   Tue, 27 Oct 2020 17:30:29 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: remove unused platform_data header file
Message-ID: <20201027163029.GA442200@ravnborg.org>
References: <20201026192040.GA350265@ravnborg.org>
 <20201027121043.GB13777@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027121043.GB13777@alpha.franken.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ER_8r6IbAAAA:8 a=pGLkceISAAAA:8
        a=VwQbUJbxAAAA:8 a=k-WWcVytrbrQ-gOoFrUA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=9LHmKk7ezEChjTCyhBa9:22
        a=AjGcO6oz07-iQ99wixmX:22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Tue, Oct 27, 2020 at 01:10:43PM +0100, Thomas Bogendoerfer wrote:
> On Mon, Oct 26, 2020 at 08:20:40PM +0100, Sam Ravnborg wrote:
> > There are no users of this headers file in the kernel.
> > All users are likely migrated to device tree which is a good thing.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > ---
> > 
> > I noticed this while surfing around in platform_data for no apperant
> > reason. So no fancy tooling or some such involved.
> > 
> > 	Sam
> > 
> >  .../linux/platform_data/jz4740/jz4740_nand.h  | 25 -------------------
> >  1 file changed, 25 deletions(-)
> >  delete mode 100644 include/linux/platform_data/jz4740/jz4740_nand.h
> 
> applied to mips-next.

Thanks for the quick response. Hopefully I can contribute something a little
more useful next time :-)

But then cleaning out old cruft is never a waste of time.

	Sam
