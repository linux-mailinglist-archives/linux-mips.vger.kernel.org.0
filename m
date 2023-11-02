Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9617DEA9F
	for <lists+linux-mips@lfdr.de>; Thu,  2 Nov 2023 03:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348035AbjKBCUK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Nov 2023 22:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbjKBCUK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Nov 2023 22:20:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7028211D;
        Wed,  1 Nov 2023 19:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698891604; x=1730427604;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qMSrBq5gKSfvneC99jG0ycqZi9wUzkwKrG5m2lwT0dM=;
  b=LdpA/K0iBInjVEGveW8ciM4zHmQ6nSMJ/VOGGNnBWn3ppc2EvW9MSsRv
   tv9G9s3JPgjQBZDQPURgj5BHXbQjgRj4T5FJsibP+Bq55BZudHcREyo5Q
   uS4bpAjwIHUznzpsyfbyeCtcAovxUJqQClWsUAN7qBq1N1vY2WFaIT2vX
   2eVBptiq/3Wrw+MW3PNzaTSKAuTOoTui0V3/QPRa4hnkOe/10L7sULKaz
   LEyUXXgVYWqUq8zRk1eiFJmhIAJK6LZYnV1Js6LV7WPvf0CtiMo0SggU3
   70HDcwXOYdJIlLFc9i82w48yQyVjwnIMdA8U5JRurucu+8RktGLM+Xhml
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373665318"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="373665318"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851761891"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="851761891"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:19:53 -0700
Message-ID: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Date:   Thu, 2 Nov 2023 10:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Kai Huang <kai.huang@intel.com>
Cc:     "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "brauner@kernel.org" <brauner@kernel.org>,
        "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "maz@kernel.org" <maz@kernel.org>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "willy@infradead.org" <willy@infradead.org>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "mic@digikod.net" <mic@digikod.net>,
        "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "tabba@google.com" <tabba@google.com>,
        "amoorthy@google.com" <amoorthy@google.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "michael.roth@amd.com" <michael.roth@amd.com>,
        "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Vishal Annapurve <vannapurve@google.com>,
        "vbabka@suse.cz" <vbabka@suse.cz>,
        "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
        "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
        "qperret@google.com" <qperret@google.com>,
        "dmatlack@google.com" <dmatlack@google.com>,
        Yilun Xu <yilun.xu@intel.com>,
        "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
        "ackerleytng@google.com" <ackerleytng@google.com>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Wei W Wang <wei.w.wang@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
From:   Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZUKMsOdg3N9wmEzy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/2/2023 1:36 AM, Sean Christopherson wrote:
>> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
>> <asm/kvm_host.h>?
> I'd prefer to keep it in generic code, as it's highly likely to end up there
> sooner than later.  There's a known use case for ARM (exit to userspace on missing
> userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> 
> [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com

I wonder how this CAP is supposed to be checked in userspace, for guest 
memfd case? something like this?

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
		abort("unexpected KVM_EXIT_MEMORY_FAULT");

In my implementation of QEMU patches, I find it's unnecessary. When 
userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies 
"KVM_CAP_MEMORY_FAULT_INFO".

So I don't see how it is necessary in this series. Whether it's 
necessary or not for [*], I don't have the answer but we can leave the 
discussion to that patch series.
