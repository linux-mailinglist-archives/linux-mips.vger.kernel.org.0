Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F1B1C3092
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 03:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDBFg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 21:05:36 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:37862 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgEDBFg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 21:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588554334; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F3RwTvS4W/Ru6HPIjFj+d9jqrjj8rrS76agrs9WAWAA=;
        b=JtCWfSGUh9re+3gtwIPVYhHKnqMydySyvWFRBnxPdQAKrSWiJggKm7kP2Ph05Ebp13bNoI
        +MKgD6goxUhrjziZPjjkolIMpyezdg9oMQZoeimI6b9XAUNDW/oeQUqR4wGUH+XREi0Hi/
        laW0mz6FxfeLc/Bnh8cccgXXwkkkBSM=
Date:   Mon, 04 May 2020 03:05:22 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi
 and ingenic-drm
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yakir Yang <ykk@rock-chips.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Paul Boddie <paul@boddie.org.uk>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Message-Id: <YC8S9Q.M96AR8DWGF0F1@crapouillou.net>
In-Reply-To: <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
        <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

So I just wrote a HDMI driver for a different chip, I guess I can=20
answer some of your questions now.


Le lun. 13 avril 2020 =E0 13:25, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> Hi Nikolaus,
>=20
>=20
> Le sam. 11 avril 2020 =E0 16:14, H. Nikolaus Schaller=20
> <hns@goldelico.com> a =E9crit :
>> Hi,
>> we (Paul Boddie and me) are working to get HDMI functional on the
>> Ingenic CI20 board with jz4780 SoC which uses a specialization of
>> the dw-hdmi driver.
>>=20
>>=20
>> So far we have identified two issues.
>>=20
>> The first is that HPD interrupts are not properly processed.
>>=20
>> drm_helper_hpd_irq_event() is called by HPD events but
>> dev->mode_config.poll_enabled is false.
>>=20

This is to be used when there's no hardware interrupt. I believe you=20
have one, right? Then call drm_kms_helper_hotplug_event() from the=20
interrupt handler instead.

>> Therefore the interrupt is ignored and nothing happens.
>>=20
>> Now I wonder about the logic behind checking for poll_enabled.
>> I understand that a driver can do either polling or irq or both.
>>=20
>> Therefore handling the irq_event shouldn't be disabled by=20
>> poll_enabled
>> being false. Otherwise we can only do: nothing, polling, polling+irq
>> but not irq alone.
>>=20
>> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
>>=20
>> 	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>>=20
>> but shouldn't this enable polling? Note that there seems to be
>> no (direct) call to drm_kms_helper_poll_init().
>>=20
>> If we set dev->mode_config.poll_enabled =3D true in
>> drm_helper_hpd_irq_event() things start to work.
>>=20
>> Please can you clarify what would be best practise here to
>> get HPD event handling working.
>>=20

Remove that - this stuff is for hardware without interrupts, where=20
everything has to be polled.

>> The other issue is in dw-hdmi.c:
>>=20
>> We found out that ingenic_drm_encoder_atomic_check() fails because
>>=20
>> info->num_bus_formats =3D=3D 0
>>=20
>> and not 1. This blocks further initialization.
>>=20
>> The reason seems to be that dw_hdmi_bridge_attach() does not call
>> drm_display_info_set_bus_formats() with a proper format like
>> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
>>=20
>> We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
>> and then DRM setup seems to work (although we still have no valid
>> HDMI signal but that is likely something else).
>>=20
>> Please can you explain how setting the bus format should be fixed
>> in dw-hdmi.c.
>>=20

I'm not sure, but that information may come from EDID data. Are you=20
able to obtain video modes from the connected monitor?

-Paul

>> If these questions should be forwarded to other specialists, please
>> do so.
>=20
> It should be sent to the DRI mailing list, you missed the most=20
> important one.
>=20
> -Paul
>=20
>>=20
>> BR and thanks,
>> Nikolaus Schaller


