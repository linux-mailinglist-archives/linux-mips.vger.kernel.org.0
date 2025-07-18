Return-Path: <linux-mips+bounces-9860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182EB0A675
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 16:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A911C81228
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 14:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FE22DAFD4;
	Fri, 18 Jul 2025 14:38:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA07B299957;
	Fri, 18 Jul 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849523; cv=none; b=iiQIUHzsJ70jKadpjdAcdo3r3RPOGE7xq9uZdh0WEikMoyWPbkzLoPaacECU1CtwB7RfBfsWruAg7rJ6DLMp6QPgaHkQsBtVFeai5wHjS7Xm3NgDPUfwkPRkie/dHBGTfq2bvrGoueTpk5MowOwOwKuL4RfTSwM6otxnaU4Z3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849523; c=relaxed/simple;
	bh=M2Rs9nEmlRwQkjguAbsBhJKM8UD3vMaQsOUjtvpGNmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KVkbLcnrqDK0l3enPQ+ULrku4QFXqgDg7SHPqeKs0Cqs+NKmu0AQjQnmr/lm0RJ7ynk9nLWOYui1Y2pZQosdTluNHJ3bj6oQDQAuLQHXE5Z5IvfBAw12hTFodCak4Op+OkyUaf+vpzahf+6ylzZJqDZpUc+/jzHIwBpQ9hrRsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3E02192009C; Fri, 18 Jul 2025 16:38:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3986A92009B;
	Fri, 18 Jul 2025 15:38:39 +0100 (BST)
Date: Fri, 18 Jul 2025 15:38:39 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@uniontech.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
    niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
In-Reply-To: <aHf8Uo2FEcRqus9T@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2507181530310.21783@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <9ED003291C66C906+94d03a66-3573-4e3f-aaac-d7c55f750776@uniontech.com> <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk> <aHf8Uo2FEcRqus9T@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Thomas Bogendoerfer wrote:

> >  I've tried to verify your changes at run time and it's turned out that a 
> > generic change to the serial communication subsystem made a while ago has 
> > caused the port to become unbootable, and it now crashes early on in port 
> > registration.
> 
> I'm hitting the same issue for IP22, my dirty hack to get serial console
> back is
> 
> diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
> index 5d1677f1b651..fccb0f1c3cc5 100644
> --- a/drivers/tty/serial/serial_base_bus.c
> +++ b/drivers/tty/serial/serial_base_bus.c
> @@ -78,12 +78,14 @@ static int serial_base_device_init(struct uart_port *port,
>  		return -EPROBE_DEFER;
>  	}
>  
> +#if 0
>  	if (type == &serial_ctrl_type)
>  		return dev_set_name(dev, "%s:%d", dev_name(port->dev), ctrl_id);
>  
>  	if (type == &serial_port_type)
>  		return dev_set_name(dev, "%s:%d.%d", dev_name(port->dev),
>  				    ctrl_id, port_id);
> +#endif
>  
>  	return -EINVAL;
>  }
> 
> I'm not sure, if port->dev needs to be populated now for every serial
> port or if there should be a check for port->dev == NULL in the code above...

 Thanks for your report.  I don't know what the exact root cause is with 
IP22, but with the DECstation configurations it's clearly a technical debt 
that needs to be paid now, by switching the respective core drivers to use 
platform devices for probing.

 We've had basic infrastructure for a while already, so I just need to 
fill the gaps there.  This will help the reuse of zs.c for the Alpha port 
as well (and dz.c could be reused for the VAX port this way, but I guess 
that won't ever happen as there's too much effort needed and too little 
manpower available to revive it).

 I'm off for a week now and will look into it sometime once I'm back.

  Maciej

