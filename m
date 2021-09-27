Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA674199D5
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 19:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235428AbhI0RCS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 13:02:18 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52483 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235412AbhI0RCS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 13:02:18 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4CF5D5805AF;
        Mon, 27 Sep 2021 13:00:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 27 Sep 2021 13:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=lhvhZkzEG2JTs8VXnXTsprv1HE/
        2QmgnPUJAYjAh5Qo=; b=SxNSGu8Bb6ncOXI85FEF+4ZP09S3cTJQWPymQOFAKq/
        bEhfBKMy809nda4QfY7Hzj8u57QNaHaNgS/RVJGVfvKHGDOfMbUJRnzX3MOrE9dP
        mcJCmw68vUtZksPzPJa2SbwDAa+N5rJF73RHPM+uLLf5fpeuOPYy10DM+iicQrua
        oGD7N4q8GowRE2xyZa8QOqhOxCfTznZW9WDCrI6GiTYcpFgzACU6j+Fqm+XhnFE1
        Xb1+r2NPg6SmWMep52h6pNI/LMktPM7nUuRwSiLBerg3QJgiDtFZG1qQhwMG1kTB
        /JH7qzxz0YSLcu8p+oh5Msw2ftHZtpt9nF/aO5sIuQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lhvhZk
        zEG2JTs8VXnXTsprv1HE/2QmgnPUJAYjAh5Qo=; b=QzYKCp3StKXF6V37i8dO/h
        GpcdLvyPDXhXhs2lOTyYM9vVbp4JnUGERXIlcNw3V/0wkBclQ5dd7IiHVCBnnLmG
        gftZQ5+reTBA/zno9nLFw1IfRXwgwObWExDxhaTL64YZqLeJolzSZFNZJvMxgceY
        r9gyVaz5nrnbvSdcUaHPhplgmkFm4g1iF2m3oqZ6iyy8BrssS+2o0HecGxc8iAhq
        nlcYASFsjj0frfTlrV+crksK5oBWmMd6qO+yWR9pgAI66O9lHPfFONbdYUnQ88bN
        hdgNq9zTFX1ed/cpkphNs63tX0nJ2YtZheVl+mqhCgntqMqJkh/5UjfJv7ZjItTA
        ==
X-ME-Sender: <xms:tPhRYdnt8mqxPQB5gXJwiFA2Uh_cC4SRe3bs4mZ-EKBNZPRe3cgtEQ>
    <xme:tPhRYY1XIoWpoELixTJUAj-IfQ-NsY-3_UlNpQa_ORTb0GKi3rFtJaLtNNFcpwt0q
    J_0HVDW0lbyaF1n9F0>
X-ME-Received: <xmr:tPhRYTpNpH1jXWTyoW1jT-CEUmIWKTeAoLZ7SAh6I7yeeCOiC7Zi5pjy81bBrKGGynf1_f_na--u_-PQWR3TTRETlZLOg70loewfysDS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tPhRYdlpst71omb_PatUJw6rzOX0i48Z_JIxsKFltJK_SbGh-6_u3A>
    <xmx:tPhRYb3LXxsoPsGKCR06BHNoECVRHfii8Bk7BI6rsp58HsvlAESzPg>
    <xmx:tPhRYcsp-PHunl-savWy2Mfi3irZNgICHfotAF6ZfNVWk9mON-o5ow>
    <xmx:t_hRYREYAgMww3McnfipLfvNxCXPUmt8SoGMiFVdRWelw-AnI0FA_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 13:00:35 -0400 (EDT)
Date:   Mon, 27 Sep 2021 19:00:34 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 05/10] drm/bridge: synopsis: Fix to properly handle HPD
Message-ID: <20210927170034.mhv5r2r5gcojc7yn@gilmour>
References: <cover.1632761067.git.hns@goldelico.com>
 <dd2356790b774c7885afecc9d29783cb51a26e6d.1632761068.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="se5ukx3kudn4e4kq"
Content-Disposition: inline
In-Reply-To: <dd2356790b774c7885afecc9d29783cb51a26e6d.1632761068.git.hns@goldelico.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--se5ukx3kudn4e4kq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 27, 2021 at 06:44:23PM +0200, H. Nikolaus Schaller wrote:
> It appears that dw-hdmi plugin detection is not properly
> propagated unless we call drm_kms_helper_hotplug_event().
>=20
> Maybe drm_bridge_hpd_notify should have been setup to
> call this.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index f082e14320e1..edea04f80576 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3018,6 +3018,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_i=
d)
>  		if (hdmi->bridge.dev) {
>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
>  			drm_bridge_hpd_notify(&hdmi->bridge, status);
> +
> +			drm_kms_helper_hotplug_event(hdmi->bridge.dev);

drm_kms_helper_hotplug_event is already called from drm_helper_hpd_irq_event

Maxime

--se5ukx3kudn4e4kq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVH4sgAKCRDj7w1vZxhR
xY1eAQCsr8ScTO4ZYd2hxMrGCf3WRCg49NwG234OHf/r7wmRSgD/RejL0pc3tJtY
pEFsvdgbaEi9RAjgGHjqhF/oTfz1sw8=
=Hrc4
-----END PGP SIGNATURE-----

--se5ukx3kudn4e4kq--
