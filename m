Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22D47E26CA
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 15:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjKFO1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 09:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjKFO1n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 09:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96E910A
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699280811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=EQEY0yLpyjybbnIksSuJ4Z5QD7aeTkworRxg3pV8noA=;
        b=CZbuNZFplBMR7BrTUPa4pK7U+nftOAf1HDw9V2kHPyncpkIrSPeXuy4KmYpqcCMhRUJauc
        nawCVH0FBKTM2rx2k0nWTSH16m6QlbaGTSl4iJmAL1fQk/Qi+eseLVcHMEsjP//v7IZoKn
        zphHSHFGR0SNYFZsSTMjR8pxnXi3GJA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-_yc-s8T_PXSGzNnML8_cvQ-1; Mon, 06 Nov 2023 09:26:49 -0500
X-MC-Unique: _yc-s8T_PXSGzNnML8_cvQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c515541a25so47945021fa.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 06:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699280808; x=1699885608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQEY0yLpyjybbnIksSuJ4Z5QD7aeTkworRxg3pV8noA=;
        b=BgzDJxIaGSAo/UTYTilXONEBliitG5uBNNCaS276cQJbSYzartF5OwqGi4Ceqc1bq0
         Jj+DreQ8gCv+J5gqyAblc91rTfpztVrROsMGhH7TVy++CyakdyIT1SNaLznXJryP1NL5
         N+CTvBa8RKyAmrpicfW3LrslWcAnIZCc14MOZXTh35JUzCOdZEIiPHWSGHrhVnCp9eEP
         IG5gf4ydZcjetTJ4mllp5GJ2t4fdcNxY8wva1tI8cT0rSun+RRLr1r1My6yKBlPpU/xZ
         JTNprZ1y+4np8AVVAH+v6vNEZ9pUEQlPtgbi9YPnXbsbgCAcl7zCCqSbN3/gLES/B8OJ
         eiDA==
X-Gm-Message-State: AOJu0Yy1Xpi9XKnyZ9Y7yTGgouZZTcmuX/qnduLrTorsZ2QtWZHdKEXB
        fuiJC5BcJhXmY9AgHtimD/ctlOz3RuwRJlFM66nkLoYThE0U6avm+q/jUwWdRqWVqc6iqRxfIPa
        Yhsa/uU90up11c0eaYR3JLg==
X-Received: by 2002:a2e:b953:0:b0:2c5:2d02:ed14 with SMTP id 19-20020a2eb953000000b002c52d02ed14mr21572214ljs.23.1699280808165;
        Mon, 06 Nov 2023 06:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe0jlmDLWFqZf1fufd7JZlCly/w1zvo9x6RPHgHPz0rI92EPGNolcWdP4AapnywQ3Fs4WFBA==
X-Received: by 2002:a2e:b953:0:b0:2c5:2d02:ed14 with SMTP id 19-20020a2eb953000000b002c52d02ed14mr21572194ljs.23.1699280807790;
        Mon, 06 Nov 2023 06:26:47 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id l41-20020a05600c1d2900b004083a105f27sm12541348wms.26.2023.11.06.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:26:47 -0800 (PST)
Message-ID: <affca7a8-116e-4b0f-9edf-6cdc05ba65ca@redhat.com>
Date:   Mon, 6 Nov 2023 15:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/34] KVM: selftests: Expand set_memory_region_test to
 validate guest_memfd()
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-32-pbonzini@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231105163040.14904-32-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/5/23 17:30, Paolo Bonzini wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Expand set_memory_region_test to exercise various positive and negative
> testcases for private memory.
> 
>   - Non-guest_memfd() file descriptor for private memory
>   - guest_memfd() from different VM
>   - Overlapping bindings
>   - Unaligned bindings

This needs a small fixup:

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index e4d2cd9218b2..1b58f943562f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -819,6 +819,7 @@ static inline struct kvm_vm *vm_create_barebones(void)
  	return ____vm_create(VM_SHAPE_DEFAULT);
  }
  
+#ifdef __x86_64__
  static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
  {
  	const struct vm_shape shape = {
@@ -828,6 +829,7 @@ static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
  
  	return ____vm_create(shape);
  }
+#endif
  
  static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
  {
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 1891774eb6d4..302c7a46955b 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -386,6 +386,7 @@ static void test_add_max_memory_regions(void)
  }
  
  
+#ifdef __x86_64__
  static void test_invalid_guest_memfd(struct kvm_vm *vm, int memfd,
  				     size_t offset, const char *msg)
  {
@@ -476,14 +477,13 @@ static void test_add_overlapping_private_memory_regions(void)
  	close(memfd);
  	kvm_vm_free(vm);
  }
+#endif
  
  int main(int argc, char *argv[])
  {
  #ifdef __x86_64__
  	int i, loops;
-#endif
  
-#ifdef __x86_64__
  	/*
  	 * FIXME: the zero-memslot test fails on aarch64 and s390x because
  	 * KVM_RUN fails with ENOEXEC or EFAULT.
@@ -493,6 +493,7 @@ int main(int argc, char *argv[])
  
  	test_add_max_memory_regions();
  
+#ifdef __x86_64__
  	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
  	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
  		test_add_private_memory_region();
@@ -501,7 +502,6 @@ int main(int argc, char *argv[])
  		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
  	}
  
-#ifdef __x86_64__
  	if (argc > 1)
  		loops = atoi_positive("Number of iterations", argv[1]);
  	else

in order to compile successfully on non-x86 platforms.

