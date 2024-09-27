Return-Path: <linux-mips+bounces-5719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC35988765
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 16:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08E51F21F7F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAE31C0DC0;
	Fri, 27 Sep 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hHZyQS+v"
X-Original-To: linux-mips@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF71BFE15;
	Fri, 27 Sep 2024 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448318; cv=none; b=giJVwrYvCeRNuGW70raU2/YBW4MRnV30FvSSKioFTJZe/m/fjoUyqDMxkJrGlOgrUkP/vXStVJSfKVTl4kvUNXt/QPRqqotlVpXFKFq0vKJX4GfPlaCrIyCmcDDJ6oFWukvCR9FEy/J5YNjsB63EDR0NrvpVaxOT9rA7WuPEHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448318; c=relaxed/simple;
	bh=MEJMjn9ntS8Y8zmLvfnNVYD5q/dmVMCCKHH9WIxiXyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7bYZN2buH4Udg+zEwAP+6R/dco2IvmD1+tVJUfqJ15Ee8ye3VejJVCDsx3/T9KJBQXr+w0D7hWtd0AciyqbulPmjJf9ZAWmbJ87MmSNCXeOy416xa84XtQ833S1xJn1lXVTL3UkMu4bg7qYUnpuAKWnSm52WibY3OoAbgdZN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hHZyQS+v; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eyv6FxKbSvQOFgQGcK5COE/kC4alwt92KY2oNq8SFCM=; b=hHZyQS+vg3fGvDLP66OXewKSw/
	MgkYPIHasNP3Y4Vnw+Qz32VU90hJgUuL0TNZM9Z0ex/VAcLL+btM20yOKGwqvGR0MSZJy8sZzWNmu
	CRtWZj46gdvGkeDWd8p6q6YFW0AO0Dg5nO6P2uO2uLV/GZj9x94qWOdQJ0+fOJKpEOeNwONe2b8my
	IytLCrYxSKBSyluqn/mTPCnt7Whlj3/ufprGWJQo4y2pUCu3eDn29jqe+Qo39CjycUpZaK6XK8Vbs
	wKQGVRYSz7kf5xERWOuc7hB190jPyoC7OddhWU6836LF6mjGb7UEvB/bz8zUJ6HC3A5y94d4HTLiu
	+ui1ah4g==;
Received: from 85-160-70-253.reb.o2.cz ([85.160.70.253] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1suCD8-0006OK-Lb; Fri, 27 Sep 2024 16:44:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 16:44:43 +0200
Message-ID: <4455919.MSiuQNM8U4@phil>
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Geert,

Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
>   - The second patch updates the Audio Graph and Simple Audio Card DT
>     bindings,
>   - Patches 3-9 converts various DTS files to use the new properties,
>   - The last 2 patches convert Freescale sound device nodes to use the
>     new properties.
> 
> All patches can be applied independently,

though I guess dts patches should wait till patch 2 gets applied
somewhere, so that changed dts and changed binding can again find
together in linux-next?


Heiko



