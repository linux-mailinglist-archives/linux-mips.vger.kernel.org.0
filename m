Return-Path: <linux-mips+bounces-13622-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHMnMXXKs2kqawAAu9opvQ
	(envelope-from <linux-mips+bounces-13622-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 09:27:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656927FA20
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 09:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D8893008507
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2026 08:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00CC381AE2;
	Fri, 13 Mar 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPPni+lY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3937FF40;
	Fri, 13 Mar 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390450; cv=none; b=L1ouaGhExlQH/ZBZmQsPgQph3RcGzh+N8ocM4bAnZNTCYPZQ4UrQpDr1tjbgRJxgh7l3isahVpXTqCCxcCb4RQrKBnrdsfm27Qx5fzBOB2XJyQhR34m9xUmLCh+pwyeAhxxE+ZuH795nGvAS9EaasFVqr8S1T8aUSEk4v10SDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390450; c=relaxed/simple;
	bh=LjjmvM/vmaS4//USd0RW7tvsnLCWGGdQkTrz5/AWVp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFjoNVtnUvg9YPmws6Au2TkHES98fhGeBp6CdgpuhiZBZNOuxCHDvSt42AjTMj23RGocFYRBdHSST53f4EjpLipN0oHn5Q1tIpA/5Xvve2rlQ+N3vnM6989Digc+WJrlr4tNpW6+Ir7fBDHMXtzailtUAa1ibE2MLphTrYMP6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPPni+lY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7BEC19421;
	Fri, 13 Mar 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390450;
	bh=LjjmvM/vmaS4//USd0RW7tvsnLCWGGdQkTrz5/AWVp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPPni+lYDoaOn1Ag3kuyj0AQj8FTTurKfSI6YHa2F1wcx6tllEIeZERg44A1o40lL
	 NBgrny4mrciTQTm+Braqu4OFRCMM3dcYEl1SHuJn4iDd9eRGqPxvL+UA852MIdW1xF
	 SU4qi3rDQEUScohJtYI4mFVdAlGmyojMScYhw3bsrx29Ctigy+thqVIS/BMMK8vkJE
	 GlSG9027eyW1Z6idxnfM4oYSyygA1YCYXWob/GSoDv3hKVvFXgmqIY+8tO+Vxxefc7
	 nE/NQGUNBnxc/LXfIESoIQGzHbiVGdOD+0wOJNk7YzS0cgMAr083vwFOGNaBac56TH
	 ZjMXgLfJ2F34g==
Date: Fri, 13 Mar 2026 09:27:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Message-ID: <20260313-dexterous-lively-jaguarundi-72bfef@houat>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260312181654.2d9ba69c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pxy5ukm7k3gyqla3"
Content-Disposition: inline
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13622-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,googlemail.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6656927FA20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--pxy5ukm7k3gyqla3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
MIME-Version: 1.0

Hi Jakub,

On Thu, Mar 12, 2026 at 06:16:54PM -0700, Jakub Kicinski wrote:
> On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >=20
> > It also reorganizes the ethqos code quite a bit to make the introduction
> > of power domains into the driver a bit easier on the eye.
>=20
> Not entirely sure what the conclusion was in the sub-thread with Russell
> but FWIW this doesn't apply to net-next as posted so respin will be
> needed either way.

We'd really like for this series to go in, so fwiw I'd prefer that we
don't create a dependency on a series that has never been posted for
this to be merged.

Maxime

--pxy5ukm7k3gyqla3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabPKagAKCRAnX84Zoj2+
dq/cAX9HbQPDp+u+6RAvVqRXiVlUqq7qrs2GAioBq5qsajRY1mqIABlDjHVyOc8v
8oDz3SwBfiJTavhwpPgjJQ9YAcH4JcHjnzxAs88eFjbDLDYSe2mAKK7fP8U02MfH
qIGBmEr8gg==
=zTCu
-----END PGP SIGNATURE-----

--pxy5ukm7k3gyqla3--

