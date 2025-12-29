Return-Path: <linux-mips+bounces-12641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3CCE621A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 08:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23A0E3004CF2
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 07:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE7220E023;
	Mon, 29 Dec 2025 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D9vqz5Ut"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED422D4C8
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766993446; cv=none; b=WvgfZPUsv0pqN6RQusQcUbIB2nJgmSpzoSBYHs86/lURkOPGwrShpktva8725e2Yb2inoerMRKTjB+w5zOr+6CL92H5R65619ln28KMqQVAiYFUTPv+n8nc+b8UlPqmCZ4xSmgVlvTuW+IhvTtaj2XoTdJgMgLzxBr2XGG/ME5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766993446; c=relaxed/simple;
	bh=vPBltPRUrlpU8MkDHxaoSL2YWfTCY4OkyWZlZ2/HLsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cz6K25iwuDtGAl5I8zryJ3S9Md2liU1fuKMZTCHwDA5hTC29Dxr5InbNFJ770+jqlVymzOuBVv/lc6ul5WNoJ2xjOahUdFcGiTpsrIg2npNednMZTOnlvSG6crugnBu2lZUbOVU7hZTbJS+lgwfME9dX/zdCrHOUwxU03jSVja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D9vqz5Ut; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 270A6C1D71A;
	Mon, 29 Dec 2025 07:30:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F6396072B;
	Mon, 29 Dec 2025 07:30:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B41B91197805D;
	Mon, 29 Dec 2025 08:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766993430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LlZGRaSTW1H4f+A6N5+MNewrlF8/dXXNx4vXI4Sr5CE=;
	b=D9vqz5UthyvU8+ZH1GZkgRk/Fp6+0MxCtDDVROZpt0UdOgeUlMv6A6V2Mczqhget83vR4z
	l8xtZvdxOLYoK62tWjBgeSEW2kSk5PqqGiR1USc+bVQyE4zq/JK/1iFyHc2GsQ50Ic4yPe
	Uf3E7lkWYj5gY9WX6PkvBrfI3W+IvR8xNn7y00De2x4WypSKCcL4hWrMFkqfR1DibJJ0Qe
	5X9qRG5ZJqsIDeJMqI2QIAgYTrE/Zj43zZnZHTwJG81wldwbvloTHL0BiIGjbHYpRfehPd
	3VrN9T2/vtmBDJptYfeTfENM9eO99Pei7VC+pky6T+11x+6uchvKiKq9NlXqbQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject:
 Re: [PATCH v6 1/7] dt-bindings: net: qcom: document the ethqos device for
 SCMI-based systems
Date: Mon, 29 Dec 2025 08:30:02 +0100
Message-ID: <8623826.T7Z3S40VBb@fw-rgant>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
References:
 <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
 <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2335471.iZASKD2KPV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextPart2335471.iZASKD2KPV
