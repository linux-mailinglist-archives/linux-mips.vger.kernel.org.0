Return-Path: <linux-mips+bounces-15558-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id By4qC+n+S2pPeQEAu9opvQ
	(envelope-from <linux-mips+bounces-15558-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 21:15:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B122714DC4
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 21:15:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TgNzUPmb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15558-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15558-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E7032A0E16
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 17:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51BA3B71D9;
	Mon,  6 Jul 2026 17:39:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72D3B8131;
	Mon,  6 Jul 2026 17:39:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359585; cv=none; b=lZMKWUzs/nUOpg7DJ4vGBPM6tbwsGBSljzfinnnYAV+P3WsHG0zCMHRU+XKAw2z2mkOG0OnV4/Kpedp1C24HtqXNRyVP49T8Pv//dJsLXmG5FRASfbG3OJOGI5jQcddjZjdnKzxx3KwT4Z5RKCvque2Vnt1bLJpyPZ5HV66FVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359585; c=relaxed/simple;
	bh=ch88ddXsK8rRVpBUHUc4SKlPkId/XSqS8UhfZgUzXI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk0yt7A8E3ckrUXXIkBTFQ78zpzSF0Z/YvsVOETPB5UBDT+RPUvnm7w6qFzUawocahbntnlsMfDljpu3VUpzUMqZkgeQWsSytl3NtXJniir0egop8d/PMCwgn5UEd5/5Sv/DU78Ag7twAcMx15yoRKN8YXvKLjNgtFcgjKD15E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgNzUPmb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053371F000E9;
	Mon,  6 Jul 2026 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359583;
	bh=3Ijv0Cx5Er5paIrljXWxNnEthBLXb9Gwgrh0LYZ8Nqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgNzUPmbDuK7hGi3J7/zuV/uS/0cUt8v9gLyj+gZ/skpvQQEi+BK6ozF3jo3SjnzN
	 bdBSuXMfcPtDUXjzzDbzT3RzSvSaEcT6IeQCxQENaVKAjd22BFLSyiNRKRvE1lS4MW
	 qjREb9gfmwYZXokBPNNanyyVJD83WVIkQyffI+yvLhYB2Gbo8rrIjejishdnRPDrd6
	 ABr8f8fI366cENbWaTCLp+xdDwsYPQ8n44I8kGZbdKxk9KV22JGTZl3/7OcsMOjB/a
	 PSa3hCeiHMWTX5rAoNlGb0mk9Woi6gCnFDzFxfqZbqMbtTL4l273Wa2qNvoOrInwFd
	 OKHpzKAhl9W5A==
Date: Mon, 6 Jul 2026 18:39:32 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <akvoVCNFwDorQg6y@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-6-ruanjinjie@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.c
 om,m:tim.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15558-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,alpha.franken.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,willie-the-truck:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B122714DC4

On Wed, Jun 24, 2026 at 05:25:30PM +0800, Jinjie Ruan wrote:
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c14b179c595d..87f92cf9ffa8 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -35,6 +35,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/kvm_host.h>
>  #include <linux/nmi.h>
> +#include <linux/lockdep.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/atomic.h>
> @@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	if (system_uses_irq_prio_masking())
>  		init_gic_priority_masking();
>  
> -	rcutree_report_cpu_starting(cpu);
> -	trace_hardirqs_off();
> +	lockdep_hardirqs_off(CALLER_ADDR0);
>  
> +	/*
> +	 * Since RCU is still offline on this CPU, any nested native printk
> +	 * or lock acquisition would normally trigger a false-positive
> +	 * "suspicious RCU usage" lockdep splat.
> +	 */
> +	lockdep_off();

On the flip side, should we really be taking locks at this point? I'm
actually quite sympathetic to lockdep here and I worry that disabling
it briefly is going to hide real problems down the line.

ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
handle the useless print in cpuinfo_detect_icache_policy(), but I've
decided just to remove that one. So I think the remaining prints we have
to worry about in this early boot code are from error paths in the
CPU feature detection logic (check_local_cpu_capabilities()).

Given that those error paths should all be fatal, perhaps we could
rework cpu_die_early() and cpu_panic_kernel() as macros that take a
string argument and either call printk_deferred() (similarly to what you
suggested in a previous version of your series [1]) or do the
lockdep_off() there before a pr_crit().

What do you think?

Will

[1] https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/

