Return-Path: <linux-mips+bounces-9845-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485CB07D8A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 21:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56A057A5B06
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 19:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4EA29E10F;
	Wed, 16 Jul 2025 19:24:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A8F28D8FB;
	Wed, 16 Jul 2025 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752693860; cv=none; b=qnxs5oyCJjF2ArSS7AXHV3sZmdiQBaNZZXnPA/1FbiUzjUF4EEJRBZWqp2Xi0ijWALVL2dRe+tV7e3ucY43GAS/hRrvJZSoMMX5etzWdaTmymJNQmJfH1TJHuwggunwT3NWQOlFwd7C2pexbLepPE6coVcf7T1XGw+FEEuD6JPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752693860; c=relaxed/simple;
	bh=NN78oOJyGkBNFGAA9HL4Ihk6/u+7E3V4MXrjEqNAP7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgkA7wZQyXVQeEYExCAzQdKNxapnXJBZV4GBxOd/XoZ8YbWAIK/K7/ANzZEVRU3ilSIasLD9Oity9D0heApu8+aJgAo99Ji7Tqzw11yFXCBTTihilyKGWqHNm6ZmOFjL/KPEM3s+ikV+02GxNCAPml/PvTWGqzAc7l4QEFQb4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc7jh-0007Fl-00; Wed, 16 Jul 2025 21:24:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 110E3C0176; Wed, 16 Jul 2025 21:24:02 +0200 (CEST)
Date: Wed, 16 Jul 2025 21:24:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: WangYuli <wangyuli@uniontech.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
	niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
Message-ID: <aHf8Uo2FEcRqus9T@alpha.franken.de>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
 <9ED003291C66C906+94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com>
 <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk>

On Mon, Jul 07, 2025 at 03:57:01PM +0100, Maciej W. Rozycki wrote:
> Hi WangYuli,
> 
> > This is a gentle ping.
> > 
> > I've addressed all the feedback from previous discussions and tried resending
> > multiple times, but haven't received any response
> 
>  Thank you for pinging.
> 
>  I've tried to verify your changes at run time and it's turned out that a 
> generic change to the serial communication subsystem made a while ago has 
> caused the port to become unbootable, and it now crashes early on in port 
> registration.

I'm hitting the same issue for IP22, my dirty hack to get serial console
back is

diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
index 5d1677f1b651..fccb0f1c3cc5 100644
--- a/drivers/tty/serial/serial_base_bus.c
+++ b/drivers/tty/serial/serial_base_bus.c
@@ -78,12 +78,14 @@ static int serial_base_device_init(struct uart_port *port,
 		return -EPROBE_DEFER;
 	}
 
+#if 0
 	if (type == &serial_ctrl_type)
 		return dev_set_name(dev, "%s:%d", dev_name(port->dev), ctrl_id);
 
 	if (type == &serial_port_type)
 		return dev_set_name(dev, "%s:%d.%d", dev_name(port->dev),
 				    ctrl_id, port_id);
+#endif
 
 	return -EINVAL;
 }

I'm not sure, if port->dev needs to be populated now for every serial
port or if there should be a check for port->dev == NULL in the code above...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

