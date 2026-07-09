Return-Path: <linux-mips+bounces-15678-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WyCQL1NcT2qvfAIAu9opvQ
	(envelope-from <linux-mips+bounces-15678-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 10:31:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB772E4CD
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 10:31:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=UMXxHBpp;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=ja1LHTEE;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15678-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15678-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88D4F3039802
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 08:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313FB3E8343;
	Thu,  9 Jul 2026 08:28:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6663ED134;
	Thu,  9 Jul 2026 08:28:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585683; cv=none; b=KrgkZhzuYYq0dWq3BrVj6HHwLhywE70OAjsyi7scLEj9EC4IMArjiNe1wJsqqewkVoeQXUvorQ8TRSAR2YiyJJGELsj97cC2JiJovkillJ5B91I2aX013QcsAQs75KPpN02xAupgzZ/KPOslUc0wA4jMSuyzESBt9lcOIngSWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585683; c=relaxed/simple;
	bh=McNy21JbctdAzJIaiuV0Ewj4m4N9SbyWYC9f1O58gfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2F5x1b7xEmanfrQ2VSeBVaYEuEQzsEKXwdxKnOFuPwZfhfr6MlNpeRF4l4GwphFCyVoAcrj6Nz5a2y08zyutIp24h/GE8RZKjsH3o8mHTHKp3thJ8D7YSkFP7TwDeyRgjmYSHwLlHLcpHxSjnUp/4+MwG5X91eX8BXZwqwSYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UMXxHBpp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ja1LHTEE; arc=none smtp.client-ip=193.142.43.55
Date: Thu, 9 Jul 2026 10:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783585679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lx0GPfIb+p9dvxHOdBuxBw9NKashWf8lY5lGPcZuetQ=;
	b=UMXxHBppphhTbYxa+BqOd80W4ngqWYhzPYL77GljpeFMyXukW5uGAsLDprtKEJyeETmgFN
	msqYnUBjEJpozd4qRINi/gEyl3eXmF2JPhb5bRF2Yb5RUoZMBkLPEgJNOqb7n5jnrIsz1J
	T/EBLiEGVbgE7kFtiNNGRfmCBxiNT6X9Xm8U+cdKwvRKu4vfD+B+cdupmGQos4JbCaBuBM
	3S2JvvwStqAxmiRXN9m9xk6wUV5Sz8TVKl60PYbK5h/Xqn/t8B/VKJmV+gEAfJXWT5pqum
	3QEumRjVd9w0RwuzH4WlnvukX96IcDYpjIFc4OGRgiDohFmqu7XaFHUL9oUstQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783585679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lx0GPfIb+p9dvxHOdBuxBw9NKashWf8lY5lGPcZuetQ=;
	b=ja1LHTEEnpn4UBUpRMLUNv43JZPCLqwtNJbKK8I1pjYisGl/FUXT1xQeXCjf2brcux0Cb1
	vjeEfDRtTffYYZCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, richard.henderson@linaro.org, mattst88@gmail.com, 
	linmag7@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	geert@linux-m68k.org, tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, 
	glaubitz@physik.fu-berlin.de, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, luto@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	peterz@infradead.org, wad@chromium.org, thuth@redhat.com, mark.rutland@arm.com, 
	ada.coupriediaz@arm.com, kevin.brodsky@arm.com, linusw@kernel.org, yeoreum.yun@arm.com, 
	song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com, 
	broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com, 
	yangtiezhu@loongson.cn, sshegde@linux.ibm.com, mchauras@linux.ibm.com, 
	austin.kim@lge.com, jchrist@linux.ibm.com, arnd@arndb.de, sohil.mehta@intel.com, 
	andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-csky@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v16 18/18] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
Message-ID: <20260709102117-c4dc4d58-f8d9-46b0-8246-61e8fb8825ce@linutronix.de>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-19-ruanjinjie@huawei.com>
 <20260630172619-6c78c2e2-c2d3-44be-88e6-6c82de12baf4@linutronix.de>
 <21875fb4-434b-480d-b68b-e2ffd5fff5ae@huawei.com>
 <20260709090525-b1e5ae06-1fb4-454e-919c-6503dcf3d073@linutronix.de>
 <d9c9686c-dfd8-4539-b301-8726bab7443b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9c9686c-dfd8-4539-b301-8726bab7443b@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15678-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:peterz@inf
 radead.org,m:wad@chromium.org,m:thuth@redhat.com,m:mark.rutland@arm.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,s:lists@lfdr.
 de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[83];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CCB772E4CD

