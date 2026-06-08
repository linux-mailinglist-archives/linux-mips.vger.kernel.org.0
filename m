Return-Path: <linux-mips+bounces-15001-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ImWmEOIHJ2ryqQIAu9opvQ
	(envelope-from <linux-mips+bounces-15001-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 20:20:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A46D659A5C
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 20:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15001-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15001-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D9630942DF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 17:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604DB36C5AC;
	Mon,  8 Jun 2026 17:52:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E007C343D66;
	Mon,  8 Jun 2026 17:52:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941132; cv=none; b=iz2cmYtYJKuYU4/tpeRohdgAX5oZ5snV4T/fRGloWQiej+78Du2IRwi7J9/FnWswr53aymDJacPfJdyvyeZrNWdgdLXkORwGLYX8aWqtjLPXvTDHdpuyWP2mOjiEo7cXHO3u1UmIvq9NHpbr4F9P/U8PeBmITSf64k3vBLij+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941132; c=relaxed/simple;
	bh=QSal/tVkHxeb9vLgIzl1B7joICUP1agySJd1l/0Ed44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzNipArLblF7NScUg67dY01kGA+1fLn6U66jStt4aqwF/Btz7hPBfVPkVbXRunkUEaiQ8gEodi3m5ggUK7oy23z/mdD5Rt3l6ivwUtOrIwd09y0Blfd8XUn8AdfloWyA03B6aMLgHAp3Ywd+LJywUKhOj9ATW57500ZKavLbxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 46872202AB5;
	Mon,  8 Jun 2026 19:52:09 +0200 (CEST)
Date: Mon, 8 Jun 2026 19:52:08 +0200
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
Message-ID: <aib8n5lO6HKbLC4Y@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-15001-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,8bytes.org:mid,8bytes.org:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A46D659A5C

Hi Paolo,

On Mon, Jun 08, 2026 at 06:47:54PM +0200, Paolo Bonzini wrote:
> On 6/8/26 16:42, Jörg Rödel wrote:
> > From: Joerg Roedel <joerg.roedel@amd.com>
> > 
> > The algorithm is to always run the lowest runnable plane. Plane
> > switches are done by stopping the current plane and setting another
> > runnable.
> > 
> > Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> 
> This was left arbitrary in my version because for example Hyper-V VTLs use
> highest-runnable instead.  It also made pure userspace scheduling possible,
> though that may not be very important in the grand scheme of things.

IIRC what Hyper-V does is always the run the highest-privileged runnable level,
no?  Maybe in their numbering level 0 has the least privileges?  Anyway, I am
happy to make changes here, also based on input from the VSM side.

> Did you drop it because it didn't work, or just for simplicity?

The user-space scheduling worked, my 6.17 planes implementation used it. But
there are some problems with it going forward, because TDX Partitioning (and
likely ARM CCA Planes as well) do not allow arbitrary switches forced by the
hypervisor. All they allow is a forced switch to the highest privileged plane,
the SVSM on SNP will force the same constraints by making lower-privilege VMSAs
not-runnable when it executes.

So exposing an interface for user-space to chose which plane to run does seem
to gain some weird, platform dependent semantics going forward. TDX and CCA
also require in-kernel switching as they can switch planes without a VMEXIT, so
I decided to have it from the start.


-Joerg