Content-Type: multipart/alternative; boundary="nextPart10778696.nUPlyArG6x";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 29 Dec 2025 08:30:02 +0100
Message-ID: <8623826.T7Z3S40VBb@fw-rgant>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart10778696.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 19 December 2025 12:42:16 CET Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
>  .../devicetree/bindings/net/eswin,eic7700-eth.yaml |  3 +
>  .../devicetree/bindings/net/intel,dwmac-plat.yaml  |  3 +
>  .../bindings/net/loongson,ls1b-gmac.yaml           |  3 +
>  .../bindings/net/loongson,ls1c-emac.yaml           |  3 +
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |  3 +
>  .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |  3 +
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  3 +
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  3 +
>  .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98
> ++++++++++++++++++++++ .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |
>  3 +
>  .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +
>  .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 +
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  5 +-
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml         |  3 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml          |  3 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml        |  3 +
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  3 +
>  .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |  3 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml |  3 +
>  .../bindings/net/toshiba,visconti-dwmac.yaml       |  3 +
>  MAINTAINERS                                        |  1 +
>  24 files changed, 166 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
> b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml index
> 23e92be33ac8..b12632545673 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
> @@ -40,6 +40,9 @@ properties:
>      description:
>        PHY regulator
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml index
> fc445ad5a1f1..448e617cddc4 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -140,6 +140,9 @@ properties:
>            - description: offset of the control register
>            - description: shift within the control register
> 
> +  power-domains:
> +    maxItems: 1
> +
>  patternProperties:
>    "^mdio[0-9]$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml index
> 5c91716d1f21..9c9cc3ef384d 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -158,6 +158,9 @@ properties:
>    interrupt-names:
>      const: macirq
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml index
> 91e8cd1db67b..c1b67cfa76d0 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -83,6 +83,9 @@ properties:
>                           register
>            - description: Offset of register controlling TX/RX clock delay
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml index
> 62c1da36a2b5..e41851931b94 100644
> --- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> +++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> @@ -47,6 +47,9 @@ properties:
>    interrupt-names:
>      const: macirq
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
> b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml index
> c4f3224bad38..c9a131b8d830 100644
> --- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
> @@ -66,6 +66,9 @@ properties:
>        - mii
>        - rgmii-id
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
> b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml index
> 99001b940b83..49db18423dd8 100644
> --- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
> @@ -65,6 +65,9 @@ properties:
>        - mii
>        - rmii
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml index
> e5db346beca9..b240c76e7dd5 100644
> --- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> @@ -83,6 +83,9 @@ properties:
>      description:
>        To select RMII reference clock from external.
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
> b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml index
> 05acd9bc7616..f61188ab0dbe 100644
> --- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
> @@ -51,6 +51,9 @@ properties:
>      items:
>        - const: stmmaceth
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml index
> 2b8b74c5feec..716407a75079 100644
> --- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -52,6 +52,9 @@ properties:
>        - const: rx
>        - const: ptp_ref
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - clocks
>    - clock-names
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml index
> 423959cb928d..ef520f810577 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -86,6 +86,9 @@ properties:
>    phy-names:
>      const: serdes
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
> b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml new file
> mode 100644
> index 000000000000..72bb764c0ca0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#
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
> +      - description: The interrupt that occurs when HW safety error
> triggered +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: core
> +      - const: mdio
> +      - const: serdes
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg-names
> +  - power-domains
> +  - power-domain-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet: ethernet@7a80000 {
> +        compatible = "qcom,sa8255p-ethqos";
> +        reg = <0x23040000 0x10000>,
> +              <0x23056000 0x100>;
> +        reg-names = "stmmaceth", "rgmii";
> +
> +        iommus = <&apps_smmu 0x120 0x7>;
> +
> +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq", "sfty";
> +
> +        dma-coherent;
> +
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
> +        power-domain-names = "core", "mdio", "serdes";
> +    };
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml index
> 16dd7a2631ab..ed0d10a19ca4 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -44,6 +44,9 @@ properties:
>        phandle pointing to a PCS sub-node compatible with
>        renesas,rzn1-miic.yaml#
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml index
> bd53ab300f50..bc5054b05f6d 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -123,6 +123,9 @@ properties:
>        Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
>        (Refer RZ/T2H portion in the DT-binding file)
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml index
> d17112527dab..ef82ff2a2884 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -121,6 +121,9 @@ properties:
>    phy-supply:
>      description: PHY regulator
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> b/Documentation/devicetree/bindings/net/snps,dwmac.yaml index
> dd3c72e8363e..312d1bbc2ad1 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -71,6 +71,7 @@ properties:
>          - loongson,ls7a-dwmac
>          - nxp,s32g2-dwmac
>          - qcom,qcs404-ethqos
> +        - qcom,sa8255p-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
> @@ -180,7 +181,8 @@ properties:
>            - const: ahb
> 
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> 
>    mac-mode:
>      $ref: ethernet-controller.yaml#/properties/phy-connection-type
> @@ -643,6 +645,7 @@ allOf:
>                  - ingenic,x1830-mac
>                  - ingenic,x2000-mac
>                  - qcom,qcs404-ethqos
> +                - qcom,sa8255p-ethqos
>                  - qcom,sa8775p-ethqos
>                  - qcom,sc8280xp-ethqos
>                  - qcom,sm8150-ethqos
> diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml index
> b89456f0ef83..e78cbf594c69 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> @@ -49,6 +49,9 @@ properties:
>    reset-names:
>      const: stmmaceth
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml index
> e8d3814db0e9..845e2c67d200 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -52,6 +52,9 @@ properties:
>    interrupt-names:
>      maxItems: 1
> 
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
> 
> diff --git
> a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml index
> 313a15331661..8a68c6d7b5c6 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -71,6 +71,9 @@ properties:
>        The argument one is the offset of phy mode selection, the
>        argument two is the shift of phy mode selection.
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml index
> 987254900d0d..29b878079ff0 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -121,6 +121,9 @@ properties:
>      minItems: 1
>      maxItems: 2
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - clocks
> diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml index
> dd7481bb16e5..ad635529d676 100644
> --- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> @@ -67,6 +67,9 @@ properties:
>        - rgmii-rxid
>        - rgmii-txid
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml index
> b3492a9aa4ef..c859f8bb5d58 100644
> --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -78,6 +78,9 @@ properties:
>      items:
>        - const: macirq
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - clocks
>    - clock-names
> diff --git
> a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
> b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml index
> f0f32e18fc85..efa39eab0256 100644
> --- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
> @@ -48,6 +48,9 @@ properties:
>    interrupt-names:
>      const: macirq
> 
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..fc8a25414417 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21429,6 +21429,7 @@ L:	netdev@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 
>  QUALCOMM FASTRPC DRIVER

