Return-Path: <linux-mips+bounces-13168-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGF4O51vjGlmngAAu9opvQ
	(envelope-from <linux-mips+bounces-13168-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 13:01:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 565871240A2
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 13:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CC03007F6B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 11:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B7A3128CC;
	Wed, 11 Feb 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyP++iWg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377426B973;
	Wed, 11 Feb 2026 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810718; cv=none; b=HIuOWQJ8KuuA0xLGib2FDWcJIz+ypUjq4Ka1AhO16HvZ5tyhU+kCSohd8hrHQE+MRitTcWpeoeSndHkn7BWN8dEP7H25Oac81kl0DmpReW4kBXl1k1xAgL5CU/FGrVYblTJVGcJOxtanfQ/YX+iNH8FRjrW4AufS1Ykm+ci+MwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810718; c=relaxed/simple;
	bh=NZB0rymbe6FPxf2mflkPdYc5jzmc/oVb2wW+byOyLhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hjg65ovvcqzYJq9phUzFmwLH1FZ9QfSNyztWbOgW+lGIZTGy2vtkHJ7xA9MOs5Ixaqvbto71D5Ej94GQxTJvkQKD6GBUSdlyLLSGK3rnS3blhF+ohyNSFzgnOXm2V7Hmh6eAO4MXyZFyERe5zymYQYGTD4rjbh8CmrI7JFNWCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyP++iWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA821C4CEF7;
	Wed, 11 Feb 2026 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770810717;
	bh=NZB0rymbe6FPxf2mflkPdYc5jzmc/oVb2wW+byOyLhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VyP++iWguHIHoeBJNRZ0BpMtlZGSDsUAUbJd14ECNQnaNjj7c2ZH8fgUh84FLX4b6
	 CksL06GbmfFgGQjjcRbTNJHs4i8tWG1DeJH35zbB7bKY8tN4j2zvKDUJX+RkzmP4jY
	 MQE9kfD6m1ZQWvuFd4kQU66hNwWnFgRnJzNYDAUEsIRXBgGHJKm/IeJCdvi1kDweYk
	 iOJuTaEW8YgXqsn73JCn+hg9QFmVanouBRQt6KQ+SAuycF4cBTBWuEHJdNZhBe/70c
	 jDdgJ/FSfHomEJRu1hnougs/ZPEmVmcwUu7EHyTvF0VTeG70V41c+tzVFQBScO7Xsc
	 XaG3yklLoZycw==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>, linux-s390@vger.kernel.org, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>
Subject: Re: [PATCH v2 1/7] genirq: reserve NR_IRQS_LEGACY IRQs in dynirq by
 default
In-Reply-To: <20260211094408.3463916-2-zhengxingda@iscas.ac.cn>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
 <20260211094408.3463916-2-zhengxingda@iscas.ac.cn>
Date: Wed, 11 Feb 2026 12:51:54 +0100
Message-ID: <871pira46d.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13168-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 565871240A2
X-Rspamd-Action: no action

On Wed, Feb 11 2026 at 17:44, Icenowy Zheng wrote:
> Several architectures define NR_IRQS_LEGACY to reserve a low range of IRQ
> numbers for fixed legacy allocations (e.g. ISA interrupts) which should
> not be handed out by the dynamic IRQ allocator.
>
> arch_dynirq_lower_bound() exists to enforce this, but today only x86 wires
> it up. In the current boot order this typically works because legacy IRQ
> domains register early and claim the low IRQ numbers first; however, that
> assumption breaks if the legacy controller is probed later.
>
> Make the default arch_dynirq_lower_bound() implementation honour
> NR_IRQS_LEGACY by clamping the allocation start to at least that value.
>
> Architectures that do not define NR_IRQS_LEGACY keep the current behaviour
> (effectively 0). Arm/PowerPC/MIPS/LoongArch use legacy IRQ domains for ISA
> interrupts and benefit from this change. x86 and s390 already provide their
> own implementations.

Q: How do all those architectures which do not require the reservation
   of the legacy interrupts benefit from that?

A: Not at all

   - PowerPC has its own way to deal with that depending on the platform
     the kernel runs on as not all platforms require it despite it being
     defined.

   - ARM only uses it when SPARSE_IRQ=n and does not need it
     otherwise. So again this changes behaviour.

   - MIPS is only using it for mips/longsoon64 and the rest of MIPS does not
     care at all.

So if you need that on loonson, implement arch_dynirq_lower_bound()
instead of making uniformed claims.

Thanks,

        tglx

