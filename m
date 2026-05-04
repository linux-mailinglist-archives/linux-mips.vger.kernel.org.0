Return-Path: <linux-mips+bounces-14444-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKR9JY4n+Wmp6AIAu9opvQ
	(envelope-from <linux-mips+bounces-14444-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 01:11:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E930E4C4C35
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 01:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D816A30056C3
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2026 23:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16D03939A4;
	Mon,  4 May 2026 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RzmO6ZuJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBE3932C8
	for <linux-mips@vger.kernel.org>; Mon,  4 May 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936252; cv=none; b=hwyvPSldPyxNUo9UwkcuJ7CweKsGHpLBreLr/cFhPh9r9r94vw9vmiKuR3PvKmJGh4UGMsAEnzS1jbBJKlyxvsFQ/M4XieD8r8E12/NTwZu4/Ie/Zdg8FWneKDSEoM4lhB61futJjC0zPJDBqtQStJvzp2Z93LKCGlKd3fCHg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936252; c=relaxed/simple;
	bh=e1v+wg5Mt+4G2ehJr+dbUseIs8rNc8zIUsahECLU2nU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qHj1GTu2C+A0wTcQG41ZVD1bfEZMTbRtoEnTe0nHgT/GNMnxgfQl6KHvz/1f1rLZCAToH26Z2cIx0ke8H+Nz73VyltsOeYOeiuiHGNx6MfJup5zL8KHncMCFpZgYHYhMJUaPvAc6qjyb/R+3AB4icBEwiB+q1eigzrZEBGiCwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RzmO6ZuJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36512f223d8so4713467a91.3
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2026 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777936250; x=1778541050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAttJD+RV5lk5kNpW7EPj87JP+4oaqPyp5frl0M0LOQ=;
        b=RzmO6ZuJiopjK38sYolMzLnHfoNKdZUPClmlYeciE2hDCq/GK68Af+Aq4ilU/LBOyu
         HJgBS3Rjnc7jW3gfRj9bBOY7lYfn8muJKT+JUFj9JRmWwhHAL5TCRNNYb2Fz0eG6Au2O
         lATPW9Wnlpi43hQ5ZZNncwTF+LkssYpWjZKAGzDtodO9AWVFumfKNdH5kOCopS00GhJi
         W7EtlDbcGr/xMPMltlyKoeKW5SZvrTbxNmdDqyjcYcfJ/XASjAdYvasigg1MnxkeeCCU
         EKsOWAY8ND2hZDD1rGaRpaRxKED4xNaaKQJkAcfTu2GsDkLoZuoKtAgSycAa59PCwreb
         meCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936250; x=1778541050;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAttJD+RV5lk5kNpW7EPj87JP+4oaqPyp5frl0M0LOQ=;
        b=GAao5TeEURtBK5Ah0L0MU1ZU7GpsSAFapnwiJlfx+ETj4bEQgy9z3szIuCZ0LoVRgy
         sRoY4qyudtofHNgOSrwEOKSDpB7IWVJdKtgUGrwykxkHjcYEoDfcg9p5mbhmb0N1GRAH
         gB0kOVa+JXOnfJlGDby0VgVj/zqO0EmTkpgX0YXeppuSgsx+tifVxxDdrBtb5KiBtTTH
         NxiS0Xy8mFD6WHjgBN3N2z7KngC2U7M/ghaVhYIQ2naoEVUE2ghL/u/jKfw2HwwOX8SB
         sukcgn7j+0vTtrKqTUNBhuCI5RcuxmT1zNpFgxz5CVQe6/zC2M5207/lkqpr++kmuwgA
         lNBA==
X-Forwarded-Encrypted: i=1; AFNElJ+6HjQxcSAinYj7m86d/GlHjbvCUiLEvh5tnA6EUKcoqwxr5IPY9c5PP25EzqX+loyYkKR2ac7houe6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6HvCtH6Cyqmn5pC6E2euAZPTthu9L7q/aEPTFKmm2f190YTOt
	xIM8cQRlXq6KzEW2/5rVJNX1mSCs7ZUct0nH9tncUUk3nTT473aBOmbVe2mZLm9AKR5YA92QfbD
	QNWscqYMwZuqJ3w0EuR8Uyg==
X-Received: from pgbcs4.prod.google.com ([2002:a05:6a02:4184:b0:c79:8b14:e151])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:580f:b0:35f:bae8:3531 with SMTP id 98e67ed59e1d1-3657761ae72mr698785a91.25.1777936249486;
 Mon, 04 May 2026 16:10:49 -0700 (PDT)
Date: Mon,  4 May 2026 23:10:47 +0000
In-Reply-To: <20260504224213.1049426-2-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504231048.1184273-1-jthoughton@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: James Houghton <jthoughton@google.com>
To: jthoughton@google.com
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	seanjc@google.com, shahuang@redhat.com, stable@vger.kernel.org, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E930E4C4C35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-14444-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@google.co=
m> wrote:
>
> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> concurrently in the event that the KVM's `mm` is __mmput() at the
> same time that last reference to the KVM is being dropped.
>
> T1              T2
> KVM_CREATE_VM
>                 Get VM file from T1
> close VM
> exit_mm()       close VM
>
> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>     with only the KVM srcu read lock held.
>
> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>     again, with only the KVM srcu read lock held.
>
> This leads to a potential double-free of
> kvm->arch.kvm_mmu_free_memory_cache and now with NV
> kvm->arch.nested_mmus.
>
> Cc: stable@vger.kernel.org
> Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is =
enabled")
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  arch/arm64/include/asm/kvm_mmu.h |  1 +
>  arch/arm64/kvm/mmu.c             | 23 +++++++++++++++++++----
>  arch/arm64/kvm/nested.c          |  4 +++-
>  3 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kv=
m_mmu.h
> index 01e9c72d6aa7..30d5c24fcebb 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -178,6 +178,7 @@ void stage2_unmap_vm(struct kvm *kvm);
>  int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigne=
d long type);
>  void kvm_uninit_stage2_mmu(struct kvm *kvm);
>  void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
>  int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>                           phys_addr_t pa, unsigned long size, bool writab=
le);
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..4bab407d43bb 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1021,7 +1021,9 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm=
_s2_mmu *mmu, unsigned long t
>
>  void kvm_uninit_stage2_mmu(struct kvm *kvm)
>  {
> -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> +       lockdep_assert_held_write(&kvm->mmu_lock);

*facepalm*.... this doesn't account for the other callers of
kvm_uninit_stage2_mmu(). They will get lockdep warnings.

I've attached a diff to the bottom of this reply that *does* deal with them=
.
:( Sorry.

I'm guessing Marc or Oliver will probably want this patch to look quite
different, so I'll wait to hear from them before actually sending a v2.

In the meantime, I'll properly retest with lockdep enabled.

> +
> +       kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
>         kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>  }
>
> @@ -1095,12 +1097,14 @@ void stage2_unmap_vm(struct kvm *kvm)
>         srcu_read_unlock(&kvm->srcu, idx);
>  }
>
> -void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +static void __kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu, bool locked)
>  {
>         struct kvm *kvm =3D kvm_s2_mmu_to_kvm(mmu);
>         struct kvm_pgtable *pgt =3D NULL;
>
> -       write_lock(&kvm->mmu_lock);
> +       if (!locked)
> +               write_lock(&kvm->mmu_lock);
> +
>         pgt =3D mmu->pgt;
>         if (pgt) {
>                 mmu->pgd_phys =3D 0;
> @@ -1111,7 +1115,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>         if (kvm_is_nested_s2_mmu(kvm, mmu))
>                 kvm_init_nested_s2_mmu(mmu);
>
> -       write_unlock(&kvm->mmu_lock);
> +       if (!locked)
> +               write_unlock(&kvm->mmu_lock);
>
>         if (pgt) {
>                 kvm_stage2_destroy(pgt);
> @@ -1119,6 +1124,16 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>         }
>  }
>
> +void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +{
> +       __kvm_free_stage2_pgd(mmu, false);
> +}
> +
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu)
> +{
> +       __kvm_free_stage2_pgd(mmu, true);
> +}
> +
>  static void hyp_mc_free_fn(void *addr, void *mc)
>  {
>         struct kvm_hyp_memcache *memcache =3D mc;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 883b6c1008fb..977598bff5e6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  {
>         int i;
>
> +       guard(write_lock)(&kvm->mmu_lock);
> +
>         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
>                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
>
>                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> -                       kvm_free_stage2_pgd(mmu);
> +                       kvm_free_stage2_pgd_locked(mmu);
>         }
>         kvfree(kvm->arch.nested_mmus);
>         kvm->arch.nested_mmus =3D NULL;
> --
> 2.54.0.545.g6539524ca2-goog

And here is the diff that should fix this patch. (Sorry!!)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_=
mmu.h
index 30d5c24fcebb..e32e844943be 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -177,6 +177,7 @@ void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_a=
ddr_t addr, phys_addr_t e
 void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned =
long type);
 void kvm_uninit_stage2_mmu(struct kvm *kvm);
