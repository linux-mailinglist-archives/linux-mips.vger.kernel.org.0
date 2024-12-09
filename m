Return-Path: <linux-mips+bounces-6900-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 903769E8C67
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 08:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA6E18863D3
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 07:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A221505B;
	Mon,  9 Dec 2024 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="m0B7CQyj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D0A214800;
	Mon,  9 Dec 2024 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730107; cv=none; b=aAOvva7ccSG/mSBwWTW4HAJe4zeS+rzk0TtWwGrQXledcqIluGfXXmuYw03erym/693EBeBalsE6UdiTjLE63f0usdHCnfmsJxfBJ82SXNQ6OoE+WxKRA6xieDF+cNw12rP4JHLzVqqp5RBNB0IyMLF4XyqzYxLAtLlYL4B+ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730107; c=relaxed/simple;
	bh=uC1pem2t1qTf2SJaJq5zueNwLm5ploeyLdhhQKMf7KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIwrtHBK6xGKHzCh07aoUaOcg5+axg1eID2YxZ0lOq6Dk2jYUvP52Cpy0jGIwjQWP92JwqGzzt8bItRtG93aMYfeDmGXXk7MfXGLXWi0e82xOGNfT59TgOBS6Ryad9/KeD3ktZsEaUgM/AKJ+vT4XAdlIR+8sRaFOPV60UgL71s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=m0B7CQyj; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=F+/1F5usZGU4xwFJCSgL70wM6kK3SGbjvRaZHVo0Zx0=;
	b=m0B7CQyjdSflcO4FEyoQ1bz1xXtz2aaBneveM0wWc38aRp5vbeDz7ctDwIsbGo
	UpqW1iwusxzg7XkDGBClLBth7ICBRKhCwevETCuxrhblIgjkao37+jwTiBu7SfBf
	aC9mJ7KN6axnCTQ6cuhvoNhlZUkd9iCPaxh/9g5n3Ctew=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3fxoBnFZnkeV5BA--.46779S3;
	Mon, 09 Dec 2024 15:28:03 +0800 (CST)
Date: Mon, 9 Dec 2024 15:28:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to
 {hp,mic}-det-gpios
Message-ID: <Z1acAA7gbxH7QfhT@dragon>
References: <cover.1727438777.git.geert+renesas@glider.be>
 <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
X-CM-TRANSID:Mc8vCgA3fxoBnFZnkeV5BA--.46779S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoGQ6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ6wZWdWeNqUcwAAsm

On Fri, Sep 27, 2024 at 02:42:25PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!


