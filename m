Return-Path: <linux-mips+bounces-7904-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943EA40372
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2025 00:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36AEE7AC035
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 23:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8876820A5EE;
	Fri, 21 Feb 2025 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTQn3OHI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C702063ED;
	Fri, 21 Feb 2025 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180598; cv=none; b=Sbvv1AX5mglAAMiEggIz34A1M8amenXuMBtxmvVHkHAM0P/pkKWgxN44klCASyx7lKKuW9UAwy5tICEyFM3j8trY3tM+bdJOJ1dq8XBCrQuARRkbM88q9eYnplIbx4gdeBBhrv8RxDiQv3edXLf60IUsaB22dL2vCx3AIbXTrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180598; c=relaxed/simple;
	bh=QH1aVh6GJNS8EGQ01gIO3V3TWWyCjcSXylXpVOrwtU4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JF/2jo0FRycWh+bSuRwJcCgESgHUhlD8jdqaLzB96MUphOaQT9fUFUWFiFfV9sleDi9Onk9gs8QdF1QDUbIS1KMbZIsa+lCJvag4SmU7gilEZorREfA7Bqx0X/xF0iKqlosvm86tTfB1RrM/vcRSysM0GFoZaGCor+2S6AhA6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTQn3OHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA26C4CED6;
	Fri, 21 Feb 2025 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740180597;
	bh=QH1aVh6GJNS8EGQ01gIO3V3TWWyCjcSXylXpVOrwtU4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jTQn3OHI5C2leksk6VxL4GqI8suIaqepfl7HgUjxS079sHHR5vn17TGFhPjSJishd
	 c5tWV8dYb8+pxinV1WteYfT4LuIvsHrFuQjU8LSseV8IVaz4+ee1Nqj9gTYiC0iOCp
	 p5eqA3J8uih4Y5q8yvSHq23CLngMR0eXMdX0NB2qnPrUgMA0k/yV3VVhXM1R7iu5Ne
	 whYXXSpUm5/haYqB9TXKlkOeUxQ/TL0VdDFjNTCQF0SaWp17PQx0vB0Rfsd2lfz+o1
	 f8RmpaDNzSmcsaXso9I3anE3vUX1+Q1jPY0hrHbriS6CVmFqciI+cGuD8BvUQE1wMJ
	 6i3aVB/z+D3XA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFB0380CEEC;
	Fri, 21 Feb 2025 23:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH net-next 0/5] dt-bindings: net: realtek,rtl9301-switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174018062876.2236176.8870349840306866405.git-patchwork-notify@kernel.org>
Date: Fri, 21 Feb 2025 23:30:28 +0000
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Feb 2025 08:52:11 +1300 you wrote:
> This is my attempt at trying to sort out the mess I've created with the RTL9300
> switch dt-bindings. Some context is available on [1] and [2].
> 
> The first patch just moves the binding from mfd/ to net/ (with an adjustment of
> the internal path name). The next two patches are successors to patches already
> sent as part of the series [3]. Finally the last two patches are needed to
> update the in-tree dts to pass `make dtbs_check`, I couldn't figure out a clean
> way of decoupling these `make dtbs_check` will either complain that the dts has
> unexpected properties or that it is missing required properties.
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,1/5] dt-bindings: net: Move realtek,rtl9301-switch to net
    https://git.kernel.org/netdev/net-next/c/3fa337651df5
  - [RESEND,net-next,2/5] dt-bindings: net: Add switch ports and interrupts to RTL9300
    https://git.kernel.org/netdev/net-next/c/92575a218237
  - [RESEND,net-next,3/5] dt-bindings: net: Add Realtek MDIO controller
    https://git.kernel.org/netdev/net-next/c/96757457da0e
  - [RESEND,net-next,4/5] mips: dts: realtek: Add switch interrupts
    (no matching commit)
  - [RESEND,net-next,5/5] mips: dts: cameo-rtl9302c: Add switch block
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



