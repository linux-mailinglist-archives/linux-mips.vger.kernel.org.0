Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433D712372
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 22:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfEBUgv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 16:36:51 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35461 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBUgv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 16:36:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id y197so4306835wmd.0
        for <linux-mips@vger.kernel.org>; Thu, 02 May 2019 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x0cIw+n3ptQTaDo+6zH4TWhqwAa3P7MjggX6SVQUiS4=;
        b=WUiO8jzf5snjmfRcY3Z8LlvhKMVI+8GhQ5MJupr+F3IlGOFFPKsFLFg9AWgzem/rGp
         MCIxDgky29A7+BhB09by/qKNBS7vDp1+5kXWUdIgWpI69QISf+S+8OyFLF/UCDqS0dXi
         7yKv29RZcv87V2zokCyqW+f2UMFH6roPgD5kHXU3UOYcNPXgbxr+Qujt9q3XtstozvxM
         Syq1sm2fa5vvEDFZqVBE1y56vp+QE5qerWYqU4sk6hbP+6ChhN04+y56jHc1kLyJ+J4G
         sh2B9Z6i3P6BTPjvcpL3dfPFHLKg0++dzsiLXeJkiodHX2hqQzrKTnzjbfeCdMaUJtVy
         3fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x0cIw+n3ptQTaDo+6zH4TWhqwAa3P7MjggX6SVQUiS4=;
        b=aSlp+iWfLmZX9tts2A4LR4ohQc+UkW1PHc51MG02dWGVghl8r+wpla/XVykYgbfIlh
         PYokCj/vOSgiPb9pvqjqh0YRNMWnFVGE42tNXbh6VwM3KS96dEARqOF3pHwzbTtOey7A
         YupIQ78OR61rf/Qg/PPitUMhnEpg+Wh2GWyPKtNX7dQupTvBcISARloxtWcG1JZfiS6+
         uV72fYBAT7NMA2pZ2cNVCPL+2CBA5Oti1LlzS96ZjvjNV2yR8oVJG3J0jiC8mqRSQDpe
         1iesdOolCT+li+sl07TTDQZL7Ht+Jwh74L5GTZTzN1SmlcI7YRPppKKHwNZLM/TWxs4L
         T9GQ==
X-Gm-Message-State: APjAAAXIjq1qwl5GfY0S4x2lbhbfb8HJA6Swrvefgh7GO/n/MyL2mvNE
        WhhyRfIZX7S3jGUxcEXWebnsxw==
X-Google-Smtp-Source: APXvYqwd50KNBd1vEKQnQ15xvFdy8/eVCKFNCvSAM8Ue1a/1xfJiTnE0qbQvZkN7sj3iThVu19NNog==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr3541069wmf.125.1556829409014;
        Thu, 02 May 2019 13:36:49 -0700 (PDT)
Received: from localhost (ip-89-177-126-50.net.upcbroadband.cz. [89.177.126.50])
        by smtp.gmail.com with ESMTPSA id y70sm480946wmc.8.2019.05.02.13.36.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 13:36:48 -0700 (PDT)
Date:   Thu, 2 May 2019 22:36:47 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Joergen Andreasen <joergen.andreasen@microchip.com>
Cc:     netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mscc: ocelot: Implement port policers
 via tc command
Message-ID: <20190502203647.GF2251@nanopsycho>
References: <20190502094029.22526-1-joergen.andreasen@microchip.com>
 <20190502094029.22526-3-joergen.andreasen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502094029.22526-3-joergen.andreasen@microchip.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thu, May 02, 2019 at 11:40:28AM CEST, joergen.andreasen@microchip.com wrote:
>Hardware offload of port policers are now supported via the tc command.
>Supported police parameters are: rate, burst and overhead.

Interesting, you offload matchall cls, yet you don't mention it at all.
Please, do it.


