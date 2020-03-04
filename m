Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1552178FD0
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 12:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgCDLum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 06:50:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:34666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729232AbgCDLul (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 06:50:41 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADACE21739;
        Wed,  4 Mar 2020 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583322641;
        bh=Vv6tft/6s8eTaR5uE07e77E4tzR7PioLaiDjnjzQ9zc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eTt62EEXLCsVOdW25+cJSe6hfk0qTill6PuVYnucUMt4ktfYuQaDM6AW4txeL8prc
         B25VHRJ7FHHueVSR1xEUMBnOTzr/1weoh0FaSlU9OaBo/dIuKYD9+tDB5Dkye9pYs0
         IEFzAE8DwUpgDh45aajZCuOq0onApZrMejyqzNiI=
Date:   Wed, 4 Mar 2020 12:50:38 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     devel@driverdev.osuosl.org, Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, willy@infradead.org,
        linux-mips <linux-mips@vger.kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ralf Baechle <ralf@linux-mips.org>, dan.carpenter@oracle.com,
        linux@roeck-us.net
Subject: Re: [PATCH 0/6] Re-instate octeon staging drivers
Message-ID: <20200304115038.GB1581141@kroah.com>
References: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
 <20200212215200.GA2367959@kroah.com>
 <CAKcpw6VczRuMC_KRzP6VRPeZPtmEpVOJE5Fc+JhDH4mWU7jUVg@mail.gmail.com>
 <20200304063910.GA1203555@kroah.com>
 <CAKcpw6Vt1wUGcps2b86YGU8gGijvKTa6ERL5F1Nk=utaJyz+kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKcpw6Vt1wUGcps2b86YGU8gGijvKTa6ERL5F1Nk=utaJyz+kg@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 04, 2020 at 06:25:34PM +0800, YunQiang Su wrote:
> Greg KH <gregkh@linuxfoundation.org> 于2020年3月4日周三 下午2:39写道：
> >
> > On Wed, Mar 04, 2020 at 09:48:46AM +0800, YunQiang Su wrote:
> > > Greg KH <gregkh@linuxfoundation.org> 于2020年2月13日周四 上午5:52写道：
> > > >
> > > > On Wed, Feb 05, 2020 at 01:11:10PM +1300, Chris Packham wrote:
> > > > > This series re-instates the octeon drivers that were recently removed and
> > > > > addresses the build issues that lead to that decision.
> > > > >
> > > > > I've approached Cavium/Marvell about taking a more active interest in getting
> > > > > the code out of staging and into their proper location. No reply on that (yet).
> > > >
> > > > Good luck with talking to the companies, hopefully that will work.
> > > >
> > > > Anyway, I've applied this series, thanks for this, let's see what breaks
> > > > now :)
> > >
> > > Did you meet any problem to merge Chris's patchset?
> >
> > They are all in linux-next, so you can see for yourself :)
> 
> Thank you so much. I found it.
> It is very important for Debian MIPS Ports as we are using some of
> Octeon machines.

If it is so important, why is no one working on fixing these drivers up?

thanks,

greg k-h
