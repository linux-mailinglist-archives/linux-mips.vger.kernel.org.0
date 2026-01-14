Return-Path: <linux-mips+bounces-12931-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA7D1FF2A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 16:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94DBF300385B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E537A3A1A20;
	Wed, 14 Jan 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FY1rCh7B"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3373A0EAD
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405886; cv=none; b=TUf7jpDPzS07C+Tego77sD/Bzks80OhleLXTHKwKl3rSomfWnjA0SsmAodLJUAYRXyxjyPB7TPbZvO59FjwELqKp4el8siag6g+9UtVcIqcgzlbLQbJfjHbwQIqqrOfcHuZJz8SHj6q++nK/7U1VyKuy1rqhUe/FimvTvtJ5YmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405886; c=relaxed/simple;
	bh=o+OEjagxl3Dsp9tfzVfdkpH30i7BI82gz0LPNnSdpig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVJJCVFiieW0a/blZOUNAXzAv5YS/gETLIrKZLq3J1KCvYYgFjS6bHgcu//BpdhFiy5MP2+a4rKI2YXBlpqXzbj+q7N1/3g1W0mekpROAgeK03GnvqTXlNz6djKENe9uDD376i5VHAlU2EFwxFHurdufKPi/dRguHY3/B+zEQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FY1rCh7B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EDFC4AF0D
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405885;
	bh=o+OEjagxl3Dsp9tfzVfdkpH30i7BI82gz0LPNnSdpig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FY1rCh7BTXtSgy430K1ImGXJbRWQzGMOIBH1z9f+jJLEcsC6lEv7EHrApo9FSgliZ
	 y0vYkLCGAkjw4diqSoI/z84wIWno1qymsG+z8s8CZ6aSqUZ0RnZelrZf1g+YX7mLLh
	 qSWBQht+cKzp68EJB5t86KporBJBJ9GcgcbofoXC29jfh+aE38gIMQRAmoTLZ8csqL
	 8CiGMfRZ1AThkmhU05KnfGCf7/WLdpvIhIRUDlq1p2+Vt99cFPyGWWI0cRZ5k49u3b
	 5UN6n7pRVDOGM0VuPvT8IyO5aPhYhSk4RCI6Pkkop+R+uEJMM/8YQut2l3/OrjM2ix
	 G2m18gRBN2lZw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-598f8136a24so10093346e87.3
        for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 07:51:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt0JvIlqUZ9iUlC+cpni11e2zSoC1piZuo8zJczqdbqRBKQ0xCc5JAW21Gy9aLt4/eVm0ZWb2YA+sG@vger.kernel.org
X-Gm-Message-State: AOJu0YzyY024VYJINhLdDLRtZ3cyxhf7SXZPMg7ZgdfRMNlwz4AWoGm+
	zch2DD8UUsZK40gUre5R1P5A8SZqKdSM7sMAc5zQyipuSKXzZGFp1gnqtYOAh9oz1+l9eo4ya0N
	UZojqEKkt8USmioUQf21zY8/SVBsEyLoqmuL8BjpwSQ==
X-Received: by 2002:a05:6512:2316:b0:59b:8472:48ca with SMTP id
 2adb3069b0e04-59ba0f63088mr1131918e87.12.1768405882412; Wed, 14 Jan 2026
 07:51:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch> <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
 <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
In-Reply-To: <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 16:51:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
X-Gm-Features: AZwV_QiTx85beob9IcsRkXcH-FzLKf11MkfoXrcsCiRgQ4kLBhgc1kcRpkaBWZY
Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
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

On Tue, Jan 13, 2026 at 11:06=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Jan 13, 2026 at 01:36:53PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 12, 2026 at 2:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Mon, Jan 12, 2026 at 11:15:41AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <brgl@kernel.org>
> > > >
> > > > In order to drop the dependency on CONFIG_OF, convert all device pr=
operty
> > > > getters from OF-specific to generic device properties and stop pull=
ing
> > > > in any linux/of.h symbols.
> > >
> > > Is the intention to read these properties from ACPI tables?
> > >
> >
> > No. Other than a couple property getters which can use the fwnode
> > abstraction, there's nothing here that requires the OF dependence.
>
> So what is the need for not using OF? Why do you want this patch?
>

We've had a higher-level abstraction for OF nodes for years now. Since
I'm already touching the driver, it makes sense to switch to using it,
as OF-centric APIs are not recommended in new code even if it's an
OF-only driver.

Bartosz

