Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC1F3A7B0D
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 11:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhFOJtJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 05:49:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhFOJtG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 05:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFE0C60FEA;
        Tue, 15 Jun 2021 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623750422;
        bh=0NgUrEQmnusO9U4XUcIRjeQHHVusUVV7w7uNhE6McsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iC/A7xvdit46bvr/3dyO2a+85Yj4BZ5XmJRPud5aXFD0D5gc7AOAqMmydpCXPyOI0
         /31zzTRyNq9f0MYmfSsf9LMyFqU5bkZQfPRv3yOJKtiSF9IZQEBAle8Pj8ous7AqzR
         aOnsGrC/oNyUJjNURCMfpKMtCwn1dxT1mwIBpKbk=
Date:   Tue, 15 Jun 2021 11:46:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     hminas@synopsys.com, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?utf-8?B?xIxlxI1hdmFj?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
Message-ID: <YMh3Ezr86NLPH+Aj@kroah.com>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
 <YFoJ0Z6K4B5smbQx@kroah.com>
 <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 15, 2021 at 04:16:39PM +0800, 周琰杰 wrote:
> Hi Greg,
> 
> Sorry for taking so long to reply.
> 
> 于 Tue, 23 Mar 2021 16:31:29 +0100
> Greg KH <gregkh@linuxfoundation.org> 写道:
> 
> > On Tue, Mar 23, 2021 at 11:24:26PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> > > Introduce configurable option for enabling GOTGCTL register
> > > bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
> > > VBUS overcurrent detection.
> > > 
> > > This patch is derived from Dragan Čečavac (in the kernel 3.18
> > > tree of CI20). It is very useful for the MIPS Creator CI20(r1).
> > > Without this patch, CI20's OTG port has a great probability to
> > > face overcurrent warning, which breaks the OTG functionality.
> > > 
> > > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > > Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
> > > ---
> > >  drivers/usb/dwc2/Kconfig | 6 ++++++
> > >  drivers/usb/dwc2/core.c  | 9 +++++++++
> > >  2 files changed, 15 insertions(+)
> > > 
> > > diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
> > > index c131719..e40d187 100644
> > > --- a/drivers/usb/dwc2/Kconfig
> > > +++ b/drivers/usb/dwc2/Kconfig
> > > @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
> > >  	  non-periodic transfers, but of course the debug logs
> > > will be incomplete. Note that this also disables some debug messages
> > >  	  for which the transfer type cannot be deduced.
> > > +
> > > +config USB_DWC2_DISABLE_VOD
> > > +	bool "Disable VBUS overcurrent detection"
> > > +	help
> > > +	  Say Y here to switch off VBUS overcurrent detection. It
> > > enables USB
> > > +	  functionality blocked by overcurrent detection.  
> > 
> > Why would this be a configuration option?  Shouldn't this be dynamic
> > and just work properly automatically?
> > 
> > You should not have to do this on a build-time basis, it should be
> > able to be detected and handled properly at run-time for all devices.
> > 
> 
> I consulted the original author Dragan Čečavac, he think since this is
> a feature which disables overcurrent detection, so we are not sure if
> it could be harmful for some devices. Therefore he advise against
> enabling it in runtime, and in favor that user explicitely has to
> enable it.

That will not work AT ALL for systems that build a generic kernel for
multiple devices (i.e. Android kernels), so please make this a runtime
determination based on the hardware capabilities.

> > If you know this is needed for a specific type of device, detect it
> > and make the change then, otherwise this could break working systems,
> > right?
> 
> According to the information provided by Dragan Čečavac, this function
> (select whether to enable over-current detection through the otgctl
> register) don't seem to be available for all dwc2 controllers, so it
> might make sense to add MACH_INGENIC dependency to
> USB_DWC2_DISABLE_VOD, which could provide additional protection from
> unwanted usage.

Again, make this dynamic and only happen for devices that know it will
work on, based on some hardware information (device type of DT value).
Do not make this happen based on a Kconfig option.

thanks,

greg k-h
