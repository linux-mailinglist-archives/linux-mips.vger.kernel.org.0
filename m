Return-Path: <linux-mips+bounces-9433-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A3AE0F9C
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 00:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCCF3BFAA3
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33D425DB0A;
	Thu, 19 Jun 2025 22:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIBDh/ku"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845625B67D;
	Thu, 19 Jun 2025 22:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750372183; cv=none; b=j8AcCYHfHauDRNnkeyaI1RB1znnfUFKmHc6mMvYti0LEtDlKQR0Q2WhR1mqXo6xh3UUhpxCNUDzMQZ4Rki5vjT/p4PsLgssD37udSFoWxyWfdWBPzYiWzsqgtscwVyMr1wqp1sESRNF9jg/UmW0d2ZMGbyuM8dNDgiKbd1Hp3xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750372183; c=relaxed/simple;
	bh=MwFEIjokl9M/QFuYv5v20kA6dUf/0XczzCLl9aA4Z1A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rbWLJxmuzFF9g91f6GkGSCF/NBfr2jqksrOXFzHRLB9u+FpTD2t9TWYqaQLxyI9sToFTHQWBG1PkUIAhuodUkMTiJ11ZBSdjvhStO7sPfVP0GqHikOKKtTJoXXJBiWxZEIa8MrTE8FuSFySQqIh0KY6Pe7GriWDn3dP1Dkq4Mlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIBDh/ku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B6DC4CEEA;
	Thu, 19 Jun 2025 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750372183;
	bh=MwFEIjokl9M/QFuYv5v20kA6dUf/0XczzCLl9aA4Z1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eIBDh/ku7vb+pN8M07gOWUtgPTg1Y+zWF220QZTqdKeDkASWSurTjlIXfjg7lbLuB
	 u1wjlrqjmmGI7HXwBhYoyJfVd3MowzLtDrRWw3AE7QOH6v4d0dO8hv4JkACONb2z9V
	 LkZNZUBdvD/xPTA6NRBMmUeLflHsVadQqChcIfsBBLXrap/NYeIyMr1Y3QIB7e4Vgz
	 JMUHiZQNW1+1HrAgue1chXee+IAshfL7iapH3o9A/q/2+4LCWA96SwT6mOiLXJl++b
	 UJVSJCYo8zgLlGGc+LsjOPj8Nid9vTtObLxJujbZO8eKX7mrrw5qG5HCAH8iBsZxr/
	 eVKgCMv7z1oOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C0338111DD;
	Thu, 19 Jun 2025 22:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: loongson1: cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175037221101.1006270.844600930827114048.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:30:11 +0000
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, keguang.zhang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Jun 2025 11:41:18 +0100 you wrote:
> Hi,
> 
> A couple of patches to cleanup loongson1. First, introducing a match
> data struct to allow the per-match data to be extended beyond the init
> function pointer, and then adding a setup method to allow the resource
> base address to be translated to the MAC index at probe time rather
> than repeatedly in the setup function.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: loongson1: provide match data struct
    https://git.kernel.org/netdev/net-next/c/b1cffac4792b
  - [net-next,2/2] net: stmmac: loongson1: get ls1b resource only once
    https://git.kernel.org/netdev/net-next/c/e3527bf4dc33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



