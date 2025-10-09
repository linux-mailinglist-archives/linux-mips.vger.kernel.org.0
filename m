Return-Path: <linux-mips+bounces-11638-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD376BC7122
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 03:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE20B4F1177
	for <lists+linux-mips@lfdr.de>; Thu,  9 Oct 2025 01:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57101E51E0;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjYsA57W"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F41E3DCD;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759972039; cv=none; b=Y8RCIQe/WemLS4P1Qprglua2KQ2jd7ZI6sZ0RFR2OSMiMP5OXCvqMQTxFg/xUWN54Ro8MuR/on2/ePQ76gONBMV8Jh4SDra7MlYKUiKnNnuXf3d4jkOmHJgCptCVsEs4ReNWkJBi9w7srz9YdTLaajUb3+nMlr5Z/B87xOEjamQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759972039; c=relaxed/simple;
	bh=t6dp3X5zH0EXAKG5SlHHvBagHVmQAF54vkAiSOAzRro=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VT046UIvtbl1N0wlmr6rozsCkJ+Om0k10WGhHBVG+bWYx0+jdo6h5gkSWBNDQohMJFNHhPzWDbjcw0OLIKBegZ2aXPLyXfLXMai3YbhuDMJo8VIevFQniQdpRGY1mJa1NEJLN2f9FToyQYubmNW+KeKQp4mijlXgWykQLgmXG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjYsA57W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1B5C4CEF5;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972039;
	bh=t6dp3X5zH0EXAKG5SlHHvBagHVmQAF54vkAiSOAzRro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hjYsA57WUk/Uk8p2fuaW+XkuH44BrQ0BB/rx3wHmvL7Nz5SEpfaDFIXoicRvUMnFO
	 7+UhpTNDXdZYg/SYGwPDbRKGUalwZjDBR3Yk/sn9Iktr2OCSplwbASH1t2VQZjcTOI
	 BU8M4dF6UujKz6YyhNr7/Jj+w1iZJD4BktB8rsRZV7CDWC/Yyj/AVaCJeuCOSA5QqX
	 CIrJ8oV6iWtuTCoNIPR+ExaOEDuwd7AKYGUlUAZVrT0MqW5h8HXO8HcmQktZM72qCh
	 6eCrEa9whwxNi/OPCSMdhTiMm1GJrzQEVPttyBmW4pm8ET69I8Yufn3a78+p7qvGbf
	 VGm+6zkZOIsRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C163A41017;
	Thu,  9 Oct 2025 01:07:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997202775.3661959.1535236572113247824.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:07 +0000
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 arnd@arndb.de, kees@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev,
 patches@lists.linux.dev, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux@armlinux.org.uk, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, palmer@dabbelt.com, alex@ghiti.fr,
 elver@google.com, peterz@infraded.org, kasan-dev@googlegroups.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Nathan Chancellor <nathan@kernel.org>:

On Thu, 21 Aug 2025 14:15:37 -0700 you wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Here is the summary with links:
  - [v2,07/12] riscv: Remove version check for LTO_CLANG selects
    https://git.kernel.org/riscv/c/6578a1ff6aa4
  - [v2,08/12] riscv: Unconditionally use linker relaxation
    https://git.kernel.org/riscv/c/7ccbe91796d7
  - [v2,09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
    https://git.kernel.org/riscv/c/87b28d71396b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



