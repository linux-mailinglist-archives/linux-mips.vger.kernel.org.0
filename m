Return-Path: <linux-mips+bounces-12317-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CEC76F11
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 03:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C605C2AA3E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 02:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336B32DCBF2;
	Fri, 21 Nov 2025 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDaxqjBX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005328506B;
	Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763690451; cv=none; b=ffNXFINGCSWAYdxyxCIevbXi8+3kbV4c4q/JA19X5gW8/79rECZBLA1Lha2SfDlBNYa/fAD77KQ8+cQgDAixzjUxTG6ZDjFtHekQTrrOOX6wTSzWBA1FPCWK9cWbNORXwpOVbLs+OYliUPjDvNmXIPleeCFqIIii714LuWzWCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763690451; c=relaxed/simple;
	bh=oURpXBr3KdDn9PGKvZ71lA/uZ3b0bjDvzcwrD9A6oco=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=taKhiaXc5frHQDNWREm4qxJpFaU8d+KFvCFd7YT6dRWSX70QYKIouNnGJ5sbARKzhOonrgglOi0caruCMPoNNsebcjyMkGWi0kZEPD+SuiO9hNUVgZH5xDQiaMYb4onNngNXlUWxHvyRmABM2GVRSFB3nfXJf7LuIKG+EVKvLxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDaxqjBX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0F3C4CEF1;
	Fri, 21 Nov 2025 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763690450;
	bh=oURpXBr3KdDn9PGKvZ71lA/uZ3b0bjDvzcwrD9A6oco=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RDaxqjBXt1j3UIdjy7D7SVnLs8g7GgWn0u8nIwwGC1fkiNvamtVFDj/FQO/M8D/eh
	 ZYIA8xclzKyMLPZroHugJ3RkCZs5j9pKq0uWtuDFi0aBxiZtSOUzYSr5VSAEob6tbA
	 +24SZmZdWrSItahXVbfOjubhuO2Q9wBLd3uWK8Q1anPuB2bUlhg79qq/F3gvp3PXJe
	 GCBA+D0/jJI9zu1fGsaJShWGCCkqQPKRf5p99z7rHol3XvaTdbp8EZvcxoMvleDjLd
	 cvjpgHB4iUi5H3cdt7LM8reUKZkE25YppGHm/F3OQ8XDVF7CXgsxWVC/aJfF3PxY64
	 b0Fp/3p8/tkTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE07F3A41003;
	Fri, 21 Nov 2025 02:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: pass struct device to init/exit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176369041551.1856901.1355582687378802410.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:00:15 +0000
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
In-Reply-To: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 fustini@kernel.org, edumazet@google.com, wefu@redhat.com, guoren@kernel.org,
 heiko@sntech.de, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jernej.skrabec@gmail.com, keguang.zhang@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 s32@nxp.com, samuel@sholland.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Nov 2025 10:02:56 +0000 you wrote:
> Rather than passing the platform device to the ->init() and ->exit()
> methods, make these methods useful for other devices by passing the
> struct device instead. Update the implementations appropriately for
> this change.
> 
> Move the calls for these methods into the core driver's probe and
> remove methods from the stmmac_platform layer.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: pass struct device to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/85081acc6b11
  - [net-next,2/3] net: stmmac: move probe/remove calling of init/exit
    https://git.kernel.org/netdev/net-next/c/32da89a840e8
  - [net-next,3/3] net: stmmac: rk: convert to init()/exit() methods
    https://git.kernel.org/netdev/net-next/c/1a62894e040d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



