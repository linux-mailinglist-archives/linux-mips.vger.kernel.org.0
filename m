Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE29E691635
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 02:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjBJB2I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Feb 2023 20:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjBJB2H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Feb 2023 20:28:07 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947825D3D5
        for <linux-mips@vger.kernel.org>; Thu,  9 Feb 2023 17:28:04 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d8so3722909plr.10
        for <linux-mips@vger.kernel.org>; Thu, 09 Feb 2023 17:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mnobgm7/BRwA5boztD22jzgEkU3wNnOY9D1aetlEf20=;
        b=csIO68IIOhsu6e+pdejTTT2+w48D/sWWLOeOIyNJYGX8uv7NM4VXMJmzIiRrpc2byB
         oNF30v46MfMUr/zM1Y9pIBSYlUDIVF+op3/R/inHFDRjbUPyvEWGmS8g+4aYPNOLXmI1
         k4gFifjP8fAfy+Pj0D/2S3/yl0kgg472XcQ7oejDQhBv7j6e61xvYtTNJxFhtCLHkUR0
         vwFGPM0W1k1+6VAy/nE3sRCRvI1WK//Zg5F92Z7EstjU8c++zH/a/c8dOrVkEQhduubT
         CTG0B3v3Gj7juI3iy68AbH4UWi8S6xjEzA/lWDNstS1PF9tuSuPj4tgHC/qRIAxoM46N
         zJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mnobgm7/BRwA5boztD22jzgEkU3wNnOY9D1aetlEf20=;
        b=U33ogmx3HEM6yUBhBklKl4trZvtRdWC7e0v6RJS7T/gGBf4rCE8ene8kcLcA4k7kx5
         gBhw5Ta3YcGqqfX3nkFLrUmBW9ccvJNCPNWdACn6daNe3XsmJx8ngjQw2HQ9CBwPhned
         TPZFR6IGAThZbv6T0sLrEQei/JzP419fUx6+9DdImXDLUnfYR7zxpNmK/2kj/D8brq7m
         9lASvQTiB0jLbIIlZ3MTY6sISPaf0jgbYjQ+cGG4RLsDpSmR2tLmSFrdbtFKIe+SHjyj
         B14W+ogJdPtllGIcw4jn57+cAsonZnNB27OqwEqLz3vRXMkUjMsH7j2fKZh6yvG5wZdN
         qncw==
X-Gm-Message-State: AO0yUKV54TJB35fbsdFp6467A0e/B9CibfMbacQpBaxdVwALe6lWEifZ
        8UYA+rxdvSx0luTpJR5pHV0RIg==
X-Google-Smtp-Source: AK7set9Obj4DfpjGpxNp3bHnBxnNHSIelzzZM7dkpr8wS73Skb7zUOHunDsTlPiKfqLt2v8la2CkZg==
X-Received: by 2002:a17:903:264c:b0:198:af4f:de0c with SMTP id je12-20020a170903264c00b00198af4fde0cmr103011plb.12.1675992483947;
        Thu, 09 Feb 2023 17:28:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id jk11-20020a170903330b00b00198da1ce519sm2143807plb.111.2023.02.09.17.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 17:28:02 -0800 (PST)
Date:   Fri, 10 Feb 2023 01:27:59 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     David Matlack <dmatlack@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH v2 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Message-ID: <Y+Wdn+mYVYhwut5l@google.com>
References: <20230126184025.2294823-1-dmatlack@google.com>
 <20230126184025.2294823-3-dmatlack@google.com>
 <86o7q4zdcp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o7q4zdcp.wl-maz@kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 08, 2023, Marc Zyngier wrote:
> On Thu, 26 Jan 2023 18:40:20 +0000, David Matlack <dmatlack@google.com> wrote:
> > @@ -368,7 +367,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
> >  		++kvm->stat.generic.remote_tlb_flush;
> >  }
> 
> For context, we currently have this:
> 
> 	if (!kvm_arch_flush_remote_tlb(kvm)
> 	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
> 		++kvm->stat.generic.remote_tlb_flush;
> 
> Is there any reason why we shouldn't move the KVM_REQ_TLB_FLUSH call
> into the arch-specific helpers? This is architecture specific, even if
> the majority of the supported architecture cannot do broadcast
> invalidation like arm64 does.

s390 and PPC don't implement kvm_arch_flush_remote_tlb() at all, forcing them to
implement the function just to implement what everyone except ARM does doesn't
seem like the right trade off.

As usual, x86 is the real oddball.  All other architectures either use the purely
generic KVM_REQ_TLB_FLUSH or they don't.  x86 is the only one that sometimes wants
to fallback.  I can't see a clean way around that though, especially since MIPS
apparently needs a notification _and_ a generic flush.

Can the ARM hook be inlined?  That would eliminate the extra call and should allow
the compiler to optimize out the conditional and the request.
