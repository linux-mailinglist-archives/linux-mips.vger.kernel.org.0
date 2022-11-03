Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1356461879B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 19:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiKCSfL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 14:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiKCSfL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 14:35:11 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B518EF40
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 11:35:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id l2so2716591pld.13
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=Pm4Lr3kAm7G9yhV3E+texinWexF8/BykknHnX+41QMhdAJg8Q6KGdsZlwDR9KsaQ03
         q0oiA6QGnfMNaCLi6FwippomEY2Gxx8DIbtsls7Wm3K9Y5ntAz6T/fo5rOOGqR0XZexV
         IMpIarVZKtd2r4wbd6pBH2HWWgUKLdmEcjKjz7hr2eZWqilU2ZOjSL0LQYBIbuLk+an3
         F080UdTs/Pl//2c4Y7M3MC5aXIj0L8ze9uKQnOS3RTfUxOdNjPBYkRT7wM2xznbkkPNf
         k6rWzEiCMkA6YZikO6kTaZUjEx2R8QJERpkjNDf1cNtL0uRiWX1pfQEgD4PMO8IN1GPi
         cqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=T0UYEKalyGd9xd/tRM3/5KAUfir7NVONilH6NkBKrRZkUfWf2Val709RA8GcyBHafy
         FBEyWkezqpHDO+lGa3FBqCXvWZlNSn35T0zC0VGovm4c60Bsw5NpC7B8Ggl0opFMfBto
         DvSPfxowy38NBS8LIG7WXZEY6fArwYbYpunbVYwKVleL5RTr8gBciWvbdC99gYrPOVWX
         AR4Ht82z/67zjrODC8Lz1IyB063gRAHFY1UpftN5ilsjeEvydHDTsuGuEVvvdhqhyzDe
         aVeZwmcmZ1de8/M1Stech6fAyZHG3ljn2XxUhwKk453/WCMLzlTbmGZV5vBe3XQvpH4H
         WElQ==
X-Gm-Message-State: ACrzQf1/apRiv59bMOJW/J1jXO6uZV3Nvq+0ytnoJVd2ybNPwylWJqE1
        GeO+Q3h9WkmniYHsezKgeLO4gg==
X-Google-Smtp-Source: AMsMyM7An2PKDpytAFzn8oRI/SQJomdGS1nTfx9CsrnDxhHyyoY4AD/5FsaR2YoYMTMl2oHfbxu0kQ==
X-Received: by 2002:a17:903:1250:b0:185:40c6:3c2c with SMTP id u16-20020a170903125000b0018540c63c2cmr31387342plh.64.1667500509087;
        Thu, 03 Nov 2022 11:35:09 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709027e8400b0017da2798025sm914686pla.295.2022.11.03.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:35:08 -0700 (PDT)
Date:   Thu, 3 Nov 2022 18:35:05 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
        Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2QJ2TuyZImbFFvi@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> 
> I think the reference to the BIOS should remain in these messages and in
> svm.c (even though these days it's much less common for vendors to default
> to disabled virtualization in the system setup).

Ya, I'll figure out a way to mention BIOS/firmware.

> The check for X86_FEATURE_MSR_IA32_FEAT_CTL is not needed because
> init_ia32_feat_ctl() will clear X86_FEATURE_VMX if the rdmsr fail (and not
> set X86_FEATURE_MSR_IA32_FEAT_CTL).

It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
if the actual CPU type matches one of the aforementioned CPU_SUP_*.

E.g. running a kernel built with

  CONFIG_CPU_SUP_INTEL=y
  CONFIG_CPU_SUP_AMD=y
  # CONFIG_CPU_SUP_HYGON is not set
  # CONFIG_CPU_SUP_CENTAUR is not set
  # CONFIG_CPU_SUP_ZHAOXIN is not set

on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
will get unexpected #UDs when trying to enable VMX.
