Return-Path: <linux-mips+bounces-13903-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCfOFVgswml5ZwQAu9opvQ
	(envelope-from <linux-mips+bounces-13903-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 07:16:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2B302B73
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 07:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A33E83170ACB
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 06:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0B33B3888;
	Tue, 24 Mar 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbNGnKO/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F713B2FF0;
	Tue, 24 Mar 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332461; cv=none; b=gHEP55UnV3oORaYZDJLhG/5d+UoihlrQVGaaOPsyUACdty9SMEP2yTh+IO5ubyrUOpYUh453MQTUS5E+HTRXER5Z1Rr0OVeC5sx9mc/WwPXuL02VDRUVVaU0nFVWm73CoRRmzNsFV95sGDNLtACx1uQs2gLOYGH2Iv0500XVUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332461; c=relaxed/simple;
	bh=JP9ahby6Ly1VVw7RxM4srHWXaEIozlGHAWmdpUP2jJ8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m+4gFOrew4vBmSjtAcjnjx9sI6nQMgNZDx9zLxXWjYcHaPGyqkkX4Dq43X7dqAAoDdJj4vg/5pB4RlApiwCAkxdy9IFHVo9erlCfojnGRb9Po6AeiEteL5ZRn/zodCQv8dP2F9BQk0EtPObjuhLVJzKF2JXiMT1sbBtjhV5SwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbNGnKO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10D0C2BCB2;
	Tue, 24 Mar 2026 06:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332460;
	bh=JP9ahby6Ly1VVw7RxM4srHWXaEIozlGHAWmdpUP2jJ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UbNGnKO/tp6ai6834ydA1lQ5PukSdo9guTKRu0aT7uQ94/PBq34Vo08i3GzwU1a7R
	 Cjj86a0rKtbPKnF+oVKFGyOV87WahqlGOu4eDV+h+S5j7x4aPhqGuz+E/DJGQoXOGA
	 wBe47f8pbr/WXEHhTZzzJBCJP9XHj+6UqfGOLICI3RcjHw+35Cz5SRZZcw7k7C/zYj
	 XUieDNECgaPKML2nc7pDk7PgesQln2TdJXIciFo+QXEQm2NonZFnC2+3B6gKw1+DHm
	 Z40BPILv5vYzesqn1zNeeb326JjYakJK+jDAuKVLcvEKgQfH7daPPDxWve9mnoaYbH
	 fSR6hO6kwysDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE5D3808200;
	Tue, 24 Mar 2026 06:07:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177433244873.469836.2501898935183219197.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:28 +0000
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, oupton@kernel.org,
 zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, anup@brainfault.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, pbonzini@redhat.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, gustavoars@kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13903-lists,linux-mips=lfdr.de,linux-riscv];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8C2B302B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to riscv/linux.git (for-next)
by Sean Christopherson <seanjc@google.com>:

On Fri,  5 Dec 2025 15:26:55 -0800 you wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> [...]

Here is the summary with links:
  - KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
    https://git.kernel.org/riscv/c/da142f3d373a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



