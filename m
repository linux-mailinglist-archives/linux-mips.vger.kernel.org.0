Return-Path: <linux-mips+bounces-3715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799090B86A
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 19:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD001C2372B
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C2D18A943;
	Mon, 17 Jun 2024 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7Bw7cS9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5D18A929;
	Mon, 17 Jun 2024 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646288; cv=none; b=fTthqfQseIyGqJwRrzM6J5favH8O9U5Zg7TCWkYui4zKTK2xUhMO/zs1HNcJiujFJ5gIV+EyL5Wtis3KXbReQ/GnBUXcW96h4o3s19MznWPDCq7qBZRes8IVL2xAGUhMp3y5LWjelzvpbo04Znhe3e0UJEim6lu14LaB6ZVETJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646288; c=relaxed/simple;
	bh=ztvuXDnk25t1p+AqflGOqcscwspQgRoCcPqqQrpop5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1rEsz8bvm1h2x6JAKG9d4cMaGSwrTM1TDvWHT16MwTjqy5ayno38Yuud2SUeFsbA2xf1NVhaoxUbNzvFXiy8g/AHpt4TuOlu/zVL6we/cHrpZzUfKe9ID9Tau5wst8qg58J/oR7oJZ2k633T3N1VycWz1aa4xLa/YaZR4tOYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7Bw7cS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014C1C2BD10;
	Mon, 17 Jun 2024 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718646288;
	bh=ztvuXDnk25t1p+AqflGOqcscwspQgRoCcPqqQrpop5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7Bw7cS9eQnkHXYakJw3J3X/55mwZny1RHQiLr6kJILgEM+gNfVUFgS31Y9hKrIi+
	 +MAUpY1087tx10TMSQs4gdQ6ADm8UGXgE020Ju3vjW3ESWwKKKS/tqXyNzL3UMiR8c
	 GMLWvYJqi+aBsH/njfU1PAU1qPJ/zCtgYswA1f3WBpvXFMy+mHoty6kR4Hg1Thw8j2
	 l1YtDLZcjSww+TUb8lJ2EX6n4N9/5RA+BZjrVn+tHm41ZJteV7ncgb/C3tCCQLfvm+
	 C3DwAHcHm+05zI5ipzSqpM3HTs2tbyZNcAhuJJRFjIzufHkSYz+ruLLOorcjOkkbId
	 pzXk5PnY4n4WA==
Date: Mon, 17 Jun 2024 10:44:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: mips allmodconfig build error with llvm-18.1.7-x86_64
Message-ID: <20240617174446.GA843124@thelio-3990X>
References: <a138bd58-80b3-4adb-8cbb-65e92a0d0b6e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a138bd58-80b3-4adb-8cbb-65e92a0d0b6e@quicinc.com>

Hi Jeff,

On Mon, Jun 17, 2024 at 08:50:00AM -0700, Jeff Johnson wrote:
> As part of my tree-wide cleanup of missing MODULE_DESCRIPTION() macros I'm
> trying to do allmodconfig builds for every architecture.
> 
> With:
> export ARCH=mips
> export LLVM=llvm-18.1.7-x86_64/bin/
> make distclean
> make allmodconfig
> make -j$(nproc)
> 
> I'm getting build errors like:
> Cannot find symbol for section 46: .text.free_initmem.
> init/main.o: failed
> 
> Cannot find symbol for section 6: .text.copy_from_kernel_nofault_allowed.
> mm/maccess.o: failed
> 
> Cannot find symbol for section 10: .text.arch_asym_cpu_priority.
> kernel/sched/fair.o: failed
> 
> Interestingly, if I make 'defconfig' instead of 'allmodconfig' I don't see
> this issue.
> 
> Any thoughts on how to have a successful mips allmodconfig build?

Hmmm, it looks like https://github.com/ClangBuiltLinux/linux/issues/1830
never got addressed, sorry about that :/

This is basically a poor interaction with Clang's integrated assembler,
-ffunction-sections, and recordmcount that nobody has really been able
to figure out how to deal with. It is not MIPS specific but the fact
that MIPS allows CONFIG_LD_DEAD_CODE_DATA_ELIMINATION to be selected
means that it is much easier to trigger.

My recommendation for this is to disable that configuration (and -Werror
configurations) when building, which you can easily do with the
KCONFIG_ALLCONFIG variable and bash's process substitution during the
allmodconfig step (keeping the rest of your commands the same):

  $ make KCONFIG_ALLCONFIG=<(printf 'CONFIG_%s=n\n' DRM_WERROR LD_DEAD_CODE_DATA_ELIMINATION WERROR) allmodconfig

Alternatively, you could use the 'allmod.config' file plus
KCONFIG_ALLCONFIG=1:

  $ printf 'CONFIG_%s=n\n' DRM_WERROR LD_DEAD_CODE_DATA_ELIMINATION WERROR >allmod.config

  $ make KCONFIG_ALLCONFIG=1 allmodconfig

I will try to send a version of that diff that I have in that linked
issue so that you don't have to jump through these hoops.

Even with that addressed though, I see another issue in an allmodconfig
when building arch/mips/kernel/cps-vec.S that I don't recall seeing
before:

  arch/mips/kernel/cps-vec.S:363:2: error: instruction requires a CPU feature not currently enabled
   jr.hb $9
   ^
  arch/mips/kernel/cps-vec.S:477:4: error: instruction requires a CPU feature not currently enabled
  1: jr.hb $8
     ^

I was able to workaround that by disabling CONFIG_MIPS_CPS in the same
manner as above and that build finished fine for me with that same
toolchain.

For what it's worth, MIPS is not very well supported in LLVM anymore, as
the main maintainer stepped down a couple of years ago. Another
maintainer has stepped up but a lot of these issues are long outstanding
problems, so I think the likelihood of them getting addressed at this
point is pretty low.

Cheers,
Nathan

