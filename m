Return-Path: <linux-mips+bounces-12897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA041D18E95
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 13:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57E630F759B
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 12:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FF13904C2;
	Tue, 13 Jan 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMKO3wDO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697C3904C8
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307902; cv=none; b=Fh/vb3v746W2IJXjWktcwtdOgIAFhUQZxRVqBn/k+We1ZH0ll6EKNr53xTgCXdRfug3OdTiBUy/pFmmN81huCNsHa/Hqm5qIqjJ448mNFa672pR3zC6Fp4SQEy+olyQ841OFnLPFSTIJTOvhPcFu0qef/BlLwx3KB5xwhGO7Jbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307902; c=relaxed/simple;
	bh=qXScHYuCzd215t8hnmVMyfAJzYu9LaTDkfUenYtogos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGnl+pYnqDZTrhubotv7FS8qyUEYK31FTWE/X40Hz2P8FyEeroQRU6jiiuicDP55tQbD3/lBA6CgP4KGY8zW5mzUntRWebt2n6SD+vpH9ZT2kkc8jGfszIN5ZuFB9jLnqySj82sHL9qdVO8QLAia3KZre6SXrvbMg+oEvEr/oSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMKO3wDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8A7C2BD00
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307901;
	bh=qXScHYuCzd215t8hnmVMyfAJzYu9LaTDkfUenYtogos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DMKO3wDOQyqAMkRsF3KjP1QgKWLmG/bIgkwkqikQWX7/JxeRnNe7RTYQnbhOkMfPE
	 G+G+GVnK7BcA67OKp/w9uYGtoDKb6gYsPJFta0W9o3WbrjYSxf+gdK+PIoWXEDVRpB
	 Q5EBZu76fgMusQwSmXX/liK7piEEVzbTmPGCiEh5Np1ueLICoCxv+JeymLWcnk+8zE
	 HJZlIdI9MFRGAndmHTk7bTK8js1iFU5lIaAW8gyi5nhPAB7QNOe9kboOVP1zt4i3+k
	 wUKGh42sKh+F35XHH38iMuMWdGE+RTZk9+LCDvYE3jVMx6N3ZypoG2kBxgAbxjzKHh
	 WESRwPJzz6AdA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fb535b73so59720401fa.0
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 04:38:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLzYpZn/LC+inKE9w7sTN9wv6Os8ln/8J46QXNiOC8Vo18Mu4QxfEiUoYPcenXYagummwTgDUPShn0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd318w1F3c5fLvnvjl+DJP0splia3LqOrl3ee3HnQlYBS+kYif
	KOBM1o+G+AhudCALxa0JwljI0O0RzoyPW4vSyamjtC/LpiWE8TXWdnH1f5rkSWT8iTsjlnbQFpm
	mTqeaLtjCFh2lL5VVsPITNLXN3fk6WVMr8WVRo1KOAw==
X-Google-Smtp-Source: AGHT+IHqazDCuLxwH7Iu/G2PkGJgVTJ7/k1UTcZwajhZd9YF9n/CenHYLasZcuGAB0SV4lL43Mgtox5RINYhxwkIRxc=
X-Received: by 2002:a05:651c:30c9:b0:37b:967e:d73 with SMTP id
 38308e7fff4ca-382ff8115efmr73607701fa.29.1768307899461; Tue, 13 Jan 2026
 04:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com> <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
In-Reply-To: <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
X-Gm-Features: AZwV_QhJCTDCGsC5t4RHVGQlo_Vyd1Okk9vVsia2jA5DJVHGvVefyoWQdJ752O4
Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 7/7] net: stmmac: qcom-ethqos: add
 support for sa8255p
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 2:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Jan 12, 2026 at 11:15:46AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <brgl@kernel.org>
> >
> > Extend the driver to support a new model - sa8255p. Unlike the
> > previously supported variants, this one's power management is done in
> > the firmware using SCMI. This is modeled in linux using power domains s=
o
> > add support for them.
>
> >  static const struct of_device_id qcom_ethqos_match[] =3D {
> >       { .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_qcs404_da=
ta},
> > +     { .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_sa8255p_=
data},
>
> Is this device being probed via DT or ACPI?
>

On the sa8255p it's probed via DT but all its resources are managed in
firmware over SCMI.

Bartosz

