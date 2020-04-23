Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EF51B5787
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 10:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgDWI6L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 04:58:11 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55393 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbgDWI6K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 04:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587632289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kkq0uwjQBfxJhQKuYr+1chwz4XGWFG4HzoEt9DzJrws=;
        b=iGAOCQ8qlGPHFbP9p+FqEGRRLBMdsIE6UH6o4zEembVbztHHxC/JWhRoWv34o5h0XkQf9s
        dgj4jftcqXalejir7yAhsFS1HfgyurbDpxr3ZVe0F+AoDhsiUlgKIEvcAr97EuXqM4PKQa
        Wgk7i3h8Mv5BWJLy7gLrXX+R+3kGtvs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-_mdq8VvvPF-qtnBdoMCuUQ-1; Thu, 23 Apr 2020 04:58:07 -0400
X-MC-Unique: _mdq8VvvPF-qtnBdoMCuUQ-1
Received: by mail-wr1-f72.google.com with SMTP id y10so2536493wrn.5
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 01:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kkq0uwjQBfxJhQKuYr+1chwz4XGWFG4HzoEt9DzJrws=;
        b=rtG2grCS79ZAh/nR+Enz6OqCbe0n/6LeSaCsOEz7y6YKTA++Zn/fbRjw8ZTMTfjdyl
         StQjdZG9zkPVqlp+Cvm0j3PB8xMfPmQf8uDQvDWl7hCZj5fvoUsLYn3ksDg4jwwvqrF5
         Q4nF9qAuXA5OpZqf3EhO43JkPnWPTUh+7pT7dJfoXZmis5JwzZk5dgWc/GHsEmngQ8kE
         Rizmg5Bx8tTxFsckIf0Wq0ijoGehJlU3h2DZ0pJZfWNLRuoN3L05qj3kNxsWTfjDMJmD
         46+MpxoDQGSDJF80vkjyYTqd9rOQEwXhMXGNVADTYb0J0c9O17JHFDN20gzmnBsIufdO
         ewpg==
X-Gm-Message-State: AGi0PuacVMrGeWVAKLRRTnHxVx76uZXqhHxIpIYnhsYLQhqPvkLH2fkq
        CmuiYxq0rf8iMzsIsyuZ+xSfKUFjOMmPOa05tNpg1Ust4dxqi3vNy8h/EwI/AGWiJ4TZTQfRwEu
        AizHP2lyZFYXRIw/MT8SKjA==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr3609438wrw.72.1587632286119;
        Thu, 23 Apr 2020 01:58:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypJw0BmW6FuCWHcq3ZxzvKLkyVd4P0Y1C0QqksviQgntreRVEaQvmWwFSAjOCQTYt1Fqs4tEqA==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr3609406wrw.72.1587632285847;
        Thu, 23 Apr 2020 01:58:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926? ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
        by smtp.gmail.com with ESMTPSA id h2sm2810041wmf.34.2020.04.23.01.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:58:05 -0700 (PDT)
Subject: Re: [PATCH 4/5] kvm: Replace vcpu->swait with rcuwait
To:     Marc Zyngier <maz@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc:     tglx@linutronix.de, kvm@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
        torvalds@linux-foundation.org, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        joel@joelfernandes.org, will@kernel.org,
        kvmarm@lists.cs.columbia.edu
References: <20200422040739.18601-1-dave@stgolabs.net>
 <20200422040739.18601-5-dave@stgolabs.net> <20200423094140.69909bbb@why>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f07f6f55-9339-04b0-3877-d3240abd6d9c@redhat.com>
Date:   Thu, 23 Apr 2020 10:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423094140.69909bbb@why>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23/04/20 10:41, Marc Zyngier wrote:
>>  
>> -	if (swait_active(kvm_arch_vcpu_wq(vcpu)))
>> +	if (rcu_dereference(kvm_arch_vpu_get_wait(vcpu)) != NULL)
> This doesn't compile (wrong function name, and rcu_dereference takes a
> variable). But whatever it would do if we fixed it looks dodgy. it isn't
> the rcuwait structure that you want to dereference, but rcuwait->task
> (we are checking whether we are called because we are blocking or being
> preempted).
> 

Yes, I agree.  Replacing swait with rcuwait is all good, but please make
the API look the same first.  Just like you added prepare_to_rcuwait and
finish_rcuwait, let's add rcuwait_active as well.

Actually let's do it like this:

1) Davidlohr, please post only patches 1-3 to "equalize" the swait and
rcuwait APIs.

2) Peter, please prepare a topic branch for those, or provide Acked-by

3) let's get everything else through the KVM tree.

Thanks,

Paolo

