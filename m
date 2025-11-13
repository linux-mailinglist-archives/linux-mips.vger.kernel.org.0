Return-Path: <linux-mips+bounces-12227-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA95C57B3C
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 14:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CDAC8356F2E
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 13:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A271F2BAD;
	Thu, 13 Nov 2025 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vy+ryhuN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA61DDC07
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040847; cv=none; b=G3sjXYukgltRGTpAlLu4GkfbPfTJ1EsUQeJHP5Ois9jtCbcnFIV0gC8c2umpN47Bq75lQPOCtmtaXvuXr8rQbSrNAFkUfQkMKQDLgswVj/AW0S9NXwsMdHGPzVTGqtfApHp6jJuLIuOUxdyaJ79kyAf27LSCycH/QfOWthmZsMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040847; c=relaxed/simple;
	bh=X3T5b32titXjcOm79yLB9wCfQXafLDscPPDjsVlvEkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9Ik1o4wG4Psu114visIvjp/2UPOjljumLo68leByyMjY1APThm52QrXJ5RIAZJcuWUwqEsFZJkCtQ2Sgy2/Qcb/ndldK0foabJbKSu/8jo7ql6XjWntOSyqzPZb06j1xzsba0x2JwR1x+1aAjye/nbbS5v1t222s5Xw8RTsJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vy+ryhuN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d1d0656so1243000e87.0
        for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 05:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040842; x=1763645642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=vy+ryhuNq4qcGtCghzOFqgwIM5zZKuYvPYTuwSNxrE7kyBvys+KzBlDkmx3uONX9lT
         j2vYL0bDq+DvY+L1MCML+GUSf1y4T/mxpREsv33GwQBBoFCif2Tm8Wv4Y777ozlr28+J
         AkPkjnTKbUxp9ST+vzsedtyB6VxybB80O0k5vNENUI/rnk1ON4qti4/g8MGpywp1f2SV
         O264bvSwjiILHX+Ec2bDygwiVzNevkSvANEirbClnSGLhmJpjD2YW1Pdqpq03XGGb/U6
         FSz7WbLGOEOoq5piJmbQ/cjQZyXxpg/zkTiWD7xLHU1SOHShmsj7oSIQGm3hI2hWIquz
         1dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040842; x=1763645642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=ofXdg/jnSJfZTUPCHa8J7Fnok24FxyIKzaLliKj+Fd2WEcR58j/W3jLxI1TEw109Zh
         IaIblHMWoVIMlzvgCPXZl1SRCAR/qNlVNGFQR585x0fejpK54PW+oQpd4HyJZYt3hoB6
         h8nQ78BHnQ1l4JtpVsSGZMUAfNJRGa2PEOq+8I0ZknYFDfOvfuqJ767mWTqid2PRNO4C
         yJYG7LI5G6ijT8FPa0y17k6utlvplt1AxobZDB7g2WJxGGE2ENYC0MfPWioOa8vLBZTH
         cuyOCxnIeZFF/rVniP0Ww9FGg0DAvEVfjkBxUv6w0lPGOW2zBEJgruvKZp+aiW7JiCYP
         MT5w==
X-Forwarded-Encrypted: i=1; AJvYcCVPv28tkINkktTEl3tm3yJyt6g9SbN0HVJXgKUWNPUJ/0FuBkZQloPGmAA//4g+sAh3d0pQEGehv2Et@vger.kernel.org
X-Gm-Message-State: AOJu0YwNCgpyxaHi2G6FG5zvThMweKuqI2ah9elpZkOVnScS8yoF4yZ5
	j8lDj9Cjv25HO6SU54mb5mQeVfZ2M1WRxI6jjcBpyiyDcw6L5fbd+zxCdfnkSjLYH6bqbZdcQgL
	GuMov0owtTic61C1k27qP5ESORH5VjmWrdSQ5Mje6gg==
X-Gm-Gg: ASbGncvPqaDvyNfhiuGtt/jGivrcZeuT3LtR4YC5GiK/FaUv+mhbpxCNEEmz4mfZS4T
	yvxV+lLwar3Drp21UvQ1RSRtEA2PUX/QOMRP/5iaStglIMmdWe9y4Wi0oAMRLi9NaeaF7BW1mxh
	eMLFaC604aumLEPz/SKDmU9b5qjlfQeg+oMSvTII4ca2lHvKSTQwyJRf1j5gjtYo7PRDIba0yKn
	nzhL+G3QSrIIuoCHpcWi7V4ME2cRUqnUJtSL9ebdkAIjDcDYFXwSgMrd9a+JNv6e/vwk7Dp40TS
	0a4t3100MqrBviNj
X-Google-Smtp-Source: AGHT+IGbk7EKeTNsNxEBH5I9gU0KP7DFoTOQ0KZ1rqq8QfnOf06KK/0zwgmGPB54vhErcQD0MD3GXM8/DDcCgOFKTlQ=
X-Received: by 2002:a05:6512:12c4:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-59576df8d25mr2057027e87.23.1763040842304; Thu, 13 Nov 2025
 05:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org> <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
In-Reply-To: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:33:48 +0100
X-Gm-Features: AWmQ_bmy5PXcBPeRnFHjyddkz8qETTfAAx4qoRDDnDLUNs7204p7vqOqHs_5gtY
Message-ID: <CAMRc=MfMQ3P-BK239953S9sTAe1_qSc_miWEFDNu83frE3aSqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 11:54=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As the first step in enabling power domain support in the driver, we'll
> > split the device match data and runtime data structures into their
> > general and power-management-specific parts. To allow that: first wrap
> > the emac driver data in another layer which will later be expanded.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  static int qcom_ethqos_probe(struct platform_device *pdev)
> >  {
> > -     const struct ethqos_emac_driver_data *data;
> > +     const struct ethqos_emac_driver_data *drv_data;
> > +     const struct ethqos_emac_match_data *data;>     struct plat_stmma=
cenet_data *plat_dat;
> >       struct stmmac_resources stmmac_res;
> >       struct device *dev =3D &pdev->dev;
> > @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_devi=
ce *pdev)
> >       ethqos->mac_base =3D stmmac_res.addr;
> >
> >       data =3D device_get_match_data(dev);
>
> This change could be made much smaller if you kept a drv_data
> pointer named 'data' and called the new one match_data
>

I prefer to make a clear distinction between the two.

Bart

> but I don't really care either way
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

