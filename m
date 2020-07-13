Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2730021B085
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 09:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgGJHsl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 03:48:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57612 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726391AbgGJHsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jul 2020 03:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594367318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w3lPi8IIyg6JHok2MkrSRXRUKV+20Z+zeyOlBbulHrA=;
        b=UIwwVZezTDq6vUmce3Y1ef+Ehzm4G3VyUPnegLqxtIOw4MahNujDj9DYBiQ22AT1KosoRF
        whFbgfxVdWntveU+CGH47c3k7ucYNEYnp0AWblCtvNadzsmUVivZCaOe7p63ePL4M9GI9d
        yyiK71vwBliW02CQo2kSbPhg2o6llng=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-3t3JIqa1OEq2UtPQDtKnsA-1; Fri, 10 Jul 2020 03:48:36 -0400
X-MC-Unique: 3t3JIqa1OEq2UtPQDtKnsA-1
Received: by mail-wr1-f72.google.com with SMTP id i14so5020191wru.17
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2020 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w3lPi8IIyg6JHok2MkrSRXRUKV+20Z+zeyOlBbulHrA=;
        b=FZvAxJGCCkVNIxLLa7eT2SPp36W/e6s2NtCFMXhHaFlnTuas28S2wvaZ5Y96DhQGoH
         GGOE0LxU/ZQzLly0CPeoZno6ezSLoZi3rSb0a2Qq2+1P78RxrwUjtwQiPeWu0vvyhThk
         q6iN2rw+5pbcwxap4plFjQpLmuRiCSj4ppecipyBogbQMz3NPhUicZEO8T5JICjlnvbj
         C/15fMwmQX4qsu3ysdzWe8meW54LbR38PilWfw/q0zdiCE/4z7XqBiSBGwvi1jRm55j6
         Yj3nn6pbjM7xinIYpeP5Mkq/KSipWu5NdaK7zHUKfyerqsiDuHj64EbYTUEKC63vtQiQ
         6yYg==
X-Gm-Message-State: AOAM532gA9W3o50xFLvpcHXeEa0rpR+HBAJdhMogQ3p/qzhNgZTfxnNB
        dfLgYv75476beE8Qri7Z5pmiZucE8OaOFhn1oYAsCozpNriUiEl2vwJltN/8CcXQT9bwth3ooeJ
        REUx98hRL4WGpKvv5W0cF0A==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4118704wml.65.1594367315234;
        Fri, 10 Jul 2020 00:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoVcmgycalDG2NxxBpe/F1Ip5MhErG5G/6zxHhUH+uoCv6KdhugBz3NZfr470zRIHVmrw60A==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4118689wml.65.1594367315031;
        Fri, 10 Jul 2020 00:48:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id o9sm8786762wrs.1.2020.07.10.00.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:48:34 -0700 (PDT)
Subject: Re: [PATCH v6 1/5] KVM: s390: clean up redundant 'kvm_run' parameters
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, frankja@linux.ibm.com, david@redhat.com,
        cohuck@redhat.com, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
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
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
 <20200623131418.31473-2-tianjia.zhang@linux.alibaba.com>
 <c49f8814-c7ea-6884-91c5-3dcd40c6509f@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e986527-1585-e1b4-1251-ef36ac3bd233@redhat.com>
Date:   Fri, 10 Jul 2020 09:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c49f8814-c7ea-6884-91c5-3dcd40c6509f@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23/06/20 17:31, Christian Borntraeger wrote:
> 
> I have trouble seeing value in this particular patch. We add LOCs
> without providing any noticable benefit. All other patches in this series at
> least reduce the amount of code. So I would defer this to Paolo if he prefers
> to have this way across all architectures. 

Yes, it adds lines of code but they're just

+	struct kvm_run *kvm_run = vcpu->run;

You could avoid the LoC increase by repeating vcpu->run over and over,
but I think the code overall is clearer.

Paolo

