Return-Path: <linux-mips+bounces-9041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CEABE8E9
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 03:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 440643B59CE
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 01:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6463116CD33;
	Wed, 21 May 2025 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJT4t/1k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F68165F13;
	Wed, 21 May 2025 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790415; cv=none; b=X9NvjP+OFajmG1TLxNX7h2UN5z4ixoHT8XriLMtXucmUOYG67o+qVwyiKPVQ9O+3vC3B4ltR9PWzzIHlGdpL6R9LtRVzkfQsdUx4KIrsASE3xCbXg+4Lfzf/CcOQxJqVBTalux6hhEOPHkgr+0qwjhXHwdj3J7odFyKAUtPTQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790415; c=relaxed/simple;
	bh=J42QwgN71K7lVleEFOdNDdi7sYwtPu6FjJUMG6HIEFo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mTJZq+BGvUa5MwqqVUdAt0nvf1pyfGLV6AAfjCUCmYrdEmwaZKTnwy9JSAKXHn4iChBFIvfcnALGc11wb4093KLgQoF+Y/LHZr+bviBzTHhQfYUHtIcKIGy3+A8wHb403Cw71DcYyrei1TuVj2rogZwh51xmvftc0E9QgaEVKC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJT4t/1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96581C4CEF0;
	Wed, 21 May 2025 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747790414;
	bh=J42QwgN71K7lVleEFOdNDdi7sYwtPu6FjJUMG6HIEFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WJT4t/1kxoSPKUy1x69rtULOXnbjNvc/Qi2JOt7DdEfdRcurMShTXqxj42JQqb2Bu
	 gxag8cc1jM9ebuO2kYAWV6rKjpCqrb+TAF0j2smU3z8x/x0q1Z9kS8iV5B43UQ/kSr
	 WxK+/kpBbZWiVmChxVBw33dAxlcV+3AfRNoDpuEx7+pW0SY5nyyiIQl3P/C1sM0mnY
	 x7D5FPnq3a7iVIDobJdoiTJnRqUDj0ed73QOj9rAcmU3ewKVG07WjSh2QOxkuPcfdf
	 7qe8XQwqbleOxU+hwSAxUiI6MhdPM3NSGFSJcHbRgeqh0R6iwWifO+qy6bsSiMl0Pn
	 bs2dz3sE/2AAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD4D380AAD0;
	Wed, 21 May 2025 01:20:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: phy: fixed_phy: simplifications and
 improvements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174779045049.1526198.18389815848433022265.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 01:20:50 +0000
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
In-Reply-To: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: gerg@linux-m68k.org, geert@linux-m68k.org, hauke@hauke-m.de,
 zajec5@gmail.com, tsbogend@alpha.franken.de, olteanv@gmail.com,
 opendmb@gmail.com, florian.fainelli@broadcom.com, Thangaraj.S@microchip.com,
 Rengarajan.S@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 andrew+netdev@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 17 May 2025 22:33:23 +0200 you wrote:
> This series includes two types of changes:
> - All callers pass PHY_POLL, therefore remove irq argument
> - constify the passed struct fixed_phy_status *status
> 
> Heiner Kallweit (3):
>   net: phy: fixed_phy: remove irq argument from fixed_phy_add
>   net: phy: fixed_phy: remove irq argument from fixed_phy_register
>   net: phy: fixed_phy: constify status argument where possible
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: phy: fixed_phy: remove irq argument from fixed_phy_add
    https://git.kernel.org/netdev/net-next/c/3f1716ee0f6c
  - [net-next,2/3] net: phy: fixed_phy: remove irq argument from fixed_phy_register
    https://git.kernel.org/netdev/net-next/c/d23b4af5df39
  - [net-next,3/3] net: phy: fixed_phy: constify status argument where possible
    https://git.kernel.org/netdev/net-next/c/4ba1c5bb4811

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



