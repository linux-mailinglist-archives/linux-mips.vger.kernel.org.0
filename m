Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B61C61A200
	for <lists+linux-mips@lfdr.de>; Fri,  4 Nov 2022 21:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiKDUPm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Nov 2022 16:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiKDUPl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Nov 2022 16:15:41 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA73C31ED6
        for <linux-mips@vger.kernel.org>; Fri,  4 Nov 2022 13:15:40 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k7so5884495pll.6
        for <linux-mips@vger.kernel.org>; Fri, 04 Nov 2022 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwcH+iZxGlELoSFmbiG2F+LcSAfxo7d4BXkkQPL3oEI=;
        b=Feo7aLccvIiUFCz0IQvThwilRRuNsyrpZUnftVsZfjj8XYXQSFrIYH3rBJ9pl9AVd1
         0QBS4p0eS2Auk5grltqCZHhMy52m2eoOZ3Dyjvl6u7ksM+uKmfXQViJ2DXA8oC3D4Z34
         IZgMWO3NptjbIzmMH+7K07NkCucKQA3oBW+yQ9OuKRe0+DMXUgLl0Rs58L/pchkt3qwG
         SRvLV8FDseMonl0kTvvz0KTjPcnWljQWZJ8bRjD448LzwgH9ljB4ZZnYaguVVVZ5Rh/H
         Z656e04FZq7s/SPiTN5UXm2Xfu4LYQY2nb1iUEZCzGlvNIqMCMtTR0K0fg2+3idK7iEY
         /AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwcH+iZxGlELoSFmbiG2F+LcSAfxo7d4BXkkQPL3oEI=;
        b=0evWZrzH9ij+ETb5+FEo5nYNw9ikVgMnH1X+wrGggDZ/Ayydkkq9Er7nLuTjV6GAt2
         erxBqXYZwTUPjw6quLNjLzp677BOaO6pbSKQ4cHlTZrj1MgmgboQIAMkB1zfk65dyRiU
         MzQpzPXEI1priF5u5NmVgNX4gsroOnNI1qZSGnOY153TM8sA8bhs/lqo+JZbvfLeZsvG
         OztknVYAqXhyygDHhIXd2ex2ioldSlGnhzR7NgU9Qky1UCFPUGDs+WKPKPcUd0Rbc8Fz
         UJeB6xQjUMdZgyuOv8q7p6JFNtue7XbdAeIuTzEF10Ol7OBghmJqBvjssRkF/QLbVsxS
         oTUQ==
X-Gm-Message-State: ACrzQf3f3uSeqe3zPlNznJlSnYHOyTMDxJ1T5tz8rtAtbj2fJ6D0mOoJ
        Pior3k7IhHP/gaI+e4sM17K9oQ==
X-Google-Smtp-Source: AMsMyM7LA9CKVJucdf56FhPBIDbY23ArzmJdn5v66cKOhKDCPGvtmHqu7FhmyFiehmOw+k0waEgaCQ==
X-Received: by 2002:a17:90a:2bc9:b0:212:8210:c92d with SMTP id n9-20020a17090a2bc900b002128210c92dmr38288471pje.38.1667592940349;
        Fri, 04 Nov 2022 13:15:40 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00183c67844aesm166908plr.22.2022.11.04.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:15:39 -0700 (PDT)
Date:   Fri, 4 Nov 2022 20:15:36 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Chao Gao <chao.gao@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 02/44] KVM: Initialize IRQ FD after arch hardware setup
Message-ID: <Y2Vy6Eq89tQa+3bq@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-3-seanjc@google.com>
 <Y2Rfz+TIcdfcawxh@gao-cwp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Rfz+TIcdfcawxh@gao-cwp>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 04, 2022, Chao Gao wrote:
> On Wed, Nov 02, 2022 at 11:18:29PM +0000, Sean Christopherson wrote:
> > 
> >+	r = kvm_irqfd_init();
> >+	if (r)
> >+		goto err_irqfd;
> >+
> > 	r = kvm_async_pf_init();
> > 	if (r)
> >-		goto out_free_4;
> >+		goto err_async_pf;
> > 
> > 	kvm_chardev_ops.owner = module;
> > 
> >@@ -5927,6 +5926,9 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
> > 	kvm_vfio_ops_exit();
> > err_vfio:
> > 	kvm_async_pf_deinit();
> >+err_async_pf:
> >+	kvm_irqfd_exit();
> 
> >+err_irqfd:
> > out_free_4:
> 
> Do you mind removing one of the two labels?

Ah, I meant to tack on a patch at the very end to clean up these labels once the
dust had settled, e.g. to also resolve the "err" vs. "out" mess I created (on
purpose, because trying to describe the "out" path was frustrating and generated
too much churn).
