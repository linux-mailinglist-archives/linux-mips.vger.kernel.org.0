Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9870546634
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jun 2022 14:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240337AbiFJMDZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jun 2022 08:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347985AbiFJMDW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jun 2022 08:03:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E823EA87;
        Fri, 10 Jun 2022 05:03:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1B5B62184;
        Fri, 10 Jun 2022 12:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656BC3411D;
        Fri, 10 Jun 2022 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654862598;
        bh=f91prLddVZ6W3Wxb6Hqxhw4VdV2kGrg/IH7kR4PdhnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U1znS8ABzt3/7+3tW8r9w0ODLWoHYuds726WAKeoahr9hFltRLm81H0CA03oc5Onx
         23VM+SJfFghn425BmH1i2xpNVPDVsNSvEL/cpHEuCZoyxDGEaAo989Whdcq+w8Xr0x
         eM1QnspuhULq9B32zaxPnZEYYuRFsh5AvVkZYA+n9Rb1/XRe3sNm605YjInqypuQGf
         Ct0RLvUATkkDNkfEu+LaV/yPbv5tU1dN7tRgiZFdckQmCpZSAeMflyqASdKidO9ISp
         ZlUgqPC+kRCvY06U7U1bpuV5knThQEuewmaR79v8OzQme2AWBWAAH0vkrEzq39r705
         METMJ1sJh6Oyg==
Date:   Fri, 10 Jun 2022 13:03:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     ckeepax@opensource.cirrus.com, linux-sunxi@lists.linux.dev,
        peter.ujfalusi@gmail.com, pierre-louis.bossart@linux.intel.com,
        linux-imx@nxp.com, krzk@kernel.org, jarkko.nikula@bitmer.com,
        linux-xtensa@linux-xtensa.org, cezary.rojewski@intel.com,
        shawnguo@kernel.org, linux-mediatek@lists.infradead.org,
        nicolas.ferre@microchip.com, patches@opensource.cirrus.com,
        linux-amlogic@lists.infradead.org, srinivas.kandagatla@linaro.org,
        daniel@zonque.org, linux-mips@vger.kernel.org,
        linux-tegra@vger.kernel.org, nsaenz@kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        jbrunet@baylibre.com,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-ID: <YqMy/FkxDPKmzdrB@sirena.org.uk>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uQXJNv1MQUHjV+R+"
Content-Disposition: inline
In-Reply-To: <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
X-Cookie: Teachers have class.
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--uQXJNv1MQUHjV+R+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> On 6/9/22 8:32 AM, Mark Brown wrote:
> > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a

> This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.

Your mail doesn't say that this will break, it says the change is
unexpected.  In any case, please send an incremental fix - there's no
need to revert the entire series for this.

--uQXJNv1MQUHjV+R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjMvsACgkQJNaLcl1U
h9DEiwgAg5/u/EffroYC0gc/E++OVOkz3gwInEgNAC9hOiZUubIV0pLgHmDWF03b
jPn25vdDiJrTgFiUmwAYyaI1N8iwXmd1UllhVOv/gLkFfltVeVeI5bb7VHjskvpU
Xx9nbpqcM0LhbDF9NG+WYAoVy5NB/aJZRKoCWoc2qbqyxE4kHlcQ+uGmXHyJDseS
8BmRAzbUgyMhj1H2rxUsdSJBv07mGmLozTE9V6Ah8CM/7n4PVN9VjDs29qDcs1v2
4cxYC5JHT+tbp1KldMeaAv50v0292Sfvps0RbW8zrLY4WwXo5mYJWrS+TYv1UQ+M
XNVup9oVA23wO2KVtvmWoirnwl8blg==
=hG/3
-----END PGP SIGNATURE-----

--uQXJNv1MQUHjV+R+--
