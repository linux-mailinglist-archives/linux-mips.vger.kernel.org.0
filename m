Return-Path: <linux-mips+bounces-12042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F4C33CF6
	for <lists+linux-mips@lfdr.de>; Wed, 05 Nov 2025 03:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63F718C1ACF
	for <lists+linux-mips@lfdr.de>; Wed,  5 Nov 2025 02:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99C3258ED5;
	Wed,  5 Nov 2025 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fabwFNBB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D37E2580F9;
	Wed,  5 Nov 2025 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762311040; cv=none; b=R73Pvk1fbdv+qFyrd04mGNUb3CPOWEBblXq5fNo4X/NzRa5u39qcPw8OXQq5dLSSuEsB048m1tryvO+Rabn+EDfSb5qDs7sEHfy9couC2lVeoEbcBvz8DoMOKs1eJimOtdNnwR2s8dfPyPlGy3RBSe4/3A82uX06BeeggBHYPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762311040; c=relaxed/simple;
	bh=0/4GOCa4yyV3ULuqaMe3d9E9KswCUQgJ6ASZBL0oPAk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RNO9lBel39o0wohPvPkJXx0UCE6LkT0M8F8vrtOnkSbiVreXVvNK9FHaFcIoARPhQP1AyujAn0U3f6C5Cg/s0cSlbkkE8XyIqUSDQqc73PX+sSQeWplyCd3lVHoGQOZk9c6zHXKOMnNYpX57j7STbztLtoAed362ray3PiWfVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fabwFNBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28D5C16AAE;
	Wed,  5 Nov 2025 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762311040;
	bh=0/4GOCa4yyV3ULuqaMe3d9E9KswCUQgJ6ASZBL0oPAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fabwFNBBfSaL5M4OzzY90BPBn+PjG1MTA7p90J7tw/KkZW00eEnTZ68++8+94DKis
	 2T7ECYCZeEFX7ELPV3J0Ic+pWeQqhkbrflv4C2Fs3ka9DqL+zhbnIZogGEvJrFc9Zs
	 xTIuIV7ySHdQaSnyhDaTZP82OlNMzEEkQNGtmfxJGCC4jynZCY/xp7SSnzLIEg8bSe
	 4dUMY8EbY7FM4VkZWKZhBjOK/VlUyPIAC7AeAjnZzumabq0eQTgLsKlkELjnC4bx/b
	 YNiO6qOV2z+iC01lkIUMAVig2s0QQSv9pzqaeAPQluM+Db7UfSF17zMRs97AFj3s4Q
	 yWBpxLWMppfKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE10380AA57;
	Wed,  5 Nov 2025 02:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: phy: remove fixed_phy_add and first its
 users
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176231101375.3070183.15813321540498380390.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 02:50:13 +0000
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: gerg@linux-m68k.org, geert@linux-m68k.org, hauke@hauke-m.de,
 zajec5@gmail.com, tsbogend@alpha.franken.de, michael.chan@broadcom.com,
 wei.fang@nxp.com, shenwei.wang@nxp.com, xiaoning.wang@nxp.com,
 linux@armlinux.org.uk, andrew@lunn.ch, andrew+netdev@lunn.ch,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Oct 2025 22:39:34 +0100 you wrote:
> fixed_phy_add() has a number of problems/disadvantages:
> - It uses phy address 0 w/o checking whether a fixed phy with this
>   address exists already.
> - A subsequent call to fixed_phy_register() would also use phy address 0,
>   because fixed_phy_add() doesn't mark it as used.
> - fixed_phy_add() is used from platform code, therefore requires that
>   fixed phy code is built-in.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: phy: fixed_phy: add helper fixed_phy_register_100fd
    https://git.kernel.org/netdev/net-next/c/c9445e3c0876
  - [net-next,2/6] net: fec: register a fixed phy using fixed_phy_register_100fd if needed
    https://git.kernel.org/netdev/net-next/c/dc86b621e1b4
  - [net-next,3/6] m68k: coldfire: remove creating a fixed phy
    https://git.kernel.org/netdev/net-next/c/0ee21f39c5d8
  - [net-next,4/6] net: b44: register a fixed phy using fixed_phy_register_100fd if needed
    https://git.kernel.org/netdev/net-next/c/10d2f15afba2
  - [net-next,5/6] MIPS: BCM47XX: remove creating a fixed phy
    https://git.kernel.org/netdev/net-next/c/458639c42b7e
  - [net-next,6/6] net: phy: fixed_phy: remove fixed_phy_add
    https://git.kernel.org/netdev/net-next/c/5de9ea1c50f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



