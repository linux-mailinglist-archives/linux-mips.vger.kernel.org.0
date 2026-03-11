Return-Path: <linux-mips+bounces-13577-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAc7HriqsWmzEQAAu9opvQ
	(envelope-from <linux-mips+bounces-13577-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:47:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1D268376
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F14193048053
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 17:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F06333447;
	Wed, 11 Mar 2026 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Mngfxk09"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48B2FD68B;
	Wed, 11 Mar 2026 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251222; cv=none; b=mnPnvXsnHgS9A5xV6TUDJJxQn8QgnMOUZ0edEEiiPYRWCk6cp/FZX4/769sZUpMjyZ+DurhFbwxAm2bMSDYESU+8krzRhL8VDqIAKespQD4pVa9+2915+ea29bA3sH6U0XFKNpeuASc74u5/tAIDVRGJhJPtJlN3R1kRvIq7KF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251222; c=relaxed/simple;
	bh=h6jbeDA9gXyuSmNcuXaj3JWcgu0pBi+oJOGx496T/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AI2yT2Q1OPfpgGNhDfHe1F7uy6ozlTOSzECkdXb88glg7bJczI7IAdrvGgOn92jKBea/IBYPJv9S+TkqdX7+RQNmnlGPoB2qMBUvvkephwHnrJaCDtF9JNYItBIg4/ZZu+lshVUh5x8xaWpAOdaAnxbIUqDLSmoFc8AVu/QclNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Mngfxk09; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vkA02cIf1bCPsbEnaLlFrwiwhwE6F8sIdO8MLg/HiWE=; b=Mngfxk09kt4/krUPKb1Zn6lcvE
	l9OOliC67agWfQrQug9P+Kg4KqL8K9pG1JGagHPp977ZBgRBJPBA6B3n6Nq7ZZjzNhNHBa04Aggd5
	OxtnrJvRSidT247vak7uZRx4sFwM4zso4bxtCfWNXqbI/zKGUIPSu5Xf8u404kZVl3eFXdmVr6G4K
	lO0ZoDXT9gXriqFDdnx8nO6ED36JLZ/Tw859kbvSISGE+Y5EZTdKRfgl8TrhT+cd35X399OGNYGsB
	A9ja4GIOef9lTvNcGssfOGnV0KFRzjeIBBAF4bFnXTDE4eQQekh/xdRvVuaMtrlshIqYyXcwouNb5
	LGP1XvZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0Ndi-000000006l7-0H7T;
	Wed, 11 Mar 2026 17:46:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0Nde-000000006RR-1cKu;
	Wed, 11 Mar 2026 17:46:30 +0000
Date: Wed, 11 Mar 2026 17:46:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
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
Subject: Re: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
Message-ID: <abGqdncKMOweUUwO@shell.armlinux.org.uk>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com>
 <abGizL-uYnahlcEt@shell.armlinux.org.uk>
 <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-13577-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[47];
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
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,shell.armlinux.org.uk:mid,qualcomm.com:email,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: E4C1D268376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:18:00PM +0100, Bartosz Golaszewski wrote:
> On Wed, Mar 11, 2026 at 6:14 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Mar 11, 2026 at 06:03:37PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > In order to drop the dependency on CONFIG_OF, convert all device property
> > > getters from OF-specific to generic device properties and stop pulling
> > > in any linux/of.h symbols.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> > Please postpone this for the time being - I'm trying to get stmmac's
> > pain-in-the-arse PCS support sorted, and I've patch series out there
> > and pending that make a large number of changes to this driver. This
> > is likely to conflict with my work.
> >
> > I'm limited by the rate at which patches can be applied to net-next
> > and the rate at which Mohd can provide me feedback. On that, I notice
> > you haven't Cc'd Mohd who is now in MAINTAINERS for qcom-ethqos.
> >
> 
> Do these two changesets interact with each other a lot? Do you have a
> WIP branch I could take a look at? This has been post-poned several
> times already, there always seem to be some new changes coming in. :/

I don't have a public branch because this work is subject to rework
depending on the feedback I receive. Mohd has another version of the
series that I'm waiting for feedback for. As soon as I hear that it's
fine, I will be sending it.

The problem I refer to has been a pain point for phylink since stmmac
was converted in 2019, which pre-dates qcom-ethqos, the merging of
which has made solving sthis much more painful as qcom-ethqos
completely bypasses phylink by forcing the PCS inband state behind
phylink's back.

Honestly, over recent months, I've been washing that I'd NACK'd the
merging of dwmac-qcom-ethqos at the time over this, but I didn't
have any solution for stmmac at that point (it wasn't my
responsibility, the broken phylink conversion of stmmac was merged
without my knowledge, without even a Cc to me.)

One of the biggest changes that will definitely conflict with your
changes is the move of qcom-ethqos' SerDes support into stmmac core
code - because the stmmac PCS code needs to know whether the SerDes
can support 2.5Gbps speed. I got the changes for the generic PHY part
of that merged last week.

Another change that will conflict is your patch 3, where masses of
changes in qcom_ethqos_probe() which will conflict with my
"net: stmmac: qcom-ethqos: enable 2500BASE-X" patch.

I've posted patches for that a couple of weeks ago, but Mohd reported
problems, so I've had to rework the series - and now those patches
are part of a follow-on series after sorting the bulk of the stmmac
PCS mess.

I'm currently waiting for Mohd's feedback on the reworked series.

https://lore.kernel.org/r/aZ7ggfQanc8jeCb9@shell.armlinux.org.uk
https://lore.kernel.org/r/aafxqCvJ_XY4YbWw@shell.armlinux.org.uk

Latest version waiting for Mohd's feedback:

https://lore.kernel.org/r/aa6sofjFxyi2nkpr@shell.armlinux.org.uk

Below are the two patches which add and convert qcom-ethqos serdes
support. Note that these two depend on other patches.


From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: stmmac: add stmmac core serdes support

Rather than having platform glue implement SerDes PHY support, add it
to the core driver, specifically to the stmmac integrated PCS driver
as the SerDes is connected to the integrated PCS.

Platforms using external PCS can also populate plat->serdes, and the
core driver will call phy_init() and phy_exit() when the administrative
state of the interface changes, but the other phy methods will not be
called.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
rfc->v1: avoid calling phy_get_mode() with NULL serdes PHY
v2: add cleanup when dwmac_serdes_set_mode() fails, so that failure at
  any point in the internal PCS enable method leaves the overall state
  unchanged.
v3: in a pending change to generic PHY documentation indicated by Vinod
  recently, calling phy_set_mode(_ext)() before phy_power_on() will be
  preferred, so re-organise to use that ordering.
v4: move phy_set_mode() into .mac_finish(), add dwmac_has_serdes() to
  make serdes calls conditional on dwmac's active phy interface, with
  the exception of phy_init()/phy_exit() calls.
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 44 +++++++--
 .../ethernet/stmicro/stmmac/stmmac_serdes.c   | 92 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_serdes.h   | 15 +++
 include/linux/stmmac.h                        |  2 +
 6 files changed, 181 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c9263987ef8d..a3c2cd5d0c91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
 	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
-	      stmmac_pcs.o $(stmmac-y)
+	      stmmac_pcs.o stmmac_serdes.o $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 37f6ee7566be..428b2e5bb4c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -49,6 +49,7 @@
 #include "stmmac_fpe.h"
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
 #include <linux/of_mdio.h>
@@ -969,7 +970,7 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
 		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
 				       interface);
 
