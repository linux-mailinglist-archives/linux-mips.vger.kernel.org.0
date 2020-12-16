Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E083F2DBC89
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 09:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgLPIUt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 03:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPIUt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 03:20:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861E5C061793
        for <linux-mips@vger.kernel.org>; Wed, 16 Dec 2020 00:20:08 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kpS2P-0004jY-8C; Wed, 16 Dec 2020 09:19:57 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kpS2M-00030k-BQ; Wed, 16 Dec 2020 09:19:54 +0100
Date:   Wed, 16 Dec 2020 09:19:54 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
        Vivien Didelot <vivien.didelot@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: qca: ar9331: fix sleeping function called
 from invalid context bug
Message-ID: <20201216081954.xnukvpnustf6mycx@pengutronix.de>
References: <20201211110317.17061-1-o.rempel@pengutronix.de>
 <20201212132558.heoykjrnam4bazp6@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201212132558.heoykjrnam4bazp6@skbuf>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:18:16 up 13 days, 22:24, 21 users,  load average: 0.00, 0.03,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 12, 2020 at 03:25:58PM +0200, Vladimir Oltean wrote:
> On Fri, Dec 11, 2020 at 12:03:17PM +0100, Oleksij Rempel wrote:
> > With lockdep enabled, we will get following warning:
> > 
> >  ar9331_switch ethernet.1:10 lan0 (uninitialized): PHY [!ahb!ethernet@1a000000!mdio!switch@10:00] driver [Qualcomm Atheros AR9331 built-in PHY] (irq=13)
> >  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:935
> >  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 18, name: kworker/0:1
> >  INFO: lockdep is turned off.
> >  irq event stamp: 602
> >  hardirqs last  enabled at (601): [<8073fde0>] _raw_spin_unlock_irq+0x3c/0x80
> >  hardirqs last disabled at (602): [<8073a4f4>] __schedule+0x184/0x800
> >  softirqs last  enabled at (0): [<80080f60>] copy_process+0x578/0x14c8
> >  softirqs last disabled at (0): [<00000000>] 0x0
> >  CPU: 0 PID: 18 Comm: kworker/0:1 Not tainted 5.10.0-rc3-ar9331-00734-g7d644991df0c #31
> >  Workqueue: events deferred_probe_work_func
> >  Stack : 80980000 80980000 8089ef70 80890000 804b5414 80980000 00000002 80b53728
> >          00000000 800d1268 804b5414 ffffffde 00000017 800afe08 81943860 0f5bfc32
> >          00000000 00000000 8089ef70 819436c0 ffffffea 00000000 00000000 00000000
> >          8194390c 808e353c 0000000f 66657272 80980000 00000000 00000000 80890000
> >          804b5414 80980000 00000002 80b53728 00000000 00000000 00000000 80d40000
> >          ...
> >  Call Trace:
> >  [<80069ce0>] show_stack+0x9c/0x140
> >  [<800afe08>] ___might_sleep+0x220/0x244
> >  [<8073bfb0>] __mutex_lock+0x70/0x374
> >  [<8073c2e0>] mutex_lock_nested+0x2c/0x38
> >  [<804b5414>] regmap_update_bits_base+0x38/0x8c
> >  [<804ee584>] regmap_update_bits+0x1c/0x28
> >  [<804ee714>] ar9331_sw_unmask_irq+0x34/0x60
> >  [<800d91f0>] unmask_irq+0x48/0x70
> >  [<800d93d4>] irq_startup+0x114/0x11c
> >  [<800d65b4>] __setup_irq+0x4f4/0x6d0
> >  [<800d68a0>] request_threaded_irq+0x110/0x190
> >  [<804e3ef0>] phy_request_interrupt+0x4c/0xe4
> >  [<804df508>] phylink_bringup_phy+0x2c0/0x37c
> >  [<804df7bc>] phylink_of_phy_connect+0x118/0x130
> >  [<806c1a64>] dsa_slave_create+0x3d0/0x578
> >  [<806bc4ec>] dsa_register_switch+0x934/0xa20
> >  [<804eef98>] ar9331_sw_probe+0x34c/0x364
> >  [<804eb48c>] mdio_probe+0x44/0x70
> >  [<8049e3b4>] really_probe+0x30c/0x4f4
> >  [<8049ea10>] driver_probe_device+0x264/0x26c
> >  [<8049bc10>] bus_for_each_drv+0xb4/0xd8
> >  [<8049e684>] __device_attach+0xe8/0x18c
> >  [<8049ce58>] bus_probe_device+0x48/0xc4
> >  [<8049db70>] deferred_probe_work_func+0xdc/0xf8
> >  [<8009ff64>] process_one_work+0x2e4/0x4a0
> >  [<800a0770>] worker_thread+0x2a8/0x354
> >  [<800a774c>] kthread+0x16c/0x174
> >  [<8006306c>] ret_from_kernel_thread+0x14/0x1c
> > 
> >  ar9331_switch ethernet.1:10 lan1 (uninitialized): PHY [!ahb!ethernet@1a000000!mdio!switch@10:02] driver [Qualcomm Atheros AR9331 built-in PHY] (irq=13)
> >  DSA: tree 0 setup
> > 
> > To fix it, it is better to move access to MDIO register to the .irq_bus_sync_unlock
> > call back.
> > 
> > Fixes: ec6698c272de ("net: dsa: add support for Atheros AR9331 built-in switch")
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> 
> Just from looking at other irqchip drivers, it seems probably ok to do
> your I/O from .irq_bus_sync_unlock.
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

