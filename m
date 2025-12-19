Return-Path: <linux-mips+bounces-12517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3734CCEEC2
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 09:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DC59303ACA1
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 08:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B612E92B7;
	Fri, 19 Dec 2025 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaLW4S1t"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB72E2846;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131992; cv=none; b=oNZ0GlqcgKn6CrKtrpaDLEIiIP4YVB1/OCPsSlEQViA0OxLCLPdUaE3JVQNrsOF9DIFOpMY3UoDfUx3z2XTwr+P6u0cEY3B8AdSTOqCyOxUHsyJPgpQ2xl38qmO50viYcnCXGw9QfsiNvtwvEego7U4yHMoRbqeSVlmGJjideVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131992; c=relaxed/simple;
	bh=VHoS82AXfCFO1ejAKfSVVHRYub84nw1PWg6S5l2Exag=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LVY5QcYHJVQ/+GlT0peSC2qjl4+57jHjORYXl8ctxeFj8fNIDujNxL6/tW3OeD9tRy/eC54+jnKQOQZJ+ONO89ndzDK3aXGzGGmcJFxtObUFG5FQjVutsppPnovYIkAtWLVK95XU2/gQ5Z8NcLemybnzLLFJUIPfI393BRKMxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaLW4S1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830A6C4CEF1;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131991;
	bh=VHoS82AXfCFO1ejAKfSVVHRYub84nw1PWg6S5l2Exag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IaLW4S1tN6Y5d0CEwtYrP7pEFFatg4+zyVk42le/G1ucAiucsqwdqRrXSmIZwetfz
	 2zs60fMbWBsq8viNHscFfmAKLsGTsX8ViZtlMfKG9WYxS113c6NsRFI8XmO0QqXa/c
	 G0kwrN1ENE+XMTcx1FH3lNlIq0qG47mawO0dWLcFaANMO7XG7pRpYaBN+N0AlY0L56
	 ULFhlpqrcbAvM1rLyzbhF9iEwedS5paG2uV9+u0arVl40hVQMgM6e0mGyCZneg8EU8
	 smrcfl6UIkPgQ9go9rjfopU/D3bUCirJ/35nYbjYY0piCkggs9AMgBsGaHp6htqpnM
	 PkespiJB9S78Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C24380AA50;
	Fri, 19 Dec 2025 08:10:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613180027.3684357.16322390150390680475.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:00 +0000
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@codeaurora.org
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org,
 nicolas.schier@linux.dev, nsc@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, tsbogend@alpha.franken.de, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, davem@davemloft.net, andreas@gaisler.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Nicolas Schier <nsc@kernel.org>:

On Tue, 14 Oct 2025 15:05:15 +0200 you wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
    https://git.kernel.org/riscv/c/d81d9d389b9b
  - [v2,02/10] init: deduplicate cc-can-link.sh invocations
    https://git.kernel.org/riscv/c/80623f2c83d7
  - [v2,03/10] kbuild: allow architectures to override CC_CAN_LINK
    (no matching commit)
  - [v2,04/10] riscv: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,05/10] s390: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,06/10] powerpc: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,07/10] MIPS: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,08/10] x86/Kconfig: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,09/10] sparc: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,10/10] kbuild: simplify CC_CAN_LINK
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



