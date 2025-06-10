Return-Path: <linux-mips+bounces-9211-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870EAD3EE8
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 18:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135E4189CDD4
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jun 2025 16:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE6B245038;
	Tue, 10 Jun 2025 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ1f2Y7N"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B8024166B;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572889; cv=none; b=N3/2lJnIY02UVZgxjMqRzEHCY+RY4TTJ3LN+XhfnP3S6109zEamIbWOLmlfdmGgC7M2tm+VyPR60PazJpE83t2366uh0FwYVV2Xdt+3uLoVtd2AjAlaO4MNTTjYXB5C6lLkChM/mThOv2YabC1duX18SVSKS0ItHXSADx+jZydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572889; c=relaxed/simple;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cRL7VOGtrA/8IooI67lQAjAprtTkDPiTx4O/41+GvUl8+VEw7vM6ER/AI6HbVFIkTa2jxIllHPB2aNTZ4Ce/JFppjOd657tuePT1QPUl+aBL1ETTcqyYKXnJxawLT859Tzm16ccrs0zdCq5AFXKKEHhbBfeuxuqSrqTm4YHYfZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ1f2Y7N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E19C4CEF0;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572889;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJ1f2Y7NQSd54tSszQLRiQIl7dD277rRFw5CD03cct8JsOIa9MeckGxwgeTNERJbY
	 /Aq7k/QdxMobJHlLVMWLaBVYiO7WUz7b5oZF8aZHHmpn5SGMFxfrabCx4zi/NelVA7
	 9tpmie/ZR7eRtm/GQUxR12kWA/MXW8KxThnLlIuGSON9FK96/TttZtzzrp91aMtCTf
	 nkrgxszvlyVUm0gGo8/i60pLDKogQxJCIy6qqOtv6fYwtbh3P8fqWAcjVqLwJncDb0
	 2wdFJTUv8YDSR+ksvQyqg1NCDe5af7sVQqmJb6cWow02fsajDICno0naOHZ+D1dFYd
	 UMToThilj3zfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D5B39D6540;
	Tue, 10 Jun 2025 16:28:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291974.2454024.16546912662876416180.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:39 +0000
References: <20250602181256.529033-2-masahiroy@kernel.org>
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr,
 andreas@gaisler.com, anton.ivanov@cambridgegreys.com, bp@alien8.de,
 bcain@kernel.org, catalin.marinas@arm.com, chris@zankel.net,
 borntraeger@linux.ibm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, davem@davemloft.net, dinguyen@kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hpa@zytor.com, hca@linux.ibm.com,
 deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 James.Bottomley@HansenPartnership.com, johannes@sipsolutions.net,
 glaubitz@physik.fu-berlin.de, jonas@southpole.se, maddy@linux.ibm.com,
 mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, monstr@monstr.eu,
 naveen@kernel.org, npiggin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, dalias@libc.org, richard.henderson@linaro.org,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, svens@linux.ibm.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, kernel@xen0n.name, will@kernel.org,
 ysato@users.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue,  3 Jun 2025 03:12:54 +0900 you wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
    https://git.kernel.org/riscv/c/e21efe833eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



