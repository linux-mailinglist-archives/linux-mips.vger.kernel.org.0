Return-Path: <linux-mips+bounces-10636-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78FB37627
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 02:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3C07C51B7
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 00:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0021DE8A4;
	Wed, 27 Aug 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U05FXyj1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128971DC997;
	Wed, 27 Aug 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756255210; cv=none; b=BGRwdG3mJiaVT9B4mOBoiUhvTELL00mzHfQRcmbld7lWsDqvXWnqhWuoRMsUDeuEIrTKExPbhQbaca5LL+dKbJDMev3Ek7LqhCOVkpVOGGCnym5l9l9JEK0L7KOJWNKoibzKtwB/MpznNWWY7DcfafSqCC2cJOPmnftIj+INv2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756255210; c=relaxed/simple;
	bh=dGZ2wYBerLgYG3xUDdHol7gEDoSc9y7MhwIAQo1Wsso=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Oz9erZ8wHpIxjkO4yLXUWAhst8ppwlu0m0hWAFbHxrLVoa/u2iP5ia7wdYgZ3vXFMd3TmMGCJoJt4Qm9gBK/N6vnW87dAtj1F9jB90L8JpVM4l+4m9CXRvyu9JTCWPZJy8fLIiASvHp3+8uui//sdQO3U/hAlF7LpQOPe57b2yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U05FXyj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D702BC4CEF4;
	Wed, 27 Aug 2025 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756255209;
	bh=dGZ2wYBerLgYG3xUDdHol7gEDoSc9y7MhwIAQo1Wsso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U05FXyj1G44ix+RrHQyyIvoknDIAbVNruoay9H4OoEpNMZhrR7v8TWKsMS/Jx2gn/
	 zP20CKe2jJjJsDzbghxi9II6SvtejsKVUpdvMO53M1Ejtf0oD9pcU4ao82wr1S8FmV
	 5IfCCKuwS8jJfdooEAaJtbXzM6IlanvuNNn5j84VwnGTE11lGDgXPLPEMBVoEW7Sm4
	 IHF0Q9AnF3TxIb26uKFaWWOqJWX6o7ZADz4fjYwsYFa42MT+oiezq/nqzqzvt1lFyZ
	 kj11a/FDDV/aUgMTWywqZGGHQtayq2kj7HexGFvKUMOXtWaAbbiT09sK6Gob8KTrs3
	 3botVLJ9sm6Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD04383BF70;
	Wed, 27 Aug 2025 00:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use
 addr 0
 and remove return value
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175625521749.151180.6244131462600024014.git-patchwork-notify@kernel.org>
Date: Wed, 27 Aug 2025 00:40:17 +0000
References: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
In-Reply-To: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: gerg@linux-m68k.org, geert@linux-m68k.org, hauke@hauke-m.de,
 zajec5@gmail.com, tsbogend@alpha.franken.de, andrew@lunn.ch,
 andrew+netdev@lunn.ch, linux@armlinux.org.uk, pabeni@redhat.com,
 edumazet@google.com, kuba@kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 22 Aug 2025 22:36:11 +0200 you wrote:
> We have only two users of fixed_phy_add(), both use address 0 and
> ignore the return value. So simplify fixed_phy_add() accordingly.
> 
> Whilst at it, constify the fixed_phy_status configs.
> 
> Note:
> fixed_phy_add() is a legacy function which shouldn't be used in new
> code, as it's use may be problematic:
> - No check whether a fixed phy exists already at the given address
> - If fixed_phy_register() is called afterwards by any other driver,
>   then it will also use phy_addr 0, because fixed_phy_add() ignores
>   the ida which manages address assignment
> Drivers using a fixed phy created by fixed_phy_add() in platform code,
> should dynamically create a fixed phy with fixed_phy_register()
> instead.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: fixed: let fixed_phy_add always use addr 0 and remove return value
    https://git.kernel.org/netdev/net-next/c/39e94fdce45f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



