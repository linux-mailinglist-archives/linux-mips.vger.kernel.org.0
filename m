Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D77204EFA
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732155AbgFWKYs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 06:24:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49947 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732236AbgFWKYr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 06:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592907886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K0VMF+zOglKc79uK7nAPfjf+HV37t2ditCPtYi6hRnc=;
        b=jCttVLpoGnxxGvO41x5swM1yUUQ52MfjQF6W3+A2PF3mM7n82xab9eO493Qlp+wz0EotS6
        6L2C/XFna6HUHJKEsFeZVTQUcF6oVMDNKaxClyTwZQzl58t/7ZdCQiKrtbQImaZijRIhLa
        s82D5fWkNrN5snbRAQo6qTA1ic88vxU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-c0pVjbMbM9yhB8Syt91T1A-1; Tue, 23 Jun 2020 06:24:42 -0400
X-MC-Unique: c0pVjbMbM9yhB8Syt91T1A-1
Received: by mail-wm1-f72.google.com with SMTP id a18so3326820wmm.3
        for <linux-mips@vger.kernel.org>; Tue, 23 Jun 2020 03:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K0VMF+zOglKc79uK7nAPfjf+HV37t2ditCPtYi6hRnc=;
        b=IYRAIR9kQsoUEGiwbQKo7S57YOhcmaqj2WaCx+AEIqOYIfoXMGCSiWgQxEoYf0XaYs
         bIWzqQoy0+vQXC23HNhVy3KwYq9308dYSjRM1EX1a9BAfsBOrxtN0HnnbWpH3n1+9z0m
         FzV6rSgxZoynsLRdokfMaE0zmpTzZmkJ2PgkDCowHgegwvszSsxADlxTB/Y8XeoXgkog
         jVe92d6NAZCv/PHzFAfrmydAwm2bagyhfFAMJIC2w0dcEszp1djbkBCkCocNZJLGXHA0
         7XYxH6xxtSBkAohiK26gsAVIFUXpOh9FjUvCnKzzlXCq76mtscszcv5HQ77oK4XlNXI/
         Q5Bw==
X-Gm-Message-State: AOAM531liKDFEXeYYBFvfApwHLft9C76k25InKumUpNVwABc1CJKtzIi
        HTmqSlK0PdZuwvWwR1gEQ8G5dVvuQOIMAMO+EELxy0gb9BI0w5pvkcXGZYYjER89VoeufiI+01Z
        m4LamXVjO+pHIJ1tHExWpxg==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr16454564wrx.294.1592907881329;
        Tue, 23 Jun 2020 03:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7GKxnJWV0b4Mz/7lWJjdPl3+rZwUgIO80Ac5HDjj13PmRVjDey+yK0l49hJjTmncjlmTnYw==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr16454534wrx.294.1592907881013;
        Tue, 23 Jun 2020 03:24:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:24f5:23b:4085:b879? ([2001:b07:6468:f312:24f5:23b:4085:b879])
        by smtp.gmail.com with ESMTPSA id c66sm3351206wma.20.2020.06.23.03.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 03:24:40 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] clean up redundant 'kvm_run' parameters
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, borntraeger@de.ibm.com,
        frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
        heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        sean.j.christopherson@intel.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
        chenhuacai@gmail.com
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <fe463233-d094-fca5-b4e9-c1d97124fd69@redhat.com>
 <3a2bee8b-20b4-5d33-7d12-09c374a5afde@linux.alibaba.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bad08799-274e-0a6f-9638-92c0010b1ba1@redhat.com>
Date:   Tue, 23 Jun 2020 12:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3a2bee8b-20b4-5d33-7d12-09c374a5afde@linux.alibaba.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23/06/20 12:00, Tianjia Zhang wrote:
> 
> 
> On 2020/6/23 17:42, Paolo Bonzini wrote:
>> On 27/04/20 06:35, Tianjia Zhang wrote:
>>> In the current kvm version, 'kvm_run' has been included in the
>>> 'kvm_vcpu'
>>> structure. For historical reasons, many kvm-related function parameters
>>> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
>>> patch does a unified cleanup of these remaining redundant parameters.
>>>
>>> This series of patches has completely cleaned the architecture of
>>> arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
>>> the large number of modified codes, a separate patch is made for each
>>> platform. On the ppc platform, there is also a redundant structure
>>> pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
>>> separately.
>>
>> Tianjia, can you please refresh the patches so that each architecture
>> maintainer can pick them up?  Thanks very much for this work!
>>
>> Paolo
>>
> 
> No problem, this is what I should do.
> After I update, do I submit separately for each architecture or submit
> them together in a patchset?

You can send them together.

Paolo

