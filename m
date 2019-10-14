Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78716D6B24
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 23:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbfJNVU2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 14 Oct 2019 17:20:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:42112 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731044AbfJNVU1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Oct 2019 17:20:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B21C1AC2F;
        Mon, 14 Oct 2019 21:20:25 +0000 (UTC)
Date:   Mon, 14 Oct 2019 23:20:24 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: ds1685: add indirect access method and remove
 plat_read/plat_write
Message-Id: <20191014232024.f77782b46b1b971bc403d849@suse.de>
In-Reply-To: <0e160839-9038-6f74-fdb6-8128344fb4b8@gentoo.org>
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
        <20191011150546.9186-3-tbogendoerfer@suse.de>
        <0e160839-9038-6f74-fdb6-8128344fb4b8@gentoo.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 12 Oct 2019 19:22:01 -0400
Joshua Kinard <kumba@gentoo.org> wrote:

> On 10/11/2019 11:05, Thomas Bogendoerfer wrote:
> > +static void
> > +ds1685_indir_write(struct ds1685_priv *rtc, int reg, u8 value)
> > +{
> > +	writeb(reg, rtc->regs);
> > +	writeb(value, rtc->data);
> > +}
> 
> IP30 applied a mask of 0x7f on the 'reg' parameter on both of its
> read/write functions, which was from Stan's original code.  Is this mask
> not needed any more with the other changes you made to the IP30 code? 

reg is always < 0x80, so I didn't see a point in masking it.

> > +	switch (pdata->access_type) {
> > +	case ds1685_reg_direct:
> > +		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
> > +		if (IS_ERR(rtc->regs))
> > +			return PTR_ERR(rtc->regs);
> > +		rtc->read = ds1685_read;
> > +		rtc->write = ds1685_write;
> > +		break;
> > +	case ds1685_reg_indirect:
> >  		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
> >  		if (IS_ERR(rtc->regs))
> >  			return PTR_ERR(rtc->regs);
> > +		rtc->data = devm_platform_ioremap_resource(pdev, 1);
> > +		if (IS_ERR(rtc->data))
> > +			return PTR_ERR(rtc->data);
> > +		rtc->read = ds1685_indir_read;
> > +		rtc->write = ds1685_indir_write;
> > +		break;
> >  	}
> 
> I believe there should be a default case in the switch statement to catch
> and return -ENXIO so that we don't wind up with rtc->{read,write} being
> NULL.

access_type is an enum and all possible values are covered with cases.
But I'll add a safe guart to check that read/write is set to cover garbled
platform_data. If you want to keep plat_read/plat_write I could add an
additional access_type (which could also be done later, when there is a
real use case).

> I also think the "indir" name isn't really descriptive of why IP32 and
> IP30 effectively have different read/write mechanisms.

IP32 accesses register directly and IP30 indirectly via an address register.
I'll use indirect in function name and some comment to explain.

> Might want to add
> some comments to explain that IP32 uses MMIO and can just directly
> read/write the registers, while IP30 uses PIO and has to go the route of

what's PIO here for you ? RTC address and data register are mapped MMIO
as part of the IOC3 register bar on IP30.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
