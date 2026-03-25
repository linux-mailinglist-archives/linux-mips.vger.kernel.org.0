Return-Path: <linux-mips+bounces-13944-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMOvBbNLxGn5xwQAu9opvQ
	(envelope-from <linux-mips+bounces-13944-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 21:55:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D632C07A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 21:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BBC3304CCE0
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 20:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9436364E90;
	Wed, 25 Mar 2026 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bJgocfdz"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA363451AF;
	Wed, 25 Mar 2026 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471952; cv=none; b=NIc7ZgdxxIwj4KPEWEUTSLoWLYcE9y7uNuOunrDDuImc4CWxLci/vuWZFlmSO8nVoQA1i2EPayCUnRce2qgHfH/oni5wDHb13OufQ/oz6/9Vw9goFRVTuYvRGuELnl7LasaMlsyZWLpksgKHuzQy33E9drc+9MeAVXPQQdQTsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471952; c=relaxed/simple;
	bh=7tfnYTF1fs0ROH1wH33nuz71pGj4lwF/JonOh4LcOu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoF0ZjtCNVw6WKPPyzfT9ZxJVLBJfcJiROtgFBIDZG0u7xfLg8K0fcUAzxHxTLq+L/WSLBl8eZXVk4AMFU6CUjafpue+4dVlpDfwWPCId/80yvHySQ/e7FcB8Jrh8XViX/VO5GCFiAStuLckTavIpkAWZIUYq+vvnbA3K+QAt1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bJgocfdz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5TaF136hS7gyiN2INSsjbTVG4M1m+RcQW4RSzUAK8mc=; b=bJgocfdzLBKes2wMXa50BQ/Sgw
	2VNxUldZJFRFO1DH1e3sWYkf+HpUKst8qeo6mEmxzisIlT9F643+8G7mP8W0cEG97CX9EddaPFnAx
	0auvwtk71mLu472gb4M/pgwwwT7auS75QFoEuI3Ulc0t8Td1yqPpRlQhMRL9Q0sVOXjuT1KRASHvT
	KyQkPoRHlhfR1LscoVZHueKBsDdovNbEjbfAFOMWWjTHfKoz7+lVqv6Pq5sNuqrikvfHErcf50ZxE
	dLM4luhf9tuxdUXNx8G4p2TIcbxgKN3UURxz0Ib/Wm84DDDPrXllvWnYoO6lVBmszS+dAvfAa4kcZ
	Cij15muw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36514)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5VD1-000000003uJ-1ODG;
	Wed, 25 Mar 2026 20:52:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5VCy-000000006MD-0rz1;
	Wed, 25 Mar 2026 20:52:08 +0000
Date: Wed, 25 Mar 2026 20:52:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
Message-ID: <acRK-F6TACsZqEhx@shell.armlinux.org.uk>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
 <20260316-qcom-sa8255p-emac-v9-5-c58934e76ff2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-5-c58934e76ff2@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13944-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,linaro.org:email,armlinux.org.uk:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B9D632C07A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:05:10PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With match data split into general and power-management sections, let's
> now do the same with runtime device data.

As I've already said, this conflicts with work that I have in progress,
which will remove the serdes support from this driver _if_ we can get
forward progress on the PCS bits from Mohd - that has become dependent
on sorting out the MDIO bus clock which seems to have been totally
broken in this driver for quite some time so that we can have confidence
that any testing that is done is actually being done on a setup which is
running within correct specification (and not running the MDIO bus at
some insane speed that may lead to data corruption.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

