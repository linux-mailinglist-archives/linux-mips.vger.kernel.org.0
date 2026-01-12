Return-Path: <linux-mips+bounces-12860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17663D12639
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 12:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E71063042890
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 11:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5F83570CC;
	Mon, 12 Jan 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8Al3vL/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC4356A32
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218548; cv=none; b=ZAki5Hcn5CA55gNd9EaLdAlLsohy2Uce3NVi0StDNIEIPWzWE/CPmq98EEFSQrMGGg3j9x69nsFmsz4tRrle48w/Ct3tS29ZLH1HJJkOXrRmHb6y4DJ4NQ5ZAAgGWJh3P585jS7UpJVe4h3+9kaS1hqEwi9cnooaz4nRCRWwXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218548; c=relaxed/simple;
	bh=bTQ2jMDgF+Gbg1sbOkIRTJ9v4E6KwpFdox2ieTMklY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah3DFSegHqUmKK5Yv7tEn7PsY19nc4aDUG3juELoqyMDBDpCldLQc+12ch+JcTPXCBmnBGRtRBXbAHM0BhcQ7DpEWGeV5rA5087hqPEKRY9Kze3BWt6XWzYglAXU942UDFE0dhg7gAdjX97RoHbB5YxFQ8/ONub20Vz34LRrTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8Al3vL/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327778df7fso3940754f8f.3
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768218543; x=1768823343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3lKmkW8uWQqiIdPsxxnnIhdvJFbePV9qyLGsJ775nY=;
        b=i8Al3vL/eeLQ9m/wXyUZPzwDFAosGMkNa7x6Ke9mPZXS0miEiJ8VnkkwKB/Mo00wgx
         ylGlHFhaRhPRewpTBHH+YF0mIR4jx2Ii1owwjhCJ9qBzeb6yNJ6DF9wIwNQZLrn/UF8C
         ysDqNPbPyq8yCRYmAs+FFN2Qzn58CTm9iudATEtVDDneZFGUr9GyNhTo21iK2vo2R92a
         u2NxZe8OjgXMIHJcMD/dLj+sGqbxoIeS8yFdjoGxrr/Cw80tzToN576VscbHpD8fnvyU
         KCN+on8amO94X36UlgjHh1AC0rgBi2sbOThQsEn9RH+JWPcPkdICerduPUOv0zu5WNLW
         NpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218543; x=1768823343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3lKmkW8uWQqiIdPsxxnnIhdvJFbePV9qyLGsJ775nY=;
        b=DaYj9KMPmRPW9+IJ/+u8AasYQUpMwB+TotXCd80XZHMYx18cZySLeSHTWhVxxFtsO+
         G7H5z4ZOon6vFoiZwfG423LLGIvNh7W1M1h8uHqON9PUbQhVtO6YyLNfi9lcIF4o0I1O
         9G3IQ+vUEJc5PlSXHTbnk1STle/hWv8LVpCyngiQKitUla7zkBhlltWaxMOKEO2KR5nq
         qgTr1SJrVs9M+mef74myxzhW7yfDS3swTPagzIb+YG/BBRrNLptJzsCX7u6usSgteiHd
         rn8VHRNd/w/2lG0gC86hxEc18b1B7DxcqzgpObAm6FhyHXA+fzWA2oX0En2CTV+bSUJL
         ek8g==
X-Forwarded-Encrypted: i=1; AJvYcCWWu1HgrtVAP4+HU5H/R630DLudDm+WrMxSIgekcb9Jti2/uHGzo4aIScPKeFQO9RVpk0Ur2C6hEhWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yycb2Aq6/ogmstWPYXvBaFIdlzI+gzAwCWDyO2RzV7ItGYf9aZY
	ru4G2mphp3Z3xVrVl64Hksa82m75X/9IIGlgsqCHTXnNxd6bwyOqaD+IF4bXhLqJrjHgesouklv
	0g1hyUt31y5eZ9eDM5CD0RR9vktrY++s=
