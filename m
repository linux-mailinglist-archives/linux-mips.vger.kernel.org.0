Return-Path: <linux-mips+bounces-13357-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Eh6F6rqp2kvlwAAu9opvQ
	(envelope-from <linux-mips+bounces-13357-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:17:46 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D61FC640
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 169C73012BE3
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 08:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EE439021F;
	Wed,  4 Mar 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvsY4JxF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9F31AF2D;
	Wed,  4 Mar 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611841; cv=none; b=lZZ3WDGSUEONNdqOGKik4Epk1ftDy18NL2GrYAu/c+9QzT4otbvBnD60JFbVKMkcJ6rM6fdgGPX9TUjiSnv3/8MPsTCGIZV30026mHiIhJMTqjnrd/Kr5u7zfUbxjpdIjzrcxXnR2GJwoNx+A6YjvV1htRsgmupTrBfQ8MzyMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611841; c=relaxed/simple;
	bh=x/cjkUsrdE57qY9IYoGwEYkkvopBW35thxqhqdiJIAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWuhvGSvgt+RqdEXOutsXBPR4IGmtHyDVpLq8+D8Hgtin98j0UK18FBjzNEVfI9ReVC+I3Iu0jQJfERJD6o+WtCYCqi1pAmOfAsSk7Z82oDKQU+9vWLAivLB4uDVfKcPfNbvTZZ0fr0PkBY6OtaUyFdN9OL8aS0Inzkx7RMEMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvsY4JxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53E8C19423;
	Wed,  4 Mar 2026 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772611840;
	bh=x/cjkUsrdE57qY9IYoGwEYkkvopBW35thxqhqdiJIAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZvsY4JxFcYf52LCAM8zNIoCTUr/ugS8UrXI8DpnABve0PkoahFeUDVQyAZ2T7w5tc
	 qvDxXw377nK660zLOZq0b1o4TMaqwXcThhKOlEpjZFL0bkvwxztXrr9ZfUwyJTBKr8
	 cQxEFx0psqwMRwqmtOZEExTbQ7fXQvjYQp1XY9q5+MJUrg2BO+qa42sUoMUFw/UKDM
	 FTPPks6SNAe+9AFIQxr/FV9a/NoFSZsQPHrTqKnPcpAk+LPhi9vX+9vtaSsBZMqckd
	 jCBvfJZ1aYZ2JCuOJ5wjnShT63I1i+NIZT0LHit09LZaUnxSAYz27d1DHaKybPv+SF
	 oKjTezLFpLZ+A==
Message-ID: <21ee2f0b-ae8e-40b6-ab13-e46f55c34254@kernel.org>
Date: Wed, 4 Mar 2026 09:10:31 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] vdso/datastore: Reduce scope of some variables
 in vvar_fault()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
 <20260304-vdso-sparc64-generic-2-v6-1-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-1-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C59D61FC640
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13357-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:email,linutronix.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action



Le 04/03/2026 à 08:48, Thomas Weißschuh a écrit :
> These variables are only used inside a single branch.
> 
> Move their declarations there.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   lib/vdso/datastore.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index a565c30c71a0..2cca4e84e5b5 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			     struct vm_area_struct *vma, struct vm_fault *vmf)
>   {
>   	struct page *timens_page = find_timens_vvar_page(vma);
> -	unsigned long addr, pfn;
> -	vm_fault_t err;
> +	unsigned long pfn;
>   
>   	switch (vmf->pgoff) {
>   	case VDSO_TIME_PAGE_OFFSET:
> @@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			 * Fault in VVAR page too, since it will be accessed
>   			 * to get clock data anyway.
>   			 */
> +			unsigned long addr;
> +			vm_fault_t err;
> +
>   			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
>   			err = vmf_insert_pfn(vma, addr, pfn);
>   			if (unlikely(err & VM_FAULT_ERROR))
> 


