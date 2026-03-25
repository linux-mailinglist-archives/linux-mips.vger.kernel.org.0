Return-Path: <linux-mips+bounces-13945-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEWGOYpPxGljyAQAu9opvQ
	(envelope-from <linux-mips+bounces-13945-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 22:11:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB532C3AA
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 22:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4827303B17D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 21:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3A332EC1;
	Wed, 25 Mar 2026 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="MwzbQSsu"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526C32B981;
	Wed, 25 Mar 2026 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473019; cv=none; b=Tb+lwNdieLfA0ftjb7koUBjYGt0qcWHGavOxG2SMFJCm3ax2K1P4XrJ1F7tXConqL17uwgUwVE6mczGJyfsLkQj6rnK+tUtslkgLomZALXXTx4ho4TdjdY2vZ9bL2mEBPQq2WGyuGglR9sVVgZwR1xA0kUFt8QuXP6jwjcYM0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473019; c=relaxed/simple;
	bh=dU32khMe+2BznoMwsDD/V6YJMW/rkyUYtIGgyQKRLfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBAfNNBg+Hu4I47nVir/ZZoxUYBcTzFVJBu9s6QTtYIKy1FZZNYpWG9MgUfovBRijAA7mHFhDiSw+/kr2IMu3n2peYmPcn6cS3hdolfCz4Y0r15Cd9lmEUFkziV7yYZuCd1dyLDrzuoyzO70K+iq7P7M8UUqC1qYcFKDnzP7Y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=MwzbQSsu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/9QX/7zuW4PRdWvukdv95Pz7/SCg2+VZ38fqrKFSMfk=; b=MwzbQSsu1iD88gkB3IH1zeZiIR
	KqZ0nyf0GKrdHH0VKi7UtAwIR8Lo/PcRwkIg9KR07u74bQOTES45rI9JMbopS+J2PF6wAoznrEGt6
	cv+cD36+oFV4fnMEsbXqQ/fMekGhiWQW0TEGXE3IGmaU2FgBkQRhpbgPuOQObWEbHTKtb0PXZIOzm
	Sfch0xoiZJ0LtuZesc8ncS0J3Oc9hwiwrx1y7+KGNpck0OxH0DfKS8HbczaRJFrgNCX255DaceQyA
	Rv5kUxT3Tzv9fc1ZbUUgu2okVyMGDHfLxEf49X1a6px/CP6wELl7p/8VpXdP/TEcKp1mT7W8oNeDt
	mj7p7fVA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52710)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5VU9-000000003vl-1BWv;
	Wed, 25 Mar 2026 21:09:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5VU4-000000006NG-0Nnm;
	Wed, 25 Mar 2026 21:09:48 +0000
Date: Wed, 25 Mar 2026 21:09:47 +0000
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
Subject: Re: [PATCH net-next v9 6/6] net: stmmac: qcom-ethqos: add support
 for sa8255p
Message-ID: <acRPGxx_KbrvUh6t@shell.armlinux.org.uk>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
 <20260316-qcom-sa8255p-emac-v9-6-c58934e76ff2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-6-c58934e76ff2@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13945-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 65CB532C3AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:05:11PM +0100, Bartosz Golaszewski wrote:
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Shouldn't the SerDes driver be doing the power management rather than
the ethernet driver?

We already have the crappy situation with this driver that the stmmac
clocks are not running when they need to be, which is now causing
warnings with the VLAN code. The platform glue driver itself doesn't
_actually_ have enough information on its own to know when it needs
to ensure that the PCS and SerDes need to be operational which is what
is leading to this problem.

Also note that the core stmmac driver does runtime PM management which
covers both the stmmac MDIO block and the core MAC as well. How does
your implementation interact with those, when e.g. a MDIO bus on one
stmmac instance could be used to access a PHY on a different instance.

> +struct ethqos_emac_pd_ctx {
> +	struct dev_pm_domain_list *pd_list;
> +	int serdes_level;

I don't think serdes_level is appropriate nor correct (see below.)

> +static void ethqos_configure_sgmii_pd(struct qcom_ethqos *ethqos,
> +				      phy_interface_t interface, int speed)
> +{
> +	switch (speed) {
> +	case SPEED_2500:
> +	case SPEED_1000:
> +	case SPEED_100:
> +	case SPEED_10:
> +		ethqos->pd.serdes_level = speed;

This is called at mac_link_up(), after mac_finish() has done its
stuff...

> +	}
> +
> +	ethqos_configure_sgmii(ethqos, interface, speed);
> +}
> +
>  static void ethqos_configure(struct qcom_ethqos *ethqos,
>  			     phy_interface_t interface, int speed)
>  {
> @@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	return ret;
>  }
>  
> +static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
> +				       unsigned int mode,
> +				       phy_interface_t interface)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret = 0;
> +
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX)
> +		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);

... which means this won't get called with anything but a stale speed
from the _previous_ link up event.

> +
> +	return ret;
> +}
> +
> +static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +	if (ret < 0)
> +		return ret;
> +
> +	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);

and same here.

The fundamental question arises - why does the power domain need to know
the _media_ speed (which is completely unrelated to the speed at which
the SerDes link operates at) ?

For example, with SGMII, the link operates at 1.25GBaud irrespective of
whether it is operating at an underlying Ethernet data rate of 10M, 100M
or 1G speeds.

To me, the whole "serdes_level" stuff looks completely wrong.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