X-Gm-Gg: AY/fxX6bT4MbnymSY4vJ//3BuHvORlhF+R0xzZfPOpPF/Z8HVrIYRlbamChW3KZlBqZ
	olYNx2nABCMI91YsX858zNXY4wVPoe/Pp/ddXUqg9SASVDMPyAtN3jmpMtsvzFaaHNbOqbt062d
	KnvKTIcfXnvsciXPPGAlvcZtMWusBo9pAQ1xH+1pV5bcdmdh8GHmkD+0OkyUSkyh3ltpJ7VdOaG
	ouyvx7C43bd9mFbLEBEF9MfLnlMsfONvyDypTqeNcTPJmKhYYyyXDSdZOtlLQeHNBpBQZT37bi7
	VIgSWcDmwCGQqlgwOyiTfz0mwcij6dsso57EaiStWA0ZUBBcqPtkq1q0jfBazCMe9Eny7t8GT+9
	ypqQVkK5rSw+b3C1E5KyRatGB
X-Google-Smtp-Source: AGHT+IHJo1T7KV7T/1vaDUGD0pxCG9RETap9UNnU2AvWT9qXBvIGLj5WC2vEm+CwzQWFi3i85cpIZ+mNpnPW6hF6IV8=
X-Received: by 2002:a5d:5f54:0:b0:432:5ce4:6fed with SMTP id
 ffacd0b85a97d-432c3629ad1mr18136879f8f.9.1768218542819; Mon, 12 Jan 2026
 03:49:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com> <20260112-qcom-sa8255p-emac-v6-1-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-1-86a3d4b2ad83@oss.qualcomm.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 11:48:36 +0000
X-Gm-Features: AZwV_QjPp_l5wcn9NYIyRVQcEgE4Mp8NncoGxUv3yeoqaE3vC8qdQZeRE5PTQsY
Message-ID: <CA+V-a8sbxL2x9nNKLNXhA_Pd9gpBT94DwUYG=UDZyQiXHvqokQ@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 1/7] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 10:16=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> From: Bartosz Golaszewski <brgl@kernel.org>
>
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
>  .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98 ++++++++++++++++=
++++++
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  3 +
>  .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
For RZ/V2H

Cheers,
Prabhakar

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
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gm=
ac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.ya=
ml
> index 23e92be33ac8609a16db530782989caed22a5730..b12632545673b2ad0148a677f=
45a7447309a43cd 100644
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
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.ya=
ml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index fc445ad5a1f1ac490e921696d6f7ca83d15de459..448e617cddc4cda8dbc77e833=
24495ffd5dfb9be 100644
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
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 5c91716d1f21e617543b03c5a90b993f8aee053c..9c9cc3ef384da0270489c21b3=
426572ea46d9499 100644
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
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml=
 b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> index 91e8cd1db67b8e14961497a7254e6b01dc4e582a..c1b67cfa76d070d5e8349d5e9=
2ce6bc4bf2ab67c 100644
> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -83,6 +83,9 @@ properties:
>                           register
>            - description: Offset of register controlling TX/RX clock dela=
y
>
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml =
b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
> index 62c1da36a2b5a29290e5e01be87c48158c4adf89..e41851931b947559c89b0cd6f=
4756f71046f9594 100644
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
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yam=
l b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
> index c4f3224bad387b87a5b4a3049dabd75f2c4bd42f..c9a131b8d8304c41559a416b3=
24df749c0a87d14 100644
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
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yam=
l b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
> index 99001b940b8361f69bb917617f857ee99f4b3fa5..49db18423dd807683b9bb2979=
78f5da8ea6cee3d 100644
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
> diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/D=
ocumentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> index e5db346beca9649be4f97727b78fda8973095912..b240c76e7dd5254d0c3752610=
c4aa848a3c3d65b 100644
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
> diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml=
 b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
