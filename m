Return-Path: <linux-mips+bounces-12862-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 036ECD12F96
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 15:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B80CC301C929
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 13:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E0135B143;
	Mon, 12 Jan 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kgNgbCQO"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D5274FC2;
	Mon, 12 Jan 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226104; cv=none; b=Ur/laPr67xdG6SywYWUNrPpU1SdkscZzfoihWZegLvmIrGGUucyu8futIC6O75r1kxj134X1YTPnEyiOT2ogydvwQlNUzDfjnf03hSK5jAlEy/s8HVcQBW3FgeL6bYtZr9aGzEI112gkJFyWQMKdxzpDAOjFylVgv0IfPY0y1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226104; c=relaxed/simple;
	bh=upzgR2xmeRa7U3D4c4yVBMn/OAGVUS/BTHUTWOPwm4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUO/UsaZvGGH7InUYoW0HK0fg5PNWHNjt9Jofm+tljIw/PYMPIrXhCdFyNOA7JzlXdQVu1pcZylTgJBInUEKjCGzxDzcVaZv/VKQYUFhsY8g6MbLLRQtHpr+PeGSiwd603hXPkfMCcSkf/1EdvLtg+YX473WBFnmHG6coy5HbGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kgNgbCQO; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KcNdXwaHO43/aWmYkdmTrvgXq9snCOwCBSSp5/oIhoc=; b=kgNgbCQOQpcxZ/lVrAiQj4C4vu
	YuAuThNoJKE1rGB2sQ0V+KcD41At13B/KCqU7SyakYddsVifUkzgIbx3P3ODIeF7OzhIWNvkduCQk
	+KbVOi44ZIkmI3gQYtKR0mhMF4YOPb9FYqVFScnxbA9/FBnlGbYWwwudqEttD7PUJgGU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfIN8-002U0Q-Vs; Mon, 12 Jan 2026 14:54:18 +0100
Date: Mon, 12 Jan 2026 14:54:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
	Swathi K S <swathi.ks@samsung.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND net-next v6 7/7] net: stmmac: qcom-ethqos: add
 support for sa8255p
Message-ID: <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>

On Mon, Jan 12, 2026 at 11:15:46AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <brgl@kernel.org>
> 
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.

>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
> +	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},

Is this device being probed via DT or ACPI?

	Andrew