-	return 0;
+	return dwmac_serdes_set_mode(priv, interface);
 }
 
 static void stmmac_mac_link_down(struct phylink_config *config,
@@ -3592,12 +3593,14 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 
 static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
 {
+	dwmac_serdes_power_on(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 }
 
 static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
 {
 	phylink_rx_clk_stop_unblock(priv->phylink);
+	dwmac_serdes_power_off(priv);
 }
 
 /**
@@ -4153,6 +4156,10 @@ static int stmmac_open(struct net_device *dev)
 	if (ret)
 		goto err_runtime_pm;
 
+	ret = dwmac_serdes_init(priv);
+	if (ret < 0)
+		goto err_disconnect_phy;
+
 	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
 		ret = stmmac_legacy_serdes_power_up(priv);
 		if (ret < 0)
@@ -4172,6 +4179,7 @@ static int stmmac_open(struct net_device *dev)
 
 err_serdes:
 	stmmac_legacy_serdes_power_down(priv);
+	dwmac_serdes_exit(priv);
 err_disconnect_phy:
 	phylink_disconnect_phy(priv->phylink);
 err_runtime_pm:
@@ -4232,6 +4240,7 @@ static int stmmac_release(struct net_device *dev)
 	__stmmac_release(dev);
 
 	stmmac_legacy_serdes_power_down(priv);
+	dwmac_serdes_exit(priv);
 	phylink_disconnect_phy(priv->phylink);
 	pm_runtime_put(priv->device);
 
@@ -7781,6 +7790,13 @@ static int __stmmac_dvr_probe(struct device *device,
 		return -EINVAL;
 	}
 
+	if (plat_dat->serdes &&
+	    (plat_dat->serdes_powerup || plat_dat->serdes_powerdown)) {
+		dev_err(device,
+			"generic PHY and SerDes platform callbacks are incompatible\n");
+		return -EINVAL;
+	}
+
 	ndev = devm_alloc_etherdev_mqs(device, sizeof(struct stmmac_priv),
 				       MTL_MAX_TX_QUEUES, MTL_MAX_RX_QUEUES);
 	if (!ndev)
@@ -8194,6 +8210,15 @@ int stmmac_suspend(struct device *dev)
 
 	rtnl_lock();
 	phylink_suspend(priv->phylink, !!priv->wolopts);
+
+	/* If the MAC has WoL enabled, the SerDes needs to remain active.
+	 * Otherwise, phylink will have stopped the MAC and the PCS will
+	 * have been disabled, meaning the SerDes is already powered off.
+	 * Call its exit function so we can call init during resume.
+	 */
+	if (!priv->wolopts)
+		dwmac_serdes_exit(priv);
+
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
@@ -8290,6 +8315,15 @@ int stmmac_resume(struct device *dev)
 
 	rtnl_lock();
 
+	/* If the MAC has WoL enabled, the SerDes was left active */
+	if (!priv->wolopts) {
+		ret = dwmac_serdes_init(priv);
+		if (ret) {
+			rtnl_unlock();
+			return ret;
+		}
+	}
+
 	/* Prepare the PHY to resume, ensuring that its clocks which are
 	 * necessary for the MAC DMA reset to complete are running
 	 */
@@ -8307,6 +8341,7 @@ int stmmac_resume(struct device *dev)
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		stmmac_legacy_serdes_power_down(priv);
 		mutex_unlock(&priv->lock);
+		dwmac_serdes_exit(priv);
 		rtnl_unlock();
 		return ret;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 0c0eb9e30b95..298d3c00b2fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 
 /*
  * GMAC_AN_STATUS is equivalent to MII_BMSR
@@ -60,8 +61,14 @@ static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
+	int ret;
 
-	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+	ret = dwmac_serdes_power_on(priv);
+	if (ret)
+		return ret;
+
+	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
 
 	return 0;
 }
@@ -69,8 +76,11 @@ static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
+
+	stmmac_mac_irq_modify(priv, spcs->int_mask, 0);
 
-	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+	dwmac_serdes_power_off(priv);
 }
 
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
@@ -220,6 +230,22 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 	return -EINVAL;
 }
 
+static void stmmac_integrated_pcs_check_support(struct stmmac_priv *priv,
+						struct stmmac_pcs *spcs,
+						phy_interface_t interface,
+						unsigned int flag)
+{
+	bool supported;
+
+	if (priv->plat->serdes)
+		supported = dwmac_serdes_validate(priv, interface) == 0;
+	else
+		supported = !flag || priv->plat->flags & flag;
+
+	if (supported)
+		__set_bit(interface, spcs->pcs.supported_interfaces);
+}
+
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 			       const struct stmmac_pcs_info *pcs_info)
 {
@@ -243,13 +269,13 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN)
 		spcs->support_tbi_rtbi = true;
 
-	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_1000BASEX, spcs->pcs.supported_interfaces);
-
-	/* Only allow 2500BASE-X if the SerDes has support. */
-	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
-		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
-			  spcs->pcs.supported_interfaces);
+	stmmac_integrated_pcs_check_support(priv, spcs,
+					    PHY_INTERFACE_MODE_SGMII, 0);
+	stmmac_integrated_pcs_check_support(priv, spcs,
+					    PHY_INTERFACE_MODE_1000BASEX, 0);
+	stmmac_integrated_pcs_check_support(priv, spcs,
+					    PHY_INTERFACE_MODE_2500BASEX,
+					    STMMAC_FLAG_SERDES_SUPPORTS_2500M);
 
 	priv->integrated_pcs = spcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
new file mode 100644
index 000000000000..a767c0553604
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
@@ -0,0 +1,92 @@
+#include <linux/phy/phy.h>
+
+#include "stmmac.h"
+#include "stmmac_serdes.h"
+
+static bool dwmac_has_serdes(struct stmmac_priv *priv)
+{
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		return false;
+
+	return priv->dma_cap.actphyif == PHY_INTF_SEL_SGMII ||
+	       priv->dma_cap.actphyif == PHY_INTF_SEL_TBI ||
+	       priv->dma_cap.actphyif == PHY_INTF_SEL_RTBI;
+}
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+
+	return phy_validate(serdes, PHY_MODE_ETHERNET, interface, NULL);
+}
+
+int dwmac_serdes_init(struct stmmac_priv *priv)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	ret = phy_init(serdes);
+	if (ret)
+		dev_err(priv->device, "failed to initialize SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_power_on(struct stmmac_priv *priv)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	if (!dwmac_has_serdes(priv))
+		return 0;
+
+	ret = phy_power_on(serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power on SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	if (!dwmac_has_serdes(priv))
+		return 0;
+
+	ret = phy_set_mode_ext(serdes, PHY_MODE_ETHERNET, interface);
+	if (ret)
+		dev_err(priv->device,
+			"failed to set SerDes mode %s: %pe\n",
+			phy_modes(interface), ERR_PTR(ret));
+
+	return ret;
+}
+
+void dwmac_serdes_power_off(struct stmmac_priv *priv)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	if (!dwmac_has_serdes(priv))
+		return;
+
+	ret = phy_power_off(serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power off SerDes: %pe\n",
+			ERR_PTR(ret));
+}
+
+void dwmac_serdes_exit(struct stmmac_priv *priv)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	ret = phy_exit(serdes);
+	if (ret)
+		dev_err(priv->device, "failed to shutdown SerDes: %pe\n",
+			ERR_PTR(ret));
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
new file mode 100644
index 000000000000..2ca37a7d0fde
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
@@ -0,0 +1,15 @@
+#ifndef STMMAC_SERDES_H
+#define STMMAC_SERDES_H
+
+#include <linux/phy.h>
+
+struct stmmac_priv;
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface);
+int dwmac_serdes_init(struct stmmac_priv *priv);
+int dwmac_serdes_power_on(struct stmmac_priv *priv);
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface);
+void dwmac_serdes_power_off(struct stmmac_priv *priv);
+void dwmac_serdes_exit(struct stmmac_priv *priv);
+
+#endif
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a8e9b5d3289f..bedba4e23088 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -216,6 +216,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
 
 struct mac_device_info;
