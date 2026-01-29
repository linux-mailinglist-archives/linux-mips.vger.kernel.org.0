Return-Path: <linux-mips+bounces-13043-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOBzG5HpemkV/gEAu9opvQ
	(envelope-from <linux-mips+bounces-13043-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 06:01:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D287ABC79
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 06:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51FDF302E865
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 05:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0712D9780;
	Thu, 29 Jan 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da88MNC9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91581EB5FD;
	Thu, 29 Jan 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769662825; cv=none; b=jvQYIggpc4Ayvb1YyM2Yl6iqfcHWfG4etTvKKyEWY1kVgYukfpaxQ3N3GQ85zL2qUuR+JCEY1nd17BnWpD8wPEDopF9lUod/M+w613N3a8dtXZbWUQxcWbSKA94uvvMPlxggsJ0SW0gMvReVE6YPUgzGLql+0BK094Sk9CqSvf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769662825; c=relaxed/simple;
	bh=U9ISJ2KDjOyPzPKwTm6AD9pt7euDC4veAsPtcj8Du54=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WoeqW4ZdMzaUSQqvArfCYFuLa8CBVndgrxCnLl7f7Z7nB5+wvi5aMfcLni7Ljgi27VmWAkpG78/M2YU5DrnRjqJk/IxaM2Bn0rbhdQT7mfEUUWLUNiyWpgLDflGxxbvGJJKyKUjUNn0E86BzNsF3LejyxyAVrr6kRMYnWA2/DnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da88MNC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECF1C116D0;
	Thu, 29 Jan 2026 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769662825;
	bh=U9ISJ2KDjOyPzPKwTm6AD9pt7euDC4veAsPtcj8Du54=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=da88MNC9sKTq68aX+hdCzQbV7WEIc/oJPndbWzWJbGhOMCmKEsU/MkyVLPl9Z0FTx
	 nQvKUs1Y+JVmAdVmoNoQsHj6WeLv4XzjCS4L4Q2O9evTj9oZPjeFkgbbzt4oJGLypA
	 C7BgDdirTJFNSjpPJNURqh7xSko4RKom22yUHVb+6epWHdGgtaxqij8nQku1PowpFM
	 dwrce6ITTtU9hBCJ/NmFwUMsv8oMlQ5tUGJyQzXiiI8rG7KQopQvWcXk/JT+SZ9bhP
	 EJt6zcPXX08BeTd7xvmNKACuFFYapRimMFMUMqoIJwQLaLNoAuMcdVyYb8EmWfLE4+
	 sbDxglOu2XInA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DAF380AA69;
	Thu, 29 Jan 2026 05:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: neterion: s2io: remove unused
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176966281835.2353118.1929748319198442783.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 05:00:18 +0000
References: <20260126031352.22997-1-enelsonmoore@gmail.com>
In-Reply-To: <20260126031352.22997-1-enelsonmoore@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, corbet@lwn.net, linasvepstas@gmail.com,
 mahesh@linux.ibm.com, oohall@gmail.com, bhelgaas@google.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, andrew+netdev@lunn.ch, akpm@linux-foundation.org,
 martink@posteo.de, pavel@ucw.cz, danishanwar@ti.com,
 mengyuanlou@net-swift.com, pablo@netfilter.org, tiwai@suse.de,
 chenhuacai@kernel.org, tytso@mit.edu, ebiggers@google.com,
 vineethr@linux.ibm.com, sshegde@linux.ibm.com, geert@linux-m68k.org,
 ardb@kernel.org, martin.petersen@oracle.com, fbarrat@linux.ibm.com,
 ajd@linux.ibm.com, herbert@gondor.apana.org.au, kshk@linux.ibm.com,
 vadim.fedorenko@linux.dev, lorenzo@kernel.org, lukas.bulwahn@redhat.com,
 dong100@mucse.com, hkallweit1@gmail.com, tglx@kernel.org, mingo@kernel.org,
 lukas@wunner.de, giovanni.cabiddu@intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,kernel.org,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13043-lists,linux-mips=lfdr.de,netdevbpf];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D287ABC79
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 25 Jan 2026 19:08:07 -0800 you wrote:
> The s2io driver supports Exar (formerly Neterion and S2io) PCI-X 10
> Gigabit Ethernet cards. Hardware supporting PCI-X has not been
> manufactured in years. On x86, it was quickly replaced by PCIe. While
> it stuck around longer on POWER hardware, the last POWER hardware to
> support it was POWER7, which is not supported by ppc64le Linux
> distributions. The last supported mainstream ppc64 Linux distribution
> was RHEL 7; while it is still supported under ELS, ELS is only
> available for x86 and IBM Z. It is possible to use many PCI-X cards in
> standard PCI slots (which are still available on new motherboards), but
> it does not make sense to do so for 10 Gigabit Ethernet because the
> maximum bandwidth of standard PCI is only 1067 Mbps. It is therefore
> highly unlikely that this driver is still being used. Remove the
> driver, and move the former maintainer to the CREDITS file (restoring
> credit for the vxge driver, which was removed in commit f05643a0f60b
> ("eth: remove neterion/vxge").
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: neterion: s2io: remove unused driver
    https://git.kernel.org/netdev/net-next/c/aba0138eb7d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



