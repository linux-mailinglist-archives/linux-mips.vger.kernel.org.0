Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BF44C1592
	for <lists+linux-mips@lfdr.de>; Wed, 23 Feb 2022 15:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241679AbiBWOjs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Feb 2022 09:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241680AbiBWOjr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Feb 2022 09:39:47 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815B2B54E7;
        Wed, 23 Feb 2022 06:39:17 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0E9AC58048A;
        Wed, 23 Feb 2022 09:39:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 23 Feb 2022 09:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=FgQTgqziNKWKER2EIGatrqwMgScYbE1jaY41Ku
        Ra9OM=; b=Yli2PPJDon/Sd3hWdozX4L17oVl7xLrv21xPwvKecUIpyd8aPy1+eQ
        PN29mJy2I0NrgpCdcxuxsni2F/BGR7WOXN4tTRXOGeJuamGKEymBaHfDqsyIyNcD
        xahS06C6zwAStN1A1Mk3pcsGwl2akNdlXJzlcSc5O/xr8+TLvdSsv6T6m3DNzLQ1
        MKSDLi+nKhqoxXUKqgiLBBqk6yRi+kqHZL5mgm9ePBJsQ5zZwJaBD8vImC2vzLvi
        4g8YL8kts6FypEX0dFFRj9xTE1XAOu3pVu7TQJbhgOSQvcUqB6S+3ifg6xd074Qk
        VeemYsCbaTufoebFyK4dUPM1BCrfHc2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FgQTgqziNKWKER2EI
        GatrqwMgScYbE1jaY41KuRa9OM=; b=fJcIHRF17UWKd0l8UNOFyNrRjbu8kDSvB
        j9nKZS5xD6s5+mep1mSmlY4AT3MPwU3ZkQ3EfiB0hM4iZGkuU1FQlGyNmLtm5tDe
        7jHteapsg/MRIyxLXkG1U4cBvHoAKog7OdOJYs5tgxB6IwoYfURQcoZjy5HiYzyL
        rQL0b2cN5R7Mo/QtQZ+LUOAQT0RvJJX+czf6rheaXsjAYhCmt1idGp0yEwKBmsGJ
        AXsycRUS0N+ttmx+PHDahoITWdsPjNgi3ieoKCSt4KHSSWykydxBnMXVhYCKhan4
        eldILqu8Ye/Mqa7HGDT5qe45rO4TSTUtbUmSQ/spOWDmILLaVYs+w==
X-ME-Sender: <xms:EkcWYuYja8czwuHjew1dyGXmSuW1IKamNvDwikHODq06sRG2mjSCTQ>
    <xme:EkcWYhYJ3f73iiAKCifKa2kr9MB21Hc3xt8JBOuYfNf0VFS7WYZqI-tIJv1yPD1Fb
    A9gVvgioma9HhTCcz4>
X-ME-Received: <xmr:EkcWYo_67oWoiTUGgonTnQtUWz7tZt1Ddxj9aFt-pxhubGm7botnBe6T68pxVybDmQNNR2FSluRZBn4QRMYcM7YhPCqrWsMBUOrTrn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EkcWYgqVlP6Ct4NexodwRqXpnhoYgMrH9eEnml_fgpbDTez2YDNf9Q>
    <xmx:EkcWYpo1pjBxKyzP3kkl2grSbOaeCDSqqu2ZSVrVymR29meM7o5DeA>
    <xmx:EkcWYuTKy4G5BQHnSLw7ioA2cgW6wHA4QmmGS1yUOlB_Vk34BCFu4w>
    <xmx:E0cWYjZQST1x64XLUkl8j2Ez7BYtR7WdgwqkR66KWHn4p-JgHD4IYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 09:39:13 -0500 (EST)
Date:   Wed, 23 Feb 2022 15:39:12 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sui Jingfeng <15330273260@189.cn>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220223143912.m727fie3vtdkvklo@houat>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
 <20220222082747.66otrkc4zwvhem7w@houat>
 <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wam4wqm3zed2h2ms"
Content-Disposition: inline
In-Reply-To: <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--wam4wqm3zed2h2ms
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:46:35PM +0800, Sui Jingfeng wrote:
>=20
> On 2022/2/22 16:27, Maxime Ripard wrote:
> > > +	if (!of_device_is_available(output)) {
> > > +		of_node_put(output);
> > > +		drm_info(ddev, "connector%d is not available\n", index);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	disp_tims_np =3D of_get_child_by_name(output, "display-timings");
> > > +	if (disp_tims_np) {
> > > +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
> > > +		lconn->has_disp_tim =3D true;
> > > +		of_node_put(disp_tims_np);
> > > +		drm_info(ddev, "Found display timings provided by connector%d\n", =
index);
> > > +	}
> > > +
> > > +	connector_type =3D lsdc_get_connector_type(ddev, output, index);
> > > +
> > > +	if (output) {
> > > +		of_node_put(output);
> > > +		output =3D NULL;
> > > +	}
> > > +
> > > +DT_SKIPED:
> > > +
> > > +	/* Only create the i2c channel if display timing is not provided */
> > > +	if (!lconn->has_disp_tim) {
> > > +		const struct lsdc_chip_desc * const desc =3D ldev->desc;
> > > +
> > > +		if (desc->have_builtin_i2c)
> > > +			lconn->ddc =3D lsdc_create_i2c_chan(ddev, index);
> > > +		else
> > > +			lconn->ddc =3D lsdc_get_i2c_adapter(ddev, index);
> > This looks weird: the connector bindings have a property to store the
> > i2c controller connected to the DDC lines, so you should use that
> > instead.
> >=20
> This is not=A0 weird,=A0 ast, mgag200, hibmc do the same thing.

And none of them have DT support.

Maxime

--wam4wqm3zed2h2ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhZHEAAKCRDj7w1vZxhR
xXitAP9v7HOYqHz8i7UAxoCMoqbrhwBW9XOoHnf/jK5QqIkJuwEAuPDXzMoMz/sH
GrxQHl28jgBtPlbX7QJnoi4BgNwVNQA=
=4ezX
-----END PGP SIGNATURE-----

--wam4wqm3zed2h2ms--