+struct phy;
 
 struct plat_stmmacenet_data {
 	enum dwmac_core_type core_type;
@@ -245,6 +246,7 @@ struct plat_stmmacenet_data {
 	 * that phylink uses.
 	 */
 	phy_interface_t phy_interface;
+	struct phy *serdes;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct device_node *mdio_node;
-- 
2.47.3



From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: convert to dwmac core
 SerDes support

Convert qcom-ethqos to use the dwmac core's generic SerDes support,
which will handle SerDes initialisation, powering, and mode setting.

Note that generic support requires the SerDes to support phy_validate()
in order to probe which PHY interface modes are supported, and
phy_set_mode_ext() to configure the appropriate PHY interface mode
(and thus the speed.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 45 ++-----------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9a2194fccb9b..a40a4bca197d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -104,7 +104,6 @@ struct qcom_ethqos {
 			       phy_interface_t interface, int speed);
 
 	struct clk *link_clk;
-	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -627,45 +626,15 @@ static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 	ethqos_configure(ethqos, interface, speed);
 }
 
-static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-	int ret;
-
-	ret = phy_init(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret)
-		phy_exit(ethqos->serdes_phy);
-
-	return ret;
-}
-
-static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
-}
-
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    unsigned int mode,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
-	int ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
-	if (interface == PHY_INTERFACE_MODE_SGMII ||
-	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
-				       interface);
-
-	return ret;
+	return 0;
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -789,9 +758,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	plat_dat->serdes = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(plat_dat->serdes))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->serdes),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -816,12 +785,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.47.3


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

