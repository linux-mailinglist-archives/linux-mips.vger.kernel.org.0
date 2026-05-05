Return-Path: <linux-mips+bounces-14473-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA+pGbVP+mm8MQMAu9opvQ
	(envelope-from <linux-mips+bounces-14473-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 22:14:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A684D3880
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 22:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F123A3003808
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 20:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794021F5847;
	Tue,  5 May 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHORffGq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FD3A6F0A
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012082; cv=none; b=YpJQNpRntbqDaaKFPun9gCa91vTF3K+CEourURg/7lxNyLNmFp98P7sj/+dPGgCZHmOgUwuO/La3hCIY2CqebLNxgiuCcFp3/6MBpP6s+MVVmPhFwsf8tluOP6jbWY8BJ+rpUAv1AufJ5bjnOTPRIkO9pvyf26C3s9DkH81G82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012082; c=relaxed/simple;
	bh=fZNJP1E6FO2fjwXHd8ye8evSEUx0JyrqYT2u92kU9L8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OVHAEtgoPe/KLSjFZh763+KbxjwqHSJlhXmsNgaXW8onicNt0Vc5gRYV1RFFIuB051CKmRK8Z06vQwR3dNmQTfwlY4sGMc0NIZ4hiQVTKWex/h/ffA13Pz+R7PxhZKr3JNVYkVjSVBx+0y14oEcv769GeNobX0Sb8wiSw/5RFTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHORffGq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-364edd430e6so5472216a91.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778012080; x=1778616880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOAwuyt3rtVWRkmVcOSIKCDRqR2NsdJAT4GPMkewjlg=;
        b=kHORffGqByaWxtjxUBBzQ1qvBJM7sR83WcAANAxUs+ahB/hFk+YFWzTE1FxIUkm/oY
         /xW5CuV5KPA5f6G3TVU/3zrOXT02e+pZ5apvqBueuuueftpao9LjRLTI88igu8m8RMp/
         hEOht8c/z9khAlx71OUC7AehTEICFsHDnjtj2dA+YPNxYsHeFdRXgTnivWDB2+vNCK/v
         3pyoC9fxCG+SXUs89oJXmxHmKqlfZkahwib7JjiMH8TM88AvYYwAzkdD+UFPMEr8HNsq
         xlKzZAyq7Z1xEpN8TszfbkhFVR0tVK9zsWdQQb7ycRsjfwkcXDaT1V3OdR5JMTQcrS1n
         jAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778012080; x=1778616880;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FOAwuyt3rtVWRkmVcOSIKCDRqR2NsdJAT4GPMkewjlg=;
        b=kHfY11cMQGxZcdiSjeDL+40/cy92g1H6RCU0eTJ+A8c5sGc1EIsRfd6ovgxuDRAgCZ
         j5P8pNNaCwjhoOL7uEcnH7Wz/EalXUhs8MOGZHCEFm/DQXBz0z9La2MiVMh/9wVKLTVD
         BwrT+MVeD5/GT2c51vUwlkWqnrMP6JFJT9MILiOk208cBEsPB4cWWc0H0JNsxjU8xYgy
         B2Wpf1is/HAKn79uW9cqDY7bWEiggnScfmXwE9zcUHVyAqb+e9NB6vZbKclXNx6JMKYE
         s135luG1iZd8+d8TQYl8B8VlBY0cl4rltFFLH1OsUjhJeoFsrsBOMFsHf1QkKQ+Q0MqP
         nPfw==
X-Forwarded-Encrypted: i=1; AFNElJ8K+V9Uv6g0SVNt1X/ZSWRPx4g7a6CtqEXdNArg1t2aWBGSVEtnXueLrQ3ept+X80DZ63EzLhdfLvRH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MKeoX8B8gEmlu5yxv4Ppqjf8L8ZydsfdXrordaur43/xDnJJ
	xoVppxpeWXcVZ/lcRqQWRpUIsy+P3TDpa397AoVN/k4YDJv+WKLA57C7akcnqqNUV8ZDH397vke
	Ql1+ndw==
X-Received: from pgmt3.prod.google.com ([2002:a63:2243:0:b0:c73:fc44:8bb5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9c:b0:39f:27ab:2454
 with SMTP id adf61e73a8af0-3aa5ab17b2bmr365628637.49.1778012080089; Tue, 05
 May 2026 13:14:40 -0700 (PDT)
Date: Tue, 5 May 2026 13:14:39 -0700
In-Reply-To: <afo0Er7R4MnMP0MB@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
 <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com> <afo0Er7R4MnMP0MB@google.com>
Message-ID: <afpPr-a00an1v6mZ@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 08A684D3880
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14473-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	BLOCKLISTDE_FAIL(0.00)[209.85.216.74:server fail,100.90.174.1:server fail,2600:3c09:e001:a7::12fc:5321:server fail];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, May 05, 2026, Sean Christopherson wrote:
> On Tue, May 05, 2026, James Houghton wrote:
> > On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > There are more issues.  kvm->arch.mmu.split_page_cache can be freed b=
y
> > > kvm_arch_commit_memory_region(), which holds slots_lock and slots_arc=
h_lock,
> > > but not mmu_lock.
> >=20
> > Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
> > documented as being protected by kvm->slots_lock; we should be holding
> > it here. But we cannot take it here because we are already holding the
> > KVM srcu lock.
> >=20
> > > IMO, the handling of kvm->arch.mmu.split_page_cache should be reworke=
d.  I don't
> > > entirely get the motivation for aggressively freeing the cache.  The =
cache will
> > > only be filled if KVM actually does eager page splitting, so it's not=
 like KVM is
> > > burning pages for setups that will never use the cache.
> > >
> > > Maybe I'm underestimating how many pages arm64 needs in the worst cas=
e scenario?
> > > (I can't follow the math, too many macros).  But if KVM is configurin=
g the cache
> > > with a capacity that's _so_ high that the "wasted" memory is problema=
tic, then we
> > > probably should we revisit the capacity and algorithm.  E.g. if KVM i=
s splitting
> > > from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this o=
n arm64), then
> > > we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
> >=20
> > I'm not sure I've fully understood the point you're making, but I
> > *think* we can just drop the
> >     kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
> > line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
> > destroyed anyway.
>=20
> It's not that simple.  KVM arm64 allows userspace to reconfigure the capa=
city of
> the cache via KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.  kvm_vm_ioctl_enable_ca=
p()
> currently allows userspace to do that so long as there are no memslots.
> __kvm_mmu_topup_memory_cache() will (rightly) yell and fail if it's calle=
d with
> the "wrong" capacity, so we'd need to sort that out.
>=20
> The other issue is that it's not clear to me what happens for large "chun=
k" sizes.
> If KVM is splitting from 1GiB (or whatever huge-hugepage sizes are suppor=
ted on
> arm64) all the way to 4KiB, e.g. to optimize against break-before-make, t=
hen the
> capacity of the cache could be significant, e.g. MiB of memory or worse. =
 My read
> of things is that purging the cache when dirty logging is disabled is a g=
uard
> against consuming too much memory when the chunk size is large.

If we go down the "let's simplify things" path, one way to simplify the han=
dling
of KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE would be to disallow changing the chu=
nk size
once the cache has been used.  That would allow deferring teardown of the c=
ache
until VM destruction.

diff --git arch/arm64/kvm/arm.c arch/arm64/kvm/arm.c
index 176cbe8baad3..671f7ac5e31d 100644
--- arch/arm64/kvm/arm.c
+++ arch/arm64/kvm/arm.c
@@ -165,7 +165,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
                 * To keep things simple, allow changing the chunk
                 * size only when no memory slots have been created.
                 */
-               if (kvm_are_all_memslots_empty(kvm)) {
+               if (kvm_are_all_memslots_empty(kvm) &&
+                   !kvm->arch.mmu.split_page_cache.capacity) {
                        u64 new_cap =3D cap->args[0];
=20
                        if (!new_cap || kvm_is_block_size_supported(new_cap=
)) {


