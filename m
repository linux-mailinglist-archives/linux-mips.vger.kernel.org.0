Return-Path: <linux-mips+bounces-14445-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBjCMk2U+WnV9wIAu9opvQ
	(envelope-from <linux-mips+bounces-14445-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 08:55:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 343824C75F1
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 08:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8C0302F70D
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 06:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BF73C2779;
	Tue,  5 May 2026 06:54:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8321734EF1C
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964064; cv=none; b=mKx9zr0lJyapGjrSVp6kEmb0eKoXkJBfdh3ur1UO5oPzVMUrnnyMHKOhiOoRgA0mfcXDTBk4qg1UldHJG6x1ggAA/HULJV39AmuC/P5bKOhraU/GxkrXRtu/76jnS3FSqYCkVUmZZpGcCEMX2XvDOJ6/aQNEC55pG6x0RioJmQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964064; c=relaxed/simple;
	bh=uWO+3vCFyxfJpigd5aIkM+YO0y898YYbiH8v/5vf4kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB8k6zG5blKaojE7S1i0m7jSnspcPeRyUaQ0SvA8U1XtSk8eDtoyShH+d/ZZUpdtFeA8Nm8xpXG53aRxb2QRa221Nb6M98l62f2Fh/yHvDp/PMWUDDqw8+Jb5/8lAnoj4zp0hgX3kyQSQ4p+ZX+0L+w7cEchXRRWdwHkGgz9dIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wK9am-0004Fz-00; Tue, 05 May 2026 08:49:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 69ED3C0256; Tue,  5 May 2026 08:48:04 +0200 (CEST)
Date: Tue, 5 May 2026 08:48:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rany Hany <rany_hany@riseup.net>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/3] MIPS: SMP: Properly stop secondary CPUs for restart
Message-ID: <afmSpLBEb2OemYRY@alpha.franken.de>
References: <20260405235956.79535-1-rany_hany@riseup.net>
 <20260405235956.79535-4-rany_hany@riseup.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405235956.79535-4-rany_hany@riseup.net>
X-Rspamd-Queue-Id: 343824C75F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14445-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alpha.franken.de:mid]

On Mon, Apr 06, 2026 at 02:59:55AM +0300, Rany Hany wrote:
> @@ -422,13 +425,66 @@ static void stop_this_cpu(void *dummy)
>  	set_cpu_online(smp_processor_id(), false);
>  	calculate_cpu_foreign_map();
>  	local_irq_disable();
> -	while (1);
> +
> +	if (mips_cm_present() && r4k_blast_dcache) {
> +		unsigned int core = cpu_core(&current_cpu_data);
> +
> +		if (atomic_dec_and_test(&core_stop_count[core])) {
> +			/* Flush data cache */
> +			r4k_blast_dcache();
> +			__sync();
> +
> +			if (mips_cm_revision() < CM_REV_CM3) {
> +				/* Restrict coherence to own core first */
> +				write_gcr_cl_coherence(1 << core);
> +				read_gcr_cl_coherence();
> +				__sync();
> +			}
> +
> +			/* Disable coherence */
> +			write_gcr_cl_coherence(0);
> +			read_gcr_cl_coherence();
> +
> +			/* Gate the core clock */
> +			if (mips_cpc_present())
> +				write_cpc_cl_cmd(CPC_Cx_CMD_CLOCKOFF);
> +		}
> +	}
> +
> +	if (cpu_has_mipsmt) {
> +		/* The last active VPE on the core will gate the core clock
> +		 * and all other remaining VPEs will halt this TC instead.
> +		 *
> +		 * Note that on systems without CPC, this will be the
> +		 * only way to shutdown the CPU.
> +		 */
> +		write_c0_tchalt(TCHALT_H);
> +		instruction_hazard();
> +	}
> +
> +	while (1)
> +		cpu_relax();
>  }

is this whole dance safe for _all_ SOCs with CM and MIPSMT ? if not,
this should be moved to a not so generic place...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

