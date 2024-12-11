Return-Path: <linux-mips+bounces-6937-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C44229EDA1D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21103163878
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 22:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A28E206F34;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hia/ijUE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567F4206F11;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956376; cv=none; b=loqAeG45tfYkpfj5EIC3DV7/2LvW8YhGsCgSOjG9on38Re7XUs2yX58o7eeWsvX21eM0zTiO53BHey4I1LObaeGUzSWaQ/NMPdF6SYLrrvrm560eEeDZuJQoW5UBtzvXqkFv0+iERTAY4YeCUhfP9xarmG35h9EkyvliMyDqb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956376; c=relaxed/simple;
	bh=1MJ06IwhKiUOka6t13pDPzzxerzMi81atHP/6c9+22c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eZ36vJSRX68Z8mxKCxAuJUi7KRy+LEEF4oW6GIGdJa5DqWgDiOfweGYj8mQ8xsCCcsP4CEvwrIvZfulNURDzl299HhSc5OoCFSsYHaC6B5okkG4Iqh0go2FvBLlALhVfTZS3BGTAeCB4yleH3i6VZS9aOZMqNWKOGy9wOAGnSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hia/ijUE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A09FC4CED3;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956376;
	bh=1MJ06IwhKiUOka6t13pDPzzxerzMi81atHP/6c9+22c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hia/ijUEuZBroxj7nHTcTLUeY0lUzwbIDShfmCnvrhgwkWkpcTiJx7pJ1rDHrcbYd
	 v9xc5XYWsKCanEQ84GJFDJY00b2HgNbwArL4F0yC9b3PGcwDDt8RjKLjKLEhKLhhcd
	 fmxIfg3UO49ThB7NCaSOMylOZeYdgxA9dXMqt5Zh24qGuiC5PnXYEzmSSsUEGzlsGM
	 QIuCwUtbYZSKHZWQsPR/5JQlLYffzh4qHAuBe3D1CDOd8aIWP34Q5xS6MsQDi3t00y
	 2Sa/0R/Urbix0SVQmgQhhgfeqd/s3orjw+NRpayKDn0m9Fbd2FqUvFGpLePlE4DJR6
	 KkGTKHdygfE8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710A8380A965;
	Wed, 11 Dec 2024 22:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395639200.1729195.15576952837564128066.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:12 +0000
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@codeaurora.org
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux@armlinux.org.uk, chenhuacai@kernel.org, kernel@xen0n.name,
 tytso@mit.edu, Jason@zx2c4.com, tsbogend@alpha.franken.de,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 vincenzo.frascino@arm.com, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 namcao@linutronix.de

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 10 Oct 2024 09:01:02 +0200 you wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
> 
> [...]

Here is the summary with links:
  - [01/28] csky/vdso: Remove gettimeofday() and friends from VDSO
    (no matching commit)
  - [02/28] csky/vdso: Remove arch_vma_name()
    (no matching commit)
  - [03/28] s390/vdso: Drop LBASE_VDSO
    (no matching commit)
  - [04/28] arm64: vdso: Drop LBASE_VDSO
    (no matching commit)
  - [05/28] arm64: vdso: Use only one single vvar mapping
    (no matching commit)
  - [06/28] riscv: vdso: Use only one single vvar mapping
    https://git.kernel.org/riscv/c/d34b60752fcb
  - [07/28] arm: vdso: Remove assembly for datapage access
    (no matching commit)
  - [08/28] LoongArch: vDSO: Use vdso/datapage.h to access vDSO data
    (no matching commit)
  - [09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
    (no matching commit)
  - [10/28] x86/mm/mmap: Remove arch_vma_name()
    (no matching commit)
  - [11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso data
    (no matching commit)
  - [12/28] x86: vdso: Place vdso_data at beginning of vvar page
    (no matching commit)
  - [13/28] x86: vdso: Access rng data from kernel without vvar
    (no matching commit)
  - [14/28] x86: vdso: Allocate vvar page from C code
    (no matching commit)
  - [15/28] x86: vdso: Access timens vdso data without vvar.h
    (no matching commit)
  - [16/28] x86: vdso: Access rng vdso data without vvar.h
    (no matching commit)
  - [17/28] x86: vdso: Move the rng offset to vsyscall.h
    (no matching commit)
  - [18/28] x86: vdso: Access vdso data without vvar.h
    (no matching commit)
  - [19/28] x86: vdso: Delete vvar.h
    (no matching commit)
  - [20/28] x86: vdso: Split virtual clock pages into dedicated mapping
    (no matching commit)
  - [21/28] powerpc: vdso: Remove offset comment from 32bit vdso_arch_data
    (no matching commit)
  - [22/28] powerpc: procfs: Propagate error of remap_pfn_range()
    (no matching commit)
  - [23/28] powerpc/pseries/lparcfg: Fix printing of system_active_processors
    (no matching commit)
  - [24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for potential processors
    (no matching commit)
  - [25/28] powerpc: Add kconfig option for the systemcfg page
    (no matching commit)
  - [26/28] powerpc: Split systemcfg data out of vdso data page
    (no matching commit)
  - [27/28] powerpc: Split systemcfg struct definitions out from vdso
    (no matching commit)
  - [28/28] vdso: Rename struct arch_vdso_data to arch_vdso_time_data
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



