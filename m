Return-Path: <linux-mips+bounces-9405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E2ADF6DA
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 21:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8A4E7AC558
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 19:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5988F211A27;
	Wed, 18 Jun 2025 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EaIfnTLG"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B989A1A2632;
	Wed, 18 Jun 2025 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274869; cv=none; b=ZG78nyUZtaPbCqTxp2g/a35SclOz3hSWLv+hYsaPOi586jbvIqJkz+hkcNGzpK1E+CXj4O2pZXSdNjq+Vrp09NIU+WEl0E9UBho/mqKBwpLgE/CQsFL+hWWgqAoyVvx27DjH9OllBQm5XH/kouuuT/CGRMDNH/eWMLzJxVISkTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274869; c=relaxed/simple;
	bh=1ggfQZFdA0UYfQVq+fCP0OtEKwuAY5GutXm6zg7tbfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJr9pm2sHhLcUC+8PP1/wLagY95llI8MGgNHc0sQk9PoxZW/d7Q48lio2pb41bCscNaJw+vOtcM6VFs2sOVvYSnpzOkflLhpz2Kq7Q64J0a01PBJrazaN1PHg5SD3rpg3d+FXbIrZKra9ZLckwgXa89UfNBfawAICwPCCBL2eF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EaIfnTLG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mbpyUcV8WJEkmNQrYOMEQSj4rAFYVKz/rtUgfOJMyew=; b=EaIfnTLGw+4JwC3Kzt5QUG2/YL
	t24i+RjeQafPTa8HWidbHGlIousYnbhxaqPsVwx9Wekyhryw/B+I0T/xRZRIbbklISomjvy5dLIMn
	4OJSC8Y4EJMhQnRFFcpqYfYs/9bXSBXQi0+dlfOtH4Uc85y91CI6/yYxq6Xr2loroqBk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRyRM-00GKRb-Q0; Wed, 18 Jun 2025 21:27:20 +0200
Date: Wed, 18 Jun 2025 21:27:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data
 struct
Message-ID: <ac285b47-ccb0-4f85-8f28-cf0067b1334c@lunn.ch>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>

On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