Haven't found any mentions of multiple power domains for RZ/N1, so LGTM.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1


--nextPart10778696.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Friday, 19 December 2025 12:42:16 CET Bartosz Golaszewski wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; From: Bartosz Golaszewski &lt;bartosz.golaszewski@linaro.org&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Describe the firmware-managed variant of the QCom DesignWare MAC. As the</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; properties here differ a lot from the HLOS-managed variant, lets put it</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; in a separate file. Since we need to update the maximum number of power</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; domains, let's update existing bindings referencing the top-level</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; snps,dwmac.yaml and limit their maxItems for power-domains to 1.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Signed-off-by: Bartosz Golaszewski &lt;bartosz.golaszewski@linaro.org&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Signed-off-by: Bartosz Golaszewski &lt;bartosz.golaszewski@oss.qualcomm.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; ---</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/allwinner,sun7i-a20-gmac.yaml&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/altr,socfpga-stmmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/amlogic,meson-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/eswin,eic7700-eth.yaml |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/intel,dwmac-plat.yaml&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/loongson,ls1b-gmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/loongson,ls1c-emac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/nxp,dwmac-imx.yaml&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/nxp,s32-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/qcom,ethqos.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/qcom,sa8255p-ethqos.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 98</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; ++++++++++++++++++++++ .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/renesas,rzv2h-gbeth.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/rockchip-dwmac.yaml&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/snps,dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +-</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/sophgo,cv1800b-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/sophgo,sg2044-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/starfive,jh7110-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/stm32-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/tesla,fsd-ethqos.yaml&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../devicetree/bindings/net/thead,th1520-gmac.yaml |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../bindings/net/toshiba,visconti-dwmac.yaml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; MAINTAINERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; 24 files changed, 166 insertions(+), 1 deletion(-)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 23e92be33ac8..b12632545673 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -40,6 +40,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PHY regulator</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; fc445ad5a1f1..448e617cddc4 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -140,6 +140,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: offset of the control register</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: shift within the control register</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; patternProperties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; &quot;^mdio[0-9]$&quot;:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type: object</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 5c91716d1f21..9c9cc3ef384d 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -158,6 +158,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; interrupt-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const: macirq</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 91e8cd1db67b..c1b67cfa76d0 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -83,6 +83,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; register</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: Offset of register controlling TX/RX clock delay</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 62c1da36a2b5..e41851931b94 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -47,6 +47,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; interrupt-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const: macirq</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; c4f3224bad38..c9a131b8d830 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -66,6 +66,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - mii</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rgmii-id</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 99001b940b83..49db18423dd8 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -65,6 +65,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - mii</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rmii</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; e5db346beca9..b240c76e7dd5 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -83,6 +83,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To select RMII reference clock from external.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 05acd9bc7616..f61188ab0dbe 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -51,6 +51,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: stmmaceth</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 2b8b74c5feec..716407a75079 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -52,6 +52,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: rx</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: ptp_ref</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clock-names</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 423959cb928d..ef520f810577 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -86,6 +86,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; phy-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const: serdes</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml new file</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; mode 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; index 000000000000..72bb764c0ca0</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- /dev/null</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -0,0 +1,98 @@</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +%YAML 1.2</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +---</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +$schema: http://devicetree.org/meta-schemas/core.yaml#</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +title: Qualcomm Ethernet ETHQOS device (firmware managed)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +maintainers:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - Bjorn Andersson &lt;andersson@kernel.org&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - Konrad Dybcio &lt;konradybcio@kernel.org&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - Bartosz Golaszewski &lt;bartosz.golaszewski@linaro.org&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +description:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; dwmmac based Qualcomm ethernet devices which support Gigabit</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; managed by firmware</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +allOf:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - $ref: snps,dwmac.yaml#</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; compatible:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; const: qcom,sa8255p-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; reg:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 2</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; reg-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: stmmaceth</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: rgmii</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; interrupts:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: Combined signal for various interrupt events</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - description: The interrupt that occurs when HW safety error</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; triggered +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; interrupt-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: macirq</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: sfty</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; minItems: 3</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 3</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domain-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: core</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: mdio</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: serdes</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; iommus:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; dma-coherent: true</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - reg-names</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - power-domains</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - power-domain-names</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +unevaluatedProperties: false</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +examples:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; - |</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; #include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; ethernet: ethernet@7a80000 {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = &quot;qcom,sa8255p-ethqos&quot;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg = &lt;0x23040000 0x10000&gt;,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;0x23056000 0x100&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg-names = &quot;stmmaceth&quot;, &quot;rgmii&quot;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iommus = &lt;&amp;apps_smmu 0x120 0x7&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts = &lt;GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH&gt;,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-names = &quot;macirq&quot;, &quot;sfty&quot;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma-coherent;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snps,tso;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snps,pbl = &lt;32&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx-fifo-depth = &lt;16384&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tx-fifo-depth = &lt;16384&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; phy-handle = &lt;&amp;ethernet_phy&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; phy-mode = &quot;2500base-x&quot;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snps,mtl-rx-config = &lt;&amp;mtl_rx_setup1&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snps,mtl-tx-config = &lt;&amp;mtl_tx_setup1&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; power-domains = &lt;&amp;scmi8_pd 0&gt;, &lt;&amp;scmi8_pd 1&gt;, &lt;&amp;scmi8_dvfs 0&gt;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; power-domain-names = &quot;core&quot;, &quot;mdio&quot;, &quot;serdes&quot;;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; };</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 16dd7a2631ab..ed0d10a19ca4 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -44,6 +44,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; phandle pointing to a PCS sub-node compatible with</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; renesas,rzn1-miic.yaml#</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; bd53ab300f50..bc5054b05f6d 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -123,6 +123,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Refer RZ/T2H portion in the DT-binding file)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; d17112527dab..ef82ff2a2884 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -121,6 +121,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; phy-supply:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description: PHY regulator</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/snps,dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; dd3c72e8363e..312d1bbc2ad1 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -71,6 +71,7 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - loongson,ls7a-dwmac</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - nxp,s32g2-dwmac</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,qcs404-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sa8255p-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sa8775p-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sc8280xp-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sm8150-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -180,7 +181,8 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: ahb</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; minItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 3</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; mac-mode:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $ref: ethernet-controller.yaml#/properties/phy-connection-type</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -643,6 +645,7 @@ allOf:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ingenic,x1830-mac</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ingenic,x2000-mac</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,qcs404-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sa8255p-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sa8775p-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sc8280xp-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - qcom,sm8150-ethqos</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b89456f0ef83..e78cbf594c69 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -49,6 +49,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; reset-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const: stmmaceth</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; e8d3814db0e9..845e2c67d200 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -52,6 +52,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; interrupt-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; resets:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 313a15331661..8a68c6d7b5c6 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -71,6 +71,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The argument one is the offset of phy mode selection, the</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; argument two is the shift of phy mode selection.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; 987254900d0d..29b878079ff0 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -121,6 +121,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxItems: 2</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; dd7481bb16e5..ad635529d676 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -67,6 +67,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rgmii-rxid</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rgmii-txid</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b3492a9aa4ef..c859f8bb5d58 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -78,6 +78,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; items:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - const: macirq</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clocks</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - clock-names</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml index</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; f0f32e18fc85..efa39eab0256 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -48,6 +48,9 @@ properties:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; interrupt-names:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const: macirq</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp; power-domains:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; maxItems: 1</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; required:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - compatible</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp;&nbsp;&nbsp; - reg</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/MAINTAINERS b/MAINTAINERS</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; index 5b11839cba9d..fc8a25414417 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/MAINTAINERS</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/MAINTAINERS</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -21429,6 +21429,7 @@ L:&nbsp;&nbsp;&nbsp; netdev@vger.kernel.org</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; L:&nbsp;&nbsp;&nbsp; linux-arm-msm@vger.kernel.org</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; S:&nbsp;&nbsp;&nbsp; Maintained</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; F:&nbsp;&nbsp;&nbsp; Documentation/devicetree/bindings/net/qcom,ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +F:&nbsp;&nbsp;&nbsp; Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; F:&nbsp;&nbsp;&nbsp; drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; QUALCOMM FASTRPC DRIVER</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Haven't found any mentions of multiple power domains for RZ/N1, so LGTM.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Reviewed-by: Romain Gantois &lt;romain.gantois@bootlin.com&gt; # For RZ/N1</p>
<br /><br /></body>
</html>
--nextPart10778696.nUPlyArG6x--

