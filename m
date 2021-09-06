Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2B74019C3
	for <lists+linux-mips@lfdr.de>; Mon,  6 Sep 2021 12:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241955AbhIFK3Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Sep 2021 06:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30636 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242014AbhIFK3W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Sep 2021 06:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630924097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=REmJl8s2nvMdTdbKRVVIcDfYVEbx2wjp9XTagCASYqs=;
        b=M0Tzz4taVNiDQ7O9U0tpdW1QbeRJ9elAmkEpqslUOUXBdmGj3whd/+ybivfoD9GN1i2m4T
        R5N7BcHNHfal9jq4A2i7oeL8XfzZ00iCopkW9hVuCjpWkVrzUftHACZQmahxOWuQhHKD1K
        F5TqTn1xqMSPQBbP3rrsS+tIOWbMg7s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-Vh-qkxn1Pwic1o-GWYpz9Q-1; Mon, 06 Sep 2021 06:28:16 -0400
X-MC-Unique: Vh-qkxn1Pwic1o-GWYpz9Q-1
Received: by mail-ed1-f72.google.com with SMTP id y10-20020a056402270a00b003c8adc4d40cso3333455edd.15
        for <linux-mips@vger.kernel.org>; Mon, 06 Sep 2021 03:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=REmJl8s2nvMdTdbKRVVIcDfYVEbx2wjp9XTagCASYqs=;
        b=Y9oHi5DySxoXxXIff6kLl/kEC6n5aqtusjgIjEvzXXXkiuEIPv+jXeWdsm1HVgOF7y
         RDZQVcDttuWDBoiDRk/ddkKiYsh3oD8EMM1lRNb9Iv+PEyKdMmi1yBeZkRCVZ/8cvQMD
         1RTNHvEjRVCqsgt1ASt2kjQ/Ny0CZFBSnqnAjRtG1bcL1LtQrcWUEQ0U/rEygjd1EFCF
         pYVSWLD4fF14zfCFqhpPg7uRdRzSQgUPGTj27JMF0+RFrpt77l5Njx73Y8ky2JvMxCHb
         BdvGL7PCWyjH4sqymnYW8o+wK4SGAn1BGKrgL5Djkq5r5qkHWQf2pnKygNzfD3bziFJL
         3isw==
X-Gm-Message-State: AOAM530G7r6PQUj5Y05qjL7ynE3sTXddhNTPmoX0Ck9/fP3lI7ZjxO4/
        Ev2qQIeis30KtvZK5Uz38usVQ5c/T592IbDW/+temO9NVVBndj6UG1/KVoj8XhMqWJs2w1Mj0lg
        bOSMMDfOeUGScvow60vPmDg==
X-Received: by 2002:a17:906:1d19:: with SMTP id n25mr13007253ejh.11.1630924095430;
        Mon, 06 Sep 2021 03:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7T8yPC7CUEnqP8Q5KGyfYQsTy7fdIFm0w0WX7OHu/0lN1pf6u81fhziGWQVchhgc+jbFRRA==
X-Received: by 2002:a17:906:1d19:: with SMTP id n25mr13007231ejh.11.1630924095200;
        Mon, 06 Sep 2021 03:28:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id h7sm4431526edr.4.2021.09.06.03.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 03:28:14 -0700 (PDT)
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
To:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     "Russell King, ARM Linux" <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, gor <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Oleg Nesterov <oleg@redhat.com>, rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        paulmck <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        shuah <shuah@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-csky <linux-csky@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        Peter Foley <pefoley@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        Ben Gardon <bgardon@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
 <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <425456d3-4772-2a1b-9cf3-a5b750b95c2e@redhat.com>
Date:   Mon, 6 Sep 2021 12:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/08/21 20:51, Mathieu Desnoyers wrote:
>> Ah, or is it the case that rseq_cs is non-NULL if and only if userspace is in an
>> rseq critical section, and because syscalls in critical sections are illegal, by
>> definition clearing rseq_cs is a nop unless userspace is misbehaving.
> Not quite, as I described above. But we want it to stay set so the CONFIG_DEBUG_RSEQ
> code executed when returning from ioctl to userspace will be able to validate that
> it is not nested within a rseq critical section.
> 
>> If that's true, what about explicitly checking that at NOTIFY_RESUME?  Or is it
>> not worth the extra code to detect an error that will likely be caught anyways?
> The error will indeed already be caught on return from ioctl to userspace, so I
> don't see any added value in duplicating this check.

Sean, can you send a v2 (even for this patch only would be okay)?

Thanks,

Paolo

