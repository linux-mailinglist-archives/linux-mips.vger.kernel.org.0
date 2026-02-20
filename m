Return-Path: <linux-mips+bounces-13183-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bN63J7zel2nW9gIAu9opvQ
	(envelope-from <linux-mips+bounces-13183-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:10:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D11647D1
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 394273005324
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 04:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1102D7DD4;
	Fri, 20 Feb 2026 04:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzlOe0Jt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2118C03E;
	Fri, 20 Feb 2026 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771560630; cv=none; b=mwYcf/Hhkph2FQR7hFaYx5Q917/B7qT8QCe4K/vXw6l/hW5kQy0Nn98+LtSc03/7vI7ZDS2U161WmRnWHSaz3CCMUSzYlWf8y58d7ISkaHepdtrnKTAaAcML0Sbq6ePJySuil20gbIDlrKy6iQKxcs+wB/N4pRaE9T7BbK2c1w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771560630; c=relaxed/simple;
	bh=gZxt4xZuUjXGGHmHKN+uEL1LSaVN4uFpnXdEPutVfBo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iCY8O5q+W759IKiayu4s6EEdxUNl7AR3CK29U1g8nFSDNBAiDhC/WbBXVLSkJVHfp8GT5SZugFhpQ6EBF6vl040To64nJqrwumpLtxdsGozNdcXMREdfBUEQbmfoDp/E4a862VEef0o9S6i/WDYprqD8/n+n2Jv+RL0Xzcvtn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzlOe0Jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BA7C116D0;
	Fri, 20 Feb 2026 04:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560629;
	bh=gZxt4xZuUjXGGHmHKN+uEL1LSaVN4uFpnXdEPutVfBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MzlOe0JtKCyX1m5ydTdmOVzcXvTdxMfSVFRW1WDwedpZ8p2JQgmRJOZGFUgTlts71
	 Hr60ts3TI6hMa3MEyxinxB57rKfjHU2uxE59BpIu/+eB5f3N+qA9HfZ/y9pxXHSsMe
	 L3ExxJrJPNmdBaRO6LklAWgLCZeMQM4SfZe7oXCSEv7YKA985b7AFKtdTkGKs4O6Cg
	 uqRH8XvnpIhuAXM6oqK780uPGKVGplX4xHqu5H1I49NkIMc68H4gUVOHdiYrMaHLJA
	 Q+bm4rmFxd0LDsuO3oJm/VkUkisIdSk1ra0ERiEMWoHPkm/KA2dJz7OtlmZRoOGqC+
	 GRRuuHhKY8EgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE293809A88;
	Fri, 20 Feb 2026 04:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156063804.189817.17364776119081008453.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:38 +0000
References: <20260103084243.195125-1-ming.jvle@gmail.com>
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
To: Keke Ming <ming.jvle@gmail.com>
Cc: linux-riscv@lists.infradead.org, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13183-lists,linux-mips=lfdr.de,linux-riscv];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email]
X-Rspamd-Queue-Id: BC2D11647D1
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Sat,  3 Jan 2026 16:42:38 +0800 you wrote:
> The use of kmap_atomic/kunmap_atomic is deprecated. The purpose of
> kmap-like functions is to create temporary mappings.
> 
> kmap_atomic() typically disables preemption, while kmap_local_page()
> allows preemption.
> 
> According to the documentation, kmap_atomic() is primarily necessary
> for contexts that cannot sleep.
> 
> [...]

Here is the summary with links:
  - [1/5] riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/a18dfb5dd332
  - [2/5] arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/094cc7bb5fc3
  - [3/5] mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/e6eb9acc024c
  - [4/5] arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/1752a1ad43a1
  - [5/5] uprobes: use kmap_local_page() for temporary page mappings
    https://git.kernel.org/riscv/c/a491c02c2770

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



