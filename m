Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05173F1F73
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 19:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbhHSR72 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Aug 2021 13:59:28 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48087 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhHSR70 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Aug 2021 13:59:26 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7CC8FE0005;
        Thu, 19 Aug 2021 17:58:47 +0000 (UTC)
Date:   Thu, 19 Aug 2021 19:58:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH devicetree 2/2] MIPS: mscc: ocelot: mark the phy-mode for
 internal PHY ports
Message-ID: <YR6b15zKkjWFoM1X@piout.net>
References: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
 <20210819170416.2252210-2-vladimir.oltean@nxp.com>
 <20210819171704.z3avr2b5jur6dohl@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819171704.z3avr2b5jur6dohl@skbuf>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19/08/2021 17:17:05+0000, Vladimir Oltean wrote:
> On Thu, Aug 19, 2021 at 08:04:16PM +0300, Vladimir Oltean wrote:
> > The ocelot driver was converted to phylink, and that expects a valid
> > phy_interface_t. Without a phy-mode, of_get_phy_mode returns
> > PHY_INTERFACE_MODE_NA, which is not ideal because phylink rejects that.
> > 
> > The ocelot driver was patched to treat PHY_INTERFACE_MODE_NA as
> > PHY_INTERFACE_MODE_INTERNAL to work with the broken DT blobs, but we
> > should fix the device trees and specify the phy-mode too.
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > ---
> 
> Please note that the pre-phylink driver has this check:
> 
> 		switch (ocelot_port->phy_mode) {
> 		case PHY_INTERFACE_MODE_NA:
> 			(...)
> 		case PHY_INTERFACE_MODE_SGMII:
> 			(...)
> 		case PHY_INTERFACE_MODE_QSGMII:
> 			(...)
> 		default:
> 			dev_err(ocelot->dev,
> 				"invalid phy mode for port%d, (Q)SGMII only\n",
> 				port);
> 			of_node_put(portnp);
> 			err = -EINVAL;
> 			goto out_teardown;
> 		}
> 
> So it does not actually expect PHY_INTERFACE_MODE_INTERNAL and will
> error out.
> 
> Are we okay with the new device tree blobs breaking the old kernel?

From my point of view, newer device trees are not required to work on
older kernel, this would impose an unreasonable limitation and the use
case is very limited.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
