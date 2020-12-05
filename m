Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049412CFDF1
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 19:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgLEStm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 13:49:42 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:40438 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgLEStl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 5 Dec 2020 13:49:41 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1klYdY-00AMjb-SF; Sat, 05 Dec 2020 15:34:12 +0100
Date:   Sat, 5 Dec 2020 15:34:12 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 net-next 1/2] net: dsa: add optional stats64 support
Message-ID: <20201205143412.GJ2420376@lunn.ch>
References: <20201204145624.11713-1-o.rempel@pengutronix.de>
 <20201204145624.11713-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204145624.11713-2-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 04, 2020 at 03:56:23PM +0100, Oleksij Rempel wrote:
> Allow DSA drivers to export stats64
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
