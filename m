Return-Path: <linux-mips+bounces-15011-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yCkJNNcJKGoC7wIAu9opvQ
	(envelope-from <linux-mips+bounces-15011-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 14:40:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C666601C6
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 14:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15011-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15011-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48E7302C5FC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 12:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125A7416CFE;
	Tue,  9 Jun 2026 12:37:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B13B3FBEC6;
	Tue,  9 Jun 2026 12:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008643; cv=none; b=RyMvJvH0v1HBQy7m1Kf2Kbi4cbqd+msKqrqWJYsk9UzXcVcIZYkXCDXgmf+/a4xI4SCUG8gO7puloW/5+XQFlKib/HGU0JwY/zZ94U+kArJLKXce/sWTGT9yC/1WGFJWQF/noAcnS6QfwS9gPemJeo0X2aWHd1jVyPL0A8am0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008643; c=relaxed/simple;
	bh=I8MfV8LIRqFznA4MUdahkkVUm3dHQTaN2smmLgCT5qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8F/vd/0DFBUsqrs65hHBJTZqOiis69Tgt6YBuqMgsen1uZrlzODxFkbdsGKcm6RB0AVNa8iHFjk9XQ3pFDddkTjGY9o7AjUH7pmcvEo416LhISDFd/8AQz9TYgVWs5b69ZUC2SUzF7sUp6jANovvOiYK4tQL8c3nqkEzhSxABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 05F52222D65;
	Tue,  9 Jun 2026 14:37:20 +0200 (CEST)
Date: Tue, 9 Jun 2026 14:37:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, michael.roth@amd.com, nsaenz@amazon.com, 
	anelkz@amazon.de, James.Bottomley@hansenpartnership.com, 
	Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Message-ID: <aigE2EvJyZlYDz0V@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
 <aib8n5lO6HKbLC4Y@8bytes.org>
 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.79 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15011-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@hansenpartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,8bytes.org:mid,8bytes.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26C666601C6

On Mon, Jun 08, 2026 at 07:58:43PM +0200, Paolo Bonzini wrote:
> Related to this, let me know if you want me to pick up again the
> common part, especially with Sashiko being hard at work on it.

Yeah, that might be good, let me think a bit about it and discuss in tomorrows
PUCK call.

> The idea of the userspace scheduling was that you're not forced to use
> it - the kernel can always choose to override it if it's using an
> accelerated implementation of planes (and of plane switching). But it
> also leaves some leeway to different accelerated implementations, each
> of which can pick their own algorithm.
> 
> Conceptually I'd rather keep the possibility of userspace scheduling.
> But maybe it doesn't add much.

My preference is to keep plane scheduling at one place (in the kernel) to keep
it simple. But if you see a need for user-mode to interact there as well (only
really works for VSM), then I can add it.

I read a bit more about VSM and it seems their prioritization of VTLs is a bit
more complicated. VTL0 has the least privileges but boots first, then sets up
VTL1. But VTL1 is only higher-privileged once it is locked by VTL0. Another way
to look at it is that VTL0 de-prioritizes itself.

The patches here are built around the assumption that plane0 is the highest
privileged one and is always runnable. Running any lower-privilege plane must
be triggered by the guest. This is clearly not sufficient for VSM, the question
is how to solve that.

The answer depends on how IRQ delivery affects VTL scheduling in VSM. If a
VM has VTL0 (currently running), VTL1, and VTL2 (highest privilege), and an IRQ
becomed pending for VTL1, does Hyper-V schedule VTL1 directly or does it switch
to VTL2 (highest privilege) first to let it schedule VTL1?

When VSM switches to VTL2 first, then planes could just use a marker for the
highest-privilege plane (which can be non-zero). In the other case the solution
is likely to make the direction in which the vcpu->common->vcpus[] array is
traversed configurable.

-Joerg