--nextPart2335471.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmlSLfoACgkQKCYAIARz
eA50jg//cC+fQYXgcqRCjFartxtxdpQN+cLmgBJPlrx8TpZ/UYSXZfL1L2iduPPe
ezXXbS1bPp5wgGbf9shE3jq2Ug3rpRBcdRtR2TjbKgswJ4xLs7UIX3gPrSKmk4/1
c3gWE0fRSTTIlLRr0zPOemzv6bEOzGuearogMjawHHkbuKV8ZkcLTok5aJXCnVMW
AV8W7l2dj4P+fhXEdP3sVB1qd/3L9LI+k4tdTlmHnLeo+cqFyqsX5FMDIREsoV0f
it/nyuObXxMxZYRZSHGAobNuy3TRGB7AlGNBXQSgWcXrhMc8pjvsZIXFL/1se8ni
x2ipgEGrYUxk0ZqPTfDSgLR+ZntyrKXMR7WujyqmrCj9aToe5cH9Bl9ZTV2JjgA7
nn7rwgl++zdeS9IC8fDpNsmMat4Q4JkyAIwltjfGyDYeJAXQbj7VVjXZi6vW0Tpd
gOVitatMPR+arbGBypFovTmPcNuyWd3p/kXgVN4kpRteT+zndxpsVSzd7aBBwTVb
DUEJuvgBUi+TbRDKKvoZ+sV0VWeTn+PXiK+6JPqteqTUxAMcK4gLFUW4GP2cNB9i
WLPv4V1anM5kTffeyZRPkGVnWE/K2osAo95jctz8ukT+Z8htAJNuuJKJI/joD+sn
B6gYvIJTlnYLHUyGlX11puRGQYeaWvYWHxo9c5+YCBPiUreK1jY=
=N738
-----END PGP SIGNATURE-----

--nextPart2335471.iZASKD2KPV--




