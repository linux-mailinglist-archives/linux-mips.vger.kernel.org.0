Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C624B35F0
	for <lists+linux-mips@lfdr.de>; Sat, 12 Feb 2022 16:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbiBLPuM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Feb 2022 10:50:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236359AbiBLPuL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Feb 2022 10:50:11 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6345A212;
        Sat, 12 Feb 2022 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644680989;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=R6w3GhxZTZuX3WNo1RvUOO07u8frIg4/HwNvBFu29SI=;
    b=dIbjz/GdYkfdLb7EuIeZIt2y2DX4C8C15j5OIwMnJDScC2YVtL035byaAu+1d5VGxX
    mB7R2pnMvy/XWkZm7gxr0u/FhQXdnucYYBwdVZa+PRJpedRpGedIxrrD7HMjHoABLhcK
    erVuQKxm09DA6rpF0N9SfH7LsbRpcaSx2QWVwBcIkpfba9rRYaHpeez5OnR4PPSrpqHg
    KIoyvSvQFeK6URDphJt0prFNxNbzBbAaN0TU0BOzJRvCsin3TA1Zu1Fthj7ULdv3RMWt
    gGRgbN65v29wsino/+GejRL+uOvTR1WA2Xbgq32pGFsaX4sFXQWhlwoPJgr75ppFNvLa
    NAPQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDaqyA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
    with ESMTPSA id L29417y1CFnlswe
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sat, 12 Feb 2022 16:49:47 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v14 1/9] drm/ingenic: Add support for JZ4780 and HDMI
 output
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <WY477R.1XWC44S25QIN3@crapouillou.net>
Date:   Sat, 12 Feb 2022 16:49:47 +0100
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F12ED081-8A7B-455C-BB8A-D4620F330F5E@goldelico.com>
References: <cover.1644675566.git.hns@goldelico.com>
 <31eff2819f94fefcb01aa5cb23c79ccf302d9238.1644675566.git.hns@goldelico.com>
 <WY477R.1XWC44S25QIN3@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 12.02.2022 um 15:44 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le sam., f=C3=A9vr. 12 2022 at 15:19:19 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>> Add support for the LCD controller present on JZ4780 SoCs.
>> This SoC uses 8-byte descriptors which extend the current
>> 4-byte descriptors used for other Ingenic SoCs.
>> Note that plane f0 is not working and disabled to be
>> seen from user-space.
>> Tested on MIPS Creator CI20 board.
>=20
> That's not really what the patch does though. It's a fix for a commit =
that has the exact same title and description, and is already merged: =
b807fd2c43fe ("drm/ingenic: Add support for JZ4780 and HDMI output").

Well, last version was not a fix...

I simply did not notice that parts of the commit contents were removed =
by rebase to drm-misc-next and the commit message diverged...

> Please rewrite the patch's title and description to actually describe =
its purpose.

Well, git rebase should do this for us if it removes the code described =
in the commit and makes a fix out of it. What do we have automation for =
:)

v15 will come now...

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++--
>> 1 file changed, 10 insertions(+), 2 deletions(-)
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index 7f10d6eed549d..dcf44cb00821f 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -65,8 +65,10 @@ struct ingenic_dma_hwdescs {
>> struct jz_soc_info {
>> 	bool needs_dev_clk;
>> 	bool has_osd;
>> +	bool has_alpha;
>> 	bool map_noncoherent;
>> 	bool use_extended_hwdesc;
>> +	bool plane_f0_not_working;
>> 	unsigned int max_width, max_height;
>> 	const u32 *formats_f0, *formats_f1;
>> 	unsigned int num_formats_f0, num_formats_f1;
>> @@ -453,7 +455,7 @@ static int ingenic_drm_plane_atomic_check(struct =
drm_plane *plane,
>> 	if (!crtc)
>> 		return 0;
>> -	if (plane =3D=3D &priv->f0)
>> +	if (priv->soc_info->plane_f0_not_working && plane =3D=3D =
&priv->f0)
>> 		return -EINVAL;
>> 	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
>> @@ -1055,6 +1057,7 @@ static int ingenic_drm_bind(struct device *dev, =
bool has_components)
>> 	long parent_rate;
>> 	unsigned int i, clone_mask =3D 0;
>> 	int ret, irq;
>> +	u32 osdc =3D 0;
>> 	soc_info =3D of_device_get_match_data(dev);
>> 	if (!soc_info) {
>> @@ -1312,7 +1315,10 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>> 	/* Enable OSD if available */
>> 	if (soc_info->has_osd)
>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>> +		osdc |=3D JZ_LCD_OSDC_OSDEN;
>> +	if (soc_info->has_alpha)
>> +		osdc |=3D JZ_LCD_OSDC_ALPHAEN;
>> +	regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);
>> 	mutex_init(&priv->clk_mutex);
>> 	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
>> @@ -1511,7 +1517,9 @@ static const struct jz_soc_info jz4770_soc_info =
=3D {
>> static const struct jz_soc_info jz4780_soc_info =3D {
>> 	.needs_dev_clk =3D true,
>> 	.has_osd =3D true,
>> +	.has_alpha =3D true,
>> 	.use_extended_hwdesc =3D true,
>> +	.plane_f0_not_working =3D true,	/* REVISIT */
>> 	.max_width =3D 4096,
>> 	.max_height =3D 2048,
>> 	.formats_f1 =3D jz4770_formats_f1,
>> --
>> 2.33.0
>=20
>=20

