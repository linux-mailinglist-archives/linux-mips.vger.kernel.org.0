Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B277DC316
	for <lists+linux-mips@lfdr.de>; Tue, 31 Oct 2023 00:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjJ3XXP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Oct 2023 19:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjJ3XXO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Oct 2023 19:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233ABE4
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698708149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=Ld3vezLmgKEaAeNYJLpNp3rB+LOD2edLdu+ngMl8YRY=;
        b=dh2OZw5iIWmF1CaDa9d051ynq3/cxJisxwDCKaAwUrUKHnelnxvt8nzZzbaqMtuwtzj+QG
        lWMHwVSCxh1eZtEocRONhZb3ntb7rAEju6knjBK/2STnLiZ00lxcPdr01qXXDabmXCP7/y
        CZ4hHaieMJpgWqLxoIYcSbFqwpNhL4E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-JVEVXbHKP72WPGikkZMjwg-1; Mon, 30 Oct 2023 19:22:18 -0400
X-MC-Unique: JVEVXbHKP72WPGikkZMjwg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-531373ea109so3897758a12.3
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 16:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698708137; x=1699312937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld3vezLmgKEaAeNYJLpNp3rB+LOD2edLdu+ngMl8YRY=;
        b=gVBedF1FecSYPmNkohCAA2zYPdn2El0J3XjA11qchrh7e7aaU+F303Pamf1nm8aWsl
         dy3TFQVFu1z/W95WLCkZ55XyzaE4JwdixvCG2RjRdy7ZzE7jt1ZWKBAmRxXJ4UIJi7Y5
         JWYD4ixGFpoKXjOBfwTZjnDRB5yTtN12osOhSGkLD42nSlMg3F41TXlf4oe8/oEiz5PI
         meDTcDFR1BJ2x4+n/Sv9sH6JnMxQ9RqyoE+KPP0h4LnVWT4IvAv2TMyNRJUbmon5tYBJ
         mJUq6QQETAmP8yKWh5h1ZMCwq+sv+Tu2zahCHqtR63OkrT4l7r2zfFD+lMVMLtEUttVz
         vHtg==
X-Gm-Message-State: AOJu0Yzachf+5PzdTiCciDANlYZSBmDQtF/O/JTKIo9//bP+ByGjd3U5
        w56WuviXljC8UjksEV7Kgyl5UHktt0mCzn8UXEuqV+/0NIxYJ0OP+GE45VZMrVbUIPNEvOozcrR
        cxDOHloeNTtzyRTgTmkI5/g==
X-Received: by 2002:a05:6402:31e3:b0:540:8fc6:dc89 with SMTP id dy3-20020a05640231e300b005408fc6dc89mr9031582edb.25.1698708136858;
        Mon, 30 Oct 2023 16:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIvgnzIhjdrEt9J9u+25rSKeQu3EBi4IBaV39UByrGfNi98o8+yXXgbVdhdU/vIuSdikvGKQ==
X-Received: by 2002:a05:6402:31e3:b0:540:8fc6:dc89 with SMTP id dy3-20020a05640231e300b005408fc6dc89mr9031573edb.25.1698708136546;
        Mon, 30 Oct 2023 16:22:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id 27-20020a50875b000000b0054358525a5bsm131435edv.62.2023.10.30.16.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 16:22:15 -0700 (PDT)
Message-ID: <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Date:   Tue, 31 Oct 2023 00:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
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
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com>
 <ZUARTvhpChFSGF9s@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZUARTvhpChFSGF9s@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/30/23 21:25, Sean Christopherson wrote:
> On Mon, Oct 30, 2023, Paolo Bonzini wrote:
>> On 10/27/23 20:21, Sean Christopherson wrote:
>>>
>>> +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
>>> +			size = sizeof(struct kvm_userspace_memory_region);
>>
>> This also needs a memset(&mem, 0, sizeof(mem)), otherwise the out-of-bounds
>> access of the commit message becomes a kernel stack read.
> 
> Ouch.  There's some irony.  Might be worth doing memset(&mem, -1, sizeof(mem))
> though as '0' is a valid file descriptor and a valid file offset.

Either is okay, because unless the flags check is screwed up it should
not matter.  The memset is actually unnecessary, though it may be a good
idea anyway to keep it, aka belt-and-suspenders.

>> Probably worth adding a check on valid flags here.
> 
> Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> what if we:
> 
>    1. Acquire/release slots_lock in __kvm_set_memory_region()
>    2. Call kvm_set_memory_region() from x86 code for the internal memslots
>    3. Disallow *any* flags for internal memslots
>    4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()

I dislike this step, there is a clear point where all paths meet
(ioctl/internal, locked/unlocked) and that's __kvm_set_memory_region().
I think that's the place where flags should be checked.  (I don't mind
the restriction on internal memslots; it's just that to me it's not a
particularly natural way to structure the checks).

On the other hand, the place where to protect from out-of-bounds
accesses, is the place where you stop caring about struct
kvm_userspace_memory_region vs kvm_userspace_memory_region2 (and
your code gets it right, by dropping "ioctl" as soon as possible).

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 87f45aa91ced..fe5a2af14fff 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1635,6 +1635,14 @@ bool __weak kvm_arch_dirty_log_supported(struct kvm *kvm)
  	return true;
  }
  
+/*
+ * Flags that do not access any of the extra space of struct
+ * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_FLAGS
+ * only allows these.
+ */
+#define KVM_SET_USER_MEMORY_REGION_FLAGS \
+	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
+
  static int check_memory_region_flags(struct kvm *kvm,
  				     const struct kvm_userspace_memory_region2 *mem)
  {
@@ -5149,10 +5149,16 @@ static long kvm_vm_ioctl(struct file *filp,
  		struct kvm_userspace_memory_region2 mem;
  		unsigned long size;
  
-		if (ioctl == KVM_SET_USER_MEMORY_REGION)
+		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
+			/*
+			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
+			 * accessed, but avoid leaking kernel memory in case of a bug.
+			 */
+			memset(&mem, 0, sizeof(mem));
  			size = sizeof(struct kvm_userspace_memory_region);
-		else
+		} else {
  			size = sizeof(struct kvm_userspace_memory_region2);
+		}
  
  		/* Ensure the common parts of the two structs are identical. */
  		SANITY_CHECK_MEM_REGION_FIELD(slot);
@@ -5165,6 +5167,11 @@ static long kvm_vm_ioctl(struct file *filp,
  		if (copy_from_user(&mem, argp, size))
  			goto out;
  
+		r = -EINVAL;
+		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
+		    (mem->flags & ~KVM_SET_USER_MEMORY_REGION_FLAGS))
+			goto out;
+
  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
  		break;
  	}


That's a kind of patch that you can't really get wrong (though I have
the brown paper bag ready).

Maintainance-wise it's fine, since flags are being added at a pace of
roughly one every five years, and anyway it's also future proof: I placed
the #define near check_memory_region_flags so that in five years we remember
to keep it up to date.  But worst case, the new flags will only be allowed
by KVM_SET_USER_MEMORY_REGION2 unnecessarily; there are no security issues
waiting to bite us.

In sum, this is exactly the only kind of fix that should be in the v13->v14
delta.

Paolo

