Return-Path: <linux-mips+bounces-715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC389810F29
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 12:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7827B281A80
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFFF22F07;
	Wed, 13 Dec 2023 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2XwzqUz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209B22EF1;
	Wed, 13 Dec 2023 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A49CDC433C9;
	Wed, 13 Dec 2023 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702465224;
	bh=qri/w5jLo+6ipU86Kfi+yN99WggNK8P2NJcKN4CB6ok=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U2XwzqUzjWN0yLjzlLhJQc3xMh3Tg0fhZn8qCu9BfIRR5WocEZ1lmz4BKFgAB/VFr
	 zg5A+VDIPe2JK5K3B6DNHg3tebxxKu4nyQ1Q9Gb/S3COrsYLwasZ4Urm66OwOCa6KI
	 L5mT16Tf/Es6CSzqCQvIjGmIY34GGFPJASUBGsJHMYvOHC1AnobfapvffVT6X8dw2m
	 oX4dPOwt/OwsrzbR9vyiahmZt2kOOk70Qzyou/gYYNqc7nctHqnJYJe/HSbaniCJTF
	 P3AS9hZhDeeizkycIvTg0X5SHhfAjKjWQuV0Ds0nw14MSFbYNk0C/Xq5Rpt1U1uAbX
	 MYTYQnc3LpREQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89A83DD4EFD;
	Wed, 13 Dec 2023 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 net 0/3] Some bug fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170246522455.5465.14917728271617814116.git-patchwork-notify@kernel.org>
Date: Wed, 13 Dec 2023 11:00:24 +0000
References: <cover.1702289232.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1702289232.git.siyanteng@loongson.cn>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: andrew@lunn.ch, tsbogend@alpha.franken.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, chenhuacai@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 11 Dec 2023 18:20:32 +0800 you wrote:
> * Put Krzysztof's patch into my thread, pick Conor's Reviewed-by
>   tag and Jiaxun's Acked-by tag.(prev version is RFC patch)
> 
> * I fixed an Oops related to mdio, mainly to ensure that
>   mdio is initialized before use, because it will be used
>   in a series of patches I am working on.
> 
> [...]

Here is the summary with links:
  - [v1,net,1/3] stmmac: dwmac-loongson: Make sure MDIO is initialized before use
    https://git.kernel.org/netdev/net/c/e87d3a1370ce
  - [v1,net,2/3] stmmac: dwmac-loongson: drop useless check for compatible fallback
    https://git.kernel.org/netdev/net/c/31fea092c6f9
  - [v1,net,3/3] MIPS: dts: loongson: drop incorrect dwmac fallback compatible
    https://git.kernel.org/netdev/net/c/4907a3f54b12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



