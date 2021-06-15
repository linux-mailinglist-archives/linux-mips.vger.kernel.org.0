Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6D43A7B15
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 11:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhFOJuh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 05:50:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231288AbhFOJuh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 05:50:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F04E60FEA;
        Tue, 15 Jun 2021 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623750512;
        bh=BHOqM+Yiul7dkQgHlYqkUtja30szDgou1/4wsvKxQqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YRZnTxTlaMoEL+P95vx6QPW55SN99t+27Xon72wh+kWEJ6DM2mjDPWGCRmmHy66xJ
         vvz8yU3Gha+pgE3VLLE6S+XNGeMUpbNuN851wX2/BhEBL0I0wdosCVvymMyNJm0HHR
         CbZ35O5q29Podq/G65aBcR3jCY0faqAFzG474iIo=
Date:   Tue, 15 Jun 2021 11:48:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Cercueil <paul@opendingux.net>
Cc:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        hminas@synopsys.com, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?utf-8?B?xIxlxI1hdmFj?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
Message-ID: <YMh3bpRjyTZC2Hsd@kroah.com>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
 <YFoJ0Z6K4B5smbQx@kroah.com>
 <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
 <8BJQUQ.QJOE5WOSWVBU@opendingux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8BJQUQ.QJOE5WOSWVBU@opendingux.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 15, 2021 at 09:52:20AM +0100, Paul Cercueil wrote:
> Hi Zhou,
> 
> Le mar., juin 15 2021 at 16:16:39 +0800, 周琰杰 <zhouyanjie@wanyeetech.com>
> a écrit :
> > Hi Greg,
> > 
> > Sorry for taking so long to reply.
> > 
> > 于 Tue, 23 Mar 2021 16:31:29 +0100
> > Greg KH <gregkh@linuxfoundation.org> 写道:
> > 
> > >  On Tue, Mar 23, 2021 at 11:24:26PM +0800, 周琰杰 (Zhou Yanjie)
> > > wrote:
> > >  > Introduce configurable option for enabling GOTGCTL register
> > >  > bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
> > >  > VBUS overcurrent detection.
> > >  >
> > >  > This patch is derived from Dragan Čečavac (in the kernel 3.18
> > >  > tree of CI20). It is very useful for the MIPS Creator CI20(r1).
> > >  > Without this patch, CI20's OTG port has a great probability to
> > >  > face overcurrent warning, which breaks the OTG functionality.
> > >  >
> > >  > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > >  > Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
> > >  > ---
> > >  >  drivers/usb/dwc2/Kconfig | 6 ++++++
> > >  >  drivers/usb/dwc2/core.c  | 9 +++++++++
> > >  >  2 files changed, 15 insertions(+)
> > >  >
> > >  > diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
> > >  > index c131719..e40d187 100644
> > >  > --- a/drivers/usb/dwc2/Kconfig
> > >  > +++ b/drivers/usb/dwc2/Kconfig
> > >  > @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
> > >  >  	  non-periodic transfers, but of course the debug logs
> > >  > will be incomplete. Note that this also disables some debug
> > > messages
> > >  >  	  for which the transfer type cannot be deduced.
> > >  > +
> > >  > +config USB_DWC2_DISABLE_VOD
> > >  > +	bool "Disable VBUS overcurrent detection"
> > >  > +	help
> > >  > +	  Say Y here to switch off VBUS overcurrent detection. It
> > >  > enables USB
> > >  > +	  functionality blocked by overcurrent detection.
> > > 
> > >  Why would this be a configuration option?  Shouldn't this be dynamic
> > >  and just work properly automatically?
> > > 
> > >  You should not have to do this on a build-time basis, it should be
> > >  able to be detected and handled properly at run-time for all
> > > devices.
> > > 
> > 
> > I consulted the original author Dragan Čečavac, he think since this is
> > a feature which disables overcurrent detection, so we are not sure if
> > it could be harmful for some devices. Therefore he advise against
> > enabling it in runtime, and in favor that user explicitely has to
> > enable it.
> 
> This could still be enabled at runtime, though, via a module parameter.
> Leave it enabled by default, and those who want to disable it can do it.

This is not the 1990's, please NEVER add new module parameters,
especially ones that are somehow supposed to be device-specific.

Remember, module options are code-wide, not device-specific.

Just do this based on the device type, or something else dynamic, do NOT
make this be forced to be selected by a kernel configuration option or a
random module option at runtime.

thanks,

greg k-h
