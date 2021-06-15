Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2673A78E3
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 10:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhFOISu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 15 Jun 2021 04:18:50 -0400
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:43064 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhFOISt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Jun 2021 04:18:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08489759|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.494894-0.00593734-0.499169;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.KSX0zZM_1623745001;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KSX0zZM_1623745001)
          by smtp.aliyun-inc.com(10.147.41.138);
          Tue, 15 Jun 2021 16:16:42 +0800
Date:   Tue, 15 Jun 2021 16:16:39 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hminas@synopsys.com, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?UTF-8?B?xIxlxI1hdmFj?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
Message-ID: <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
In-Reply-To: <YFoJ0Z6K4B5smbQx@kroah.com>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
        <YFoJ0Z6K4B5smbQx@kroah.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

Sorry for taking so long to reply.

于 Tue, 23 Mar 2021 16:31:29 +0100
Greg KH <gregkh@linuxfoundation.org> 写道:

> On Tue, Mar 23, 2021 at 11:24:26PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> > Introduce configurable option for enabling GOTGCTL register
> > bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
> > VBUS overcurrent detection.
> > 
> > This patch is derived from Dragan Čečavac (in the kernel 3.18
> > tree of CI20). It is very useful for the MIPS Creator CI20(r1).
> > Without this patch, CI20's OTG port has a great probability to
> > face overcurrent warning, which breaks the OTG functionality.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
> > ---
> >  drivers/usb/dwc2/Kconfig | 6 ++++++
> >  drivers/usb/dwc2/core.c  | 9 +++++++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
> > index c131719..e40d187 100644
> > --- a/drivers/usb/dwc2/Kconfig
> > +++ b/drivers/usb/dwc2/Kconfig
> > @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
> >  	  non-periodic transfers, but of course the debug logs
> > will be incomplete. Note that this also disables some debug messages
> >  	  for which the transfer type cannot be deduced.
> > +
> > +config USB_DWC2_DISABLE_VOD
> > +	bool "Disable VBUS overcurrent detection"
> > +	help
> > +	  Say Y here to switch off VBUS overcurrent detection. It
> > enables USB
> > +	  functionality blocked by overcurrent detection.  
> 
> Why would this be a configuration option?  Shouldn't this be dynamic
> and just work properly automatically?
> 
> You should not have to do this on a build-time basis, it should be
> able to be detected and handled properly at run-time for all devices.
> 

I consulted the original author Dragan Čečavac, he think since this is
a feature which disables overcurrent detection, so we are not sure if
it could be harmful for some devices. Therefore he advise against
enabling it in runtime, and in favor that user explicitely has to
enable it.

> If you know this is needed for a specific type of device, detect it
> and make the change then, otherwise this could break working systems,
> right?

According to the information provided by Dragan Čečavac, this function
(select whether to enable over-current detection through the otgctl
register) don't seem to be available for all dwc2 controllers, so it
might make sense to add MACH_INGENIC dependency to
USB_DWC2_DISABLE_VOD, which could provide additional protection from
unwanted usage.

Thanks and best regards!

> 
> thanks,
> 
> greg k-h
