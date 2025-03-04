Return-Path: <linux-mips+bounces-8077-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CAA4D0FC
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 02:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA9B176E08
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 01:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14263156C76;
	Tue,  4 Mar 2025 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyfrOXWw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BCB13D893;
	Tue,  4 Mar 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741051924; cv=none; b=jPpqnbuXw4ilUYShrFRI2avfcHuhJ4fisxHKdvMa1qIcFWqicvFCKkUVEjYrCHu7XsYFpFpmdJYYB3iDKtQFVAkobitmhFCll0rUgb7th8QbbaZ0uJS4PpWhXsiwOdyK87JXlMEXpQ6cgGF/JB7I1H9Zfhb6Qjmd5zAfaa7MXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741051924; c=relaxed/simple;
	bh=1OcsWP6/szj2uz5yKmlKz7hjrxScnDpRzTxzIErkM/w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSeay34Nrb4uxmW0/XEWWQGrKe3udUckZKnLiC4ghcVbIwCh74g5jkBbPof/5KTJ+SKvPm/vYDvuPd4atKvAUQr6HlTYgF8bcXJQHMhS4hvs7ZfU/LlLuSS2dzw0CWi3D2ISjB96FWWRO/WWjME+MgldxsFoqJKWitq1f9EFeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyfrOXWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84EAC4CEE4;
	Tue,  4 Mar 2025 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741051923;
	bh=1OcsWP6/szj2uz5yKmlKz7hjrxScnDpRzTxzIErkM/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AyfrOXWwcLMC8oKCYZcVy2y6yBFL4yws5AmKdwxXBIlqnUqqY0KJh1RbL5EbjMqmK
	 LCQMBTiJi7hVn2t84BNMIb1BCty6eEeNSSgoXHPnK44IFT4LpZGYSrg+wGk5ZlJaTq
	 xW5T8MwRaW1K9PsBZ9SVHcfWj1OmFMvxAx44p+R5HzkyAB2u6ZmQp2nVpQHA4l5M/l
	 fdqTVsxHHvo7VeReNmVTaeKpBe9bhzh+sqBVAgduP/Bl8WU211VYexhg2jDnIKP/v0
	 LsWZRQEq3Eyx0NvEYvUjv4oZ65CW97+KhdnWTInBpZpk3VOD7oQtLkCgp5ikTtUoo/
	 Lx644jYBCCR+Q==
Date: Mon, 3 Mar 2025 17:32:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, sander@svanheule.net, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 0/2] RTL9300 MDIO driver
Message-ID: <20250303173201.4205ed0c@kernel.org>
In-Reply-To: <20250227213248.2010986-1-chris.packham@alliedtelesis.co.nz>
References: <20250227213248.2010986-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Feb 2025 10:32:46 +1300 Chris Packham wrote:
> This series adds a driver for the MDIO controller on the RTL9300 family
> of devices. The controller is a little unique in that we can't access the SMI
> interfaces directly. This means we need to use the hardware description from
> the DTS to compute a mapping of switch port to mdio bus/address.
> 
> The dt-bindings have been applied to net-next.
> 
> I've dropped a patch that added PHYs to the cameo-rtl9302c board as I know that
> will need updating once some of the other in-flight changes make it into
> linux-mips.

Is the second patch going via the mips tree?
If so could you repost just patch 1 for net-next? 
The second patch applies to net-next but with some fuzz, 
I suspect that may be why we're not getting any reviews here.
-- 
pw-bot: cr

