Return-Path: <linux-mips+bounces-14440-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKCqFsQh+Wmz5wIAu9opvQ
	(envelope-from <linux-mips+bounces-14440-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:46:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94004C48AB
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 00:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58D6F307184B
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 22:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD2538CFEF;
	Mon,  4 May 2026 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pNCJCJOs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F69B38AC8E
	for <linux-mips@vger.kernel.org>; Mon,  4 May 2026 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934564; cv=none; b=jK+Po7avkMRpQ7FxoERD6jNJcgowI1Sa1gt1trF6EY2odPQTwTKXd5LXReTBKHtVxjTf3lBMvRNHFp4ZqyxBDjCCEkit8pAJuX3howh/issHhb7DOyAvHxFmRBGxSdyYZ29/l2VnW+dM8YGQ89PO2wg/sCQs6tUB7uWM15qwq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934564; c=relaxed/simple;
	bh=CUOCTJmVRKCTLlMSZJdBYm2KCJJFvArAmComUQyKG2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OvVj3vUJW/ZM4blusG7z+InA5JtXZWXP4TGiu1TenPWo98pRnq1nx0e1+YedHp8LoHsfKHgdmd7HoW9bm5aIzNTHmEpFEvotLjWFdvKq9yK1YNAM0Rzx5kS07OZJaSvxg1gaRYhU+drt9lZm+5hJfLnSS9+NfjgO27kpqMONaKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pNCJCJOs; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8234c06a10so122284a12.3
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2026 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934562; x=1778539362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPDlks8S40wU9ZB94GBJYrEHqJjoYpfybndF76KRr9U=;
        b=pNCJCJOswO7K0JMYh1I3F/+isDgwdbxdEw4UIMAmGDvBvyz28YtVXt7eyd5EW5JvUm
         Puju2oC7k7acSosIAEADK+iQq6aw+vpi/dgjtIxltMHLajPeIR29ZlWyumfp2UVn/i+N
         ECet1OB++24jQSDQKV23E0KetxYMuBaAq/JnjJXpB+js6l7t/tIF+HUJIf0OKNtmwN0H
         CMlTJOQjil+3a+wUNSVwpXjvDbXriag2MjW2CRj2989wJJxxL8GsXK4fcYMIQ141goSB
         QxMoONNha3nCdZBy9QtC2HumKJtyEdhNAnESZ2ipqoqgMljGQHDGiKPn0bBt0zNcMRke
         jRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934562; x=1778539362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPDlks8S40wU9ZB94GBJYrEHqJjoYpfybndF76KRr9U=;
        b=FwAmiceJ++ge371DFJqBqPBQktsUF/X1Gb13Q1/XwY0m5NlwzCmpZnvl1WCwSyqhl7
         j58AmCn44ihNK+HgPjFcXyW/uOzkHZuLGwoabLnO/alB7leo6Yo6izYWjvoUsKRr8pCx
         oqC5dgluUhkjRxqb6xOBPYRAsezT6LWPC9DZXdDG5lEUjOqs3RKn0KuK/XpMghGhKC0m
         v+mNVmSC4WLYJOYFcimxLiQO40lI9nfVh9Go3ezjm3aIjgFvzH9EXgr80g0ok8bziQCk
         vgzXkmySQQp+wrg7n+4GI5Nj7vT+G3BoV8UeHsFuK5vAHbL3SZ4i8CI9piA6I+ti5eBJ
         Pc0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+hLoMkGMN7kBU0HTntge5Qa+wcooz37WMgQZL5A+3IwM0oAAWZYnTSkN3rP080p3Xq+OpoMuRJPSk1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbrh2K22HIfUVvCfDkX7Pj0GE7RTLyM4aPOGFGfYoBejn4FkGb
	gjclV2cMaRfGLPf9wbAbvAyqXHGYlgXlHH7tdq4OwSNJRgr44metpTlFvteJdvSTH3DdH7CxuG5
	0XOchYc+Q5NczUj1wRWocOg==
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:c79:8315:4734])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:918a:b0:3a2:e0d3:37d1 with SMTP id adf61e73a8af0-3a7f1eb20dbmr12044574637.41.1777934561428;
 Mon, 04 May 2026 15:42:41 -0700 (PDT)
Date: Mon,  4 May 2026 22:42:10 +0000
In-Reply-To: <20260504224213.1049426-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504224213.1049426-4-jthoughton@google.com>
Subject: [PATCH 3/5] KVM: mips: Grab MMU lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B94004C48AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-14440-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kvm_mips_flush_gpa_pt() expects the MMU lock to be held; it is not in
this path.

This can lead to a double-free of page table entries if
kvm_arch_flush_shadow_all() is called twice on the same `kvm`
concurrently; such a scenario is possible.

Cc: stable@vger.kernel.org
Fixes: b62091108633 ("KVM: MIPS: Implement kvm_arch_flush_shadow_all/memslot")
Signed-off-by: James Houghton <jthoughton@google.com>
---
Note: This is compile-tested only!

 arch/mips/kvm/mips.c | 2 ++
 arch/mips/kvm/mmu.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..463b6c4aa62c 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -180,6 +180,8 @@ long kvm_arch_dev_ioctl(struct file *filp, unsigned int ioctl,
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
+	guard(spinlock)(&kvm->mmu_lock);
+
 	/* Flush whole GPA */
 	kvm_mips_flush_gpa_pt(kvm, 0, ~0);
 	kvm_flush_remote_tlbs(kvm);
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index d2c3b6b41f18..5045833f8116 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -269,6 +269,8 @@ static bool kvm_mips_flush_gpa_pgd(pgd_t *pgd, unsigned long start_gpa,
  */
 bool kvm_mips_flush_gpa_pt(struct kvm *kvm, gfn_t start_gfn, gfn_t end_gfn)
 {
+	lockdep_assert_held(&kvm->mmu_lock);
+
 	return kvm_mips_flush_gpa_pgd(kvm->arch.gpa_mm.pgd,
 				      start_gfn << PAGE_SHIFT,
 				      end_gfn << PAGE_SHIFT);
-- 
2.54.0.545.g6539524ca2-goog


