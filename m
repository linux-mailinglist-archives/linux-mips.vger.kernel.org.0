Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1664915F65C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgBNTGk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:06:40 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:55244 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgBNTGk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581707197; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4KB1bZUahZdMxykkZApvtcfxGNo5EEXp6pqcqZ+9Y/Q=;
        b=m/G/6+eO4qdQjEzCuMTIRsZAWqUmu8d7b0F7tO+d1MPV2IuvUKI7o756uV+aNtF73xQvrL
        B4C/IMiyF2njiBqqQbNxpbLFWCwtvNGDKvAuTdaeBMNnKscn4OTNo/4bEcpSuXmzvfIvM0
        21O999aAb9OhsCVkv5Iq2yp5jLZMT3Q=
Date:   Fri, 14 Feb 2020 16:06:17 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/12] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1581707177.3.6@crapouillou.net>
In-Reply-To: <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
        <1b5475c88032b3851c6d33443e688b432af42a9f.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Please rebase this patch on top of drm-misc-next and send it apart - it=20
should go through the DRM tree.


Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Add MODULE_DEVICE_TABLE so that the driver can load by
> matching the device tree if compiled as module.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 6d47ef7b148c..d8617096dd8e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -844,6 +844,8 @@ static const struct of_device_id=20
> ingenic_drm_of_match[] =3D {
>  	{ /* sentinel */ },
>  };
>=20
> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);

Also please remove the blank line above MODULE_DEVICE_TABLE.

Cheers,
-Paul

> +
>  static struct platform_driver ingenic_drm_driver =3D {
>  	.driver =3D {
>  		.name =3D "ingenic-drm",
> --
> 2.23.0
>=20

=

