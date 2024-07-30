Return-Path: <linux-mips+bounces-4593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5709410B6
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 13:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF3A1F231EA
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 11:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B544D19FA9C;
	Tue, 30 Jul 2024 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibH9nKZT"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5919FA8D
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339508; cv=none; b=D3F5MTNJ/fnsiulhWB93B8COFoV6QTdB1infqHkuPntMKHPkYVPZSkGT/aYHxrohTn6xS4axqlIR8tOpmsmsSrc/H1WUZtBbEXnUwGJXmJ+OZW3rgm0woXKUU02k8Q+nrx2Elsq2bYpFE0/yjiw/nOh80JFDDVazlz5hN2INuA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339508; c=relaxed/simple;
	bh=jEQjAI9y/pos62ZtY9408Lx8xEWIbgsSw4bTFr5ulUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsiEftmnT6ZsF6uNrkS0juXIUc53vI2WGGKv4BYXTtuVf/qQxEi238wbeE935Y+WQjP9glA35OTIjJsow2bYn1+YYd3n+NzP+VhNoMdNxw1dgN2nMOWZ18MzmeCYufaD1VHoHzao/sVFrpgM61cKzV4Epjk/vT7PioaXM/no7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibH9nKZT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722339503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ERqvjmTEXa43pGz7pfJyJekKhPX7hTshV7jfkEYTbUI=;
	b=ibH9nKZTkOTb/oNYtIL9rjXX2aED3hkVNA8bb8j7pXOaQBxKXAL8R2yjZ1EvYv3yGQpNdR
	08kC/Sk8E0/RbJO2o5f3ZUi/+N0MT7FR8J/gq/FKIX37YmJ8Ugiqdvma+js5elVimQcvDs
	jvfxREomdQiserjHemZoU18+8ILDVXY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-vqgyaS8oOkqt8RRb59_cnA-1; Tue, 30 Jul 2024 07:38:22 -0400
X-MC-Unique: vqgyaS8oOkqt8RRb59_cnA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5a8b0832defso8345446a12.1
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 04:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339501; x=1722944301;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERqvjmTEXa43pGz7pfJyJekKhPX7hTshV7jfkEYTbUI=;
        b=maTWmd4y7Z69rhYGzCviaD7W+1bb4zE/MD4wN6G9FnvLOHbcRJ0mZvtHXhjQpXZsnQ
         I+GUNW/Vc0tTc7YVAdQRoa5OhfH+KVntOFf2TySMOHl2Ch/Zwzb/0N5uH2E4skD6dAux
         M/S05mzkBtPVp55IKnceHTQWrEbWmOsW9gPJYtt7ofooWaW7UjVCvsdeKWIWDO9eAa6z
         mKg1txI4FCtW3REFyObqyz9VH1hxkd06L7kK0MV2lANorru9iWqhEgm+r3HYagPOdLMM
         Tztzwlo4RTq8VjzLVRfEfynhFRWXkc/fzHKiejWYbvcimRz+dnephjUgbJhrrt80RXo4
         uI9A==
X-Forwarded-Encrypted: i=1; AJvYcCWnAi/jndnEm8tauNDXy4jiE7D5C2TDFmKSFuRipAc2CqkROPsPFuxm4Jw00j64PxcHXND5wJyOKX9W3/27RZzaQpA9cwHrk3NPGg==
X-Gm-Message-State: AOJu0Yx/QrcXn/IW31d0Rj84rpJNJkEnSHzoyWcnDsJXQZNZuRNUtd3g
	FbzM4NXQkuatJgdj60kG93W0rFn2/DJQiK0xe7ghVCDj2W1fPKYRwVKtTHCsR+J3FLO/DzYtD/u
	j6J7QLI6iTNatMtzMFKtMzB/WJbtj7AbX0D7QLnZvUG3nuhnNl+UaPR0QtAs=
X-Received: by 2002:a50:8a97:0:b0:58a:f14f:4d6d with SMTP id 4fb4d7f45d1cf-5b46dcc63bemr1603227a12.19.1722339500909;
        Tue, 30 Jul 2024 04:38:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5mXget4GcehKSHwg1m9swHhHUWQVbVnzHoQE7CArjlMaR1EOy+GWFyRYZ9RZxu1lu8WCBeQ==
X-Received: by 2002:a50:8a97:0:b0:58a:f14f:4d6d with SMTP id 4fb4d7f45d1cf-5b46dcc63bemr1603198a12.19.1722339500323;
        Tue, 30 Jul 2024 04:38:20 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63b59c86sm7201458a12.42.2024.07.30.04.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 04:38:19 -0700 (PDT)
Message-ID: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Date: Tue, 30 Jul 2024 13:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-85-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-85-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/24 01:52, Sean Christopherson wrote:
> Now that KVM no longer relies on an ugly heuristic to find its struct page
> references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> have a valid struct page.  In addition to removing a long-standing wart
> in KVM, this allows KVM to map non-refcounted struct page memory into the
> guest, e.g. for exposing GPU TTM buffers to KVM guests.

Feel free to leave it to me for later, but there are more cleanups that
can be made, given how simple kvm_resolve_pfn() is now:

> @@ -2814,35 +2768,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
>   	if (kfp->map_writable)
>   		*kfp->map_writable = writable;
>   
> 	if (pte)
>   		pfn = pte_pfn(*pte);
> 	else
>   		pfn = page_to_pfn(page);
>   
>   	*kfp->refcounted_page = page;
>   

Something like (untested/uncompiled):

