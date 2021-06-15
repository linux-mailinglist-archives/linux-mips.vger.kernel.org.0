Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E263A7982
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 10:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhFOIyy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 04:54:54 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:49379 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhFOIyi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Jun 2021 04:54:38 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E6FDF240008;
        Tue, 15 Jun 2021 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1623747152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y4ciBzdWryCO1TDR+M1h+MZSSZQWKo3h0AKLa2iLwQE=;
        b=Sf3XuG7b1H/0obFq5OSYzSFjZYyzlBi0qG+c96CHfJ2GOJdwJMIGsRh1QtvKce5W6K1V2y
        x79Q53WCIUR0XSLBQFDHkVGnqZzFLXmCrUfxh/cr1fJx8wNw6tj6ZgHin/p498sPkODX2H
        2BbnSRGKbxxwXTafjni8WAo3KUapP6+Eo8DbgOTwl3Fj/Qr8cFqzT1swnE+aJVpjuw61J+
        NO2mxLERg8D2Ea+mR7cbACYTQ/HhcRwSrp41q7VURKkR33MJwajD66L8KMb1wgx/VC2vRA
        NzmweCQqGiFQ3zvdJIfubY/47D0GYrfcTLX1bFIMsxLbClXtDpOoe3q05eMUhA==
Date:   Tue, 15 Jun 2021 09:52:20 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, hminas@synopsys.com,
        paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com,
        Dragan =?iso-8859-2?b?yGXoYXZhYw==?= <dragancecavac@yahoo.com>
Message-Id: <8BJQUQ.QJOE5WOSWVBU@opendingux.net>
In-Reply-To: <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
        <YFoJ0Z6K4B5smbQx@kroah.com>
        <20210615161456.2dd501a1@zhouyanjie-virtual-machine>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar., juin 15 2021 at 16:16:39 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Hi Greg,
>=20
> Sorry for taking so long to reply.
>=20
> =E4=BA=8E Tue, 23 Mar 2021 16:31:29 +0100
> Greg KH <gregkh@linuxfoundation.org> =E5=86=99=E9=81=93:
>=20
>>  On Tue, Mar 23, 2021 at 11:24:26PM +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (=
Zhou Yanjie)=20
>> wrote:
>>  > Introduce configurable option for enabling GOTGCTL register
>>  > bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
>>  > VBUS overcurrent detection.
>>  >
>>  > This patch is derived from Dragan =C4=8Ce=C4=8Davac (in the kernel 3.=
18
>>  > tree of CI20). It is very useful for the MIPS Creator CI20(r1).
>>  > Without this patch, CI20's OTG port has a great probability to
>>  > face overcurrent warning, which breaks the OTG functionality.
>>  >
>>  > Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@=
wanyeetech.com>
>>  > Signed-off-by: Dragan =C4=8Ce=C4=8Davac <dragancecavac@yahoo.com>
>>  > ---
>>  >  drivers/usb/dwc2/Kconfig | 6 ++++++
>>  >  drivers/usb/dwc2/core.c  | 9 +++++++++
>>  >  2 files changed, 15 insertions(+)
>>  >
>>  > diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
>>  > index c131719..e40d187 100644
>>  > --- a/drivers/usb/dwc2/Kconfig
>>  > +++ b/drivers/usb/dwc2/Kconfig
>>  > @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
>>  >  	  non-periodic transfers, but of course the debug logs
>>  > will be incomplete. Note that this also disables some debug=20
>> messages
>>  >  	  for which the transfer type cannot be deduced.
>>  > +
>>  > +config USB_DWC2_DISABLE_VOD
>>  > +	bool "Disable VBUS overcurrent detection"
>>  > +	help
>>  > +	  Say Y here to switch off VBUS overcurrent detection. It
>>  > enables USB
>>  > +	  functionality blocked by overcurrent detection.
>>=20
>>  Why would this be a configuration option?  Shouldn't this be dynamic
>>  and just work properly automatically?
>>=20
>>  You should not have to do this on a build-time basis, it should be
>>  able to be detected and handled properly at run-time for all=20
>> devices.
>>=20
>=20
> I consulted the original author Dragan =C4=8Ce=C4=8Davac, he think since =
this=20
> is
> a feature which disables overcurrent detection, so we are not sure if
> it could be harmful for some devices. Therefore he advise against
> enabling it in runtime, and in favor that user explicitely has to
> enable it.

This could still be enabled at runtime, though, via a module parameter.=20
Leave it enabled by default, and those who want to disable it can do it.

Also, overcurrent detection is just "detection", so enabling or=20
disabling it won't change the fact that you can get overcurrent=20
conditions, right?

-Paul

>>  If you know this is needed for a specific type of device, detect it
>>  and make the change then, otherwise this could break working=20
>> systems,
>>  right?
>=20
> According to the information provided by Dragan =C4=8Ce=C4=8Davac, this=20
> function
> (select whether to enable over-current detection through the otgctl
> register) don't seem to be available for all dwc2 controllers, so it
> might make sense to add MACH_INGENIC dependency to
> USB_DWC2_DISABLE_VOD, which could provide additional protection from
> unwanted usage.
>=20
> Thanks and best regards!
>=20
>>=20
>>  thanks,
>>=20
>>  greg k-h


