Return-Path: <linux-mips+bounces-14388-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPh6F1qz8WmwjgEAu9opvQ
	(envelope-from <linux-mips+bounces-14388-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 09:29:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EB49077D
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 09:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12D6A30157C4
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 07:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D084D3A4521;
	Wed, 29 Apr 2026 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/A2mRIC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD90F3A3E7B;
	Wed, 29 Apr 2026 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447159; cv=none; b=jXz413PdP1RS/OzYCzOJGFuz4jiZTQhFYJAhe36KHLXkT8pVtEH3kg3JB/KxSuoGhoUd1bnOLFWsHFhkhv4DgqtkXlApJ3dphx9Bs4EPBR9RmTbe6n1XSGY0v+KOOAA+RXYV80ZJ4DScwGROyAHEkb8Og0aOgp19TULp2nklfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447159; c=relaxed/simple;
	bh=M8jWi/iwARsSCdhnsrumHZijiF7Pox6rExtjsTJLJHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XyVZIl4zfb7GIBmPsP2l4HBwE7hSKzm/HXR9Ii9E/D1kl4hglovp7kDyLbvzVzSpInOGMwobTikuw6vpmFxKD5T+2NQTpF+HOwpfppQfSb02q7bCmHwlZIYCZKDdkDZ+7D5ETU8MQs2f6GwipLYgXA3DSpEFcQmypq8U7mge8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/A2mRIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65358C19425;
	Wed, 29 Apr 2026 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447159;
	bh=M8jWi/iwARsSCdhnsrumHZijiF7Pox6rExtjsTJLJHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D/A2mRICO84nLmSp93o3iYWAW1Az6jzLxPdtj1B8fIDB6l+8IVEneALtWUN/qURFX
	 5GwVRKkrnf7AEy3hyAeryB8j3BxZf1HSk44vRGeF4pIkMVRp3mEKpNFsSNRMKxxkN3
	 Ne5V8nXrn/HPn9jAjFZyxcQ81OeTf6gJLSy2QQ7gtZrLIfVwLdhxXy95LeRNc8HMvb
	 kokjcNJFrUE8FEjynUPYM6d8rLSR772FJPJRkPOMnsW9uNo6Hk6RYmWZXGJEPDfPpp
	 ymWwJJgWQHtJpKmD1tQSv3FiQzpkjq3EY8EDDM5aIwgQwiFxERXObATs1yGVX4AQNg
	 iRDoEgDw1y4gA==
From: Thomas Gleixner <tglx@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Caleb James
 DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH 2/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
In-Reply-To: <20260425123531.270548-3-cjd@cjdns.fr>
References: <20260425123531.270548-1-cjd@cjdns.fr>
 <20260425123531.270548-3-cjd@cjdns.fr>
Date: Wed, 29 Apr 2026 09:19:15 +0200
Message-ID: <87tssuxmh8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: BA7EB49077D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14388-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.605];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, Apr 25 2026 at 12:35, Caleb James DeLisle wrote:
> This of course subverts the traditional intc hierarchy, and on the
> 1004Kc the interrupt controller is standardized (IRQ_GIC) so it can be
> reasonably considered part of the CPU itself - and tighter coupling
> between IRQ_GIC and arch/mips/* is tolerable. However on the 34Kc
> the intc is defined by each SoC vendor, so we have the task of making a

s/so we have.../so it's required to have a modular driver/

or something like that. Please use passive and factual voice for change logs.

> reasonably modular driver - but for a device which in fact ends up
> taking over the entire interrupt system.
>
> We let the DT describe which IRQs which come from the CPU and should
> be

s/we let/Let/

> routed back and handled by the CPU intc. These particularly include the
> two IPI interrupts which would otherwise necessitate duplication of all
> the IPI supporting infrastructure from the CPU intc.
>  /**
>   * @membase: Base address of the interrupt controller registers
> + * @domain: The irq_domain for direct dispatch
> + * @ipi_domain: The irq_domain for inter-process dispatch

Can you please make that tabular for easier parsing?

>   * @interrupt_shadows: Array of all interrupts, for each value,
>  
> +/* When in VEIC mode, the CPU jumps to a handler in the vector table.

This is invalid multiline comment style.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

> + * The only way to know which interrupt is being triggered is from the vector table offset that
> + * has been jumped to. Reading REG_PENDING(0|1) will tell you which interrupts are currently

> +		if (receive >= IRQ_COUNT) {
> +			pr_err("%pOF: Entry %d:%d in %s (%u) %s\n",
> +			       node, i, 0, field, receive, "is out of bounds");

Yuck. What's the point of the last string constant argument? Just stick
it into the format string. All over the place.

Other than those nits, this look like a reasonable solution for a
completely unreasonable hardware design.

Thanks,

        tglx

