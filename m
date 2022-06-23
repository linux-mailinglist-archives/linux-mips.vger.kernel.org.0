Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3845E557853
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 13:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiFWLC5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 07:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiFWLC4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 07:02:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF027B00;
        Thu, 23 Jun 2022 04:02:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7AC32B81BF7;
        Thu, 23 Jun 2022 11:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C860C3411B;
        Thu, 23 Jun 2022 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655982171;
        bh=QWxmpYJIQevrOn+jIA9BiDlZ1Jm6cS7KRCVZB/rj9MU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uQk8I+JcFVSOI+L8cXE8qm9iQ8k8bUT7pZ8ijL0cSccXLN/EnEJluw10gdhEyLr88
         s6xeP9hTwyT3i50PQskxDM7s5sJ2nLymilcYIEePm8cIm44TRyGaEB2yaLeixVYMrg
         0mAYkNT2SfaDKlQsjc/t8JthcQT6mrQJK6lEVobXtbCMLERvjkwCLxxYNMtYejSyuS
         HSovhcM4827L2LVHZT2VNMWzjxl7vsjEsFQKWsfL1FBmkr3e3R9PDrzQmE8758RzF+
         yE7Esv/81d3SjOJ4ZNdwrzouWuT87mR+AC21FSj5henoKNvlHs7tJDzCKhtuX9qPOn
         ITMDCSQZB//dg==
Date:   Thu, 23 Jun 2022 12:02:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
        mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        vkoul@kernel.org, nicolas.ferre@microchip.com, nsaenz@kernel.org,
        shawnguo@kernel.org, linux-imx@nxp.com, cezary.rojewski@intel.com,
        pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, daniel@zonque.org,
        srinivas.kandagatla@linaro.org, linux-rockchip@lists.infradead.org,
        krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
        heiko@sntech.de, jbrunet@baylibre.com, kernel@pengutronix.de,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <YrRIUef2WAs15/Mg@sirena.org.uk>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
 <20220623093951.GG38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aRjk/oNkrDuhHxkv"
Content-Disposition: inline
In-Reply-To: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
X-Cookie: I had pancake makeup for brunch!
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--aRjk/oNkrDuhHxkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 23, 2022 at 09:39:51AM +0000, Charles Keepax wrote:

> Mark do you want me to send a v2 for the whole series? Or given
> the size would it be better to just resend this patch?

Series please.

--aRjk/oNkrDuhHxkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0SFEACgkQJNaLcl1U
h9At5wf6Ax7J+7EqACjWVB1NBLm4Fqt/fn2hmYjsWEp5xg2nu64uAExOpqhd88Ub
8EiQ8JJ5Yh+LqGAd+ebgMayuxNfGx/YW+EBYI86mKPNt5JUiC9pf7v5IDM8Tdowt
ItjroWnrAvyu755n93nXekhH53LbekNQZ3r38IqmgYxXfRwuBwo+6LDpWwG+yuZM
qsKAlnQyapzbY/t5/1ziDvbV9Tu1jRGLpytGhBD3ishspCgdES0U6CAXTAiQbGpc
MjSi61J4JAE+Xhu37HN97vid7MjwfolyUldVhZBQk80qRTtR78Iu5cv5Mg1kJ1v7
BEu+WlV4O3xD0frAhInPwl3skpKkHQ==
=ECPa
-----END PGP SIGNATURE-----

--aRjk/oNkrDuhHxkv--
