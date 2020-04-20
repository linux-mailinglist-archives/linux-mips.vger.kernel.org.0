Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651421B12E7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 19:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgDTRZe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 13:25:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50567 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726671AbgDTRZe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 13:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587403532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Wi4I6E0HOoTIiwC/qCL3vbIOZi357RgujrqauiVCgo=;
        b=SENqR6uYce9hUseA96cdXZPF5e7XvvAFPHPVRDQBlNxCgdlGMnn2oxSCfCDaGZ67o/5avu
        sKEui/+4ZUGdeGzP4l14e8dHiLvE9VYTSgJUWNzm83JymfA6Gtt/X6MtXw9C6Z4HslwpwR
        pfN0zV+7LMGhrEnWlm497HSXrWAHuMI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-oyYv6PwzMs-q6vWvHCsqlA-1; Mon, 20 Apr 2020 13:25:31 -0400
X-MC-Unique: oyYv6PwzMs-q6vWvHCsqlA-1
Received: by mail-wr1-f69.google.com with SMTP id u4so6035038wrm.13
        for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2020 10:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Wi4I6E0HOoTIiwC/qCL3vbIOZi357RgujrqauiVCgo=;
        b=tFtgNyd9CjhDifV9mpYijO0OOQJTIn2PbIVwyMC+c8attzTW6nKxsQGEHAzBqz8gxs
         qcX32UEAOmU4qFuvArK1cH7fEsbuvo6T+11AYunNDFpCl+gtpJtclUFodWAdyPe68H/R
         +Q6feFTnXRbjRfsBg9r9pICQoicJyAKK4qiuxYmXLTITsCEGnWxg/EN/rVC11z3kSLKB
         EQ6B9ryzrN7UtHFmo3HzCpMjJ6jKA+L7+w3iv08gOSllRAKxKjijTJ588OxqP5X8pKsD
         NHnbPw6/OQla09mx9mPU9z35QPXm4Fm5Wno0SGhYtCjDS7N0fRacqCdlib3YPQA461FO
         iR2A==
X-Gm-Message-State: AGi0PuZfdToVLjBL9c/PNi3/lIsxl5XP2esez50GQYqxepbbtCJYLj4T
        Am2eHbfi/930YRRFiw9aS8N0MfsPuPkquAq8F6jhhKY2V3Fww7SBxia6M86pf2aNSEAVuVKGg2Q
        NtGgS4PmUFtM8mlyC5jtnZg==
X-Received: by 2002:adf:c109:: with SMTP id r9mr19678376wre.265.1587403530025;
        Mon, 20 Apr 2020 10:25:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypLifiyD2rISqsBTFDUXYG+CQzr+z4iBiqXWbcljpUFDAk2pWd1/77hoQLgJWF6OMqcIiIWbgw==
X-Received: by 2002:adf:c109:: with SMTP id r9mr19678363wre.265.1587403529829;
        Mon, 20 Apr 2020 10:25:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:199a:e5ab:a38c:544c? ([2001:b07:6468:f312:199a:e5ab:a38c:544c])
        by smtp.gmail.com with ESMTPSA id h2sm240458wro.9.2020.04.20.10.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 10:25:29 -0700 (PDT)
Subject: Re: [PATCH v2] kvm: Replace vcpu->swait with rcuwait
To:     Marc Zyngier <maz@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc:     tglx@linutronix.de, kvm@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
        torvalds@linux-foundation.org, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        joel@joelfernandes.org, will@kernel.org,
        kvmarm@lists.cs.columbia.edu
References: <20200324044453.15733-1-dave@stgolabs.net>
 <20200324044453.15733-4-dave@stgolabs.net>
 <20200420164132.tjzk5ebx35m66yce@linux-p48b>
 <418acdb5001a9ae836095b7187338085@misterjones.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <22800f1b-3bdb-15b4-7592-93a7b244b45a@redhat.com>
Date:   Mon, 20 Apr 2020 19:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <418acdb5001a9ae836095b7187338085@misterjones.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/04/20 19:12, Marc Zyngier wrote:
>>
>>
>> -    trace_kvm_vcpu_wakeup(block_ns, waited, vcpu_valid_wakeup(vcpu));
>> +    trace_kvm_vcpu_wakeup(block_ns, !block_check,
>> vcpu_valid_wakeup(vcpu));
> 
> This looks like a change in the semantics of the tracepoint. Before
> this change, 'waited' would have been true if the vcpu waited at all.
> Here, you'd have false if it has been interrupted by a signal, even
> if the vcpu has waited for a period of time.
True, good catch.  Perhaps add macros prepare_to_rcuwait and
finish_rcuwait?

Paolo

