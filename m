Return-Path: <linux-mips+bounces-15723-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iJmtHYvuT2pfqgIAu9opvQ
	(envelope-from <linux-mips+bounces-15723-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 20:55:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2697349AC
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 20:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=U6gvfzDj;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15723-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15723-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86EB930EAD85
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4104446E9;
	Thu,  9 Jul 2026 18:42:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C84446FC
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 18:42:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622566; cv=none; b=Tr/6Ojz1u95srAmteHjX+p3tjr6ULy5Le4sfsctV2J3G3R8BbyXJOdaius7/m94/cLvWWPRCGLntcllyTBoP3wa0nSDrA2mZBGkTFx5GRrXY4P6LFKlSzmEWNQfkk1lHHL6c/BzkbRg02K2LWIpjALoIv1HmhOggI8dkQdLMWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622566; c=relaxed/simple;
	bh=jxrFwpuvrTS1XNI/bITRNy4rM5f6KM69+ytcvmY9Kws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSZmahaP82xvERoaLqkLN/PqZ77RNAuwHvqELqXoXFKLum5mDpmAuS85laZywXHg1+PJAt/6VwU1HVHRfoGRNWFdlRkEAamz7h/lIoDqPOLIRvAeTuu2YdyDMvUE5Uvhk2/YnyX2Z4js6BhxhkKXnXWhQ5DRShkcslKsj+tVaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6gvfzDj; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso231877a91.1
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622563; x=1784227363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=U6gvfzDjo4nu8YyTuL1rd4RldHrXshiAzCDQI0Op6aGgTYJr7abS6n1/CkidpgGpgo
         qEuUwuKusDonHWkcq5kScBASsmzOJ7UM/6j+aMrGQOd019d6S88tbOlTIGLHRQ6dW/PV
         kSRMrTwvUFbc7HdyE2VVbt6u0XmS0tWN6Z9KTqlW/ss+ZJd1tOqGRlWk761zGt4Vaoql
         x1s3NoTr+xJINeE94lVp55FIi43Ex8fxtSfF+E8R6O6b6kZskp/BrWnI7tbkn0ePHktX
         GaU2ywLRtMc1KZoHoHHieb8c3DTeztRs0k/MG3m73q3GaJjt2+5mg0yO0v1qZEjnqoSd
         ywPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622563; x=1784227363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=ljj3GT0DtFJlLwShgqTECNwHCArGNKFr04fqq+mpCE9qQVMqDHnr9okhl2C8AbxuYL
         P7U8p8A5xKp6SmgiUGiLJYZ6eK6iqBAxZC0mhMHl69cf3gPc68wpk/TQzD3wK4tEt5wT
         tH/tZTFbtks4jcJxSl59f+RC0j+dzx1c1Cslyo4MAUcFwIH0EnJCtuJbaaMw7Qp3wGFK
         Nxgny6LENIhCPWr1J5T4F1XeyQGi7ksR8fcaJvZkEoFvTJ6VBg6ZwDM8rQYt3wHw/OcC
         2sKfGUybh9bxmt3+7ehfT9UMB7oo0LAmZt7kTRG+k/zpbGuEfugH1uOy3vWRmeEG6OQl
         UbXg==
X-Forwarded-Encrypted: i=1; AHgh+RosThTmldRGgK0z87wNx4rZgQWjNranne1l0l0pZl0xsORoLyOyUwshBO+PXXBRUl52vzr2x8WeS+bh@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+wfyA9hyWdQ91qQckLP1j9Uvg22zRWvHglS7vJjidB5mTD7Y
	aAdA8QcMVd90X7D3w9wkq3lh5NmoNjPspz8R7IHjy8szM9aDyqgsRsQz
X-Gm-Gg: AfdE7cnTKL7VqjGSW/PSQgz1lV0sseZRa7R831sb+i9u1s599Vhc6fab9tPDDeO7A7W
	MjhVh3Vqf5/1Q6moF04+j2AfvmRpdfKoqsrN7GXsPdOBSRTLrqPxCsKkphko9G6vTb7EtPJkPWS
	2BUQCA818dg/Yddhuz4Y3MubSnC9no8cL6gCHegtOOAgm5tIFd0YZXLl4AsFjKgwVTpSBUjvKya
	FZIHV8a63VG0V0u8Mz/NEQQhiil8oXRRVfyuDdXpSY6DFxu72MkYduCwnmjQWJUnqMdVvVh8Zf3
	ETLK7d3YK6QP9X9WNnob0j/qqTZaulbU3LbjCmALxoxlok5emm7kwoPMof28F+h6GkWJXYk3VKa
	ZdAALzviqkeisIH+U5tNYUBBsCpBHUCwIIE3d4Rj1IFjN9ltQziV3zRnXVXMjOgaRWfhUulnqU/
	McbCr1b3T5Y39XUo5tyHfpmI+xcfv7Dppak7tGM2l/VawTqGPV2XELfQ4WRIq4
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr9806931637.27.1783622563297;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm19491362eec.17.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:12:23 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rfwwd1OtaQxka@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.974626922@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.974626922@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15723-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,kernel.org,dabbelt.com,lists.infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dabbelt.com:email,infradead.org:email,li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E2697349AC

On Tue, Jul 07, 2026 at 09:06:19PM +0200, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/traps.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -7,7 +7,6 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -333,9 +332,7 @@ void do_trap_ecall_u(struct pt_regs *reg
>  
>  		riscv_v_vstate_discard(regs);
>  
> -		syscall = syscall_enter_from_user_mode(regs, syscall);
> -
> -		add_random_kstack_offset();
> +		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
>  
>  		if (syscall >= 0 && syscall < NR_syscalls) {
>  			syscall = array_index_nospec(syscall, NR_syscalls);
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

