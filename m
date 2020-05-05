Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4A51C6030
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2020 20:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEESgZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 5 May 2020 14:36:25 -0400
Received: from mailrelay4.webfaction.com ([185.20.51.6]:39276 "EHLO
        mailrelay4.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgEESgZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 May 2020 14:36:25 -0400
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 May 2020 14:36:22 EDT
Received: from mailrelay3.webfaction.com (mailrelay3.webfaction.com [207.38.93.110])
        by mailrelay4.webfaction.com (Postfix) with ESMTPS id BDA21A6CCF;
        Tue,  5 May 2020 18:26:31 +0000 (UTC)
Received: from mailrelay2.webfaction.com (mailrelay2.webfaction.com [185.20.50.247])
        by mailrelay3.webfaction.com (Postfix) with ESMTPS id BD4652A4BD8;
        Tue,  5 May 2020 18:26:29 +0000 (UTC)
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
        by mailrelay2.webfaction.com (Postfix) with ESMTPS id 75E1A1018AD;
        Tue,  5 May 2020 18:26:27 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id 168686016ACF2;
        Tue,  5 May 2020 18:26:27 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
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
Subject: Re: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi and ingenic-drm
Date:   Tue, 05 May 2020 20:26:10 +0200
Message-ID: <79437309.Fv5JZGVDrq@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <YC8S9Q.M96AR8DWGF0F1@crapouillou.net>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com> <125Q8Q.9F49TXF6ZICX1@crapouillou.net> <YC8S9Q.M96AR8DWGF0F1@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Monday 4. May 2020 03.05.22 Paul Cercueil wrote:
> 
> > Le sam. 11 avril 2020 à 16:14, H. Nikolaus Schaller <hns@goldelico.com> a
> > écrit :
> >> 
> >> So far we have identified two issues.
> >> 
> >> The first is that HPD interrupts are not properly processed.
> >> 
> >> drm_helper_hpd_irq_event() is called by HPD events but
> >> dev->mode_config.poll_enabled is false.
> 
> This is to be used when there's no hardware interrupt. I believe you
> have one, right? Then call drm_kms_helper_hotplug_event() from the
> interrupt handler instead.

What we have in drivers/gpu/drm/bridge/synopsys/dw-hdmi.c is a function called 
dw_hdmi_irq which appears to be the thread_fn for HDMI interrupts (alongside 
the dw_hdmi_hardirq which is the handler), initialised by a call to 
devm_request_threaded_irq.

In dw_hdmi_irq, a hotplug event seems to cause drm_helper_hpd_irq_event to be 
called. However...

[...]

> >> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
> >> 
> >> 	connector->polled = DRM_CONNECTOR_POLL_HPD;
> >> 
> >> but shouldn't this enable polling? Note that there seems to be
> >> no (direct) call to drm_kms_helper_poll_init().
> >> 
> >> If we set dev->mode_config.poll_enabled = true in
> >> drm_helper_hpd_irq_event() things start to work.
> >> 
> >> Please can you clarify what would be best practise here to
> >> get HPD event handling working.
> 
> Remove that - this stuff is for hardware without interrupts, where
> everything has to be polled.

Yes, I think this must be a mistake in the driver. In 
drm_helper_hpd_irq_event, the connector is tested for the 
DRM_CONNECTOR_POLL_HPD flag and skips the connector. It isn't clear whether 
this actually matters for the other hardware using this technology, 
documentation being rather thin on the ground.

> >> The other issue is in dw-hdmi.c:
> >> 
> >> We found out that ingenic_drm_encoder_atomic_check() fails because
> >> 
> >> info->num_bus_formats == 0
> >> 
> >> and not 1. This blocks further initialization.
> >> 
> >> The reason seems to be that dw_hdmi_bridge_attach() does not call
> >> drm_display_info_set_bus_formats() with a proper format like
> >> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
> >> 
> >> We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
> >> and then DRM setup seems to work (although we still have no valid
> >> HDMI signal but that is likely something else).
> >> 
> >> Please can you explain how setting the bus format should be fixed
> >> in dw-hdmi.c.
> 
> I'm not sure, but that information may come from EDID data. Are you
> able to obtain video modes from the connected monitor?

The modes are definitely received, or at least the list of modes given by 
/sys/devices/platform/13050000.lcd/drm/card0/card0-HDMI-A-1/modes is viable.

However, it rather looked like the bus format information wasn't being set and 
that this inhibited the completion of the initialisation process which, if 
completed, would ultimately cause the format to be set. (This being the short 
version of the story as I remember it right now.) So, the problem presents 
itself as an initialisation order problem.

I removed the flag from the connector to see if it makes any difference, but 
it doesn't look like it. Here is what /sys/kernel/debug/dri/0/state contains:

plane[31]: plane-0
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
crtc[32]: crtc-0
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[34]: HDMI-A-1
        crtc=(null)
        self_refresh_aware=0

The crtc member values do not look encouraging. In fact, it just looks like 
most structure members are uninitialised.

Thanks for the advice: I spent some time the other day reviewing various 
aspects of the Synopsys drivers of different vintages (Ingenic 3.0.8 non-DRM 
driver for JZ4780, MIPS/Ingenic 3.18 DRM driver for JZ4780 based on Freescale 
driver code, the recent generic DRM bridge driver), and so this information is 
timely and valuable.

Paul

P.S. Sorry if this message goes to far too many people. I don't want to 
"personalise" it by taking people off the recipients list, but I realise that 
this is probably not interesting to most recipients, either. Feel free to trim 
recipients if replying.
