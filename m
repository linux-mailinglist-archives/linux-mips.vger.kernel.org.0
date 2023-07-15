Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2CA7546E9
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jul 2023 07:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjGOFXf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Jul 2023 01:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGOFXe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Jul 2023 01:23:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09FE3A9D;
        Fri, 14 Jul 2023 22:23:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6438A60281;
        Sat, 15 Jul 2023 05:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58162C433C7;
        Sat, 15 Jul 2023 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689398612;
        bh=jrDgla842TmyRAqSOcr4SE3GZfYxFyaUdYuDYy8R8Yw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RgKCvksIE1RXb18/KqJWsqxICl9Xav24OHRP0cyDA9CY6Nkv+CLQGeGRn0oK4CMkr
         8TJK0dc+ZQ7uF1qhIWBNwUaA7d05/fpaftb01NLlm/lvxAlz4HKDhwbc2Q1CQNNuKn
         Fdb9CGSs6ibMXn93z+5fb7f/aOj+wu4NikcjCUDk=
Date:   Sat, 15 Jul 2023 07:23:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Ladislav Michl <oss-lists@triops.cz>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] usb: dwc3: Add SPDX header and copyright
Message-ID: <2023071550-exploring-freeload-ef90@gregkh>
References: <ZLD7RHvE4eRPoqKN@lenoch>
 <ZLD8RkrgU/A9pZMf@lenoch>
 <20230714214609.cemmrkkfvw6p2toz@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714214609.cemmrkkfvw6p2toz@synopsys.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 14, 2023 at 09:46:13PM +0000, Thinh Nguyen wrote:
> On Fri, Jul 14, 2023, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > As driver is rewritten and David no longer works for Marvell (Cavium),
> > I'm to blame for breakage.
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > ---
> >  CHANGES:
> >  - v2: None
> >  - v3: None
> > 
> >  drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> > index dd47498f4efb..a68d568b11a9 100644
> > --- a/drivers/usb/dwc3/dwc3-octeon.c
> > +++ b/drivers/usb/dwc3/dwc3-octeon.c
> > @@ -1,11 +1,9 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * XHCI HCD glue for Cavium Octeon III SOCs.
> > + * DWC3 glue for Cavium Octeon III SOCs.
> >   *
> >   * Copyright (C) 2010-2017 Cavium Networks
> > - *
> > - * This file is subject to the terms and conditions of the GNU General Public
> > - * License.  See the file "COPYING" in the main directory of this archive
> > - * for more details.
> > + * Copyright (C) 2023 Ladislav Michl <ladis@linux-mips.org>
> 
> I may not be an expert with Copyright, but is it correct to put your
> name rather than the entity this belongs to?

That is up to the employer of the developer as to what they want to see
here.  Ladislav, you have run this by your legal group, right?

thanks,

greg k-h
