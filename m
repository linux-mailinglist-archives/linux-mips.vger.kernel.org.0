Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F4B4B8B1C
	for <lists+linux-mips@lfdr.de>; Wed, 16 Feb 2022 15:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbiBPOLo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Feb 2022 09:11:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiBPOLn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Feb 2022 09:11:43 -0500
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8B163F2;
        Wed, 16 Feb 2022 06:11:29 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 48E4D580790;
        Wed, 16 Feb 2022 09:11:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 16 Feb 2022 09:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=i2qG2nO4rS4VmdzOeglqVq9vsAN10ZORWEZaYZ
        TfUK8=; b=pSrwM38yuMw01iuenrss84p89r/K8SzJ/EPX2kdCW/uKq44b3bFEk2
        ne/VfaKSDxLaMY5X8TQduLAycXwsvJG0gcNdql9jYIAOOSWT7PWyyvmZKHVz3/+w
        ovDxvwgag/EV6e2ZBBCHFgaVcSjjGddXk7yJckRxktRKl4ABa1J4Wo0F3AtdNt5o
        JU3BqE+2FZ0lYPCRhlUigozQTfr1yBvRTbJusknLN93XC626NHwM8Hw28Q9+d7go
        rxeADLhY+bJ9Bk/KBOtoiS/PiowmnpM4uD+Hezp74IKtEEZfsIoZ8qM5h96fN/Ty
        fC850dzW6mf8tfsa2rQtuIz6/MSAIxXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i2qG2nO4rS4VmdzOe
        glqVq9vsAN10ZORWEZaYZTfUK8=; b=ihcbqs4iq5kxd5MoQKrvNwO5Ov2/WjbOI
        Y/4CGWIOC49uLE71AN3EDNOHEbEPEo1Afec80qmZms6Qiby6amGxcisqyaLSOymb
        AG2o7qI+oMW+Y9Ru2rVZ+yyCn4MDoIThv+pAGY7R6dknG1lZTO8pLCV53aOCtbgo
        vfuyMhsat9TS8u7I2Ma5f8lfvtNXQCNX9xnHZ08XgcBKTckVVOd48YFBVre3asBc
        jRZXpDvQQfGC84uRno1oryfNvLc8D4tGiRnB0AqHIjZES/JvXE/ZEAFNV1VW/eXh
        TGmZUVCfBrt4NEbo1AzMfzjnIf84kTJLLqvrVibaJEaGiED85E8WA==
X-ME-Sender: <xms:EAYNYgwvQMCuukwKZ-NAHNU7ufMTpc9hPTT2Xq3eMGch4JL3MqBPxg>
    <xme:EAYNYkTsnpRiqBJ6BerqJv8AfclvHKo95shZOuWZufUWvQqGKRifR0yQfjcBp2Bhy
    4tibwybRres5-rie8c>
X-ME-Received: <xmr:EAYNYiUJAM4sz6QirEELh6vpb1FJAXGbsSv0AtGhqwa1bWm27G8fux-N1qvPyEcU-EEL6GydFPql3l2eHBRr3Jn37s8JOaNZ-8XTHnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EAYNYuiOOofO1KkIBSV0qM2vdAyCzgWkba4S2fYUA2xw-Z1bDrrByg>
    <xmx:EAYNYiANd1pzR0_uYXHToXYpa8nuDZbsaZaFP_38JoIc46m1QDVBew>
    <xmx:EAYNYvLy4dQbFSsEBvyIdbZnnJlTEs-0IY38DgNKvXm9kBb0OR5UwQ>
    <xmx:EQYNYq3_8gjpMTBgDnj1yX6shnqxPPKyK-flH6l35MEfzRAEfYaLUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 09:11:28 -0500 (EST)
Date:   Wed, 16 Feb 2022 15:11:27 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sui Jingfeng <15330273260@189.cn>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        suijingfeng <suijingfeng@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220216141127.2b7frii62w7xp3tu@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <11ac5696-29e3-fefa-31c0-b7b86c88bbdc@189.cn>
 <20220209084908.kub4bs64rzhvpvon@houat>
 <84bfb2fc-595c-3bae-e8a0-c19ccbcfcfd8@189.cn>
 <20220209161624.42ijbnhanaaari46@houat>
 <965ca520-229f-5729-bf06-ae64ed3af383@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="if4dkzifithtnd47"
Content-Disposition: inline
In-Reply-To: <965ca520-229f-5729-bf06-ae64ed3af383@189.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--if4dkzifithtnd47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Wed, Feb 16, 2022 at 09:34:47PM +0800, Sui Jingfeng wrote:
> On 2022/2/10 00:16, Maxime Ripard wrote:
> > And, to reinstate, we already have a mechanism to set an EDID, and if it
> > wasn't an option, the DT is not the place to store an EDID blob.
>=20
> Hi,
>=20
>=20
> if DT is not the place to store EDID blob, why nvidia can do that ?
>=20
> output->edid =3D of_get_property(output->of_node, "nvidia,edid", &size);
> [1][2]

Because that binding is 10 years old and never got reviewed by a DT maintai=
ner.

Things change, some things we did in the past have been mistakes that we
don't want to repeat, can we move forward?

Maxime

--if4dkzifithtnd47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYg0GDwAKCRDj7w1vZxhR
xfrUAQDoc1GrrZYHXc7NMWEIsyPQ1lsWTu8qjcZQon9X0OfsPgEAwkVb2Uv/vcHy
dC/YeqCI6cZBcH7PZOIyLedrztqdEgA=
=ryuu
-----END PGP SIGNATURE-----

--if4dkzifithtnd47--
