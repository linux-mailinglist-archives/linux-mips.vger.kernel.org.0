Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A6D1CC1D7
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 15:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgEINnh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 09:43:37 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58252 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgEINng (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 May 2020 09:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589031813; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3+OUbR3nAMHj6vOkoLNKrouoG7vK2MNU8TiGQFCjkNE=;
        b=mzYvCsSkmTcvd80dckxAzm86ehgWKmiR+rQMbWEdfhl0qfnXd53qsC+5ePCfu/qkCPfwyp
        lHMrHUrqXJ/qFUEwRSbjrcH8ezx68Ub8amGNPxkbF3G/Y6lZ1eYIfrR8WJsrbxj5rDH/y6
        WGniJIlDkxh3l4Xf/F8JAahNCU5JL/Y=
Date:   Sat, 09 May 2020 15:43:21 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi
 and ingenic-drm
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Dave Airlie <airlied@linux.ie>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yakir Yang <ykk@rock-chips.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Message-Id: <9SG2AQ.ALB8O9UHXRT11@crapouillou.net>
In-Reply-To: <79437309.Fv5JZGVDrq@jeremy>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
        <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
        <YC8S9Q.M96AR8DWGF0F1@crapouillou.net> <79437309.Fv5JZGVDrq@jeremy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Le mar. 5 mai 2020 =E0 20:26, Paul Boddie <paul@boddie.org.uk> a =E9crit :
> On Monday 4. May 2020 03.05.22 Paul Cercueil wrote:
>>=20
>>  > Le sam. 11 avril 2020 =E0 16:14, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a
>>  > =E9crit :
>>  >>
>>  >> So far we have identified two issues.
>>  >>
>>  >> The first is that HPD interrupts are not properly processed.
>>  >>
>>  >> drm_helper_hpd_irq_event() is called by HPD events but
>>  >> dev->mode_config.poll_enabled is false.
>>=20
>>  This is to be used when there's no hardware interrupt. I believe you
>>  have one, right? Then call drm_kms_helper_hotplug_event() from the
>>  interrupt handler instead.
>=20
> What we have in drivers/gpu/drm/bridge/synopsys/dw-hdmi.c is a=20
> function called
> dw_hdmi_irq which appears to be the thread_fn for HDMI interrupts=20
> (alongside
> the dw_hdmi_hardirq which is the handler), initialised by a call to
> devm_request_threaded_irq.
>=20
> In dw_hdmi_irq, a hotplug event seems to cause=20
> drm_helper_hpd_irq_event to be
> called. However...
>=20
> [...]
>=20
>>  >> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
>>  >>
>>  >> 	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>>  >>
>>  >> but shouldn't this enable polling? Note that there seems to be
>>  >> no (direct) call to drm_kms_helper_poll_init().
>>  >>
>>  >> If we set dev->mode_config.poll_enabled =3D true in
>>  >> drm_helper_hpd_irq_event() things start to work.
>>  >>
>>  >> Please can you clarify what would be best practise here to
>>  >> get HPD event handling working.
>>=20
>>  Remove that - this stuff is for hardware without interrupts, where
>>  everything has to be polled.
>=20
> Yes, I think this must be a mistake in the driver. In
> drm_helper_hpd_irq_event, the connector is tested for the
> DRM_CONNECTOR_POLL_HPD flag and skips the connector. It isn't clear=20
> whether
> this actually matters for the other hardware using this technology,
> documentation being rather thin on the ground.
>=20
>>  >> The other issue is in dw-hdmi.c:
>>  >>
>>  >> We found out that ingenic_drm_encoder_atomic_check() fails=20
>> because
>>  >>
>>  >> info->num_bus_formats =3D=3D 0
>>  >>
>>  >> and not 1. This blocks further initialization.
>>  >>
>>  >> The reason seems to be that dw_hdmi_bridge_attach() does not call
>>  >> drm_display_info_set_bus_formats() with a proper format like
>>  >> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
>>  >>
>>  >> We have patched to set a single bus format=20
>> MEDIA_BUS_FMT_RGB888_1X24
>>  >> and then DRM setup seems to work (although we still have no valid
>>  >> HDMI signal but that is likely something else).
>>  >>
>>  >> Please can you explain how setting the bus format should be fixed
>>  >> in dw-hdmi.c.
>>=20
>>  I'm not sure, but that information may come from EDID data. Are you
>>  able to obtain video modes from the connected monitor?
>=20
> The modes are definitely received, or at least the list of modes=20
> given by
> /sys/devices/platform/13050000.lcd/drm/card0/card0-HDMI-A-1/modes is=20
> viable.
>=20
> However, it rather looked like the bus format information wasn't=20
> being set and
> that this inhibited the completion of the initialisation process=20
> which, if
> completed, would ultimately cause the format to be set. (This being=20
> the short
> version of the story as I remember it right now.) So, the problem=20
> presents
> itself as an initialisation order problem.

It's not an initialization order problem, the ingenic-drm expects the=20
bus_formats to be provided and the synopsis driver never calls=20
drm_display_info_set_bus_formats().

> I removed the flag from the connector to see if it makes any=20
> difference, but
> it doesn't look like it. Here is what /sys/kernel/debug/dri/0/state=20
> contains:
>=20
> plane[31]: plane-0
>         crtc=3D(null)
>         fb=3D0
>         crtc-pos=3D0x0+0+0
>         src-pos=3D0.000000x0.000000+0.000000+0.000000
>         rotation=3D1
>         normalized-zpos=3D0
>         color-encoding=3DITU-R BT.601 YCbCr
>         color-range=3DYCbCr limited range
> crtc[32]: crtc-0
>         enable=3D0
>         active=3D0
>         self_refresh_active=3D0
>         planes_changed=3D0
>         mode_changed=3D0
>         active_changed=3D0
>         connectors_changed=3D0
>         color_mgmt_changed=3D0
>         plane_mask=3D0
>         connector_mask=3D0
>         encoder_mask=3D0
>         mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
> connector[34]: HDMI-A-1
>         crtc=3D(null)
>         self_refresh_aware=3D0
>=20
> The crtc member values do not look encouraging. In fact, it just=20
> looks like
> most structure members are uninitialised.
>=20
> Thanks for the advice: I spent some time the other day reviewing=20
> various
> aspects of the Synopsys drivers of different vintages (Ingenic 3.0.8=20
> non-DRM
> driver for JZ4780, MIPS/Ingenic 3.18 DRM driver for JZ4780 based on=20
> Freescale
> driver code, the recent generic DRM bridge driver), and so this=20
> information is
> timely and valuable.

With a hardcoded bus_format of RGB888 in the ingenic-drm driver, and=20
jz4780_dw_hdmi_plat_data.input_bus_format initialized too:

modetest -D /dev/dri/card0 -M ingenic-drm -s 35@32:1280x720-60

My PC monitor sees a signal - unfortunately it says "input not=20
supported".


> Paul
>=20
> P.S. Sorry if this message goes to far too many people. I don't want=20
> to
> "personalise" it by taking people off the recipients list, but I=20
> realise that
> this is probably not interesting to most recipients, either. Feel=20
> free to trim
> recipients if replying.

Again, you shoul send this message to the DRI mailing list. The people=20
who did work with the Synopsis IP may be able to help.

-Paul


