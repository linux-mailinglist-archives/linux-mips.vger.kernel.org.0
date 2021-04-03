Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F329235345D
	for <lists+linux-mips@lfdr.de>; Sat,  3 Apr 2021 16:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhDCOuF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 10:50:05 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:32798 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231681AbhDCOuE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 3 Apr 2021 10:50:04 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lShaw-00Ee1B-9m; Sat, 03 Apr 2021 16:49:50 +0200
Date:   Sat, 3 Apr 2021 16:49:50 +0200
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
Subject: Re: [PATCH net-next v1 2/9] net: dsa: tag_ar9331: detect IGMP and
 MLD packets
Message-ID: <YGiAjngOfDVWz/D7@lunn.ch>
References: <20210403114848.30528-1-o.rempel@pengutronix.de>
 <20210403114848.30528-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403114848.30528-3-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> @@ -31,6 +96,13 @@ static struct sk_buff *ar9331_tag_xmit(struct sk_buff *skb,
>  	__le16 *phdr;
>  	u16 hdr;
>  
> +	if (dp->stp_state == BR_STATE_BLOCKING) {
> +		/* TODO: should we reflect it in the stats? */
> +		netdev_warn_once(dev, "%s:%i dropping blocking packet\n",
> +				 __func__, __LINE__);
> +		return NULL;
> +	}
> +
>  	phdr = skb_push(skb, AR9331_HDR_LEN);
>  
>  	hdr = FIELD_PREP(AR9331_HDR_VERSION_MASK, AR9331_HDR_VERSION);

Hi Oleksij

This change does not seem to fit with what this patch is doing.

I also think it is wrong. You still need BPDU to pass through a
blocked port, otherwise spanning tree protocol will be unstable.

	Andrew