> index 05acd9bc7616356e68090ebdd4df20e42f70dd7e..f61188ab0dbe3c0cec5b10f7a=
65dfaff4dc3898f 100644
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
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/D=
ocumentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> index 2b8b74c5feec8378750358e1b9335cc2c2762bb6..716407a750796ff27e8fbcdb7=
5267f3922ef64f5 100644
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
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Doc=
umentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 423959cb928d945aa3e758a3c803d12bd61ec42b..ef520f8105773e22c0536ff41=
9dad55fe316e1bd 100644
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
> diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.ya=
ml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..72bb764c0ca046e0df4bbffe6=
c323850f5231787
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
> +      - description: The interrupt that occurs when HW safety error trig=
gered
> +
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
> +        compatible =3D "qcom,sa8255p-ethqos";
> +        reg =3D <0x23040000 0x10000>,
> +              <0x23056000 0x100>;
> +        reg-names =3D "stmmaceth", "rgmii";
> +
> +        iommus =3D <&apps_smmu 0x120 0x7>;
> +
> +        interrupts =3D <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "macirq", "sfty";
> +
> +        dma-coherent;
> +
> +        snps,tso;
> +        snps,pbl =3D <32>;
> +        rx-fifo-depth =3D <16384>;
> +        tx-fifo-depth =3D <16384>;
> +
> +        phy-handle =3D <&ethernet_phy>;
> +        phy-mode =3D "2500base-x";
> +
> +        snps,mtl-rx-config =3D <&mtl_rx_setup1>;
> +        snps,mtl-tx-config =3D <&mtl_tx_setup1>;
> +
> +        power-domains =3D <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
> +        power-domain-names =3D "core", "mdio", "serdes";
> +    };
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml=
 b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> index 16dd7a2631abf6fb7dc8e0c90755ab1e81915b38..ed0d10a19ca4c47c05f6873c6=
4b0537b90acd15a 100644
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
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.ya=
ml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index bd53ab300f5003ea1f951d3957cefc702301217a..bc5054b05f6d7f1bcd5cd8640=
deb89293d9f69a6 100644
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
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index d17112527dab0a5104ffaf2627fdcb73603d5db7..ef82ff2a2884d994c5ae6c98e=
0b3483b56dda653 100644
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
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f=
5587381cbd1e01c 100644
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
> diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.y=
aml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> index b89456f0ef830991135bd17626da98661429596c..e78cbf594c695204040a53ab1=
e367daa9e12246b 100644
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
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> index e8d3814db0e94fdcd0f3ab2a9fa8bab972a97ab5..845e2c67d20037496bb1eec6e=
b73c99cde74e944 100644
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
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 313a15331661208a1fa64386739d87a4f11b7e20..8a68c6d7b5c6d6629a780d002=
299d767088def77 100644
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
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Doc=
umentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 987254900d0da7aab81237f20b1540ad8a17bd21..29b878079ff0c1a0ef95fc63f=
2035f478ee039b2 100644
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
> diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml =
b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> index dd7481bb16e59982c26c1a54ae82b8cff85fdfe0..ad635529d676ed6b752ab3bde=
5152d5cbddcb519 100644
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
> diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml=
 b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> index b3492a9aa4effa73fadf92a63a76ba8bb65a8769..c859f8bb5d582af8b8782f2f8=
9ab5e6ee3d7a46c 100644
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
> diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac=
.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
> index f0f32e18fc8550e6f63b87b60a095972453836c9..efa39eab0256a1102b01872bd=
848749788c9b4e8 100644
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
> index ecae8a5e33cce6f2cb883c1b14b7908e71dbfb5d..6c3bd060f68df8813e9f64d6e=
6f9f1f98d4131af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21523,6 +21523,7 @@ L:      netdev@vger.kernel.org
>  L:     linux-arm-msm@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +F:     Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
>  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>
>  QUALCOMM FASTRPC DRIVER
>
> --
> 2.47.3
>
>