OK, thx!

> But I'm a bit concerned about your ar9331_sw_remove method. Is it safe
> to call these in the following order?
> 
> 	irq_domain_remove(priv->irqdomain);
> 	mdiobus_unregister(priv->mbus);
> 	dsa_unregister_switch(&priv->ds);
> 
> What if a PHY interrupt occurs after the irqdomain was removed and/or
> the master MDIO bus was removed, but before dsa_unregister_switch
> happened, which performed all the phylink teardown?

Good point. It is different bug, i'll send a separate patch for this.

> > changes v2:
> > - fix comment on error
> > 
> >  drivers/net/dsa/qca/ar9331.c | 33 ++++++++++++++++++++++++---------
> >  1 file changed, 24 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
> > index e24a99031b80..4d49c5f2b790 100644
> > --- a/drivers/net/dsa/qca/ar9331.c
> > +++ b/drivers/net/dsa/qca/ar9331.c
> > @@ -159,6 +159,8 @@ struct ar9331_sw_priv {
> >  	struct dsa_switch ds;
> >  	struct dsa_switch_ops ops;
> >  	struct irq_domain *irqdomain;
> > +	u32 irq_mask;
> > +	struct mutex lock_irq;
> >  	struct mii_bus *mbus; /* mdio master */
> >  	struct mii_bus *sbus; /* mdio slave */
> >  	struct regmap *regmap;
> > @@ -520,32 +522,44 @@ static irqreturn_t ar9331_sw_irq(int irq, void *data)
> >  static void ar9331_sw_mask_irq(struct irq_data *d)
> >  {
> >  	struct ar9331_sw_priv *priv = irq_data_get_irq_chip_data(d);
> > -	struct regmap *regmap = priv->regmap;
> > -	int ret;
> >  
> > -	ret = regmap_update_bits(regmap, AR9331_SW_REG_GINT_MASK,
> > -				 AR9331_SW_GINT_PHY_INT, 0);
> > -	if (ret)
> > -		dev_err(priv->dev, "could not mask IRQ\n");
> > +	priv->irq_mask = 0;
> >  }
> >  
> >  static void ar9331_sw_unmask_irq(struct irq_data *d)
> > +{
> > +	struct ar9331_sw_priv *priv = irq_data_get_irq_chip_data(d);
> > +
> > +	priv->irq_mask = AR9331_SW_GINT_PHY_INT;
> > +}
> > +
> > +static void ar9331_sw_irq_bus_lock(struct irq_data *d)
> > +{
> > +	struct ar9331_sw_priv *priv = irq_data_get_irq_chip_data(d);
> > +
> > +	mutex_lock(&priv->lock_irq);
> > +}
> > +
> > +static void ar9331_sw_irq_bus_sync_unlock(struct irq_data *d)
> >  {
> >  	struct ar9331_sw_priv *priv = irq_data_get_irq_chip_data(d);
> >  	struct regmap *regmap = priv->regmap;
> >  	int ret;
> >  
> >  	ret = regmap_update_bits(regmap, AR9331_SW_REG_GINT_MASK,
> > -				 AR9331_SW_GINT_PHY_INT,
> > -				 AR9331_SW_GINT_PHY_INT);
> > +				 AR9331_SW_GINT_PHY_INT, priv->irq_mask);
> >  	if (ret)
> > -		dev_err(priv->dev, "could not unmask IRQ\n");
> > +		dev_err(priv->dev, "failed to change IRQ mask\n");
> > +
> > +	mutex_unlock(&priv->lock_irq);
> >  }
> >  
> >  static struct irq_chip ar9331_sw_irq_chip = {
> >  	.name = AR9331_SW_NAME,
> >  	.irq_mask = ar9331_sw_mask_irq,
> >  	.irq_unmask = ar9331_sw_unmask_irq,
> > +	.irq_bus_lock = ar9331_sw_irq_bus_lock,
> > +	.irq_bus_sync_unlock = ar9331_sw_irq_bus_sync_unlock,
> >  };
> >  
> >  static int ar9331_sw_irq_map(struct irq_domain *domain, unsigned int irq,
> > @@ -584,6 +598,7 @@ static int ar9331_sw_irq_init(struct ar9331_sw_priv *priv)
> >  		return irq ? irq : -EINVAL;
> >  	}
> >  
> > +	mutex_init(&priv->lock_irq);
> >  	ret = devm_request_threaded_irq(dev, irq, NULL, ar9331_sw_irq,
> >  					IRQF_ONESHOT, AR9331_SW_NAME, priv);
> >  	if (ret) {
> > -- 
> > 2.29.2
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
