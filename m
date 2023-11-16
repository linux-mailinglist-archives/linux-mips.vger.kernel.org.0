Return-Path: <linux-mips+bounces-89-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038B7EEA18
	for <lists+linux-mips@lfdr.de>; Fri, 17 Nov 2023 00:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7091C20752
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 23:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ECC321BE;
	Thu, 16 Nov 2023 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWUmcUsO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9AA134BF;
	Thu, 16 Nov 2023 23:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FBD7C433C9;
	Thu, 16 Nov 2023 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700178624;
	bh=iZTHuCWoor6S98kuCs5ovo7lTycGWu73FgexY+9G6bs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SWUmcUsOK11BN37F+HI7fUbMsLqLW+sPxdEC2CN+rACWDAL3tBcMELD9z4q+KxTF0
	 1unyubO0oyh8RB3mlwzIB9RI3zovNGDtI0PHiHOr1UavW3roI7RCQxIGwupEwmzlsZ
	 kwHG+rYz/EIDjhhmnB5Ctmu8wdZIYZ552ksavUMMAOIctVrJzlGgfxy6w/0X4T54HD
	 dws8ebNQZTlOwLfSrxUvO6qZodpZ+ITzTKJ1RsP2N3JxNnQur31MQmRHVyKopSwGAb
	 SZbRVB09EsE26JCeEmIa0K+W4sSMuVjLoHkMB49PJhpXFr+p6snvBoJK5KJN6LQJMg
	 AR9t4MbXd93BA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56C71C4166E;
	Thu, 16 Nov 2023 23:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] stmmac: dwmac-loongson: Add architecture dependency
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170017862435.24110.14803700607535582296.git-patchwork-notify@kernel.org>
Date: Thu, 16 Nov 2023 23:50:24 +0000
References: <20231115115331.19eb0c24@endymion.delvare>
In-Reply-To: <20231115115331.19eb0c24@endymion.delvare>
To: Jean Delvare <jdelvare@suse.de>
Cc: keguang.zhang@gmail.com, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 15 Nov 2023 11:53:31 +0100 you wrote:
> Only present the DWMAC_LOONGSON option on architectures where it can
> actually be used.
> 
> This follows the same logic as the DWMAC_INTEL option.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2] stmmac: dwmac-loongson: Add architecture dependency
    https://git.kernel.org/netdev/net/c/7fbd5fc2b35a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



