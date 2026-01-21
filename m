Return-Path: <linux-mips+bounces-12978-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCubG/BFcGnXXAAAu9opvQ
	(envelope-from <linux-mips+bounces-12978-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 04:20:16 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9ED5058C
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 04:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2AA283877C5
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 03:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D064315D29;
	Wed, 21 Jan 2026 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVonU4WW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3171E51E0;
	Wed, 21 Jan 2026 03:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965608; cv=none; b=BiAfZiOoR1NhkpjtHn58wyZNj9+FLCycReIOAfAqWDSVm9BwouC2p7KJV9PI/cHIzc7rr3ISAkacczBAqVl9ulNWnlgWIMLavjJXjwPsBz4oG8o5Wiq5P/INSfTehF4ibC7m4XXhHOghku45TQL5FzRsTgtC9vZliwBBoI5m3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965608; c=relaxed/simple;
	bh=9Z0XiMnRi8begUH8nIv6a1WfMen8ZxqEfefDwyFTh94=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=osC5WCQkUC3DYFBuctL6BB8LQ2YaI71imcpl38LtljB0Go/xfgTYWOGVr7kquETQnWtm085yBvkFJXCrwC8gWwL2vYkl4u8FqS9ocIq8kGipB6GDt9XEmhBeLkNec5T3KEZ6u1VooFjFhUy7I7RJUWqBv5q9mOG2MCloefhgYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVonU4WW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF969C16AAE;
	Wed, 21 Jan 2026 03:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768965607;
	bh=9Z0XiMnRi8begUH8nIv6a1WfMen8ZxqEfefDwyFTh94=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nVonU4WW5kDQ6IKqYvLA/WcUSp5rSy5EcWgLZN7tYcNvQ7FmLCS8c2XaMu9GDW7ER
	 kEXh8wd2+XwTxLku3w5veRiX/8QIxKx1F7uCefoeGg1RNsK2/lF1BCYw/RaUAtPKBn
	 nvKAda4r0hHxEuu8gl4/brl25vIppZXHOkv9BLdq9fT7Sn04GuQi2Ozs0JCO0Eq12v
	 4L1G/n77z/422xEbCBjIYeRuUguyNbQvuTtLl5M3nosAD2tr+7OYTFJYv8OIQ22tih
	 e5wMQ6epJb4RvISKazrtXxb8C+9HTAGr+G5t9XeWx6OkeqLN8+r/FKqPoq6+njfoqR
	 38qBQXoiaWS9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ED86380820D;
	Wed, 21 Jan 2026 03:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: remove HIPPI support and RoadRunner HIPPI
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176896560511.710718.2129233075354584657.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 03:20:05 +0000
References: <20260119022451.22344-1-enelsonmoore@gmail.com>
In-Reply-To: <20260119022451.22344-1-enelsonmoore@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
 jes@trained-monkey.org, tsbogend@alpha.franken.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 bhelgaas@google.com, horms@kernel.org, dakr@kernel.org,
 kwilczynski@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 akpm@linux-foundation.org, martink@posteo.de, pavel@ucw.cz,
 johan.korsnes@gmail.com, geert@linux-m68k.org, paul@paul-moore.com,
 tytso@mit.edu, kuniyu@google.com, ebiggers@google.com, tglx@linutronix.de,
 mingo@kernel.org, linux@treblig.org
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,trained-monkey.org,alpha.franken.de,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linux-foundation.org,posteo.de,ucw.cz,linux-m68k.org,paul-moore.com,mit.edu,linutronix.de,treblig.org];
	TAGGED_FROM(0.00)[bounces-12978-lists,linux-mips=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 4B9ED5058C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 18 Jan 2026 18:24:04 -0800 you wrote:
> HIPPI has not been relevant for over two decades. It was rapidly
> eclipsed by Fibre Channel, and even when it was new, it was
> confined to very high-end hardware. The HIPPI code has only
> received tree-wide changes and fixes by inspection in the entire
> Git history. Remove HIPPI support and the rrunner HIPPI driver,
> and move the former maintainer to the CREDITS file. Keep the
> include/uapi/linux/if_hippi.h header because it is used by the TUN
> code, and to avoid breaking userspace, however unlikely that may be.
> 
> [...]

Here is the summary with links:
  - [net-next] net: remove HIPPI support and RoadRunner HIPPI driver
    https://git.kernel.org/netdev/net-next/c/d8f87aa5fa0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



