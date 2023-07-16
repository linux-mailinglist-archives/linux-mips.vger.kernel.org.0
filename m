Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E82D754EEF
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jul 2023 16:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjGPOMD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Jul 2023 10:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjGPOMC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jul 2023 10:12:02 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0C4CC
        for <linux-mips@vger.kernel.org>; Sun, 16 Jul 2023 07:12:00 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id L2TaqBUhtPm6CL2TbqINzC; Sun, 16 Jul 2023 16:11:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516717; bh=qEEEQe08huDEerbWiAR0cXkc0ghaaeZB3NbaG6DmygU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=tnPg1fg/ZCNSIJTHsL27cdlRYcyEzU1bfEgzsoQj4h464D2d0t7Mr/7L9OVTPr/u6
         a9cuYFJ4USHCZZ1EIAANN/8NKFTYppMqKA+rJQr6mpWHMxYST4VV0HC7ucTVWtFPHS
         7i0biV1VhywxD4rQEj3gnnEhMhjKAc9aGGYuMZTxRMlAv28K+d6zEGnia/CVJuHdxA
         h7KaIStiVc/Pt3Kc54RsPVIiiP0HqFO9Jk0yFL//9E67ymypL67eMb4i8vvdXRlXI/
         AfRV+3CgXd1hYwic8jAkJHrQqJJdKmYxiHDNdl0Cim3t/ylOfYIlf+lIhJ0SWXQch7
         g05d9UdkdxVag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516717; bh=qEEEQe08huDEerbWiAR0cXkc0ghaaeZB3NbaG6DmygU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=tnPg1fg/ZCNSIJTHsL27cdlRYcyEzU1bfEgzsoQj4h464D2d0t7Mr/7L9OVTPr/u6
         a9cuYFJ4USHCZZ1EIAANN/8NKFTYppMqKA+rJQr6mpWHMxYST4VV0HC7ucTVWtFPHS
         7i0biV1VhywxD4rQEj3gnnEhMhjKAc9aGGYuMZTxRMlAv28K+d6zEGnia/CVJuHdxA
         h7KaIStiVc/Pt3Kc54RsPVIiiP0HqFO9Jk0yFL//9E67ymypL67eMb4i8vvdXRlXI/
         AfRV+3CgXd1hYwic8jAkJHrQqJJdKmYxiHDNdl0Cim3t/ylOfYIlf+lIhJ0SWXQch7
         g05d9UdkdxVag==
Date:   Sun, 16 Jul 2023 16:11:53 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] usb: dwc3: Add SPDX header and copyright
Message-ID: <ZLP6qXR3O3X654/n@lenoch>
References: <ZLD7RHvE4eRPoqKN@lenoch>
 <ZLD8RkrgU/A9pZMf@lenoch>
 <20230714214609.cemmrkkfvw6p2toz@synopsys.com>
 <2023071550-exploring-freeload-ef90@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023071550-exploring-freeload-ef90@gregkh>
X-CMAE-Envelope: MS4wfAFdxZTnfcmhtvkh/GYhLdlU8GEn5atsKhyR0SZDdpcLhoNhg6EZjTrn5AtYYQOPfexHK2ezjOg3epkzV2tYEdbGjRXp5LSBFrzQAyr+80k/2qa/1eyI
 xjsQS6aI1Vfo3IiVtFi/yF0rB4WmdWt6nT1Mb8DEw8bHcL9Fj1BXhtpG7FtHoZd8B/xR/mTDrL29k9nSrCK4z8lxC7a2I0oHI+j+2KK/zEMLQUlGqT6VCi23
 Ftmxxlpx0XClIHV1cu2+W89PH3jVW0yIhfbT0r/6SXCldPSAmY0NVCCPOq1MZ7MC8a1VVVuUNV6do/r4zFNSYGuwZSJiP7raoHJNCy75arqvDLAKz84hFQO4
 gF0IFhUv
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 15, 2023 at 07:23:29AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 14, 2023 at 09:46:13PM +0000, Thinh Nguyen wrote:
> > On Fri, Jul 14, 2023, Ladislav Michl wrote:
> > > From: Ladislav Michl <ladis@linux-mips.org>
> > > 
> > > As driver is rewritten and David no longer works for Marvell (Cavium),
> > > I'm to blame for breakage.
> > > 
> > > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > > ---
> > >  CHANGES:
> > >  - v2: None
> > >  - v3: None
> > > 
> > >  drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> > > index dd47498f4efb..a68d568b11a9 100644
> > > --- a/drivers/usb/dwc3/dwc3-octeon.c
> > > +++ b/drivers/usb/dwc3/dwc3-octeon.c
> > > @@ -1,11 +1,9 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > >  /*
> > > - * XHCI HCD glue for Cavium Octeon III SOCs.
> > > + * DWC3 glue for Cavium Octeon III SOCs.
> > >   *
> > >   * Copyright (C) 2010-2017 Cavium Networks
> > > - *
> > > - * This file is subject to the terms and conditions of the GNU General Public
> > > - * License.  See the file "COPYING" in the main directory of this archive
> > > - * for more details.
> > > + * Copyright (C) 2023 Ladislav Michl <ladis@linux-mips.org>
> > 
> > I may not be an expert with Copyright, but is it correct to put your
> > name rather than the entity this belongs to?
> 
> That is up to the employer of the developer as to what they want to see
> here.  Ladislav, you have run this by your legal group, right?

Not this particular one as I do not have any legal group :) I started
this cleanup on my own, but it turned out there will be much more work
needed to make USB on Octeon reliable. So after asking my contact person
at Racom, copyright will be assigned to them. Note that it is not official
statement yet, but as Thinh is on holidays anyway, we have quite some
time to sort this out. I'll either confirm or send v5 - v4 is is on the
way with Thinh's comments addressed, so I'm lookign forward for feedback.

Thanks,
	ladis
