Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D271763C0
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 20:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgCBTWD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 14:22:03 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:37338 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgCBTWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 14:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583176920; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BdwneqTr2id/gIeZNxFxbnKoAw05xVADq6/gmIhZwg4=;
        b=AqUyKD024PGi1OHtNmOIPdseDG4JSqAnMjoEWug5pu0ruALpVlC4z6ZX1ymIeD1q0aQf9b
        9AArX0blaUj+5gfaNF92anigg+B3rPch0xaYfXhL6gHleYjUJQxoiR6rkhjf58LqE8wxWn
        tgFLcqWQSGaEN9Ga4UYZDzVDcS0z444=
Date:   Mon, 02 Mar 2020 16:21:37 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 3/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
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
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1583176897.3.4@crapouillou.net>
In-Reply-To: <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
        <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> so that the driver can load by matching the device tree
> if compiled as module.
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

Please remove the blank line above the MODULE_DEVICE_TABLE() macro.

-Paul

> +
>  static struct platform_driver ingenic_drm_driver =3D {
>  	.driver =3D {
>  		.name =3D "ingenic-drm",
> --
> 2.23.0
>=20

=