--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2758,32 +2758,12 @@ static inline int check_user_page_hwpois
  	return rc == -EHWPOISON;
  }
  
-static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
-				 pte_t *pte, bool writable)
-{
-	kvm_pfn_t pfn;
-
-	WARN_ON_ONCE(!!page == !!pte);
-
-	if (kfp->map_writable)
-		*kfp->map_writable = writable;
-
-	if (pte)
-		pfn = pte_pfn(*pte);
-	else
-		pfn = page_to_pfn(page);
-
-	*kfp->refcounted_page = page;
-
-	return pfn;
-}
-
  /*
   * The fast path to get the writable pfn which will be stored in @pfn,
   * true indicates success, otherwise false is returned.  It's also the
   * only part that runs if we can in atomic context.
   */
-static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
+static bool hva_to_page_fast(struct kvm_follow_pfn *kfp)
  {
  	struct page *page;
  	bool r;
@@ -2799,23 +2779,21 @@ static bool hva_to_pfn_fast(struct kvm_f
  		return false;
  
  	if (kfp->pin)
-		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, &page) == 1;
+		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, kfp->refcounted_page) == 1;
  	else
-		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page);
+		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, kfp->refcounted_page);
  
-	if (r) {
-		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
-		return true;
-	}
+	if (r)
+		kfp->flags |= FOLL_WRITE;
  
-	return false;
+	return r;
  }
  
  /*
   * The slow path to get the pfn of the specified host virtual address,
   * 1 indicates success, -errno is returned if error is detected.
   */
-static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
+static int hva_to_page(struct kvm_follow_pfn *kfp)
  {
  	/*
  	 * When a VCPU accesses a page that is not mapped into the secondary
@@ -2829,34 +2807,32 @@ static int hva_to_pfn_slow(struct kvm_fo
  	 * implicitly honor NUMA hinting faults and don't need this flag.
  	 */
  	unsigned int flags = FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT | kfp->flags;
-	struct page *page, *wpage;
+	struct page *wpage;
  	int npages;
  
+	if (hva_to_page_fast(kfp))
+		return 1;
+
  	if (kfp->pin)
-		npages = pin_user_pages_unlocked(kfp->hva, 1, &page, flags);
+		npages = pin_user_pages_unlocked(kfp->hva, 1, kfp->refcounted_page, flags);
  	else
-		npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
-	if (npages != 1)
-		return npages;
+		npages = get_user_pages_unlocked(kfp->hva, 1, kfp->refcounted_page, flags);
  
  	/*
-	 * Pinning is mutually exclusive with opportunistically mapping a read
-	 * fault as writable, as KVM should never pin pages when mapping memory
-	 * into the guest (pinning is only for direct accesses from KVM).
+	 * Map read fault as writable if possible; pinning is mutually exclusive
+	 * with opportunistically mapping a read fault as writable, as KVM should
+	 * should never pin pages when mapping memory into the guest (pinning is
+	 * only for direct accesses from KVM).
  	 */
-	if (WARN_ON_ONCE(kfp->map_writable && kfp->pin))
-		goto out;
-
-	/* map read fault as writable if possible */
-	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	if (npages == 1 &&
+	    kfp->map_writable && !WARN_ON_ONCE(kfp->pin) &&
+	    !(flags & FOLL_WRITE) &&
  	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		put_page(page);
-		page = wpage;
-		flags |= FOLL_WRITE;
+		put_page(kfp->refcounted_page);
+		kfp->refcounted_page = wpage;
+		kfp->flags |= FOLL_WRITE;
  	}
  
-out:
-	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
  	return npages;
  }
  
@@ -2915,7 +2891,9 @@ static int hva_to_pfn_remapped(struct vm
  		goto out;
  	}
  
-	*p_pfn = kvm_resolve_pfn(kfp, NULL, &pte, pte_write(pte));
+	if (kfp->map_writable)
+		*kfp->map_writable = pte_write(pte);
+	*p_pfn = pte_pfn(pte);
  out:
  	pte_unmap_unlock(ptep, ptl);
  	return r;
@@ -2932,12 +2910,13 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_p
  	if (WARN_ON_ONCE(!kfp->refcounted_page))
  		return KVM_PFN_ERR_FAULT;
  
-	if (hva_to_pfn_fast(kfp, &pfn))
-		return pfn;
+	npages = hva_to_page(kfp);
+	if (npages == 1) {
+		if (kfp->map_writable)
+			*kfp->map_writable = kfp->flags & FOLL_WRITE;
+		return page_to_pfn(kfp->refcounted_page);
+	}
  
-	npages = hva_to_pfn_slow(kfp, &pfn);
-	if (npages == 1)
-		return pfn;
  	if (npages == -EINTR)
  		return KVM_PFN_ERR_SIGPENDING;
  


Also, check_user_page_hwpoison() should not be needed anymore, probably
not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

The only way that you could get a poisoned page without returning -EHWPOISON,
is if FOLL_HWPOISON was not passed.  But even without these patches,
the cases are:
- npages == 0, then you must have FOLL_NOWAIT and you'd not use
   check_user_page_hwpoison()
- npages == 1 or npages == -EHWPOISON, all good
- npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
- everything else including -EFAULT can go downt the vma_lookup() path, because
npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON

This means that you can simply have

	if (npages == -EHWPOISON)
		return KVM_PFN_ERR_HWPOISON;

before the mmap_read_lock() line.  You may either sneak this at the beginning
of the series or leave it for later.

Paolo


