Return-Path: <linux-mips+bounces-7656-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F2A23B74
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 10:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22497161736
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 09:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182FF14B08A;
	Fri, 31 Jan 2025 09:32:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9F7374FF;
	Fri, 31 Jan 2025 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315946; cv=none; b=ldoWtq5dnY6nYb9tNL/ozxLZ9dCLkGHC8LeqrUMyN68rSjhFpZLgHmyboYctQP8H9E18Vwd8/FzhFylAQqsxBUX98/J3b+tYuvCZ3n0M05VtiWOBU7Ho/6DNVM4BwwXFUkTbgvXkbq3ToCQT/LqweTIsStu3hwf+CWvLJBQ80I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315946; c=relaxed/simple;
	bh=r3LAuR0iEd1V4hhMgeKfMRZCn+au/X7a1OyVrkOBnlk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7LZyqwIeZb144AqR0ElXeckjSx2lSxndSkcLzUZwPZe1+ZxgQVTsV0bc3lVCPVY6GG9GSkMF2IQm8csoPWIa9Ar712o/u3Pr7SUnwXSMi1DTs1IB2L3HR6yRnI7AXxzyDBb9/cul1yAdzT6dEnKBlZaFkyuQypPcZ1VOFSGW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tdnNk-0003hP-00; Fri, 31 Jan 2025 10:32:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4E023C0147; Fri, 31 Jan 2025 10:32:00 +0100 (CET)
Date: Fri, 31 Jan 2025 10:32:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "mips: fix shmctl/semctl/msgctl syscall for o32"
Message-ID: <Z5yYkMSPJcYme1kX@alpha.franken.de>
References: <20250130104857.56251-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130104857.56251-1-tsbogend@alpha.franken.de>

On Thu, Jan 30, 2025 at 11:48:56AM +0100, Thomas Bogendoerfer wrote:
> This reverts commit bc7584e009c39375294794f7ca751a6b2622c425.
> 
> The split IPC system calls for o32 have been introduced with modern
> version only. Changing this breaks ABI.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/syscalls/syscall_o32.tbl | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
> index e8a57c206758..349b8aad1159 100644
> --- a/arch/mips/kernel/syscalls/syscall_o32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
> @@ -382,15 +382,15 @@
>  368	o32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
>  # room for arch specific calls
>  393	o32	semget				sys_semget
> -394	o32	semctl				sys_old_semctl		compat_sys_old_semctl
> +394	o32	semctl				sys_semctl			compat_sys_semctl
>  395	o32	shmget				sys_shmget
> -396	o32	shmctl				sys_old_shmctl		compat_sys_old_shmctl
> +396	o32	shmctl				sys_shmctl			compat_sys_shmctl
>  397	o32	shmat				sys_shmat			compat_sys_shmat
>  398	o32	shmdt				sys_shmdt
>  399	o32	msgget				sys_msgget
>  400	o32	msgsnd				sys_msgsnd			compat_sys_msgsnd
>  401	o32	msgrcv				sys_msgrcv			compat_sys_msgrcv
> -402	o32	msgctl				sys_old_msgctl		compat_sys_old_msgctl
> +402	o32	msgctl				sys_msgctl			compat_sys_msgctl
>  403	o32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
>  404	o32	clock_settime64			sys_clock_settime		sys_clock_settime
>  405	o32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
> -- 
> 2.35.3

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

