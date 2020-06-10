Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF251F4EDF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgFJH3H convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 10 Jun 2020 03:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgFJH3G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 03:29:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12959C03E96B
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 00:29:06 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jivAS-0007sn-5M; Wed, 10 Jun 2020 09:29:00 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jivAQ-00031u-P3; Wed, 10 Jun 2020 09:28:58 +0200
Message-ID: <6e387142f0f07491f8b2b66c970e7ead8e94de7b.camel@pengutronix.de>
Subject: Re: [PATCH 3/7] reset: add BCM6345 reset controller driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     robh+dt@kernel.org, tsbogend@alpha.franken.de,
        Jonas Gorski <jonas.gorski@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date:   Wed, 10 Jun 2020 09:28:58 +0200
In-Reply-To: <41A1CC01-BFA0-48A1-A2EE-7917B3A1323A@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
         <20200609134232.4084718-4-noltari@gmail.com>
         <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
         <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
         <2a621f170574a616bcf047f6725c74552f7abbb1.camel@pengutronix.de>
         <46614E69-578A-4782-9D72-85B2D2F38FB8@gmail.com>
         <e80e5c4c-ceef-3a62-3158-02f742bf76b7@gmail.com>
         <41A1CC01-BFA0-48A1-A2EE-7917B3A1323A@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Álvaro,

On Wed, 2020-06-10 at 08:08 +0200, Álvaro Fernández Rojas wrote:
> Hi Florian,
> 
> > El 9 jun 2020, a las 22:17, Florian Fainelli <f.fainelli@gmail.com> escribió:
> > 
> > 
> > 
> > On 6/9/2020 9:41 AM, Álvaro Fernández Rojas wrote:
> > > > > > If you can do without this, with I think this driver could be made to
> > > > > > use reset-simple.
> > > > > 
> > > > > Yes, but only if I can add reset support with a configurable sleep range to reset-simple. Is this possible?
> > > > 
> > > > I should have mentioned, support for this is on the reset/next branch:
> > > > 
> > > > git://git.pengutronix.de/pza/linux.git reset/next
> > > 
> > > Yes, but reset_us was only added to reset_simple_data, so there’s no way to fill that value from reset_simple_devdata or device tree, right?
> > 
> > Not that I can see, but you could certainly extend it here:
> > 
> > if (devdata) {
> > 		reg_offset = devdata->reg_offset;
> > 		if (devdata->nr_resets)
> > 			data->rcdev.nr_resets = devdata->nr_resets;
> > 		data->active_low = devdata->active_low;
> > 		data->status_active_low = devdata->status_active_low;
> > 	}
> 
> Yes, I would extend it there too,

You are right, reset_us is missing from reset_simple_devdata.

> but I was just saying that it’s a bit strange that it was only added
> to reset_simple_data without any way to fill the value.

The patch was added for the benefit of drivers that register their own
reset controller using reset_simple_data/ops, like sunxi or socfpga.
This might be considered an oversight, but until now there was no user
inside reset-simple.c.

regards
Philipp
