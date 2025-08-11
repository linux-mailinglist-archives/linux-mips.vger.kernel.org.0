Return-Path: <linux-mips+bounces-10177-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA3B2110B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFAC47B5059
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B530A2D6E6F;
	Mon, 11 Aug 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iN2EhbD9"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F3A2D6E45
	for <linux-mips@vger.kernel.org>; Mon, 11 Aug 2025 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927868; cv=none; b=hBlD0rZnW2CiaiIyc0BmXzpkfvArTFE/00m9bcX5RdNl6IQuLHz0ac+YZBhN/mrHA41ReZGtq8svUCgehLYx+d09pNZM5fWcXWKsQiXjkEmi3OMyD/FdSIj/sBtTU+FIy1JFcAg2Ds95yEMWSuJqIC/Eqy3V9U5vOwdo9ibFqfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927868; c=relaxed/simple;
	bh=07eO2bvYIRsiAjlhL5Ks2RMc74npsOWxeUj+fPHc9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YP/3X/JFMlM+SUhI/zSEB4PvXVKRNLSH2He2KrHkrvayX275pbPBoKU90y5DAbTccQ5LJVkdWQA41k7M84CsT+1IEAvlJ/V9PUUP4VTL8jXfei3o4Yj59K5RuamaBblkj2PJQeqTjBimsJApVRhoDnGeprGfxzIbduT7DmoLiOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iN2EhbD9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754927865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
	b=iN2EhbD90ie9CgoZVivdz9sre9b3D2VhxMFSPXr82443LS5XVYsBZBJS3GaenR1zqD3r3r
	vNVf5vXrUJvYkljprd2yRlwZ+anMLZaWze/RNW989bOQiHjwcqdO0PgG2YWDAGGMfA6ngH
	Kn7kWXLB0lDk8wsaPK/R1E2LkxSfqks=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-OP5PP3EtOmClqMnul4Z6-w-1; Mon, 11 Aug 2025 11:57:44 -0400
X-MC-Unique: OP5PP3EtOmClqMnul4Z6-w-1
X-Mimecast-MFC-AGG-ID: OP5PP3EtOmClqMnul4Z6-w_1754927862
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7074bad04efso100711826d6.1
        for <linux-mips@vger.kernel.org>; Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927862; x=1755532662;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
        b=rVuwfsdxyJ963lMkiRUFCsryvXi3rm8+svlgjW2pnf2TKo3wBneT+HsuxnvEmVhRTd
         iWEKfFNgxN3eSbCI5wZ7rb7X67EEkEP3BX+l8nfoP8cfA/54ukrOk1VTob9GgIWW6RUs
         WVjZ5+odaHVhqEYy0LFQfNv7uYLD4tnLftYy0igVNQFxCVOcOF4eetJ7prqe08htj144
         TuLRvQWxSwmC4IffYITZUbSgt+cHe/hRig44bPfVrIj/NsymJYURAIMV350uo2Iyj6mo
         YRIiRUryLG6G64yD6PRqy25sa80GEsIH7a+6uZ/93PrpLQZ5OGc8niI8MqEj+xK/cvUH
         OmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHkILRUVcQ7x0ROUdtkCaEjskOO3SSrwM8CDvnYNEQfnwcGGfge74qbcUBR2q5rLXOWRI8M1V0eH0o@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiozAO+F8jE/sVpnx5OpCT0+hPWuvbK2hLY6r6yBxh/A4lpNW
	OiCze85jBsLUSZzoBZyEeKgMPcvU98t2XBc14OLuEBIaBrtMkfyvE12sjmIXzzDxXczyrhyTUeR
	1bnwbe0VUXF4LOHZGRWGiHuMHbZZwt6gYhKHqcswS4OE7kSSi+2Ljxx8hUVO6l6Q=
X-Gm-Gg: ASbGncsxEE4SyQKrp8LOg+Wjl2+LPbvHt8K1PNYbp3FCUbCk8OroekpW6Q3bRryxsBn
	vcM2rcSrU14kRxpJsn9rZWj+xTc+TL6yAuARkxrSxkHmS6KD2Smrkeo2U1af4k9vKMeeAOodL6F
	c/e9ELBT67L2RM42oH+HF8/aOrkl2C1YbQRV1ZdNKaa93Z0J9O4a1Dxe+faBieDI2AZ88QrVNVK
	8DgnfXYJs9mt2JnhdTW+tbxaSBEwY4OzpT42X/Ux1Ebt6AuPxZO3qm7TyW78LvcoKXrPluXz6G8
	n1xq3ewjEnGeFAv4TL++H0mFjs992XdpjiTwLx3yfAquhI4MDMaMbbAYlo7c1Zo=
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1135166d6.18.1754927862221;
        Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE83iNLxuXWBRGJIeIFUZHblancM50VRXiEQcjWFBbyuLTm1IZWPJbr6gZfh6Uj5SzS3+J40w==
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1133886d6.18.1754927861515;
        Mon, 11 Aug 2025 08:57:41 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5b4esm155566456d6.69.2025.08.11.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:57:40 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:57:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
Message-ID: <aJoS7twZC0WsIDY5@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
 <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Aug 11, 2025 at 05:45:57PM +0200, Alexander Sverdlin wrote:
> On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> > @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> >  			bestdiv = readl(divider->reg) >> divider->shift;
> >  			bestdiv &= clk_div_mask(divider->width);
> >  		}
> > -		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> > +		ret_rate = DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
>                                                  ^^
> May "*&" be redundand?

Yes, I agree that needs dropped and something I missed when I cleaned
things up by hand. I verified that this is the only case in this series,
and all of the other series that I referenced on the cover letter, where
this occurred.

My Coccinelle semantic patch has a case when the parent rate is
dereferenced, and I'm not sure why that wasn't converted here since it
works elsewhere.

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

I'll wait a few weeks to send out a v2 to hopefully let big chunks of
this series get merged so that I don't have to send out 114 patches
again for a v2.

Brian


