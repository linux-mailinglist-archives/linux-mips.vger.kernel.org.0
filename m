Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6076F1C3118
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 03:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgEDBdO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 21:33:14 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58868 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgEDBdO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 21:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588555991; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s3kVnM/pt0oggUIsiHNmQoFutX1dSCYY6TB3Lm6oLFE=;
        b=mxItMKtRyij5x/wPWOz13FGJPQjbal6rSoJWpgE2O0yRMR788cFDS8oY/lU7J32gz/QGX9
        wZTwogoNRBP8FYfj7KyPbrYAqfdVnWIPCIzTR9T3oCM4x5478uCuGUeYjZPuPKUYltHhOe
        hRlxtN57Okse4d6QbeTj8le1efh8CVs=
Date:   Mon, 04 May 2020 03:32:58 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v3 2/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com
Message-Id: <YM9S9Q.3YCM1LVLIS2O3@crapouillou.net>
In-Reply-To: <02c8f35fde969fd852a62740b4fa8a01c53b79ef.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
        <02c8f35fde969fd852a62740b4fa8a01c53b79ef.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le dim. 29 mars 2020 =E0 19:35, H. Nikolaus Schaller <hns@goldelico.com>=20
a =E9crit :
> so that the driver can load by matching the device tree
> if compiled as module.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Please add:

Cc: stable@vger.kernel.org # v5.3+
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")

And re-send this patch alone, then I can merge it ASAP.

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 6d47ef7b148c..bcba2f024842 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -843,6 +843,7 @@ static const struct of_device_id=20
> ingenic_drm_of_match[] =3D {
>  	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D &jz4770_soc_info },
>  	{ /* sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
>=20
>  static struct platform_driver ingenic_drm_driver =3D {
>  	.driver =3D {
> --
> 2.25.1
>=20


