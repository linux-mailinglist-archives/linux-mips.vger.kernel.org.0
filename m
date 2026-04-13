Return-Path: <linux-mips+bounces-14125-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJWpOAr13GkvYgkAu9opvQ
	(envelope-from <linux-mips+bounces-14125-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96F3ECC3C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C30F3011F06
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 13:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBC43CD8B3;
	Mon, 13 Apr 2026 13:45:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0B46BFCE;
	Mon, 13 Apr 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087923; cv=none; b=QlNyxc+hsXmbzBTQ3pGlRV7RFMUb0vKltBXJquA/tZjA+cJ6a2jjN2O1tnzziGSwDv+eaid6Hws9+z4mFJcDyPON7C6N8IUl0aMu9PCWzI0vsJ5lpf5vA+ojXDZ3gxKAvVs5ESvTg8lfGv0EvtKSEbZ5/9hcOW1xSc21CcpA8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087923; c=relaxed/simple;
	bh=yh3iJ/MioreNmZnVc0OTHf4MJ0O2cfP9x6JcTisig+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4E2QDKFn8Nk/t2D4ykpjclu4F9dOJu3RF9noSEghakKF0imU0EkIhtJTi0v9Mu7KyVjz5qItbZtag6YA0tuwpl08+Fl3PL3yheimkhnHHAm8gkb/sJhCILeLHFrOmdsfpPPAUVmcc2jZe97CGRfk8JcDaRFRy4z5tCr++TfVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aD-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 71DA7C0988; Mon, 13 Apr 2026 15:43:25 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:43:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sergey Shtylyov <sergei.shtylyov@gmail.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: validate DT bootargs before appending them
Message-ID: <adzy_YQfWWS8OcIF@alpha.franken.de>
References: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
 <20260407120002.2-mips-dt-bootargs-v2-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407120002.2-mips-dt-bootargs-v2-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14125-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3A96F3ECC3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:57:03AM +0800, Pengpeng Hou wrote:
> bootcmdline_scan_chosen() fetches the raw flat-DT bootargs property and
> passes it straight to bootcmdline_append(). That helper later feeds the
> same pointer into strlcat(), which computes strlen(src) before copying.
> Flat DT properties are external boot input, and this path does not
> prove that bootargs is NUL-terminated within its declared bounds.
> 
> Reject unterminated bootargs properties before appending them to the
> kernel command line.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1:
> - use strnlen() instead of memchr() for the local NUL-termination check
> 
> arch/mips/kernel/setup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index f9b228e33f3b..1ae6d0c0e1d6 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -31,6 +31,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/dmi.h>
>  #include <linux/crash_dump.h>
> +#include <linux/string.h>
>  
>  #include <asm/addrspace.h>
>  #include <asm/bootinfo.h>
> @@ -541,6 +542,9 @@ static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
>  
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0) {
> +		if (strnlen(p, l) >= l)
> +			return 1;
> +
>  		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
>  		*dt_bootargs = true;
>  	}
> -- 
> 2.50.1 (Apple Git-155)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

