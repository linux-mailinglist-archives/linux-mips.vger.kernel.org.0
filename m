Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC2F3A7B97
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhFOKRu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 06:17:50 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:46883 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhFOKRt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Jun 2021 06:17:49 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 7B9CECC5B1;
        Tue, 15 Jun 2021 10:06:54 +0000 (UTC)
Received: (Authenticated sender: paul@opendingux.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id ABEC0C0010;
        Tue, 15 Jun 2021 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1623751590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XuVVJBxzTq/nezMzQHmQ1iVQtTJi09b38NBbn1HjEvw=;
        b=JHYLsSG9c/DxPug2+3SS07gd9NSKQdIOHICPsS6HGrJIp5dhUaBO4zub1qz10DE6zncynR
        MAot7LCUhW/EFVNxL0XBzz51PoBF6avWqVYnPEkGmRRfgViAKEg79y9sFwxNhftod0dWIU
        Uby73qZbDhZZC2Q0XIHgTBadil6EHZEBEWQO2q16MYtxJCQHyg4yYiYmKNZ7V+80Dm5uZK
        KM/s42LdGBMV8JceVMNeTMfX3Y530BiykAx/xqHcVU/Z6BiO5/262Gab7IZXWJNoKqZQba
        x+OYathox+vQMl54ravzHVrSAUfD6zrJzz1g/qBNA0U/GB7DPey2ecs24cSt2g==
Date:   Tue, 15 Jun 2021 11:06:17 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        hminas@synopsys.com, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?iso-8859-2?b?yGXoYXZhYw==?= <dragancecavac@yahoo.com>
Message-Id: <HQMQUQ.3AEG9G7WVQKQ2@opendingux.net>
In-Reply-To: <YMh3bpRjyTZC2Hsd@kroah.com>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
        <YFoJ0Z6K4B5smbQx@kroah.com>
        <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
        <8BJQUQ.QJOE5WOSWVBU@opendingux.net> <YMh3bpRjyTZC2Hsd@kroah.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

Le mar., juin 15 2021 at 11:48:30 +0200, Greg KH=20
<gregkh@linuxfoundation.org> a =C3=A9crit :
> On Tue, Jun 15, 2021 at 09:52:20AM +0100, Paul Cercueil wrote:
>>  Hi Zhou,
>>=20
>>  Le mar., juin 15 2021 at 16:16:39 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0=20
>> <zhouyanjie@wanyeetech.com>
>>  a =C3=A9crit :
>>  > Hi Greg,
>>  >
>>  > Sorry for taking so long to reply.
>>  >
>>  > =E4=BA=8E Tue, 23 Mar 2021 16:31:29 +0100
>>  > Greg KH <gregkh@linuxfoundation.org> =E5=86=99=E9=81=93:
>>  >
>>  > >  On Tue, Mar 23, 2021 at 11:24:26PM +0800, =E5=91=A8=E7=90=B0=E6=9D=
=B0 (Zhou=20
>> Yanjie)
>>  > > wrote:
>>  > >  > Introduce configurable option for enabling GOTGCTL register
>>  > >  > bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
>>  > >  > VBUS overcurrent detection.
>>  > >  >
>>  > >  > This patch is derived from Dragan =C4=8Ce=C4=8Davac (in the kern=
el=20
>> 3.18
>>  > >  > tree of CI20). It is very useful for the MIPS Creator=20
>> CI20(r1).
>>  > >  > Without this patch, CI20's OTG port has a great probability=20
>> to
>>  > >  > face overcurrent warning, which breaks the OTG functionality.
>>  > >  >
>>  > >  > Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
>> <zhouyanjie@wanyeetech.com>
>>  > >  > Signed-off-by: Dragan =C4=8Ce=C4=8Davac <dragancecavac@yahoo.com=
>
>>  > >  > ---
>>  > >  >  drivers/usb/dwc2/Kconfig | 6 ++++++
>>  > >  >  drivers/usb/dwc2/core.c  | 9 +++++++++
>>  > >  >  2 files changed, 15 insertions(+)
>>  > >  >
>>  > >  > diff --git a/drivers/usb/dwc2/Kconfig=20
>> b/drivers/usb/dwc2/Kconfig
>>  > >  > index c131719..e40d187 100644
>>  > >  > --- a/drivers/usb/dwc2/Kconfig
>>  > >  > +++ b/drivers/usb/dwc2/Kconfig
>>  > >  > @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
>>  > >  >  	  non-periodic transfers, but of course the debug logs
>>  > >  > will be incomplete. Note that this also disables some debug
>>  > > messages
>>  > >  >  	  for which the transfer type cannot be deduced.
>>  > >  > +
>>  > >  > +config USB_DWC2_DISABLE_VOD
>>  > >  > +	bool "Disable VBUS overcurrent detection"
>>  > >  > +	help
>>  > >  > +	  Say Y here to switch off VBUS overcurrent detection. It
>>  > >  > enables USB
>>  > >  > +	  functionality blocked by overcurrent detection.
>>  > >
>>  > >  Why would this be a configuration option?  Shouldn't this be=20
>> dynamic
>>  > >  and just work properly automatically?
>>  > >
>>  > >  You should not have to do this on a build-time basis, it=20
>> should be
>>  > >  able to be detected and handled properly at run-time for all
>>  > > devices.
>>  > >
>>  >
>>  > I consulted the original author Dragan =C4=8Ce=C4=8Davac, he think si=
nce=20
>> this is
>>  > a feature which disables overcurrent detection, so we are not=20
>> sure if
>>  > it could be harmful for some devices. Therefore he advise against
>>  > enabling it in runtime, and in favor that user explicitely has to
>>  > enable it.
>>=20
>>  This could still be enabled at runtime, though, via a module=20
>> parameter.
>>  Leave it enabled by default, and those who want to disable it can=20
>> do it.
>=20
> This is not the 1990's, please NEVER add new module parameters,

First time I hear this.

> especially ones that are somehow supposed to be device-specific.
>=20
> Remember, module options are code-wide, not device-specific.

Right. I thought "just make the option available on devices that=20
support it" but that's not how it works.

-Paul

> Just do this based on the device type, or something else dynamic, do=20
> NOT
> make this be forced to be selected by a kernel configuration option=20
> or a
> random module option at runtime.
>=20
> thanks,
>=20
> greg k-h


