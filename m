Return-Path: <linux-mips+bounces-12045-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583CC347C3
	for <lists+linux-mips@lfdr.de>; Wed, 05 Nov 2025 09:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 742E6346706
	for <lists+linux-mips@lfdr.de>; Wed,  5 Nov 2025 08:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058F8288525;
	Wed,  5 Nov 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWRtcGLQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01592652B2;
	Wed,  5 Nov 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331610; cv=none; b=tbktahSzfSNcFJp0SWfG2YbCPYoItudDb/MvDY4hPxDJzH1H56Tz1/B/Vnc6wfpyyYKhEIHrMuENZ9zd11VEtRLbwfL5TmhI8Mx9g8SlzwJmPu63HyhOVUfNorOEjUeYXxs9JGf+PAdNsyZnMt8r6mjVl3OEzKSJ1ne/ykYhE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331610; c=relaxed/simple;
	bh=N9DVJZLHg/ikq7JcKb017+GXdHTNHUl1swp5I6YFwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeWoqolGP0OuPswEsquv1ISDKHux62wYqkumOO6wOdoiA/NXMHYlQR3/yDlfuYtTtTp4jdOOodgoL4Nd1ugqayzl/dlwHDky+AJEpiwbDhTXOSG2XYvhH65k8XaqgL5R9jnqpSYSptV11xUA+d+gnyHV5yRFoeKbDk6+JCo7MoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWRtcGLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA45C4CEF8;
	Wed,  5 Nov 2025 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762331610;
	bh=N9DVJZLHg/ikq7JcKb017+GXdHTNHUl1swp5I6YFwKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWRtcGLQVHMZgFcfCcC2Ue5biDzICOqxbsTH9uRs3nHuk4V9OMogHP0jGb51Z/R1/
	 jJxkWdC8AHsbMqgtuTPgrjWZOlEwVVOpsHrziXpskkAkKCA1xrAzVVi07M2Ld7UyTP
	 VJIqW87HIEtASx13s4C1VM/y6/X7on3YXHn7gwZzVxCFO470mCBBKSCNdU9LIk5Cyc
	 1XM/bvkZNvlVnWDHYXq4thAk5z0FFtDTWqf6wOzceEzFJa6Pqtp/I85AxdCnbThUg5
	 dL17TQbIUFUeUW15dIGkbb9zPwlX5ZkCMOZjeOPxSyuT7pqNhvIJS5W4nOvExPXANQ
	 M6yn12bRbQ/3Q==
Date: Wed, 5 Nov 2025 09:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Shuang Liang <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	David Wu <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
Message-ID: <20251105-fat-aromatic-nightingale-1ef8ac@kuoka>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
 <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>

On Tue, Nov 04, 2025 at 02:08:52PM +0100, Bartosz Golaszewski wrote:
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff70d785d326f39a8fe5698759c56ab2cb7f7eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3

You should have here both constraints - min and maxItems. Current code
works fine, but usually we want it to be explicit.

I found two more nits which I did not notice earlier, so when fixing
above please also:

1. Please name the file following compatible, so:
qcom,sa8255p-ethqos.yaml
(unless this was already discussed...)

> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&ethernet_phy>;
> +        phy-mode = "2500base-x";
> +
> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +
> +        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
> +        power-domain-names = "core", "mdio","serdes";

2. Missing space after ,


Best regards,
Krzysztof


