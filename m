Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9E3A3071
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 18:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFJQZV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 12:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29023 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229823AbhFJQZU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Jun 2021 12:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623342204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xaDYl3mAKqwxB1xdG6u3uJxh4rz2ERkYQsFm9BataQM=;
        b=RcUaiJYaTmpDK2vFq31FTH8lpVUFoRXy8gGjrzhYHUkPDcOXv1l6Fuix/xerJJyovJx2IG
        9NNyjZSp/iG8n/nmwrus2FM7E+HUqNIQSWILsCjk+8pO4nR6XwE0ULebAPBJJc/HIutIrn
        SY3rnmLjpr1flQOijzm2KYGqV2/AtHA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-XpuR6yDYPSWUjjBDPqkm_A-1; Thu, 10 Jun 2021 12:23:22 -0400
X-MC-Unique: XpuR6yDYPSWUjjBDPqkm_A-1
Received: by mail-wm1-f72.google.com with SMTP id h9-20020a05600c3509b02901b985251fdcso2208624wmq.9
        for <linux-mips@vger.kernel.org>; Thu, 10 Jun 2021 09:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xaDYl3mAKqwxB1xdG6u3uJxh4rz2ERkYQsFm9BataQM=;
        b=Sy6nDVewQ/5MifDUOk5n8w3eoJF+Qx5WNI9sDNa394wIiJpE8dHU+p10aHDR81g4KU
         YNKtL6PF7xZ6yA5RQPsuX7I0X5QMeSQUa5mg4beZeWlcnoH2zClTBuOJEA+fWo7h6n9D
         +V/kLqtC673FAb2OXH/7s3RLWTW7T06NDkaOC7sP5zDppHwXy2WGYTIjbQCOr7wx9b7z
         kg4Wui8NHP7IGQDED3nKD+GDd4KSihNZmxiLsR6XWMmdFceV5jnEQM00VXycad1hkIZS
         fO6RT+Rdi9sXAYE0Ee4jj7HkckE1skGu2VM+pXO/X6ntAahdujlhoHiekxZW9i1gQdBy
         HQfg==
X-Gm-Message-State: AOAM531QPLiPtRlG2I73WzV5e/E+WKKmvNN8QByJD1tYP1eR/0H1Xo52
        zpIr2060gLXAaT6HG+WIG7pmjhN+uFRh/pHgxBBTaoI++7YnPwCttjdbe3l969NpXxgfPJ9xwu8
        EYWlgIGgYOkmB9cunjgPLlg==
X-Received: by 2002:adf:de91:: with SMTP id w17mr6484907wrl.352.1623342201700;
        Thu, 10 Jun 2021 09:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzimm0IhzRGX0own3XmAQS7AEY/ooW0Iee1AKpx0NvxC3qE+jaJNCMXAZvHTl29Jx/k7NJRTg==
X-Received: by 2002:adf:de91:: with SMTP id w17mr6484880wrl.352.1623342201486;
        Thu, 10 Jun 2021 09:23:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a? ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
        by smtp.gmail.com with ESMTPSA id o9sm3760703wri.68.2021.06.10.09.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 09:23:20 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] KVM: stats: Add fd-based API to read binary stats
 data
To:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>
References: <20210603211426.790093-1-jingzhangos@google.com>
 <20210603211426.790093-3-jingzhangos@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3b2b3ab-88a2-827c-7775-10be63158ff3@redhat.com>
Date:   Thu, 10 Jun 2021 18:23:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603211426.790093-3-jingzhangos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/06/21 23:14, Jing Zhang wrote:
> +#define DEFINE_VM_STATS_DESC(...) {					       \
> +	STATS_DESC_COUNTER("remote_tlb_flush"),				       \
> +	## __VA_ARGS__							       \
> +}
> +
> +#define DEFINE_VCPU_STATS_DESC(...) {					       \
> +	STATS_DESC_COUNTER("halt_successful_poll"),			       \
> +	STATS_DESC_COUNTER("halt_attempted_poll"),			       \
> +	STATS_DESC_COUNTER("halt_poll_invalid"),			       \
> +	STATS_DESC_COUNTER("halt_wakeup"),				       \
> +	STATS_DESC_TIME_NSEC("halt_poll_success_ns"),			       \
> +	STATS_DESC_TIME_NSEC("halt_poll_fail_ns"),			       \
> +	## __VA_ARGS__							       \

Let's instead put this (note it's without braces) in macros like these

#define KVM_GENERIC_VM_STATS()							\
	STATS_DESC_COUNTER("remote_tlb_flush"),

#define KVM_GENERIC_VCPU_STATS(...)						\
	STATS_DESC_COUNTER("halt_successful_poll"),				\
	STATS_DESC_COUNTER("halt_attempted_poll"),				\
	STATS_DESC_COUNTER("halt_poll_invalid"),				\
	STATS_DESC_COUNTER("halt_wakeup"),					\
	STATS_DESC_TIME_NSEC("halt_poll_success_ns"),				\
	STATS_DESC_TIME_NSEC("halt_poll_fail_ns"),

and it can be used in the arch files.  In fact it can even be added in patch 1 and
switched to STATS_DESC_* here.

Paolo

