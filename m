Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1961A65FC
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 13:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgDMLyn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 07:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgDMLyn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 07:54:43 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Apr 2020 07:54:42 EDT
X-Greylist: delayed 168 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Apr 2020 04:49:13 PDT
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B230EC03BC92;
        Mon, 13 Apr 2020 04:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586778552;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8iHbGZPtb+jLR7wFq0bcz83kvyfN8ojZLOZPdfJ3DN0=;
        b=jzCixlMigoLBab/r7rphEa3/lu/SkG5/YzIXqlSxSNbYbt4gEJH6z6P8UBE6+x6go1
        gZ0TfJ9kz5VbA50HcICeDhcPbZ8530tSfnPaQ8Ou3io7NpMT4GILnqbWToNFBy4NVGGw
        X1MD6y8m4pwWe0N1ZDxB/uQc1l67d8TNMBbr/Wf6yg/U0rc92E13mftGWtk+EW9I68kT
        XI1keCnkvKtjLfehGLJOzPWujqS/LraH9QFwoSmFzfeqWESCA4chQAUGNMtMkDOD2H3I
        Uc6CGjTJu64/FAryger9klPNAaKJQbpM3ZiWh1WDYZZsM2+tZkDa+uV3+A/f+8vNgqXy
        D+nQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0Mwc0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w3DBkC5CU
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 13 Apr 2020 13:46:12 +0200 (CEST)
Subject: Re: DRM interaction problems on Ingenic CI20 / jz4780 with dw-hdmi and ingenic-drm
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
Date:   Mon, 13 Apr 2020 13:46:12 +0200
Cc:     Dave Airlie <airlied@linux.ie>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yakir Yang <ykk@rock-chips.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Paul Boddie <paul@boddie.org.uk>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAFD4E35-E830-4CED-956E-E354BC012698@goldelico.com>
References: <ED77DCA8-FF50-4E9E-A4B8-688262774723@goldelico.com> <125Q8Q.9F49TXF6ZICX1@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 13.04.2020 um 13:25 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le sam. 11 avril 2020 =E0 16:14, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Hi,
>> we (Paul Boddie and me) are working to get HDMI functional on the
>> Ingenic CI20 board with jz4780 SoC which uses a specialization of
>> the dw-hdmi driver.
>> So far we have identified two issues.
>> The first is that HPD interrupts are not properly processed.
>> drm_helper_hpd_irq_event() is called by HPD events but
>> dev->mode_config.poll_enabled is false.
>> Therefore the interrupt is ignored and nothing happens.
>> Now I wonder about the logic behind checking for poll_enabled.
>> I understand that a driver can do either polling or irq or both.
>> Therefore handling the irq_event shouldn't be disabled by =
poll_enabled
>> being false. Otherwise we can only do: nothing, polling, polling+irq
>> but not irq alone.
>> The jz4780 hdmi subsystem (drm/bridge/dw-hdmi.c) uses
>> 	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>> but shouldn't this enable polling? Note that there seems to be
>> no (direct) call to drm_kms_helper_poll_init().
>> If we set dev->mode_config.poll_enabled =3D true in
>> drm_helper_hpd_irq_event() things start to work.
>> Please can you clarify what would be best practise here to
>> get HPD event handling working.
>> The other issue is in dw-hdmi.c:
>> We found out that ingenic_drm_encoder_atomic_check() fails because
>> info->num_bus_formats =3D=3D 0
>> and not 1. This blocks further initialization.
>> The reason seems to be that dw_hdmi_bridge_attach() does not call
>> drm_display_info_set_bus_formats() with a proper format like
>> other drivers (e.g. drm/bridge/ti-tfp410.c) are doing.
>> We have patched to set a single bus format MEDIA_BUS_FMT_RGB888_1X24
>> and then DRM setup seems to work (although we still have no valid
>> HDMI signal but that is likely something else).
>> Please can you explain how setting the bus format should be fixed
>> in dw-hdmi.c.
>> If these questions should be forwarded to other specialists, please
>> do so.
>=20
> It should be sent to the DRI mailing list, you missed the most =
important one.

Ah, ok.

>=20
> -Paul
>=20
>> BR and thanks,
>> Nikolaus Schaller

