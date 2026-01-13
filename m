Return-Path: <linux-mips+bounces-12900-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0888D1B88D
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 23:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92D43300F195
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 22:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99170340A59;
	Tue, 13 Jan 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kIY8zUy9"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6326ED37;
	Tue, 13 Jan 2026 22:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342001; cv=none; b=Yju2tlKoAgEIjpMkrK7wx9J2N7IHhj/uOaraFGZgwEmimY9aQMj1UuXNxf4+su5WMW5SRZwroD1tCh7vStge9hBMhiOxDwQsiz+j32zVGTGgWP/CzjvP0adCjlLe+kdqFe779rKf5AwbKYikLrWQm3WiwThUU8eyKgCG028s5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342001; c=relaxed/simple;
	bh=LsQ80Nt6Qk+bvf75Ia6NSgSazOOzop19Sk4/CGy3YPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBGh41ry7BZWQImFUuQa74CNNBF/4OjFTJIWWC7HV08SCBafMvnfmqAlRvw/60/9Ac/+/nJeAokSSZUolN6Ql8arZaKO2e7mZPBp8scRGx1D6ZtdKRoiYgI2TaaOOvwZIZlweWKqLzIN22AR/g7nZOzNg74LWEMEU7P2otBpEuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kIY8zUy9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=oBM2ZoOF22ddiLW29uUZvDBCanemUcQlDXTvmAcjlq4=; b=kI
	Y8zUy97+/X5jNowUufRNGBEkL5lckHnRZAeGH2ky7o8DY2gnk+V1zKaO95hqWEgDAg40w523H3J+c
	+cBn8rp7OJQD/Z+CBIQkEsT1pZZgZ0TM2oaYWUL7T5O8Q6hif/olvCQyS1uUtoDXmW//efHVd6A5l
	wb+967zbnQezKGU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfmWA-002hQ8-MR; Tue, 13 Jan 2026 23:05:38 +0100
Date: Tue, 13 Jan 2026 23:05:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Romain Gantois <romain.gantois@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Shuang Liang <liangshuang@eswincomputing.com>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
Message-ID: <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
 <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>

On Tue, Jan 13, 2026 at 01:36:53PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 12, 2026 at 2:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Mon, Jan 12, 2026 at 11:15:41AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <brgl@kernel.org>
> > >
> > > In order to drop the dependency on CONFIG_OF, convert all device property
> > > getters from OF-specific to generic device properties and stop pulling
> > > in any linux/of.h symbols.
> >
> > Is the intention to read these properties from ACPI tables?
> >
> 
> No. Other than a couple property getters which can use the fwnode
> abstraction, there's nothing here that requires the OF dependence.

So what is the need for not using OF? Why do you want this patch?

    Andrew