+void kvm_uninit_stage2_mmu_locked(struct kvm *kvm);
 void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
 void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4bab407d43bb..98ba8116676c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1019,14 +1019,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_=
s2_mmu *mmu, unsigned long t
 	return err;
 }
=20
-void kvm_uninit_stage2_mmu(struct kvm *kvm)
-{
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
-	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
-}
-
 static void stage2_unmap_memslot(struct kvm *kvm,
 				 struct kvm_memory_slot *memslot)
 {
@@ -1134,6 +1126,24 @@ void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *m=
mu)
 	__kvm_free_stage2_pgd(mmu, true);
 }
=20
+static void __kvm_uninit_stage2_mmu(struct kvm *kvm, bool locked)
+{
+	__kvm_free_stage2_pgd(&kvm->arch.mmu, locked);
+	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
+}
+
+void kvm_uninit_stage2_mmu(struct kvm *kvm)
+{
+	__kvm_uninit_stage2_mmu(kvm, false);
+}
+
+void kvm_uninit_stage2_mmu_locked(struct kvm *kvm)
+{
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	__kvm_uninit_stage2_mmu(kvm, true);
+}
+
 static void hyp_mc_free_fn(void *addr, void *mc)
 {
 	struct kvm_hyp_memcache *memcache =3D mc;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 977598bff5e6..f61f0244f0fb 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1201,7 +1201,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 	kvfree(kvm->arch.nested_mmus);
 	kvm->arch.nested_mmus =3D NULL;
 	kvm->arch.nested_mmus_size =3D 0;
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_uninit_stage2_mmu_locked(kvm);
 }
=20
 /*

