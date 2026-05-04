Return-Path: <linux-mips+bounces-14431-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kESjBaTT+Gm41AIAu9opvQ
	(envelope-from <linux-mips+bounces-14431-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 19:13:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E704C1CC3
	for <lists+linux-mips@lfdr.de>; Mon, 04 May 2026 19:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803E9303FFFE
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 17:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABA53783C7;
	Mon,  4 May 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhSh+t/Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49A23182D;
	Mon,  4 May 2026 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914655; cv=none; b=eMbtuoK8LNWg0i4ya86Vtw8sUMLTKZp9n3aTmU25yJFGfKuq74Nzti17KowNUWvLDV9xWhC2kaoEKHEaWnX4nY1AsKgCMj65pGFE4Dkq7v0EgBnPfBWuUXcU46YJ54p/l11lrGNefJlQPhhBX9A5FEvjPl20ZitanESE4YYfmtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914655; c=relaxed/simple;
	bh=IkznJVzJ3fBAhwVmXNKJBpwOd2otEHsmGVGrEQ9n+iQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aaF/iBOUgW1aCZCqE/DzA3O7sl0oQOr/yyoL6ssvoWYFJm3RO3I78im4oTmR5PmeGGrJLEyHx5UvD91VWFW4lQvoRFrfLQlFSgtXRbjn71XYACivnCvS4jmttehtkCUIBAWD+fgbUdo+dSF7nn/9Yt8FzSrpgGwt1P2rSyDmcFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhSh+t/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697A8C2BCB8;
	Mon,  4 May 2026 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777914655;
	bh=IkznJVzJ3fBAhwVmXNKJBpwOd2otEHsmGVGrEQ9n+iQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lhSh+t/ZiTt2H2HkvaM82JRVUBvLR7jbvZuL/oTcThDCfukTBYmCOS3qB9qusBOb8
	 cihWlcU4gs7XPds/c+4yhSg2M81WTPXEQIiYJ5CJj5UoQrjWhy8KaH+nCy6XEgp9gk
	 HjT0APZ9S9vrsQpJJcYW+9ykaXFeL1OAJz52gg/kP8wcQ6Za+0UfbK5F6V2umQs7G2
	 KL71+dcsHhcChm8dykTVbVRvRpjjKrWd9GeryO0doIUpi413EdNrYcacZKaT6fx2AE
	 jbfBMtZ+twj0w4ZX/tc/fWB0xwspxrAHCgHAFUwzlEBn5yX6IWIQc1JbsinYfeAQJ6
	 GScnElIBDR13Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EBC3930032;
	Mon,  4 May 2026 17:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bluetooth-next v2] bluetooth: remove all PCMCIA drivers
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177791460656.801187.2564297588269230821.git-patchwork-notify@kernel.org>
Date: Mon, 04 May 2026 17:10:06 +0000
References: <20260503033201.19719-1-enelsonmoore@gmail.com>
In-Reply-To: <20260503033201.19719-1-enelsonmoore@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux@armlinux.org.uk, chenhuacai@kernel.org, kernel@xen0n.name,
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, ebiggers@kernel.org, ardb@kernel.org,
 herbert@gondor.apana.org.au, tytso@mit.edu, andre.draszik@linaro.org,
 geert@linux-m68k.org, kuba@kernel.org, horms@kernel.org,
 johan.korsnes@gmail.com, david@ixit.cz
X-Rspamd-Queue-Id: 83E704C1CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14431-lists,linux-mips=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[vger.kernel.org,armlinux.org.uk,kernel.org,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,holtmann.org,gondor.apana.org.au,mit.edu,linaro.org,linux-m68k.org,ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sat,  2 May 2026 20:31:21 -0700 you wrote:
> PCMCIA is almost completely obsolete (the last computers supporting it
> natively were from ~2009), and the general consensus [1] seems to be
> that support for it should be gradually removed from the kernel.
> 
> In 2023, an initial step of removing all the PCMCIA char drivers was
> taken in commit 9b12f050c76f ("char: pcmcia: remove all the drivers"),
> and that has not been reverted, so it seems logical to continue this
> process by removing more low-hanging fruit.
> 
> [...]

Here is the summary with links:
  - [bluetooth-next,v2] bluetooth: remove all PCMCIA drivers
    https://git.kernel.org/bluetooth/bluetooth-next/c/88cb3906d295

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



