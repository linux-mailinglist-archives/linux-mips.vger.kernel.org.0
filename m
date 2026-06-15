Return-Path: <linux-mips+bounces-15077-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D37zOt7XL2o1HwUAu9opvQ
	(envelope-from <linux-mips+bounces-15077-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:45:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEAD6856F0
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15077-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15077-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B4C303C4E9
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B3C33C536;
	Mon, 15 Jun 2026 10:43:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F8F331EDE;
	Mon, 15 Jun 2026 10:43:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520230; cv=none; b=jpY0wBedDxlUUMLXGqOdcMtYDB/iA7FFT+CPuZNlO4VHhlxu4dGRu70BnD/5fL22YY6UYQ2IEqbYaHOUra42hZn0vcoKbsXgOkUzXs6yS5Ili//+DnE28zeq66/KjLfsuek4j8lCQ4czwGUnGgv06NKM59SimrKZ6gGR99R3tLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520230; c=relaxed/simple;
	bh=PqxZeqhPQz+s55hdoC77x2kn+2U4fJ3s/UnM4RmaOlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeJ54dHpz6BO3UEwvifVwroRymYQv4NKb8uO1Xhar16Doco4Pq5wIool0zroy3xF2SNuUvQMjITRNMySIZUqjvE7W8CCKG+cNOeIRX7Zih+8rZvhj7iORcJyhiGplYlWe6+p0VqOkiWNLaQWhEA9IOgJSAI0cb/cvKGF8sDCMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JF-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 25EE2C084D; Mon, 15 Jun 2026 12:30:25 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:30:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/4] MIPS: kernel: proc: Use seq_putc() calls in
 show_cpuinfo()
Message-ID: <ai_UQS6UvlqhhEqD@alpha.franken.de>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <c2dcc1be-0f5e-4e51-ba67-235c178ce211@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2dcc1be-0f5e-4e51-ba67-235c178ce211@web.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15077-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alpha.franken.de:mid,alpha.franken.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CEAD6856F0

On Thu, Jun 04, 2026 at 07:54:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 Jun 2026 19:12:11 +0200
> 
> Single characters should occasionally be put into a sequence.
> Thus use the corresponding function “seq_putc”.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/kernel/proc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 9e8b8f99b606..42430c7f0acf 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -79,7 +79,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
>  			seq_printf(m, "%s0x%04x", i ? ", " : "",
>  				cpu_data[n].watch_reg_masks[i]);
> -		seq_puts(m, "]");
> +		seq_putc(m, ']');
>  	}
>  
>  	seq_puts(m, "\nisa\t\t\t:");
> @@ -149,7 +149,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_puts(m, " loongson-ext");
>  	if (cpu_has_loongson_ext2)
>  		seq_puts(m, " loongson-ext2");
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>  
>  	if (cpu_has_mmips) {
>  		seq_printf(m, "micromips kernel\t: %s\n",
> @@ -298,7 +298,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
>  				&proc_cpuinfo_notifier_args);
>  
> -	seq_puts(m, "\n");
> +	seq_putc(m, '\n');
>  
>  	return 0;
>  }
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

