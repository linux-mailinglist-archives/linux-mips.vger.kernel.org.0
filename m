Return-Path: <linux-mips+bounces-5987-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482C99A373
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 14:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 026081F225BF
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA77021858E;
	Fri, 11 Oct 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMggbeoO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11DD218584;
	Fri, 11 Oct 2024 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648628; cv=none; b=uFnniegYGweYyji/w19RYQWwmGMLJb9jwAxWkvrMnZRfzg7LhkzpQbig4Y3t61RIynefHIkVYbCzhIEx/xii6AuFst7ktUS5claVAJok2cjOHP62QqAuUu15Q9PNXswreZRZFpLQCmmaem1K2CwsErA/utLpcDK1fzDIFfqzm7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648628; c=relaxed/simple;
	bh=QsWhg1lPTy3xAXP6qpwZyfL4P1tilWHSFqdyzad3j40=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hUsuOhkgPWS2BetnPElApjlNIue6BSk/Wfei2wE5tJ2jk6NrLXDfV1xjvx/XOZa8jDU6og6XV3WoTeHek99jHQAzRLBuPwHw6IwnIZGeQTuryL7FSqg3bYK5QvzyFZjcjPF5cR3cOXb11+osNl/fcJIzBx/c8PqC1qwhMoFtXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMggbeoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CD1C4CECC;
	Fri, 11 Oct 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728648627;
	bh=QsWhg1lPTy3xAXP6qpwZyfL4P1tilWHSFqdyzad3j40=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MMggbeoOZIDWYva2gyVPbsA18OBrYiUIncQeNizMo2465ZLLSHcF/mu4zoELbkv8x
	 uFQUbLajDOG5+POY0aHajh6AbNxHYvAbNOD0mSm6O9yD7LpIhTFkyVqy9+zWewFEXC
	 puNTTA31Dp9cjqB0jTahT24oN+/IR1r5gkqNbGPrG+U6kNlnTXY1yTxAjjVRBERK0s
	 +ojLcILDgKUufReYbUHACMWdJysLI8aiL9MyXuqUXIgNVUrSmMy/uM9GLHQepRhoA0
	 tGWNSkQbPenefNhG7PWTvVg/bCctqvhaC34FR/J7l8A793CWYH/4Zxhd7XEbz8cIhF
	 nDvH0pfvn2viA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE33822E4C;
	Fri, 11 Oct 2024 12:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172864863175.2796508.4724823416498296056.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 12:10:31 +0000
References: <20241008154824.1448370-1-kuba@kernel.org>
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 pctammela@mojatatu.com, victor@mojatatu.com, coelacanthushex@gmail.com,
 jhs@mojatatu.com, horms@kernel.org, shannon.nelson@amd.com,
 sd@queasysnail.net, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue,  8 Oct 2024 08:48:24 -0700 you wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] eth: remove the DLink/Sundance (ST201) driver
    https://git.kernel.org/netdev/net-next/c/8401a108a633

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



