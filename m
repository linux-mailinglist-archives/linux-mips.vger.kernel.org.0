Return-Path: <linux-mips+bounces-13339-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIH0IbZYp2lsgwAAu9opvQ
	(envelope-from <linux-mips+bounces-13339-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:55:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B681F7CC4
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0712030B0F07
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 21:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EB44F7983;
	Tue,  3 Mar 2026 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="RLwZ/rk8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616324DBD99;
	Tue,  3 Mar 2026 21:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772574827; cv=none; b=rQUrywVhjsve5rWluV+D0zlBnhNWWz9yiEuOD5XkxXRpBWoqdcxJgh/BtLXMBpdMxG0lLGALbyVQqo3h7d9EtDYpTjw0XY2EsK98a6t+6DIrGW5JGUnYeWwlOcc/DaZn5cTFqV+Yx6qZL3bWs06UMDDEsEK2QVAFpEdiSYZvcHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772574827; c=relaxed/simple;
	bh=Qj69O/bykwzEu4dk5vkBv9W3rTXakvfnATFfpya/oiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asZih0+PLofwrXFYOiOI7RuNX8UTn2OGS3rrJvEbD96V6V61dKElcTbj53LkbC5UVMLIUh7XebhNEMr0s36Oq6Jc47DjGAiFGPxemhDR/ypTQ2aXc3kIifOtPmvVaEHa7fluZ1P7T6RQ5+zT7PECEeh3F80YnENyLEJ9IHR3XUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=RLwZ/rk8; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623LavOS3436858
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:36:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623LavOS3436858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772573825;
	bh=D1r1C1nkJC8myDUqBbWlJuno+S+Hsv+z3MI/a3FcqHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLwZ/rk8vaq6V4tFXUGKShs9EBYHpeXArYtAO8GRTPF0Qb9ckRJAy3tcD5EWeuBHX
	 vr0OB9eU7N3DVYjRVanoVDfqhq4F+AkTzExopgowDGEFypgJWOgNXBkU6FNdThL97f
	 Lw7JtD6O+ENFjRKkORJY5LGdYpcgeiUuBzkeJbD5nNV5qeKq9oq8xMw9GJMwXTJY58
	 GQjC3/XyTBNrpt/UhJOXTqWbTWEJKRY1JmqsyxsLflRD6J85F4d6toUWrWmiKQly38
	 ciLSIrOtlh968Kr67YxA/mjWIPI5I11u1R6hN8+kq3t5kAbHjJDAA+e6EhT7AmEGux
	 lOCVXVCJis+ZQ==
Message-ID: <0d2d834d-0f3c-43bb-9530-da6c2492763a@zytor.com>
Date: Tue, 3 Mar 2026 13:36:52 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
 <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 21B681F7CC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13339-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zytor.com:dkim,zytor.com:mid]
X-Rspamd-Action: no action

On 2026-03-03 13:27, Arnd Bergmann wrote:
> 
> I see. I would argue here that a link failure is actually the best
> case then: the entire point of CONFIG_COMPAT_32BIT_TIME=n is to
> enforce the fail-early case, as opposed to silent data corruption
> after (now) 12 years of operation.
> 
> I don't think there is an actual link failure here, as dl_vdso_vsym()
> resolves it at runtime by glibc (when using time32), while musl
> doesn't use __vdso_gettimeofday at all.
> 

Well, the former is a link failure -- just one handled reasonably gracefully.
A library that really wants a fallback can presumably also avoid the problem
by provide a weak reference for the fallback.

	-hpa


