Return-Path: <linux-mips+bounces-15684-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7sVaOXtqT2pWgQIAu9opvQ
	(envelope-from <linux-mips+bounces-15684-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:31:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8D72EF87
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=BX2yr5ox;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15684-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15684-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02BAD3037A5C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 09:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4D63E3DAF;
	Thu,  9 Jul 2026 09:30:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9093F0755;
	Thu,  9 Jul 2026 09:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589434; cv=none; b=TFJFh//CNwP9pELd6nMvvwSO4aarUI/11mOxfEQ9AQbf/mBU1T8ikevfeS3yoeQTIf2wTFJs5IBVTy9CggFQqZFaWyHaDU5zxWWlBiULZx7In+I/hZ3hgx5hetzfFZ/XxHKJMA9dRcI4UYMSax2PJqCfCcs6wV8CXzG66Wey4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589434; c=relaxed/simple;
	bh=gkbcCKmYABm1VJL9iiBAv1PML9K/4RhD0DsCywNLHaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW93fWV6Vxi59i+Z1e8vfPA4C4DbZzLpup2YhaLBJHfXPd9zdh5vctql0mQecvVtVRuhbUvMGvULG/ACXAbP8I0zbzh9W6a2TxLrHZY2kNuvoueTA/J3mwbRParThWoCsiqPJCpMtGmk6sZKHuP/775jvqAOeOvnbmKSRDscC80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BX2yr5ox; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 365A9357B;
	Thu,  9 Jul 2026 02:30:27 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 993D33F66F;
	Thu,  9 Jul 2026 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589431; bh=gkbcCKmYABm1VJL9iiBAv1PML9K/4RhD0DsCywNLHaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BX2yr5ox0DG6qH7q4NuvQvr7KxQiLF4K926Df7ZqT+BCbYaxFW2q6FcTYmNAGmCyT
	 vQdfDowStNCbGHFgPC7riR/WOSAh87CLArzkG0pBpmuV2IiIkCA8Z7xxzCFrQSD0Aq
	 WRJgLwVE5AgoLrk0dNS7vbbDuYKDpI1n01Zvxa8c=
Message-ID: <b5b0405c-82fc-4c3c-9d53-266eccde29c9@arm.com>
Date: Thu, 9 Jul 2026 10:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] vDSO: Automatically select HAVE_GENERIC_VDSO if
 necessary
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-4-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-4-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15684-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C8D72EF87



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> gettimeofday() and getrandom() in the vDSO require the vDSO datastore.
> 
> Enable it automatically if either one of them is enabled so the
> architecture code doesn't need to know this.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  lib/vdso/Kconfig | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index db87ba34ef19..eedb04974fd5 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -3,10 +3,9 @@
>  config HAVE_GENERIC_VDSO
>  	bool
>  
> -if HAVE_GENERIC_VDSO
> -
>  config GENERIC_GETTIMEOFDAY
>  	bool
> +	select HAVE_GENERIC_VDSO
>  	help
>  	  This is a generic implementation of gettimeofday vdso.
>  	  Each architecture that enables this feature has to
> @@ -21,7 +20,6 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
>  
>  config VDSO_GETRANDOM
>  	bool
> +	select HAVE_GENERIC_VDSO
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> -
> -endif
> 

-- 
Regards,
Vincenzo


