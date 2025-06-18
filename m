Return-Path: <linux-mips+bounces-9403-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CAADF5F9
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 20:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557473A4EA9
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 18:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CF12F4A1E;
	Wed, 18 Jun 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzYud4bf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D12F4A13;
	Wed, 18 Jun 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271618; cv=none; b=el3df1VmRcij4paN5K5oK7XF6auyOpBUjM0DudV7u5eO4bBH1iwTC447Ch9wK2h7A0qYPh+1tgT93iAIqYq/f82ykZrvx2EVig9FNBqvRlxVfBeQWxD4rH8YM4xsCG0grdlFQ9IqSk7uWHSZ0JqSoGp849HIk8zf9VqnHN21xb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271618; c=relaxed/simple;
	bh=Qvk01E4K4eKwx+8ladXQ0z7hVsHIb+7XaYBHTXV1Qho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+AKM80dlvk/AaHMTJ+1UHJ3r+PMAgNmJ2zanazKDYd9cv1qGVPFDLaXwOFVHbJuFABSd9211xKMK2vQcERhWk/CDB8hjRSEO2Qjx+O+Rj5hJT3lrAiLW1G5p3orC4bCmHikeIitp2km/cYqgD52HqYpbyd4It9qgLhyWMN1JbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzYud4bf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3F6C4CEE7;
	Wed, 18 Jun 2025 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750271618;
	bh=Qvk01E4K4eKwx+8ladXQ0z7hVsHIb+7XaYBHTXV1Qho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzYud4bftYB9pjydcI4H4I2BpBLdO83lNw+wguQau46tp6Sh0UauAF4ND4tOpOpLP
	 D2/Kf8q0knJy5v0b1oZHaSKTA3P2gFtLrDxnRRjOmXCsfz1C8tnF8niME+kTuWtXav
	 CbT8TSSE6zTs9qIQoa9OQtf98mZ/Lx0dYzZbc2ViKVGru0vTDkM9w9P5HpHA1p16hJ
	 MOBmcZfOBbgBUozS+2zstmeSdPwOdMynK6nwraPDiwIJMJ4eOg6cNdh50DkWoJ19jn
	 ZCw0l0fqTM0wMXyELOFqtPjq5UaoY6mCns0psqj6uWdg+NBrxJ3VthF6OHpaOBqKXd
	 xZvDXhGQThkMA==
Date: Wed, 18 Jun 2025 19:33:33 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <20250618183333.GW1699@horms.kernel.org>
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

Reviewed-by: Simon Horman <horms@kernel.org>


