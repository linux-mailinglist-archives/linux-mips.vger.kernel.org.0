Return-Path: <linux-mips+bounces-16-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF47E8DBF
	for <lists+linux-mips@lfdr.de>; Sun, 12 Nov 2023 01:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A924280DE0
	for <lists+linux-mips@lfdr.de>; Sun, 12 Nov 2023 00:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EF317F2;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLb3QwkY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABA17C5;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68ACAC433C9;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=VgTVM+5WP2BDA8+eWnnrND2B8DSs8IWm3pfXn96hH5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JLb3QwkYkbpfY3FNvlq0ln90cjF2dCJ/FBjoJvohtlKl5++jjxUpLiRvVRrzLfnMw
	 vqIx6cIMfKr070kpufEO4pDDNYZBrsbey74LmD56VyB6rtMKEMS2PuHv8FlOzAdnko
	 OCS/Hdjzh6S+iL7nZNY1du7wFsPrQPCaydb5KK9mUDp8BLAfADd2autchrBUsE5bXS
	 wtlaPjOEbe6qAkDlAIfra6VZWq2xAq3pay7+/5hPxAYOmrUCJZap1/rY5guetPn+MO
	 WzYBiUUdpnzpd6S0tZndmFihAyu/lQnh1zU4pQRpK3GfZZ53EnlYT1MgSfx2vEGWUx
	 pSeNNz6aY733A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4447AE00088;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169975054627.11360.14371365860315312701.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231017103742.130927-1-masahiroy@kernel.org>
In-Reply-To: <20231017103742.130927-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, bp@alien8.de,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, hpa@zytor.com,
 mingo@redhat.com, mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
 ndesaulniers@google.com, nicolas@fjasle.eu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tsbogend@alpha.franken.de, tglx@linutronix.de,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue, 17 Oct 2023 19:37:39 +0900 you wrote:
> The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
> 'true' command.
> 
> Remove the meaningless code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - [1/4] kbuild: remove ARCH_POSTLINK from module builds
    https://git.kernel.org/riscv/c/7f6d8f7e43fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



