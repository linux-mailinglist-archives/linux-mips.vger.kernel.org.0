Return-Path: <linux-mips+bounces-5773-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550F992696
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2024 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CDC1C220FB
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2024 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10892187555;
	Mon,  7 Oct 2024 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="G/k1s40U"
X-Original-To: linux-mips@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C04849C;
	Mon,  7 Oct 2024 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288358; cv=none; b=lNPJWLCBUFYZKKhEWOrRelLFI+pGbwh7a8cwMBOywrxjBcXoCKNyMlURhuO2VKjNc0lsBOqqcT8SU0jYflJ7TPQmzldKLXcBxRxc6IiOk6S+dCWKHKpu3WbScAuEV2G5MO7pbA/Zs6lAPFxn0F10Vr75ocPF8YJd7O2tLgTMu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288358; c=relaxed/simple;
	bh=waUV4a7mutxzrLnl05aUF1spDLiYo3LFIffRAYq+buw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpzGJoqBdIAPSHDR5DcEVwCADHgXiitG3yZ/fBrW0V3X0PS9Kt9AqURzDkf85gibLSE49KpboL/SA59QnT2tUTBQ5RRjZZDLeDL4t/L+eD+eiMxDL22gGoE+yL6+B3zI9g3gf1NUSSBOGzDU1RyeRg8+WmCOs/zjN3CWoUsp0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=G/k1s40U; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZkOxRoRypHAVQgVjyqb7heF/q9DLPK8SmPxFVAuphQI=; b=G/k1s40Ulb10wWe2CvPP9H8zku
	QyoRAgzReOYMUcvY1lT5FklGPJb9trwS8HWM5iKC2m2ws7E5TBIouShElZ6rUqd7aL1NY7tFFpVKE
	wqInKhrzG35pjz7jHf4OdIyFp3xZtpyrQXwDcYsiY6x/GxEZc2Jw5mZA5rcEBBcKbM2WHNg1Fdfs2
	kNbk1NVQV/19IsFaacmsHaoCamjIA1H2jsOPU65USw0roLxH03+ZCKnQBXaVtJ7nLQr2BB8WSp9q/
	pK0Qc7UupO3XNZW14pv9HT2V5bQRXcSXjTwLYdsqnGept/bPGsRtLZYkPMGkRaEsXJw7YIF5kf8hC
	Rg1jWntw==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxik7-0004Pv-F9; Mon, 07 Oct 2024 10:05:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Mon,  7 Oct 2024 10:05:20 +0200
Message-ID: <172814935870.2376693.17979672250689687487.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[06/11] arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
        commit: 7ac5c0a592f73fdc52393f6469ce8211ff3e771f
[07/11] arm64: dts: rockchip: Switch to hp-det-gpios
        commit: 3ca743f8a5b568dc5e5d5f1bab0298a4a43c2360

after the binding change from patch 02 got merged into the sound tree

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

