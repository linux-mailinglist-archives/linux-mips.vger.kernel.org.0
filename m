Return-Path: <linux-mips+bounces-15559-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pe3YAvbpS2rkcgEAu9opvQ
	(envelope-from <linux-mips+bounces-15559-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:46:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 986AD7140B3
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:46:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Do1Iqi9T;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15559-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15559-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 307FA302E7D8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 17:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3DC3B840E;
	Mon,  6 Jul 2026 17:41:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE43B7B99;
	Mon,  6 Jul 2026 17:41:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359662; cv=none; b=hnYaKiKrLGQRDiYc83etHUnuDEL5j/gFwIdhRPZJrSJjqoPIlRCeupYHkkDK+1SUOWbnxqfuT1sED/0RPZsTm09rcx913xV0hetjgwF0skM2A+NYYonxI/ZCx5mm6+jM6lNm/wqp++XaPALzcNeL37ckiUkHNIrhpQUVWqytYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359662; c=relaxed/simple;
	bh=OrJgRf8yUKP70qTXIbym8aIyvQGlEpvfTadJCEU3wjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO7vniJ+7n9QOZVv7nwNkcNT4gpA3PKO9/uZf1X+zALwcF0wcL5ACHlcIKMl3fLS6YK7YaQNEBXxJ5kYeEYELTPInFgzyozzRLm1OJlbvv9ekw12/aXfoi6fpKDmKqGoJcfAVxJIqs8ZmfEZbUcr5J/xg4xtb48n/704zCK7GQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do1Iqi9T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E77D1F000E9;
	Mon,  6 Jul 2026 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359661;
	bh=r/cEfdTrJX4Mf9cEJk/e0bkaILx8pnZR7bB5XN7kzuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Do1Iqi9Tj5uD8+kkbkxEKdyzXHqw4nrZQkoq37XGzdvFHeaQyUWf8ib9xJpx7QXni
	 v8t+9IiCIG+BANMBAT84JNSz06KP5kG4iUJEA4D48/5Z/YhuTN1IamXHKpmTlLvh6s
	 Rgq1agqvciTzbhmeY1IkkQI0ySbW6kchsWqK0MXRtEaB5I2MzuQgHwSgNXvi2BE/OV
	 KqudW7MbCdbmvkwY6YCBeSzxM+eJu9V7Fz0l/TR0/Tgq2UGwQa7+BNrWyxKMSAwU/J
	 J6nCGMV6oXm4sakDNiNOFaVTOahFnD5BBgKR0D2iTwznLwoja4AKskaaX5kIaR2FmQ
	 3Zsp8ims2y00A==
Date: Mon, 6 Jul 2026 18:40:50 +0100
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
Subject: Re: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to
 system_cpucaps bitmap
Message-ID: <akvooksAvkmG971U@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-10-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-10-ruanjinjie@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-15559-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[willie-the-truck:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 986AD7140B3

On Wed, Jun 24, 2026 at 05:25:34PM +0800, Jinjie Ruan wrote:
> Parallel CPU bringup allows multiple secondary CPUs to concurrently
> execute update_cpu_capabilities() during early boot.
> 
> The current non-atomic __set_bit() and __clear_bit() helpers perform
> unserialized updates on the shared global bitmap, risking data races
> and feature flag erasure.
> 
> Upgrade these operations to set_bit() and clear_bit() to ensure all
> concurrent modifications are properly serialized via arm64 atomics.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index be75e60d56ca..a1a13f3e01ed 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  
>  		if (!caps->matches(caps, cpucap_default_scope(caps))) {
>  			if (match_all)
> -				__clear_bit(caps->capability, system_cpucaps);
> +				clear_bit(caps->capability, system_cpucaps);
>  			continue;
>  		}
>  
> @@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>  		if (!match_all && caps->desc && !caps->cpus)
>  			pr_info("detected: %s\n", caps->desc);
>  
> -		__set_bit(caps->capability, system_cpucaps);
> +		set_bit(caps->capability, system_cpucaps);
>  
>  		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
>  			set_bit(caps->capability, boot_cpucaps);

I don't think this is sufficient. Even if we use atomic updates for the
low-level bits, the logic here which tries to avoid re-probing features
that have already been detected isn't going to work correctly if it's
running concurrently with itself.

I think the best bet is probably to move update_cpu_capabilities() out
of check_local_cpu_capabilities() and call it after cpuhp_ap_sync_alive()
when the system capabilities are not yet finalised. WDYT? That means
we'd have something akin to setup_boot_cpu_features() for the secondary
CPUs.

Will

