Return-Path: <linux-mips+bounces-15002-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3aMsE/0CJ2oNpwIAu9opvQ
	(envelope-from <linux-mips+bounces-15002-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 19:59:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3B659795
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 19:59:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=AUY6YrOQ;
	dkim=pass header.d=redhat.com header.s=google header.b=YnZxSl2I;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15002-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15002-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 748BD30055C3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 17:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A7E3BED2D;
	Mon,  8 Jun 2026 17:59:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90723AB27C
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 17:59:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941560; cv=pass; b=edR0sAvbmc6Zv3gl183iKpr5d73OhONBSn8Oi9UVDrC1zUl5gC8U6R9Qwd0k5l27t2rSDw4Ul34F0sZiOJ+bKpxuov5WslZCzdw31fZoT4CfRvMtrakA9ymoOZAvOjtsrOFa6a9pZoByn62hg0R18Sk7vd3sIbTpCCyzcxpRnhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941560; c=relaxed/simple;
	bh=Yh2vF4TIAGag+raZttED/lbT/nnkLgvDu0weKA8pAqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr+cIZBJYINJvYDJAlTgBXCcCxB1o5rK/7cssuIkhgt9jU7zpn4v9z+RnNNJUGGfJmYPnoV5jyuRTyAgms6eZFGNFC4VoBK9EB8REYq7pV4kZX/yu7RgWOgHs0E0tX9oWXDLpmp0NZDACndYN158hrixKPYzs9HpmGd5RRdwA1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AUY6YrOQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnZxSl2I; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780941558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
	b=AUY6YrOQ9plNq/CYRGbRoQJRYkCPVvA2/akADym9mecp+aeKLvwtw+Ry3h4rDKYS7BG1XC
	tsnSApEkjhrVZVzJmiGTO1BTgX0Osrwb2R978KntObSeKnp8n7TcRFLqrVGDPIXfCoNLPR
	d8kZC+Qz5T/fIpSBvXkCxGcqwqxMgx4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-slJBAoHNP7GukgDoZ-x1qg-1; Mon, 08 Jun 2026 13:59:16 -0400
X-MC-Unique: slJBAoHNP7GukgDoZ-x1qg-1
X-Mimecast-MFC-AGG-ID: slJBAoHNP7GukgDoZ-x1qg_1780941555
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490b37e1f48so38261925e9.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 10:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941555; cv=none;
        d=google.com; s=arc-20240605;
        b=f97k46AAyJ7pFmXtMWt2Qz7YfwzGO9qhfX63FrX37ZNyC0umOvNQR2rWnaij+GVljO
         HViWYDsmULhflIcxjy9JIUkEdaAL8shiByqN5SJe/jSHKW7OIXWLUt8k+12KQtat5OD6
         luXimYSyBU5754RRTWj76vwimEuEEAj4DfHJOJMKIPS+6WHFbyHZA+QrDOPH0QBPYhVz
         mJtb4HMueeP5Awu1ZCsOhakHyPLqvONfHV4UsOUxOzIBExfUCLcr2x8duDr+AoXPES3b
         UnwkigPb3rUAOwYhYaXWV8fNFCQ6s6ubYE8O8ilCh0f7x9Pd8iB6N2mIiRDRUsP7FNI+
         9zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
        fh=bJEnw2LH7fiyeabiUCzXF46VUWpzOZvGYtW6AT2ODJc=;
        b=f+MgE3XG0Petq4OnYKfU2waaw2j98ECJoNGK6+Wko9xrYszgmUllLteZQ2xEHIaj11
         iimNqUqiMv9V5suKi/uvtxET24YcNQKpeAsNmiuoAQgaivePerh4j19B+remzKa17+em
         ofLmz85/ya+pInzfhtBu4zw4Fe5gv+xgr4h6Z+SIzMfsrHa4nYrStxs1bcPmH437/gfU
         xrVntdPVHRy/J0XjlHqfYWRBh4RAf6638Kj7m9TcJGcBMuNKdOkKVjgQcbJV8/yuMjo5
         3UghREPJKYeE9KYPgOdssntjffzHSTxypyteBu/Sggqnkl7VBtMWqYv5zWJnwuujOg6v
         Avyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780941555; x=1781546355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
        b=YnZxSl2If3IairZCo5RwmZA0ERyuP5/oDA1FWmQLNRqHU7nK5c2RW9kT5bBLGER+CD
         ohmLEBOR5E84BaUiii7qAiFBG2YwK5y+x7yU+wg7PZu14+flVgfmgNqljsmdVehCepOA
         5JMF9fDnc+pinhWDeHPNeXx8nl/4PfwvUMeeUZsr4Sq+9hHNipmyirubiQjng99ZfFAQ
         iSzTDuysZd1z1F7WDKDj1Xidh0Em3U7biKnIBvJ3mHHDoChYjp8ijr3teyNH02+jTOx6
         mOVfqnBEdhmH7mzlTZJB02Qz0PnSF0DV+/ul9yo0FULtby3xS3qWdxMoqWvJd4PpMEMd
         xdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941555; x=1781546355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
        b=OW40ssjwQpSVfJLl1dPtZtd1EgaVN5X6acFBOnymuyleYtuYhVzFKhmc/tdU9gjKuT
         wGmLucM+SwnTc3frfKJPb8jovqunxD6PcMuDeQVV3i+QPtApa7KXhE/v6MCssBC9LcDs
         YDOKSmSa5IJzxB7xoDpeGgR18WVZY0qzeKZq9Va+60lake+lJkLlhC3c6MPwWTik6G50
         lLObP2odAfxmUZVdaTC8Zjn4AUW0sAIe548MB4/kS6vA+anLFFo4UMOWkjjFnSRpQW+C
         CM57fVVshUW3VpNr3ziYhypA6FwHQgFZUgGRDjGjLOS46KsmMKEBx4sVyUW/KSe+w292
         GXHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cdjsg1lSQc1ijZks7EjfPA0BgJmCZcFmoNDj/I0XUL2uZsCNg1VmXQISXaDaO9yUGu3nPhI9nk1fy@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGBw7YqeiopX30z/l1BZO9sWL2wxiPn6pmiFNFX2ZTmQe3Al7
	bt+PZ7MEk1gS/SEIYMcnTEnzNVEqewdhgTEa/uxAy5GFNtyD1Sd9tpIssZ+6xh0xFB9z1fRqZ5V
	3e3BABVm5xHqNqVGYrkdzVfEJl3FTygsLP9yaIj3Pjc7FIKFyVOy0QC342wQevNCOGnsMbcMIlT
	RgGIF//6VXTNYTLy6rwESeKgzdzq30Y6RyvzDbvQ==
X-Gm-Gg: Acq92OF00YSWmUHwRqwQZXh5WvgOO23A76yE9YkGMjzCrIDhWt+hOudFPAztmik7ZEh
	EVo5BJqPocu4hYXkgj2UBPD78B1P/FcAFQ8P3NO9rDgrpBp5MxzOSnZuZeuxcYdrhAR1HmqWOXi
	1OEFsJJol/ZHhBHjO0/HImGWAhcQkMXpTzCmm901OlonyzsZI/c1GFEvPoGkBtYYB3BWDg+JLKD
	KcgGbgn9yWy7U8EGAPU878WoQRpzvKcaFFl4+aJGJ5wYZ0wXMDM59BUmMPZe59oC22Nzk2PFIEz
	UI3BgCnb/roOBcko
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id 5b1f17b1804b1-490c25b5f6cmr285228275e9.13.1780941555109;
        Mon, 08 Jun 2026 10:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id
 5b1f17b1804b1-490c25b5f6cmr285227865e9.13.1780941554714; Mon, 08 Jun 2026
 10:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608144252.351443-1-joro@8bytes.org> <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com> <aib8n5lO6HKbLC4Y@8bytes.org>
In-Reply-To: <aib8n5lO6HKbLC4Y@8bytes.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 8 Jun 2026 19:58:43 +0200
X-Gm-Features: AVVi8CcaSI98hh9wFoB_n6cKHV5EHNPF6kPS5m5gs3YdhiTjEhtRfK4vGBfAwzg
Message-ID: <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, 
	michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com, Melody Wang <huibo.wang@amd.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15002-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@hansenpartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[pbonzini@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pbonzini@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,8bytes.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48B3B659795

On Mon, Jun 8, 2026 at 7:52=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
> On Mon, Jun 08, 2026 at 06:47:54PM +0200, Paolo Bonzini wrote:
> > On 6/8/26 16:42, J=C3=B6rg R=C3=B6del wrote:
> > > The algorithm is to always run the lowest runnable plane. Plane
> > > switches are done by stopping the current plane and setting another
> > > runnable.
> >
> > This was left arbitrary in my version because for example Hyper-V VTLs =
use
> > highest-runnable instead.  It also made pure userspace scheduling possi=
ble,
> > though that may not be very important in the grand scheme of things.
>
> IIRC what Hyper-V does is always the run the highest-privileged runnable =
level,
> no?  Maybe in their numbering level 0 has the least privileges?

Yes, exactly.

> Anyway, I am happy to make changes here, also based on input from the VSM=
 side.

Related to this, let me know if you want me to pick up again the
common part, especially with Sashiko being hard at work on it.

> > Did you drop it because it didn't work, or just for simplicity?
>
> The user-space scheduling worked, my 6.17 planes implementation used it. =
But
> there are some problems with it going forward, because TDX Partitioning (=
and
> likely ARM CCA Planes as well) do not allow arbitrary switches forced by =
the
> hypervisor. All they allow is a forced switch to the highest privileged p=
lane,
> the SVSM on SNP will force the same constraints by making lower-privilege=
 VMSAs
> not-runnable when it executes.

The idea of the userspace scheduling was that you're not forced to use
it - the kernel can always choose to override it if it's using an
accelerated implementation of planes (and of plane switching). But it
also leaves some leeway to different accelerated implementations, each
of which can pick their own algorithm.

Conceptually I'd rather keep the possibility of userspace scheduling.
But maybe it doesn't add much.

Paolo

> So exposing an interface for user-space to chose which plane to run does =
seem
> to gain some weird, platform dependent semantics going forward. TDX and C=
CA
> also require in-kernel switching as they can switch planes without a VMEX=
IT, so
> I decided to have it from the start.
>
>
> -Joerg
>


