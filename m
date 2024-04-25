Return-Path: <linux-mips+bounces-2890-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9D8B244B
	for <lists+linux-mips@lfdr.de>; Thu, 25 Apr 2024 16:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C3271F238A4
	for <lists+linux-mips@lfdr.de>; Thu, 25 Apr 2024 14:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE53814A4FC;
	Thu, 25 Apr 2024 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hO8QjXa9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB914A4F1
	for <linux-mips@vger.kernel.org>; Thu, 25 Apr 2024 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714056329; cv=none; b=qx1EYIyLXPtO+uTrrITwNBL5/pNIzVF8BUv8ogk7UQJsAxpkD/j/xvj6pExlsh3aSRRKfGg009rghSrk/s4thANBOHQfsr4WHd1LKLFVTnfAjqkxG8S3QMWgBL1vQtiz7lwynWMbHuH49mI0wJ3tlk5LoN/xIdOkQSea2ovd+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714056329; c=relaxed/simple;
	bh=IJ3J9+qMMc5AcpPKGPwrAuPLaO9e0GfSfZ8R0+bwFng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJ3WKU3Ky3+oXatjWqhhmnzONbf8899kFYgz267hBNJsptB55Eim8ocrlfTN+xVXcydb5plu/yVSVoxfrMIMghQEtgN6gXW6vDiQjatTTbN9l6wcWvmvl40aYZlqiClWVnJCUmrj8wfRUnuWJDCzdF+3qQnOrg+xCmjup+gJ/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hO8QjXa9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ecf1d22d78so66950b3a.0
        for <linux-mips@vger.kernel.org>; Thu, 25 Apr 2024 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714056328; x=1714661128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Upe9hXc85SfykUK8OSJyDQtUplWhtMiTd1jA3tMRXuo=;
        b=hO8QjXa9lALXbwUsKXaff/iSO59Zbkn009rIlqZSCTTs5fi3iWw7w0869tbnDvi0rr
         uVk4tKOMW8eURFiwROT9wn9tu1s/k4yyjGRr4TfEno57Ab9msTY+G7tLLBikp7Djbv0K
         VEmmMQ1Ob3RkrKeZUGT3O07/ag/h4VifsNM+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714056328; x=1714661128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upe9hXc85SfykUK8OSJyDQtUplWhtMiTd1jA3tMRXuo=;
        b=ackSp6ibgbD7+OtJDodlNtS+obQnKYPxlOms8xpbKJXAIt60jDitAU9oJkVZZrujqK
         yuJ5n2weKxXu1W/StjJG3SB/ZqhLwYrFcFyAmYK+cTW42Am8ds+wlYJsipxyqygmsWCd
         7H5bYQbfOC3NqSMPbUdfK5jN3vzvjbESvMr0fe48TI8tSdtcozmsOEysrO8zmKIPa5CH
         Lf1EdpAYcmaSkOMUjz10LaowYiWlj1DKMCuR3oPzo5CwdxSyFsVp/5gnnyjhMFexHd5t
         69hyW5lOHbM73OY5Mb6PL8kh/TJlpohS+vSBH6FD4+cQ9659kP+HCNeI9+7yf+TYVyFA
         torw==
X-Forwarded-Encrypted: i=1; AJvYcCUCKHy9/I+mPAr4NmuxyPWZwf9CmkB0vERBB7h8v6cIKN5jNKty9pCA4HEHupdNue/UtngHdoX8sFL3LxS1dIzSMREyoXh2GtdP9Q==
X-Gm-Message-State: AOJu0YyB01les1QPyb11NFjzuPmaDOG+ESgjgNGGjvu3friTGWQM2wi+
	ivDjnCIbIsBb/6yXjjjO5vjyrXdJNiKBuSvNLNtd1fLl4g534xUNTDgta+FRKz4=
X-Google-Smtp-Source: AGHT+IH2ZWIxVnWGlxZ14mWcvRqLtKyE6u0gRzo1WyBlfFhqv5treC26C0VPwnpQrTOD05hYIY1E7A==
X-Received: by 2002:a05:6a00:731:b0:6ea:ba47:a63b with SMTP id 17-20020a056a00073100b006eaba47a63bmr6568081pfm.0.1714056327589;
        Thu, 25 Apr 2024 07:45:27 -0700 (PDT)
Received: from [192.168.43.82] ([223.185.79.208])
        by smtp.gmail.com with ESMTPSA id k124-20020a633d82000000b005f7d61ec8afsm11351461pga.91.2024.04.25.07.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 07:45:27 -0700 (PDT)
Message-ID: <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Date: Thu, 25 Apr 2024 08:45:07 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/24 08:12, Dan Carpenter wrote:
> On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
>> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
>> support for guest private memory can be added without needing an entirely
>> separate set of helpers.
>>
>> Note, this obviously makes selftests backwards-incompatible with older KVM
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> versions from this point forward.
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Is there a way we could disable the tests on older kernels instead of
> making them fail?  Check uname or something?  There is probably a
> standard way to do this...  It's these tests which fail.

They shouldn't fail - the tests should be skipped on older kernels.
If it is absolutely necessary to dd uname to check kernel version,
refer to zram/zram_lib.sh for an example.

thanks,
-- Shuah

