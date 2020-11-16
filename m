Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B528F2B546C
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 23:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgKPWfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 17:35:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:38332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbgKPWfq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 17:35:46 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AB8222447;
        Mon, 16 Nov 2020 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605566146;
        bh=ZwEePHZn12ed5MuPVMfyo7ubFFF+FLNwHaAJMqQ2gVQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nI7zP8oQZ8gfw4vw1Hj5C/wGCKFGUi7R/SfwzQR2jyMIlUqOl085GcCaPCUOkgWWu
         WVl34LnlFHLtHeoGveQt9vhR4X8BjZzXuYJDeyaYzRkPkY9hvByxsFJ+kaHCiVuzs6
         fRyidLWbj56cgkAAM5hImdha2CNYFvEvGkJJT6uc=
Date:   Mon, 16 Nov 2020 14:35:44 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v1 net-next] net: dsa: qca: ar9331: add ethtool stats
 support
Message-ID: <20201116143544.036baf58@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201116222146.znetv5u2q2q2vk2j@skbuf>
References: <20201115073533.1366-1-o.rempel@pengutronix.de>
        <20201116133453.270b8db5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <20201116222146.znetv5u2q2q2vk2j@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 17 Nov 2020 00:21:46 +0200 Vladimir Oltean wrote:
> On Mon, Nov 16, 2020 at 01:34:53PM -0800, Jakub Kicinski wrote:
> > You must expose relevant statistics via the normal get_stats64 NDO
> > before you start dumping free form stuff in ethtool -S.  
> 
> Completely agree on the point, Jakub, but to be honest we don't give him
> that possibility within the DSA framework today, see .ndo_get_stats64 in
> net/dsa/slave.c which returns the generic dev_get_tstats64 implementation,
> and not something that hooks into the hardware counters, or into the
> driver at all, for that matter.

Simple matter of coding, right? I don't see a problem.

Also I only mentioned .ndo_get_stats64, but now we also have stats in
ethtool->get_pause_stats.

> But it's good that you raise the point, I was thinking too that we
> should do better in terms of keeping the software counters in sync with
> the hardware. But what would be a good reference for keeping statistics
> on an offloaded interface? Is it ok to just populate the netdev counters
> based on the hardware statistics?

IIRC the stats on the interface should be a sum of forwarded in software
and in hardware. Which in practice means interface HW stats are okay,
given eventually both forwarding types end up in the HW interface
(/MAC block).

> And what about the statistics gathered
> today in software, could we return them maybe via something like ifstat
> --extended=cpu_hits?

Yup, exactly, that's what --extended=cpu_hits is for.
