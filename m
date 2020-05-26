Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC181B231B
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 11:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgDUJpE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 05:45:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32852 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726403AbgDUJpD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Apr 2020 05:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587462302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vn871PQoRr8hKR73ojEvQDx4nU8OlY1HT3TpH6BJBpc=;
        b=B79PIn3Ph9UElB5buFe6znFq/6gWgjQYqNFO2xjlcCMGTm5Uk6W73lAZz+zogfUA9ffHOe
        vlhdUUCdn+BTyiYB0pHfoMnEmM2DeblltfyJgwPiqrKBI/HFw/ntzUi7Lvei+Te82BfR36
        7bJjelCsnLA5X8LVmy2Wgo6g6lB/ZrM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-3xxgwt3cObC-n8At5TmbSA-1; Tue, 21 Apr 2020 05:45:00 -0400
X-MC-Unique: 3xxgwt3cObC-n8At5TmbSA-1
Received: by mail-wr1-f71.google.com with SMTP id j16so7216561wrw.20
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2020 02:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vn871PQoRr8hKR73ojEvQDx4nU8OlY1HT3TpH6BJBpc=;
        b=U9jrvH6ClWhUE5Uazvl3QUSzRO+H8nUX3nB+Jozhu0LCgvnzwEgbFUJWjBwjHtGqki
         gVqo7V/9vSIvFOr8xOOOL7uFgACrdR1jUbM6J/ehUqEHn0U+XN5h/ADZ4pfgYU90GdMu
         G9tz8P4RtPAuhyxxj3NytjLS+dMG/Romnmhblr3/104VkKbXAS/pOHWr4rP9NbMEqt+Q
         F8zkLeu7zeIgRxVSmzLzWpR+3Wye42jKuDB7Vikrr9JwiWMD67Te5ENqMDaOfj4hbUKL
         XBBFk1nsdlCBhZVQ1l7lUpWpFnyEDdZcbYg56TzZsGLD1N/JKq63sISZ8RJDODc3H0ya
         yo1g==
X-Gm-Message-State: AGi0PubMzeV1vHCD4iu1yid4vvzM95hUG9zqVr80gKwXLnBYbXd3iP2H
        u7C2v1/h4aDwgv/QFTAa0pCu+KGmy3Jbnw/8XclNn2s2vCkvlQG92v88GQYhN7w6Vk8QrYOJsUQ
        CG0T1TGUVk8q1EoiVb9qhkg==
X-Received: by 2002:adf:e982:: with SMTP id h2mr22309081wrm.425.1587462299214;
        Tue, 21 Apr 2020 02:44:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypLbdpxyM62zaDI9d+6FTcqhJenduGXb99s5sXM8ly8KhMH8Zk/YVGvLVp9YOKq9Pttf2tCjnw==
X-Received: by 2002:adf:e982:: with SMTP id h2mr22309050wrm.425.1587462299019;
        Tue, 21 Apr 2020 02:44:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926? ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
        by smtp.gmail.com with ESMTPSA id a7sm2684985wmj.12.2020.04.21.02.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 02:44:58 -0700 (PDT)
Subject: Re: [PATCH v2] kvm: Replace vcpu->swait with rcuwait
To:     Davidlohr Bueso <dave@stgolabs.net>
Cc:     Marc Zyngier <maz@kernel.org>, tglx@linutronix.de,
        kvm@vger.kernel.org, Davidlohr Bueso <dbueso@suse.de>,
        peterz@infradead.org, torvalds@linux-foundation.org,
        bigeasy@linutronix.de, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, linux-mips@vger.kernel.org,
        Paul Mackerras <paulus@ozlabs.org>, joel@joelfernandes.org,
        will@kernel.org, kvmarm@lists.cs.columbia.edu
References: <20200324044453.15733-1-dave@stgolabs.net>
 <20200324044453.15733-4-dave@stgolabs.net>
 <20200420164132.tjzk5ebx35m66yce@linux-p48b>
 <418acdb5001a9ae836095b7187338085@misterjones.org>
 <20200420205641.6sgsllj6pmsnwrvp@linux-p48b>
 <f7cc83fe-3e91-0057-9af2-26c201456689@redhat.com>
 <20200420215014.sarodevmhphnkkn7@linux-p48b>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <02e1b00d-a8ea-a947-bbe6-0b1380aa7ec4@redhat.com>
Date:   Tue, 21 Apr 2020 11:43:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420215014.sarodevmhphnkkn7@linux-p48b>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/04/20 23:50, Davidlohr Bueso wrote:
> On Mon, 20 Apr 2020, Paolo Bonzini wrote:
> 
>> On 20/04/20 22:56, Davidlohr Bueso wrote:
>>> On Mon, 20 Apr 2020, Marc Zyngier wrote:
>>>
>>>> This looks like a change in the semantics of the tracepoint. Before
>>>> this
>>>> change, 'waited' would have been true if the vcpu waited at all. Here,
>>>> you'd
>>>> have false if it has been interrupted by a signal, even if the vcpu
>>>> has waited
>>>> for a period of time.
>>>
>>> Hmm but sleeps are now uninterruptible as we're using TASK_IDLE.
>>
>> Hold on, does that mean that you can't anymore send a signal in order to
>> kick a thread out of KVM_RUN?� Or am I just misunderstanding?
> 
> Considering that the return value of the interruptible wait is not
> checked, I would not think this breaks KVM_RUN.

What return value?  kvm_vcpu_check_block checks signal_pending, so you
could have a case where the signal is injected but you're not woken up.

Admittedly I am not familiar with how TASK_* work under the hood, but it
does seem to be like that.

Paolo

