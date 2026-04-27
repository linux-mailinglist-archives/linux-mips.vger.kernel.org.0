Return-Path: <linux-mips+bounces-14322-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOulK9mv7mnxwgAAu9opvQ
	(envelope-from <linux-mips+bounces-14322-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 02:37:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA6446BB61
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 02:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F7A4300BD84
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 00:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C037D221DAE;
	Mon, 27 Apr 2026 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJk7is+H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3921257F;
	Mon, 27 Apr 2026 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250261; cv=none; b=XUgJT38dJJ+82r1goTF+4Xxq4frXyoXJSp3M4+OtR2Z0A9o4E4wWaqJVNrFDHKnphMKKeQ5cilRnErs/jSWF+a1l2c8uMi/Mkuh8di2KPxSeN8odLceST14Xk+aiX4QuTm+DM1Ps7tZaM2k5toVG1aiSRLfshSsiIobvyGsJ9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250261; c=relaxed/simple;
	bh=/KQyIIXxBANDbJVbULlbyLCLd8t/G3HnMy/6KaTpJyo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ewf2VnwWykc3txzGyP8C0gDbKJr89hQJzL+RvfTH6l/RDd1C3/WYTaAdJLm280RYLhiy/xF1NMNrQx50cOu62+6BX5cbks4uoFDUJGYXAezDR0lqLpoIHKYwN0YlbIXFrmwWYEEKo5hITnZlnlQG7KEb35JG1ylGUiwSEzzB/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJk7is+H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406E3C2BCAF;
	Mon, 27 Apr 2026 00:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777250261;
	bh=/KQyIIXxBANDbJVbULlbyLCLd8t/G3HnMy/6KaTpJyo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FJk7is+Hy5OEaY3cjP+TfeQwamOc2VwogBDAIxZ6TLjWHWxV8gH6fwuHp/PoxRk2o
	 oi2tIu9jDq9Jdq3ufB6mAx61Z8FkICyEXZ/lO31S38fUgQN4cbtQmLVhXhcaX6/iM+
	 IYBbWSWoOUQtVg9Jg8Aa23MXfOA2RDhAPpnmY+A0J5lEZA9Fa+PDIM8n9pWiMEmO97
	 BQzoIUM8aN6wXZCYhBaoRzEPVIccJ3G7xdcrdnN1dQplAFc7fYwz6i9ME2VIqvrtti
	 V5DlYGI3OnZIrysDCAa8OJDUlXkLM/wE1BHbCnTf8MbKXVzq2Af3ntEnfcNWt3RRHD
	 FZ55/2fAgDeug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA06A38119E5;
	Mon, 27 Apr 2026 00:37:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy
 ATM device drivers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177725021958.2839245.12173011555079376914.git-patchwork-notify@kernel.org>
Date: Mon, 27 Apr 2026 00:36:59 +0000
References: <20260422041846.2035118-1-kuba@kernel.org>
In-Reply-To: <20260422041846.2035118-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, 3chas3@gmail.com, razor@blackwall.org, idosch@nvidia.com,
 jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, geert@linux-m68k.org, ebiggers@kernel.org,
 johannes.berg@intel.com, jonathan.cameron@huawei.com, kees@kernel.org,
 kuniyu@google.com, fourier.thomas@gmail.com, andriy.shevchenko@intel.com,
 rdunlap@infradead.org, akpm@linux-foundation.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bridge@lists.linux.dev, dwmw2@infradead.org
X-Rspamd-Queue-Id: 5CA6446BB61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14322-lists,linux-mips=lfdr.de,netdevbpf];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Apr 2026 21:18:44 -0700 you wrote:
> Remove the ATM protocol modules and PCI/SBUS ATM device drivers
> that are no longer in active use.
> 
> The ATM core protocol stack, PPPoATM, BR2684, and USB DSL modem
> drivers (drivers/usb/atm/) are retained in-tree to maintain PPP
> over ATM (PPPoA) and PPPoE-over-BR2684 support for DSL connections.
> 
> [...]

Here is the summary with links:
  - [net-deletions,v2] net: remove unused ATM protocols and legacy ATM device drivers
    https://git.kernel.org/netdev/net/c/6deb53595092

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



