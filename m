Return-Path: <linux-mips+bounces-15377-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/jvMC9eRGqftgoAu9opvQ
	(envelope-from <linux-mips+bounces-15377-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 02:24:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C156A6E8E7F
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 02:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ObWHs0AG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15377-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15377-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EA143023331
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 00:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001D023D7DC;
	Wed,  1 Jul 2026 00:20:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C948B219FC;
	Wed,  1 Jul 2026 00:20:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782865238; cv=none; b=a8gjReFo99C988Y7P+3vz9rFdwFa+iHGyCXzrvZTeCBXqrvNebQUD5RRhu31Fd7qve7CzQN+q+OJkux8TZFxfAYjWFiEiKCyAOdgVaxFhNmPww2Z0m4z5YX79Gynvu6iGB/pExmvZcFAWQgF8QQM0xb2g0n7maydoDUFTsxAUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782865238; c=relaxed/simple;
	bh=+MtWZEI7sL4Gq/hiLtL10JPVTljMjqSYfZ8RhHj2i3k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JBHFiPTUnQ3bKAXsKrsoVc1AMFIDRO9DVUryU/VwJCPfIzMXF4w78FHNVqrpqnpyFmk6X1fg3wvR0+mHVAOZ796aKn+HFcidJfzn10z1zQNpYKLfhfvKCOkAevANcsvxOFXkwJYEulQI26G0F5PACgnymfJ1LFao6eyWcfN9zIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObWHs0AG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF351F000E9;
	Wed,  1 Jul 2026 00:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782865237;
	bh=8ha5HOs0BA1n/WIGjOEKvG8bb7gqGwHOZP3aqkyKxe4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ObWHs0AG8s9kpOgHRWK6ESc/Pm1UJVfCjGwmckBw7pxuL9P4uE++5mu4UN8CE/ujB
	 37wH0opS9tu0xMY7e7dMWLVVSVfkN1tK2ueCJstgmPvRM52SXUVKKEr7sSctDeam32
	 d6JyPDDba3eCyv4jJhDqaH8OCzfWM8I1hIenA6xyGo410u/OsR9i95dpt6yz+9vNvm
	 cTI0QD7OHPh1hz86ElUdmGqZnKvf5XFecmEXbQcbE4P1ao2z5SwsnDuTVZdHUNH0Iv
	 9bpbtL/o1gytGPrYv0BNMp4HDWoyNzLt8YSJ2SLswadCuOXbweJORIWDVbSgnZTYog
	 OLtKUA4BmRBDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B2F393A963;
	Wed,  1 Jul 2026 00:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sgi: ioc3-eth: unregister netdev before freeing
 DMA
 rings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178286522113.349616.415560228684093854.git-patchwork-notify@kernel.org>
Date: Wed, 01 Jul 2026 00:20:21 +0000
References: <40CD736C4911C181+20260629085053.964383-1-raoxu@uniontech.com>
In-Reply-To: <40CD736C4911C181+20260629085053.964383-1-raoxu@uniontech.com>
To: Xu Rao <raoxu@uniontech.com>
Cc: tsbogend@alpha.franken.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15377-lists,linux-mips=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:raoxu@uniontech.com,m:tsbogend@alpha.franken.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C156A6E8E7F

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Jun 2026 16:50:53 +0800 you wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> ioc3eth_remove() frees the coherent RX and TX descriptor rings before
> unregistering the netdev. If the interface is running,
> unregister_netdev() invokes ioc3_close() through ndo_stop.
> 
> ioc3_close() stops the device and then calls ioc3_free_rx_bufs() and
> ioc3_clean_tx_ring(). Both cleanup functions access descriptors in the
> rings, so the current ordering causes CPU accesses to freed coherent
> memory. Until ioc3_stop() disables RX and TX DMA, the device may also
> continue using the freed ring addresses.
> 
> [...]

Here is the summary with links:
  - [net] net: sgi: ioc3-eth: unregister netdev before freeing DMA rings
    https://git.kernel.org/netdev/net-next/c/18a28f3e107e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



