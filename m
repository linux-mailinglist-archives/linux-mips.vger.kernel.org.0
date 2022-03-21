Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614E14E2AB3
	for <lists+linux-mips@lfdr.de>; Mon, 21 Mar 2022 15:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349374AbiCUOaI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Mar 2022 10:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349248AbiCUO1w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Mar 2022 10:27:52 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DDF1CFF2;
        Mon, 21 Mar 2022 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647872486; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OrL7JO2qfltrw/AE5sARmYQoFlwPHN9MKzIkP6MbteQ=;
        b=FiO5IEc4KUCJur80gcUWfmv9JtIlEXAhMwSjf7MpfcFBkIeW11dfIFh8/QAASUWOYaWH/H
        dJljtTifWLI/szjjcBPbBgjgZOrUhotfeROesy0QAuAZNHargCrwPPDtNr8u7CdNEd1YHl
        bFU2t86NDxH/Zr3wddrLz1pLt3Se/Rw=
Date:   Mon, 21 Mar 2022 14:21:16 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
 add .enable and .disable
To:     Christophe Branchereau <cbranchereau@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Message-Id: <GJM39R.I3L8ZIKHOJ252@crapouillou.net>
In-Reply-To: <20220321133651.291592-4-cbranchereau@gmail.com>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
        <20220321133651.291592-4-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christophe,

Le lun., mars 21 2022 at 14:36:51 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> Following the introduction of bridge_atomic_enable in the ingenic
> drm driver, the crtc is enabled between .prepare and .enable, if
> it exists.
>=20
> Add it so the backlight is only enabled after the crtc is, to avoid
> graphical issues.
>=20
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>

Didn't Sam acked it?

> ---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 31=20
> +++++++++++++++++--
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31=20
> ++++++++++++++++---
>  2 files changed, 55 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c=20
> b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> index f043b484055b..ddfacaeac1d4 100644
> --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> @@ -140,7 +140,7 @@ static const struct reg_sequence=20
> y030xx067a_init_sequence[] =3D {
>  	{ 0x03, REG03_VPOSITION(0x0a) },
>  	{ 0x04, REG04_HPOSITION1(0xd2) },
>  	{ 0x05, REG05_CLIP | REG05_NVM_VREFRESH | REG05_SLBRCHARGE(0x2) },
> -	{ 0x06, REG06_XPSAVE | REG06_NT },
> +	{ 0x06, REG06_NT },
>  	{ 0x07, 0 },
>  	{ 0x08, REG08_PANEL(0x1) | REG08_CLOCK_DIV(0x2) },
>  	{ 0x09, REG09_SUB_BRIGHT_R(0x20) },
> @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel=20
> *panel)
>  		goto err_disable_regulator;
>  	}
>=20
> -	msleep(120);
> -
>  	return 0;
>=20
>  err_disable_regulator:
> @@ -202,6 +200,30 @@ static int y030xx067a_unprepare(struct drm_panel=20
> *panel)
>  	return 0;
>  }
>=20
> +static int y030xx067a_enable(struct drm_panel *panel)
> +{
> +
> +	struct y030xx067a *priv =3D to_y030xx067a(panel);
> +
> +	regmap_set_bits(priv->map, 0x06, REG06_XPSAVE);
> +
> +	if (panel->backlight) {
> +		/* Wait for the picture to be ready before enabling backlight */
> +		msleep(120);
> +	}
> +
> +	return 0;
> +}
> +
> +static int y030xx067a_disable(struct drm_panel *panel)
> +{
> +	struct y030xx067a *priv =3D to_y030xx067a(panel);
> +
> +	regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
> +
> +	return 0;
> +}
> +
>  static int y030xx067a_get_modes(struct drm_panel *panel,
>  				struct drm_connector *connector)
>  {
> @@ -239,6 +261,8 @@ static int y030xx067a_get_modes(struct drm_panel=20
> *panel,
>  static const struct drm_panel_funcs y030xx067a_funcs =3D {
>  	.prepare	=3D y030xx067a_prepare,
>  	.unprepare	=3D y030xx067a_unprepare,
> +	.enable		=3D y030xx067a_enable,
> +	.disable	=3D y030xx067a_disable,
>  	.get_modes	=3D y030xx067a_get_modes,
>  };
>=20
> @@ -246,6 +270,7 @@ static const struct regmap_config=20
> y030xx067a_regmap_config =3D {
>  	.reg_bits =3D 8,
>  	.val_bits =3D 8,
>  	.max_register =3D 0x15,
> +	.cache_type =3D REGCACHE_FLAT,

I understand that this is added because the panel registers are=20
write-only and read as zero, and it is needed for=20
regmap_{clear,set}_bits to work.

This information should definitely be added to the commit message.

If you can add it inline here, and I'll update the commit message when=20
applying the patch.

Cheers,
-Paul

>  };
>=20
>  static int y030xx067a_probe(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c=20
> b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> index c558de3f99be..6de7370185cd 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> @@ -80,8 +80,6 @@ static const struct reg_sequence=20
> ej030na_init_sequence[] =3D {
>  	{ 0x47, 0x08 },
>  	{ 0x48, 0x0f },
>  	{ 0x49, 0x0f },
> -
> -	{ 0x2b, 0x01 },
>  };
>=20
>  static int ej030na_prepare(struct drm_panel *panel)
> @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel=20
> *panel)
>  		goto err_disable_regulator;
>  	}
>=20
> -	msleep(120);
> -
>  	return 0;
>=20
>  err_disable_regulator:
> @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel=20
> *panel)
>  	return 0;
>  }
>=20
> +static int ej030na_enable(struct drm_panel *panel)
> +{
> +	struct ej030na *priv =3D to_ej030na(panel);
> +
> +	/* standby off */
> +	regmap_write(priv->map, 0x2b, 0x01);
> +
> +	if (panel->backlight) {
> +		/* Wait for the picture to be ready before enabling backlight */
> +		msleep(120);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ej030na_disable(struct drm_panel *panel)
> +{
> +	struct ej030na *priv =3D to_ej030na(panel);
> +
> +	/* standby on */
> +	regmap_write(priv->map, 0x2b, 0x00);
> +
> +	return 0;
> +}
> +
>  static int ej030na_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel=20
> *panel,
>  static const struct drm_panel_funcs ej030na_funcs =3D {
>  	.prepare	=3D ej030na_prepare,
>  	.unprepare	=3D ej030na_unprepare,
> +	.enable		=3D ej030na_enable,
> +	.disable	=3D ej030na_disable,
>  	.get_modes	=3D ej030na_get_modes,
>  };
>=20
> --
> 2.35.1
>=20


