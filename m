Return-Path: <linux-mips+bounces-9404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44FADF5FB
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 20:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265F83AB207
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 18:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AEA2F547C;
	Wed, 18 Jun 2025 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3Ej2aul"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC5527E07E;
	Wed, 18 Jun 2025 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271636; cv=none; b=m/ipv1+lat+4XK6QaPWvpebdhWzKdi3aRKg8D3zrmzVSOzq0WfzrCugU+TvNadVnL9s8cjWiNlte8dOL0k2t8EmxZ1y3f6qczwky0N0URn0fDmW1oi3qVx6H/1SkAKAk40+HuiwRHEMX6OxRsuzRv7wXVQ9EPVJGYBKt4LMDiNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271636; c=relaxed/simple;
	bh=kpSEGRfAU9fOVbtCMrVZ+rQ1aeDB+P7Ft42jygFEEhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eoa6kcx/8Bki1BB0XhSGv1qmyYRcZJ49nKi2t3Yq1N7uVzHk4bHa+yTIB6KXKMgSj/eVt2/UTgJyn0sEx79rQXaSoSRNls6q72q6gmJ0hqg/tuLsD143We8/7f1O9F/UK9CUvpai8k1Q0o0meX2StZYMGYYJvXJBJ9WuJpQbT24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3Ej2aul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C8EC4CEE7;
	Wed, 18 Jun 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750271636;
	bh=kpSEGRfAU9fOVbtCMrVZ+rQ1aeDB+P7Ft42jygFEEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3Ej2aul6fOJdod+0Bbxj0EYeWA1n+Nq1rRrj2roqfVx8U5wc9HLvaFtQ/Gl+sX87
	 DVlw0BCrspfewDTpmNpbKVx5NKWLTN6j3JaLhozqVKHvBJRbJrAeiHFjzJANJcHvru
	 ady7/4IUV0NdKjQIe1n6y1eQPhCTWlo3fImZ/x7KWqP4G7Pi7Voyo3jMtMZaU7TS1g
	 2Z8fBPysGH7TIfjr3E84ZogDi7vPuFu4iBSlaUrSlAiuJTiQMrAe29qWgU6+tzKTRt
	 Da8MhNQmLQ0fOi+ywjmv1dXi7e4bx7W2YI+ojHWczLCnBetGloAn07w6VGIrBPt1LS
	 EN19s6tQH1ViA==
Date: Wed, 18 Jun 2025 19:33:51 +0100
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
Subject: Re: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource
 only once
Message-ID: <20250618183351.GX1699@horms.kernel.org>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>

On Wed, Jun 18, 2025 at 11:41:14AM +0100, Russell King (Oracle) wrote:
> ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
> which GMAC block is being used. Move this to a separate setup() function
> that only runs at probe time, so it can sensibly behave with an
> unrecognised resource adress. Use this to set a MAC index (id) which is
> then used in place of testing the base address.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


