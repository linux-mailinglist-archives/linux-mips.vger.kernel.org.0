Return-Path: <linux-mips+bounces-13041-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNzrGhPZemkc/AEAu9opvQ
	(envelope-from <linux-mips+bounces-13041-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 04:50:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D6AB827
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 04:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4EE9301F30A
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 03:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F3C3644DD;
	Thu, 29 Jan 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeilFgFe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2803644D0;
	Thu, 29 Jan 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658627; cv=none; b=rIxpyrsTuquj2SCKB0/MFHlYu0BAu2TB+z/u1jgOlw3xwh1TIKsYYCIszJMz8ImEpbtUW/JAF0DEWPWPZ/fwcZ46eK2MYniPMOk3IM3a7rUFZ87gdn6mJmy1fQcPWhE6wYOErkaa4FdUvMRu2u7JmO2kx6kLb/rhDtpn6ghLXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658627; c=relaxed/simple;
	bh=au1YCfGb6P6+eJFrLlqmBI6lSaRhkBliK94BPZ23yHs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W4SCTAecw57jIikf/8/rniskse4arATFn5IQ2pzC+rs99VL/VgiCkUfhHa9+CWPaXXVjdBzTuGmo4ZhMjklLnjDEMrZGSVfIkLseAixRYIJ4qj6KE8/TFB0MHbMB1Z5PNeI05jpapYtvI4wt6RYgeXtmqRLzjJRD3A6U9KBMN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeilFgFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23786C116D0;
	Thu, 29 Jan 2026 03:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769658627;
	bh=au1YCfGb6P6+eJFrLlqmBI6lSaRhkBliK94BPZ23yHs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JeilFgFesQFmR27k/RTvKgBNSx8o+w4sRb2OM/mefdu36Ht2igbMrgf0+xsPVn3Yq
	 PTddzPM2WgkU1QHx8iQxWgSAVsBHTv7OxGM5ixK/G/yTsd2VX4/b9upyaR9YyU98jT
	 R4Fk6qu+Ril4fvlX9Littf2YYFSwp3w4r3wCeJNb6M+fSngB1ajoBxRuaIDhAZEwID
	 eYVWbc0z0irIhIJ9TqzWqODDML5dW+c5fCUWsOEIDqTYO6b+BkoXvgW3RFEJH7eHbh
	 o7EWwIpC1l6cxhMgk8jvUV/J61PJUqAr1/ns/RB2ptDaIU0jV+mgm+RIv5KGHM6/Xg
	 2ObhBZ9cdrHPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BBBA380AA61;
	Thu, 29 Jan 2026 03:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176965862035.2339773.5022435376804374065.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 03:50:20 +0000
References: <20260127135334.qUEaYP9G@linutronix.de>
In-Reply-To: <20260127135334.qUEaYP9G@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org, macro@orcam.me.uk,
 kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13041-lists,linux-mips=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF6D6AB827
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Jan 2026 14:53:34 +0100 you wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this as of commit aef30c8d569c0 ("genirq: Warn
> about using IRQF_ONESHOT without a threaded handler").
> 
> [...]

Here is the summary with links:
  - [net-next,v2] declance: Remove IRQF_ONESHOT
    https://git.kernel.org/netdev/net-next/c/701b40f8bde1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



