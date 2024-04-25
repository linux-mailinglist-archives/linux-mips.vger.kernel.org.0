Return-Path: <linux-mips+bounces-2892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118938B264E
	for <lists+linux-mips@lfdr.de>; Thu, 25 Apr 2024 18:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C00C1286A2E
	for <lists+linux-mips@lfdr.de>; Thu, 25 Apr 2024 16:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E719414D712;
	Thu, 25 Apr 2024 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bTW2y76Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B070D14D6EE
	for <linux-mips@vger.kernel.org>; Thu, 25 Apr 2024 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714062150; cv=none; b=AD1FhgZVhGIJZpl9tObm7wEIpepmtbEdfpkXquB+8rJsAkXX2jNytqAI8Ap7WEYOKs6w/84VfB2N7IQeUSkScXuKOWVuDSJI6JxZ7z7T1dhUlF6eVl8wAGpmFEbvcI2pwqzncevaTjwW+6O9/8O6u59e9DbdIxmgDgyigzt85eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714062150; c=relaxed/simple;
	bh=MDAUkdPnGzKG6chVud66+86ptfSgJ9KB44HVfsQFna8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4vTgvLqRFkkbzX8A1DZ+Otif4i8xeJcRWH6MdVXrzhaIjvpPXEeSQLvt3syBVN1hNg2trd2+FMwAScbqA0wlFsMh13A0WaQ66ju+d+7+aReNtuIgLAbdBVwSDlrA7H6TNbPDJX67js6qadvcFHyOK7+lFKhAD8dhLvJHFukNf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bTW2y76Y; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7d9c78d7f97so9337639f.3
        for <linux-mips@vger.kernel.org>; Thu, 25 Apr 2024 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714062148; x=1714666948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZwpXS/k0DYed9wD5OBUEJ5ypdpSnZbheBH2rdFMtPA=;
        b=bTW2y76YgHaHc6KB1MhvC43eovk1JFB7R42GEEGwApT83OWEkcKfjVabJ7hyn1Ynp4
         qJ7pNAz8/i958EUH0F77Z/ph+LeZvTa6ubMMyFG1THOi28/zeaGWwtAPDfz1DiGvDTg8
         23QFIGZ8H8MnIu9Q6nTps/dMHb/bierZgVkYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714062148; x=1714666948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZwpXS/k0DYed9wD5OBUEJ5ypdpSnZbheBH2rdFMtPA=;
        b=OjyMd2QetzfUIu2VOq8gjRCzA674HSQdhD280Y9e/Pc7Qph+XBhauVveKhKYlEKauA
         mFV4Kdz/daZpLwuPD1m2bs12R/wYXrIBNWsYqgNP3RfMc6aGVF62GX4BKD38Zj2YEK21
         TyFHdme43zPEDtXlWmucZtmVfMFdbb5sgQ43rnLAbpCf2eQXtjrtLTO1DVg+2UkKq4Ur
         oXZZayw0+fl5geZ2DAyeEUEFvvfel2Kq1Wr3UnVgZ+hHUSbvFYjRgxALI65/qxmOC1XI
         gJWHgE+l16r/D4VyN11R0AeK5sGo5rIXI8cBA5malHTL7BgmbAIalcWZ71jerdoZsPk9
         KhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4G3KzI0C5ymzCKKRs7SlrSGVGmupmsgBD+iI/dHAu1HLbJCn4Hn/nsNquq7wOCopFvFUgwz8tOcygzELe6OcpmB4a6c9Ha7MmPQ==
X-Gm-Message-State: AOJu0YwNzQOz68IIAGns2xnUdqN4ETFDSWL5JY99Dffza+XaRsepD6wt
	QMOzdytwPw8dEpLhWi88Egdv9KHH7HV8wguDmK5mPk53ybB93bRLp9JjkJcoyRM=
X-Google-Smtp-Source: AGHT+IFwsbdYoXOctiJAidygEpyjdbBI6reVPMMOFHtDCREzxeaCqAED6LqVik99m0cV8ef76M2rcQ==
X-Received: by 2002:a6b:ea07:0:b0:7da:cdf3:7bec with SMTP id m7-20020a6bea07000000b007dacdf37becmr160971ioc.1.1714062147803;
        Thu, 25 Apr 2024 09:22:27 -0700 (PDT)
Received: from [192.168.43.82] ([223.185.79.208])
        by smtp.gmail.com with ESMTPSA id m2-20020a638c02000000b005e857e39b10sm13196097pgd.56.2024.04.25.09.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:22:27 -0700 (PDT)
Message-ID: <763ee03a-817d-4833-b42f-e5b4bd25dc7f@linuxfoundation.org>
Date: Thu, 25 Apr 2024 10:22:11 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
To: Sean Christopherson <seanjc@google.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Benjamin Copeland <ben.copeland@linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
 <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
 <ZipyPYR8Nv_usoU4@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZipyPYR8Nv_usoU4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/24 09:09, Sean Christopherson wrote:
> On Thu, Apr 25, 2024, Shuah Khan wrote:
>> On 4/25/24 08:12, Dan Carpenter wrote:
>>> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>>>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>>>> support for guest private memory can be added without needing an entirely
>>>> separate set of helpers.
>>>>
>>>> Note, this obviously makes selftests backwards-incompatible with older KVM
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> versions from this point forward.
>>>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> Is there a way we could disable the tests on older kernels instead of
>>> making them fail?  Check uname or something?  There is probably a
>>> standard way to do this...  It's these tests which fail.
>>
>> They shouldn't fail - the tests should be skipped on older kernels.
> 
> Ah, that makes sense.  Except for a few outliers that aren't all that interesting,
> all KVM selftests create memslots, so I'm tempted to just make it a hard requirement
> to spare us headache, e.g.
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..4b2038b1f11f 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2306,6 +2306,9 @@ void __attribute((constructor)) kvm_selftest_init(void)
>          /* Tell stdout not to buffer its content. */
>          setbuf(stdout, NULL);
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          kvm_selftest_arch_init();
>   }
> 
> --
> 
> but it's also easy enough to be more precise and skip only those that actually
> create memslots.

This is approach is what is recommended in kselfest document. Rubn as many tests
as possible and skip the ones that can't be run due to unmet dependencies.

> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b2262b5fad9e..b21152adf448 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -944,6 +944,9 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
>                  .guest_memfd_offset = guest_memfd_offset,
>          };
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
>   }
>   
> @@ -970,6 +973,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>          size_t mem_size = npages * vm->page_size;
>          size_t alignment;
>   
> +       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
> +                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
> +
>          TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
>                  "Number of guest pages is not compatible with the host. "
>                  "Try npages=%d", vm_adjust_num_guest_pages(vm->mode, npages));
> --

thanks,
-- Shuah