>
>Example:
>
>Add:
>tc qdisc add dev eth3 handle ffff: ingress
>tc filter add dev eth3 parent ffff: prio 1 handle 2		\
>	matchall skip_sw					\
>	action police rate 100Mbit burst 10000 overhead 20
>
>Show:
>tc -s -d qdisc show dev eth3
>tc -s -d filter show dev eth3 ingress
>
>Delete:
>tc filter del dev eth3 parent ffff: prio 1
>tc qdisc del dev eth3 handle ffff: ingress
>
>Signed-off-by: Joergen Andreasen <joergen.andreasen@microchip.com>
>---
> drivers/net/ethernet/mscc/Makefile        |   2 +-
> drivers/net/ethernet/mscc/ocelot.c        |   6 +-
> drivers/net/ethernet/mscc/ocelot.h        |   3 +
> drivers/net/ethernet/mscc/ocelot_police.c | 289 ++++++++++++++++++++++
> drivers/net/ethernet/mscc/ocelot_police.h |  16 ++
> drivers/net/ethernet/mscc/ocelot_tc.c     | 151 +++++++++++
> drivers/net/ethernet/mscc/ocelot_tc.h     |  19 ++
> 7 files changed, 483 insertions(+), 3 deletions(-)
> create mode 100644 drivers/net/ethernet/mscc/ocelot_police.c
> create mode 100644 drivers/net/ethernet/mscc/ocelot_police.h
> create mode 100644 drivers/net/ethernet/mscc/ocelot_tc.c
> create mode 100644 drivers/net/ethernet/mscc/ocelot_tc.h
>
>diff --git a/drivers/net/ethernet/mscc/Makefile b/drivers/net/ethernet/mscc/Makefile
>index cb52a3b128ae..5e694dc1f7f8 100644
>--- a/drivers/net/ethernet/mscc/Makefile
>+++ b/drivers/net/ethernet/mscc/Makefile
>@@ -1,5 +1,5 @@
> # SPDX-License-Identifier: (GPL-2.0 OR MIT)
> obj-$(CONFIG_MSCC_OCELOT_SWITCH) += mscc_ocelot_common.o
> mscc_ocelot_common-y := ocelot.o ocelot_io.o
>-mscc_ocelot_common-y += ocelot_regs.o
>+mscc_ocelot_common-y += ocelot_regs.o ocelot_tc.o ocelot_police.o
> obj-$(CONFIG_MSCC_OCELOT_SWITCH_OCELOT) += ocelot_board.o
>diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
>index d715ef4fc92f..3ec7864d9dc8 100644
>--- a/drivers/net/ethernet/mscc/ocelot.c
>+++ b/drivers/net/ethernet/mscc/ocelot.c
>@@ -943,6 +943,7 @@ static const struct net_device_ops ocelot_port_netdev_ops = {
> 	.ndo_vlan_rx_kill_vid		= ocelot_vlan_rx_kill_vid,
> 	.ndo_set_features		= ocelot_set_features,
> 	.ndo_get_port_parent_id		= ocelot_get_port_parent_id,
>+	.ndo_setup_tc			= ocelot_setup_tc,
> };
> 
> static void ocelot_get_strings(struct net_device *netdev, u32 sset, u8 *data)
>@@ -1663,8 +1664,9 @@ int ocelot_probe_port(struct ocelot *ocelot, u8 port,
> 	dev->netdev_ops = &ocelot_port_netdev_ops;
> 	dev->ethtool_ops = &ocelot_ethtool_ops;
> 
>-	dev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_RXFCS;
>-	dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>+	dev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_RXFCS |
>+		NETIF_F_HW_TC;
>+	dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_TC;
> 
> 	memcpy(dev->dev_addr, ocelot->base_mac, ETH_ALEN);
> 	dev->dev_addr[ETH_ALEN - 1] += port;
>diff --git a/drivers/net/ethernet/mscc/ocelot.h b/drivers/net/ethernet/mscc/ocelot.h
>index ba3b3380b4d0..9514979fa075 100644
>--- a/drivers/net/ethernet/mscc/ocelot.h
>+++ b/drivers/net/ethernet/mscc/ocelot.h
>@@ -22,6 +22,7 @@
> #include "ocelot_rew.h"
> #include "ocelot_sys.h"
> #include "ocelot_qs.h"
>+#include "ocelot_tc.h"
> 
> #define PGID_AGGR    64
> #define PGID_SRC     80
>@@ -458,6 +459,8 @@ struct ocelot_port {
> 
> 	phy_interface_t phy_mode;
> 	struct phy *serdes;
>+
>+	struct ocelot_port_tc tc;
> };
> 
> u32 __ocelot_read_ix(struct ocelot *ocelot, u32 reg, u32 offset);
>diff --git a/drivers/net/ethernet/mscc/ocelot_police.c b/drivers/net/ethernet/mscc/ocelot_police.c
>new file mode 100644
>index 000000000000..b40382dcc748
>--- /dev/null
>+++ b/drivers/net/ethernet/mscc/ocelot_police.c
>@@ -0,0 +1,289 @@
>+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>+/* Microsemi Ocelot Switch TC driver

"TC driver" ? That sounds quite odd...


>+ *
>+ * Copyright (c) 2019 Microsemi Corporation
>+ */
>+
>+#include "ocelot_police.h"
>+
>+#define MSCC_RC(expr)				\
>+	do {					\
>+		int __rc__ = (expr);		\
>+		if (__rc__ < 0)			\
>+			return __rc__;		\
>+	}					\
>+	while (0)

Please don't use macros like this.


>+
>+/* The following two functions do the same as in iproute2 */
>+#define TIME_UNITS_PER_SEC	1000000
>+static unsigned int tc_core_tick2time(unsigned int tick)
>+{
>+	return (tick * (u32)PSCHED_TICKS2NS(1)) / 1000;
>+}
>+
>+static unsigned int tc_calc_xmitsize(u64 rate, unsigned int ticks)
>+{
>+	return div_u64(rate * tc_core_tick2time(ticks), TIME_UNITS_PER_SEC);
>+}
>+
>+enum mscc_qos_rate_mode {
>+	MSCC_QOS_RATE_MODE_DISABLED, /* Policer/shaper disabled */
>+	MSCC_QOS_RATE_MODE_LINE, /* Measure line rate in kbps incl. IPG */
>+	MSCC_QOS_RATE_MODE_DATA, /* Measures data rate in kbps excl. IPG */
>+	MSCC_QOS_RATE_MODE_FRAME, /* Measures frame rate in fps */
>+	__MSCC_QOS_RATE_MODE_END,
>+	NUM_MSCC_QOS_RATE_MODE = __MSCC_QOS_RATE_MODE_END,
>+	MSCC_QOS_RATE_MODE_MAX = __MSCC_QOS_RATE_MODE_END - 1,
>+};
>+
>+/* Round x divided by y to nearest integer. x and y are integers */
>+#define MSCC_ROUNDING_DIVISION(x, y) (((x) + ((y) / 2)) / (y))
>+
>+/* Round x divided by y to nearest higher integer. x and y are integers */
>+#define MSCC_DIV_ROUND_UP(x, y) (((x) + (y) - 1) / (y))
>+
>+/* Types for ANA:POL[0-192]:POL_MODE_CFG.FRM_MODE */
>+#define POL_MODE_LINERATE   0 /* Incl IPG. Unit: 33 1/3 kbps, 4096 bytes */
>+#define POL_MODE_DATARATE   1 /* Excl IPG. Unit: 33 1/3 kbps, 4096 bytes  */
>+#define POL_MODE_FRMRATE_HI 2 /* Unit: 33 1/3 fps, 32.8 frames */
>+#define POL_MODE_FRMRATE_LO 3 /* Unit: 1/3 fps, 0.3 frames */
>+
>+/* Policer indexes */
>+#define POL_IX_PORT    0    /* 0-11    : Port policers */
>+#define POL_IX_QUEUE   32   /* 32-127  : Queue policers  */
>+
>+/* Default policer order */
>+#define POL_ORDER 0x1d3 /* Ocelot policer order: Serial (QoS -> Port -> VCAP) */
>+
>+struct qos_policer_conf {
>+	enum mscc_qos_rate_mode mode;
>+	bool dlb; /* Enable DLB (dual leaky bucket mode */
>+	bool cf;  /* Coupling flag (ignored in SLB mode) */
>+	u32  cir; /* CIR in kbps/fps (ignored in SLB mode) */
>+	u32  cbs; /* CBS in bytes/frames (ignored in SLB mode) */
>+	u32  pir; /* PIR in kbps/fps */
>+	u32  pbs; /* PBS in bytes/frames */
>+	u8   ipg; /* Size of IPG when MSCC_QOS_RATE_MODE_LINE is chosen */
>+};
>+
>+static int qos_policer_conf_set(struct ocelot_port *port,
>+				u32 pol_ix,
>+				struct qos_policer_conf *conf)
>+{
>+	struct ocelot *ocelot = port->ocelot;
>+	u32 cir = 0, cbs = 0, pir = 0, pbs = 0;
>+	u32 cf = 0, cir_ena = 0, frm_mode = 0;
>+	u32 pbs_max = 0, cbs_max = 0;
>+	bool cir_discard = 0, pir_discard = 0;
>+	u8 ipg = 20;
>+	u32 value;
>+
>+	pir = conf->pir;
>+	pbs = conf->pbs;
>+
>+	switch (conf->mode) {
>+	case MSCC_QOS_RATE_MODE_LINE:
>+	case MSCC_QOS_RATE_MODE_DATA:
>+		if (conf->mode == MSCC_QOS_RATE_MODE_LINE) {
>+			frm_mode = POL_MODE_LINERATE;
>+			ipg = min_t(u8, GENMASK(4, 0), conf->ipg);
>+		} else {
>+			frm_mode = POL_MODE_DATARATE;
>+		}
>+		if (conf->dlb) {
>+			cir_ena = 1;
>+			cir = conf->cir;
>+			cbs = conf->cbs;
>+			if (cir == 0 && cbs == 0) {
>+				/* Discard cir frames */
>+				cir_discard = 1;
>+			} else {
>+				cir = MSCC_DIV_ROUND_UP(cir, 100);
>+				cir *= 3; /* 33 1/3 kbps */
>+				cbs = MSCC_DIV_ROUND_UP(cbs, 4096);
>+				cbs = (cbs ? cbs : 1); /* No zero burst size */
>+				cbs_max = 60; /* Limit burst size */
>+				cf = conf->cf;
>+				if (cf)
>+					pir += conf->cir;
>+			}
>+		}
>+		if (pir == 0 && pbs == 0) {
>+			/* Discard PIR frames */
>+			pir_discard = 1;
>+		} else {
>+			pir = MSCC_DIV_ROUND_UP(pir, 100);
>+			pir *= 3;  /* 33 1/3 kbps */
>+			pbs = MSCC_DIV_ROUND_UP(pbs, 4096);
>+			pbs = (pbs ? pbs : 1); /* No zero burst size */
>+			pbs_max = 60; /* Limit burst size */
>+		}
>+		break;
>+	case MSCC_QOS_RATE_MODE_FRAME:
>+		if (pir >= 100) {
>+			frm_mode = POL_MODE_FRMRATE_HI;
>+			pir = MSCC_DIV_ROUND_UP(pir, 100);
>+			pir *= 3;  /* 33 1/3 fps */
>+			pbs = (pbs * 10) / 328; /* 32.8 frames */
>+			pbs = (pbs ? pbs : 1); /* No zero burst size */
>+			pbs_max = GENMASK(6, 0); /* Limit burst size */
>+		} else {
>+			frm_mode = POL_MODE_FRMRATE_LO;
>+			if (pir == 0 && pbs == 0) {
>+				/* Discard all frames */
>+				pir_discard = 1;
>+				cir_discard = 1;
>+			} else {
>+				pir *= 3; /* 1/3 fps */
>+				pbs = (pbs * 10) / 3; /* 0.3 frames */
>+				pbs = (pbs ? pbs : 1); /* No zero burst size */
>+				pbs_max = 61; /* Limit burst size */
>+			}
>+		}
>+		break;
>+	default: /* MSCC_QOS_RATE_MODE_DISABLED */
>+		/* Disable policer using maximum rate and zero burst */
>+		pir = GENMASK(15, 0);
>+		pbs = 0;
>+		break;
>+	}
>+
>+	/* Limit to maximum values */
>+	pir = min_t(u32, GENMASK(15, 0), pir);
>+	cir = min_t(u32, GENMASK(15, 0), cir);
>+	pbs = min_t(u32, pbs_max, pbs);
>+	cbs = min_t(u32, cbs_max, cbs);
>+
>+	value = (ANA_POL_MODE_CFG_IPG_SIZE(ipg) |
>+		 ANA_POL_MODE_CFG_FRM_MODE(frm_mode) |
>+		 (cf ? ANA_POL_MODE_CFG_DLB_COUPLED : 0) |
>+		 (cir_ena ? ANA_POL_MODE_CFG_CIR_ENA : 0) |
>+		 ANA_POL_MODE_CFG_OVERSHOOT_ENA);
>+
>+	ocelot_write_gix(ocelot,
>+			 value,
>+			 ANA_POL_MODE_CFG,
>+			 pol_ix);
>+
>+	ocelot_write_gix(ocelot,
>+			 ANA_POL_PIR_CFG_PIR_RATE(pir) |
>+			 ANA_POL_PIR_CFG_PIR_BURST(pbs),
>+			 ANA_POL_PIR_CFG,
>+			 pol_ix);
>+
>+	ocelot_write_gix(ocelot,
>+			 (pir_discard ? GENMASK(22, 0) : 0),
>+			 ANA_POL_PIR_STATE,
>+			 pol_ix);
>+
>+	ocelot_write_gix(ocelot,
>+			 ANA_POL_CIR_CFG_CIR_RATE(cir) |
>+			 ANA_POL_CIR_CFG_CIR_BURST(cbs),
>+			 ANA_POL_CIR_CFG,
>+			 pol_ix);
>+
>+	ocelot_write_gix(ocelot,
>+			 (cir_discard ? GENMASK(22, 0) : 0),
>+			 ANA_POL_CIR_STATE,
>+			 pol_ix);

I understand that you want to wrap all 5 calls in the same way. But
still, pol_ix does not have to be on a separate line.


>+
>+	return 0;
>+}
>+
>+int ocelot_port_policer_add(struct ocelot_port *port,
>+			    struct tcf_police *p)
>+{
>+	struct ocelot *ocelot = port->ocelot;
>+	struct qos_policer_conf pp;
>+
>+	if (!p)
>+		return -EINVAL;
>+
>+	netdev_dbg(port->dev,

Unnecessary line wrap.


>+		   "result %d ewma_rate %u burst %lld mtu %u mtu_pktoks %lld\n",
>+		   p->params->tcfp_result,
>+		   p->params->tcfp_ewma_rate,
>+		   p->params->tcfp_burst,
>+		   p->params->tcfp_mtu,
>+		   p->params->tcfp_mtu_ptoks);
>+
>+	if (p->params->rate_present)
>+		netdev_dbg(port->dev,

Again, no need to wrap.


>+			   "rate: rate %llu mult %u over %u link %u shift %u\n",
>+			   p->params->rate.rate_bytes_ps,
>+			   p->params->rate.mult,
>+			   p->params->rate.overhead,
>+			   p->params->rate.linklayer,
>+			   p->params->rate.shift);
>+
>+	if (p->params->peak_present)
>+		netdev_dbg(port->dev,

Again, no need to wrap.


>+			   "peak: rate %llu mult %u over %u link %u shift %u\n",
>+			   p->params->peak.rate_bytes_ps,
>+			   p->params->peak.mult,
>+			   p->params->peak.overhead,
>+			   p->params->peak.linklayer,
>+			   p->params->peak.shift);
>+
>+	memset(&pp, 0, sizeof(pp));
>+
>+	if (p->params->tcfp_ewma_rate) {
>+		netdev_err(port->dev, "tcfp_ewma_rate is not supported\n");
>+		return -EOPNOTSUPP;
>+	}
>+	if (p->params->peak_present) {
>+		netdev_err(port->dev, "peakrate is not supported\n");
>+		return -EOPNOTSUPP;
>+	}
>+	if (!p->params->rate_present) {
>+		netdev_err(port->dev, "rate not specified\n");
>+		return -EINVAL;
>+	}
>+	if (p->params->rate.overhead) {
>+		pp.mode = MSCC_QOS_RATE_MODE_LINE;
>+		pp.ipg = p->params->rate.overhead;
>+	} else {
>+		pp.mode = MSCC_QOS_RATE_MODE_DATA;
>+	}
>+
>+	pp.pir = (u32)div_u64(p->params->rate.rate_bytes_ps, 1000) * 8;
>+	pp.pbs = tc_calc_xmitsize(p->params->rate.rate_bytes_ps,
>+				  PSCHED_NS2TICKS(p->params->tcfp_burst));
>+	netdev_dbg(port->dev,

Again, no need to wrap.


>+		   "%s: port %u pir %u kbps, pbs %u bytes, ipg %u bytes\n",
>+		   __func__, port->chip_port, pp.pir, pp.pbs, pp.ipg);
>+
>+	MSCC_RC(qos_policer_conf_set(port, POL_IX_PORT + port->chip_port, &pp));
>+
>+	ocelot_rmw_gix(ocelot,
>+		       ANA_PORT_POL_CFG_PORT_POL_ENA |
>+		       ANA_PORT_POL_CFG_POL_ORDER(POL_ORDER),
>+		       ANA_PORT_POL_CFG_PORT_POL_ENA |
>+		       ANA_PORT_POL_CFG_POL_ORDER_M,
>+		       ANA_PORT_POL_CFG,
>+		       port->chip_port);
>+
>+	return 0;
>+}
>+
>+int ocelot_port_policer_del(struct ocelot_port *port)
>+{
>+	struct ocelot *ocelot = port->ocelot;
>+	struct qos_policer_conf pp;
>+
>+	netdev_dbg(port->dev, "%s: port %u\n", __func__, port->chip_port);
>+
>+	memset(&pp, 0, sizeof(pp));
>+	pp.mode = MSCC_QOS_RATE_MODE_DISABLED;
>+
>+	MSCC_RC(qos_policer_conf_set(port, POL_IX_PORT + port->chip_port, &pp));
>+
>+	ocelot_rmw_gix(ocelot, 0 |
>+		       ANA_PORT_POL_CFG_POL_ORDER(POL_ORDER),
>+		       ANA_PORT_POL_CFG_PORT_POL_ENA |
>+		       ANA_PORT_POL_CFG_POL_ORDER_M,
>+		       ANA_PORT_POL_CFG,
>+		       port->chip_port);
>+
>+	return 0;
>+}
>diff --git a/drivers/net/ethernet/mscc/ocelot_police.h b/drivers/net/ethernet/mscc/ocelot_police.h
>new file mode 100644
>index 000000000000..bc4dc34c684e
>--- /dev/null
>+++ b/drivers/net/ethernet/mscc/ocelot_police.h
>@@ -0,0 +1,16 @@
>+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>+/* Microsemi Ocelot Switch driver
>+ *
>+ * Copyright (c) 2019 Microsemi Corporation
>+ */
>+
>+#ifndef _MSCC_OCELOT_POLICE_H_
>+#define _MSCC_OCELOT_POLICE_H_
>+
>+#include <net/tc_act/tc_police.h>
>+#include "ocelot.h"
>+
>+int ocelot_port_policer_add(struct ocelot_port *port, struct tcf_police *p);
>+int ocelot_port_policer_del(struct ocelot_port *port);
>+
>+#endif /* _MSCC_OCELOT_POLICE_H_ */
>diff --git a/drivers/net/ethernet/mscc/ocelot_tc.c b/drivers/net/ethernet/mscc/ocelot_tc.c
>new file mode 100644
>index 000000000000..97b0a7bf5d06
>--- /dev/null
>+++ b/drivers/net/ethernet/mscc/ocelot_tc.c
>@@ -0,0 +1,151 @@
>+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>+/* Microsemi Ocelot Switch TC driver
>+ *
>+ * Copyright (c) 2019 Microsemi Corporation
>+ */
>+
>+#include "ocelot_tc.h"
>+#include "ocelot_police.h"
>+#include <net/pkt_cls.h>
>+
>+static int ocelot_setup_tc_cls_matchall(struct ocelot_port *port,
>+					struct tc_cls_matchall_offload *f,
>+					bool ingress)
>+{
>+	const struct tc_action *a;
>+	int err;
>+
>+	netdev_dbg(port->dev,

Again, no need to wrap.


>+		   "%s: port %u cookie %lu\n",
>+		   __func__, port->chip_port, f->cookie);
>+	switch (f->command) {
>+	case TC_CLSMATCHALL_REPLACE:
>+		if (!tcf_exts_has_one_action(f->exts)) {
>+			netdev_err(port->dev, "only one action is supported\n");
>+			return -EOPNOTSUPP;
>+		}
>+
>+		a = tcf_exts_first_action(f->exts);
>+
>+		if (is_tcf_police(a)) {
>+			if (!ingress)
>+				return -EOPNOTSUPP;
>+
>+			if (port->tc.police_id &&
>+			    port->tc.police_id != f->cookie) {
>+				netdev_warn(port->dev,

Again, no need to wrap.


>+					    "Only one policer per port is supported\n");
>+				return -EEXIST;
>+			}
>+
>+			err = ocelot_port_policer_add(port, to_police(a));
>+			if (err) {
>+				netdev_err(port->dev, "Could not add policer\n");
>+				return err;
>+			}
>+			port->tc.police_id = f->cookie;
>+			return 0;
>+		} else {
>+			return -EOPNOTSUPP;
>+		}
>+	case TC_CLSMATCHALL_DESTROY:
>+		if (port->tc.police_id != f->cookie)
>+			return -ENOENT;
>+
>+		err = ocelot_port_policer_del(port);
>+		if (err) {
>+			netdev_err(port->dev, "Could not delete policer\n");
>+			return err;
>+		}
>+		port->tc.police_id = 0;
>+		return 0;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static int ocelot_setup_tc_block_cb(enum tc_setup_type type,
>+				    void *type_data,
>+				    void *cb_priv, bool ingress)
>+{
>+	struct ocelot_port *port = cb_priv;
>+
>+	if (!tc_cls_can_offload_and_chain0(port->dev, type_data))
>+		return -EOPNOTSUPP;
>+
>+	switch (type) {
>+	case TC_SETUP_CLSMATCHALL:
>+		netdev_dbg(port->dev, "tc_block_cb: TC_SETUP_CLSMATCHALL %s\n",
>+			   ingress ? "ingress" : "egress");
>+
>+		return ocelot_setup_tc_cls_matchall(port, type_data, ingress);
>+	case TC_SETUP_CLSFLOWER:
>+		netdev_dbg(port->dev, "tc_block_cb: TC_SETUP_CLSFLOWER %s\n",
>+			   ingress ? "ingress" : "egress");
>+
>+		return -EOPNOTSUPP;
>+	default:
>+		netdev_dbg(port->dev, "tc_block_cb: type %d %s\n",
>+			   type,
>+			   ingress ? "ingress" : "egress");
>+
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static int ocelot_setup_tc_block_cb_ig(enum tc_setup_type type,
>+				       void *type_data,
>+				       void *cb_priv)
>+{
>+	return ocelot_setup_tc_block_cb(type, type_data,

Again, no need to wrap.


>+					cb_priv, true);
>+}
>+
>+static int ocelot_setup_tc_block_cb_eg(enum tc_setup_type type,
>+				       void *type_data,
>+				       void *cb_priv)
>+{
>+	return ocelot_setup_tc_block_cb(type, type_data,

Again, no need to wrap.


>+					cb_priv, false);
>+}
>+
>+static int ocelot_setup_tc_block(struct ocelot_port *port,
>+				 struct tc_block_offload *f)
>+{
>+	tc_setup_cb_t *cb;
>+
>+	netdev_dbg(port->dev, "tc_block command %d, binder_type %d\n",
>+		   f->command, f->binder_type);
>+
>+	if (f->binder_type == TCF_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
>+		cb = ocelot_setup_tc_block_cb_ig;
>+	else if (f->binder_type == TCF_BLOCK_BINDER_TYPE_CLSACT_EGRESS)
>+		cb = ocelot_setup_tc_block_cb_eg;
>+	else
>+		return -EOPNOTSUPP;
>+
>+	switch (f->command) {
>+	case TC_BLOCK_BIND:
>+		return tcf_block_cb_register(f->block, cb, port,
>+					     port, f->extack);
>+	case TC_BLOCK_UNBIND:
>+		tcf_block_cb_unregister(f->block, cb, port);
>+		return 0;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+int ocelot_setup_tc(struct net_device *dev, enum tc_setup_type type,
>+		    void *type_data)
>+{
>+	struct ocelot_port *port = netdev_priv(dev);
>+
>+	switch (type) {
>+	case TC_SETUP_BLOCK:
>+		return ocelot_setup_tc_block(port, type_data);
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+	return 0;
>+}
>diff --git a/drivers/net/ethernet/mscc/ocelot_tc.h b/drivers/net/ethernet/mscc/ocelot_tc.h
>new file mode 100644
>index 000000000000..c905b98b6b4c
>--- /dev/null
>+++ b/drivers/net/ethernet/mscc/ocelot_tc.h
>@@ -0,0 +1,19 @@
>+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>+/* Microsemi Ocelot Switch driver
>+ *
>+ * Copyright (c) 2019 Microsemi Corporation
>+ */
>+
>+#ifndef _MSCC_OCELOT_TC_H_
>+#define _MSCC_OCELOT_TC_H_
>+
>+#include <linux/netdevice.h>
>+
>+struct ocelot_port_tc {
>+	unsigned long police_id;
>+};
>+
>+int ocelot_setup_tc(struct net_device *dev, enum tc_setup_type type,
>+		    void *type_data);
>+
>+#endif /* _MSCC_OCELOT_TC_H_ */
>-- 
>2.17.1
>
