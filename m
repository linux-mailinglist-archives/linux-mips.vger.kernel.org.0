Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE441A6598
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 13:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgDMLZ3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 07:25:29 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:39716 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728964AbgDMLZ2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 07:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586777124; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Spmp5Tk3iEtqE4TakLgDMzw0KFx8MfCsUhQrPLM9+cs=;
        b=P0DJOk6HriC0s37BJhSot3nEJqW2fb8W7qlyZeMRoJn9JhXtfv0uEs5Tn61Mbt+dBuQauX
        nnfNSp8T0JGD24iqzKo3mE/rdZ4wROBre3Igkpw2HAnNSWbh0U739h7NFpReT1b/pbiAOU
        md7+/hp4ReBv+29kdl5L/2OK2h963Gw=
Date:   Mon, 13 Apr 2020 13:25:13 +0200
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
Message-Id: <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
In-Reply-To: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le sam. 11 avril 2020 =E0 16:14, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi,
> we (Paul Boddie and me) are working to get HDMI functional on the
> Ingenic CI20 board with jz4780 SoC which uses a specialization of
> the dw-hdmi driver.
>=20
>=20
> So far we have identified two issues.
>=20
> The first is that HPD interrupts are not properly processed.
>=20
> drm_helper_hpd_irq_event() is called by HPD events but
> dev->mode_config.poll_enabled is false.
>=20
> Therefore the interrupt is ignored and nothing happens.
>=20
> Now I wonder about the logic behind checking for poll_enabled.
> I understand that a driver can do either polling or irq or both.
>=20
> Therefore handling the irq_event shouldn't be disabled by poll_enabled
> being false. Otherwise we can only do: nothing, polling, polling+irq
> but not irq alone.
>=20
> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
>=20
> 	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>=20
> but shouldn't this enable polling? Note that there seems to be
> no (direct) call to drm_kms_helper_poll_init().
>=20
> If we set dev->mode_config.poll_enabled =3D true in
> drm_helper_hpd_irq_event() things start to work.
>=20
> Please can you clarify what would be best practise here to
> get HPD event handling working.
>=20
>=20
> The other issue is in dw-hdmi.c:
>=20
> We found out that ingenic_drm_encoder_atomic_check() fails because
>=20
> info->num_bus_formats =3D=3D 0
>=20
> and not 1. This blocks further initialization.
>=20
> The reason seems to be that dw_hdmi_bridge_attach() does not call
> drm_display_info_set_bus_formats() with a proper format like
> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
>=20
> We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
> and then DRM setup seems to work (although we still have no valid
> HDMI signal but that is likely something else).
>=20
> Please can you explain how setting the bus format should be fixed
> in dw-hdmi.c.
>=20
> If these questions should be forwarded to other specialists, please
> do so.

It should be sent to the DRI mailing list, you missed the most=20
important one.

-Paul

>=20
> BR and thanks,
> Nikolaus Schaller