On Thu, Jul 09, 2026 at 04:15:15PM +0800, Jinjie Ruan wrote:
> On 7/9/2026 3:17 PM, Thomas Weißschuh wrote:
> > On Thu, Jul 09, 2026 at 02:37:05PM +0800, Jinjie Ruan wrote:
> >> On 6/30/2026 11:32 PM, Thomas Weißschuh wrote:
> >>> On Mon, Jun 29, 2026 at 09:06:16PM +0800, Jinjie Ruan wrote:
> > (..)
> > 
> >>>> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> >>>> index 592dd8668de4..5a0314a3c26e 100644
> >>>> --- a/arch/arm64/kernel/vdso.c
> >>>> +++ b/arch/arm64/kernel/vdso.c
> >>>> @@ -343,3 +343,19 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> >>>>  
> >>>>  	return ret;
> >>>>  }
> >>>> +
> >>>> +bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> >>>> +{
> >>>> +	unsigned long sigtramp;
> >>>> +
> >>>> +#ifdef CONFIG_COMPAT
> >>>> +	if (is_compat_task()) {
> >>>> +		unsigned long sigpage = (unsigned long)current->mm->context.sigpage;
> >>>> +
> >>>> +		return regs->pc >= sigpage && regs->pc < (sigpage + PAGE_SIZE);
> >>>> +	}
> >>>> +#endif
> >>>> +	sigtramp = (unsigned long)VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
> >>>> +
> >>>> +	return regs->pc == (sigtramp + 8);
> >>>
> >>> Instead of hardcoding 'sigtramp + 8' you could add a new label to the 'svc #0'
> >>> instruction and use that with VDSO_SYMBOL().
> >>
> >> It seems that the modification of __kernel_rt_sigreturn() is not recommended
> > 
> > For the changes to the object code of the function this is obvious and
> > well explained in the comments.
> > 
> > Such a label however would not change the object code of the function.
> > In fact it would not change any bit whatsoever in the final vDSO,
> > save for a new build ID.
> 
> Yes, and using labels is easier to maintain than hardcoding offsets
> directly.
> 
> Similar to the code below?

Exactly.

(...)

> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 592dd8668de4..609d7bcd8308 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -343,3 +343,19 @@ int arch_setup_additional_pages(struct linux_binprm
> *bprm, int uses_interp)
> 
>         return ret;
>  }
> +
> +bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> +{
> +       unsigned long sigtramp;

Could be named better now.

> +#ifdef CONFIG_COMPAT
> +       if (is_compat_task()) {
> +               unsigned long sigpage = (unsigned
> long)current->mm->context.sigpage;
> +
> +               return regs->pc >= sigpage && regs->pc < (sigpage +
> PAGE_SIZE);
> +       }
> +#endif
> +       sigtramp = (unsigned long)VDSO_SYMBOL(current->mm->context.vdso,
> sigreturn_landing_pad);
> +
> +       return regs->pc == sigtramp;
> +}
> diff --git a/arch/arm64/kernel/vdso/sigreturn.S
> b/arch/arm64/kernel/vdso/sigreturn.S
> index 0e18729abc3b..8d2d413ff45e 100644
> --- a/arch/arm64/kernel/vdso/sigreturn.S
> +++ b/arch/arm64/kernel/vdso/sigreturn.S
> @@ -73,6 +73,7 @@ SYM_CODE_START(__kernel_rt_sigreturn)
>         mov     x8, #__NR_rt_sigreturn
>  //     PLEASE DO NOT MODIFY
>         svc     #0
> +       SYM_INNER_LABEL(__sigreturn_landing_pad, SYM_L_GLOBAL)
>  //     PLEASE DO NOT MODIFY
>  //     .cfi_endproc
>  SYM_CODE_END(__kernel_rt_sigreturn)
> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S
> b/arch/arm64/kernel/vdso/vdso.lds.S
> index 52314be29191..5fee2927e4c5 100644
> --- a/arch/arm64/kernel/vdso/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> @@ -104,6 +104,7 @@ VERSION
>                 __kernel_clock_gettime;
>                 __kernel_clock_getres;
>                 __kernel_getrandom;
> +               __sigreturn_landing_pad;

This should not be done. The symbol is not intended to be used by userspace.

>         local: *;
>         };
>  }
> @@ -112,3 +113,4 @@ VERSION
>   * Make the sigreturn code visible to the kernel.
>   */
>  VDSO_sigtramp          = __kernel_rt_sigreturn;
> +VDSO_sigreturn_landing_pad     = __sigreturn_landing_pad;

