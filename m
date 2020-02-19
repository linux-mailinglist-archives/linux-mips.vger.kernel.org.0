Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2DE164048
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 10:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgBSJXY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 04:23:24 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34921 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgBSJXX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 04:23:23 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so26245915ljb.2
        for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2020 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VYACtOJzFbdHHzYAV0uoJeRPRBCCx7IkeDn63MpNOyk=;
        b=CCiBJDOQ5P0k1bJLD9sFKDMpZF6oQoNIKRBF2hY/zXle6ThFUJbx+Uw8FDu0XhSKfM
         OuqwMUedhFw6kO9+gKhw/6icCcP+A1cD3RRqIU+Ltyo+5MXfiNboB6NEenFFQkECXJSw
         HlqWyXSXGIYk7hjq0bEsC0KfXWoorwMeFCYx5lS9L+O2m1PrE/Mxpv9BiEvaaYuzmkCO
         7KkriufHpAT98/br77i3qzpcE9ZZG4qN3h5EIF9lJTl/9rGRYzUQHtq41R/8I0ruZ9VH
         WItNmhMtbZVQ9Byk+iw+zfqs7wj3lJgUVGnUyEJC4J7jpW874hnI2f7thaU/GlZFqFVm
         rVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VYACtOJzFbdHHzYAV0uoJeRPRBCCx7IkeDn63MpNOyk=;
        b=sAqAPpvSiksZ4ydzY73aBIGbGQPNmHLcr5E92c3/ZS7NJeswaj6iWwA3exEXb+zgtD
         tukw0em07QgfrusKfdpukSv8vFtFWI5wPmwhjGDEZACvoGxG45ai56NgSFxon2rLl8v2
         fjGfP+9xHq7pwiYBWIwjjQdGC8jpyKfGbUD4jki34EXhex7HJJLW0x0fveEjqkibqgnx
         hh3uH/Cf/v9vx0E/uxqMCg7BlEr1Pd9H6CfI+1U0e13I+IXJnroBWcw7DqR93n+zcpmr
         l1dZMiYvxNFVRX86TIwDGQlrpKi/cBkyGyyiUJLJB+92V022CmOiUncvkM8MheuIZUvh
         mbgA==
X-Gm-Message-State: APjAAAUg6rjptuPGgbKjwhAO/0gN8Szr3gc3mTwnD8zEXphx1RJhMRAU
        pT/PU4p1/qtk+0QYktLULcEPpw==
X-Google-Smtp-Source: APXvYqwYpw0gDCHzJar4JQhf+hD+uQHtynXxiIGrOaO+rkxoRcCGQ2R/zdsyaYtZedMgWq+L5SluAA==
X-Received: by 2002:a2e:b044:: with SMTP id d4mr14981358ljl.159.1582104201028;
        Wed, 19 Feb 2020 01:23:21 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:26e:a51f:ed1d:2717:41f:4f76? ([2a00:1fa0:26e:a51f:ed1d:2717:41f:4f76])
        by smtp.gmail.com with ESMTPSA id q26sm843539lfp.85.2020.02.19.01.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 01:23:20 -0800 (PST)
Subject: Re: [PATCH v6 21/22] KVM: x86/mmu: Use ranged-based TLB flush for
 dirty log memslot flush
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Peter Xu <peterx@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200218210736.16432-1-sean.j.christopherson@intel.com>
 <20200218210736.16432-22-sean.j.christopherson@intel.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fdb72ab9-18d4-5719-2863-78cde4e97fae@cogentembedded.com>
Date:   Wed, 19 Feb 2020 12:22:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218210736.16432-22-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 19.02.2020 0:07, Sean Christopherson wrote:

> Use the with_address() variant to when performing a TLB flush for a
                                  ^^ is it really needed here?

> specific memslot via kvm_arch_flush_remote_tlbs_memslot(), i.e. when
> flushing after clearing dirty bits during KVM_{GET,CLEAR}_DIRTY_LOG.
> This aligns all dirty log memslot-specific TLB flushes to use the
> with_address() variant and paves the way for consolidating the relevant
> code.
> 
> Note, moving to the with_address() variant only affects functionality
> when running as a HyperV guest.
> 
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
[...]

MBR, Sergei
