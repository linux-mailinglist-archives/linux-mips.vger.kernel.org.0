Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBC864AB3B
	for <lists+linux-mips@lfdr.de>; Tue, 13 Dec 2022 00:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbiLLXMn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 18:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiLLXMm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 18:12:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7751C11B
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670886706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ro+zcDO7opJfp7WFDTaK4QIlqGiqpBQjwVa0Lz8JmGo=;
        b=RQwZ6PiffjWvTSuusrLT+932iuhHkixj+8k7HSshe7k1GGKt5NKYjsY4PQfQzRwU8rx25m
        CNk1Jd/Ib0zS8fH1DUusqfUXbvah9qUeRfMyI+31WSnOUSN7tmE6Dmw81XxLdnonO4xdn4
        CWYA8o5GD8bYrqt8xUTaRWJXz2dcJ0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-Ijmvv4QFNWag_nZcX_lPiA-1; Mon, 12 Dec 2022 18:11:45 -0500
X-MC-Unique: Ijmvv4QFNWag_nZcX_lPiA-1
Received: by mail-wm1-f70.google.com with SMTP id c1-20020a7bc001000000b003cfe40fca79so2329547wmb.6
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 15:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro+zcDO7opJfp7WFDTaK4QIlqGiqpBQjwVa0Lz8JmGo=;
        b=kHwsuco14xXH2pIPjsf9e1E2DiPQwtt3YcJ7Keb6auQ5Qt7hUm3sOco6SrdzpZyvQD
         4X/Vvljt2EOjLIHrjy4fesARQKcQ5wzgZ+nt4vmHVn08RO5jc4sSOBHtXC6BfMl+68xn
         rte52OGpecgN5LytOAcL1IAHvHw+UF6YkjEOjW0C4bGkDSto8woh3T6cv7iP8qlRZ83B
         qjYRzSvWdeXZYW3bOULBOQwjmzPNnydn93o9iw/O01bKG2Ae+oqpM7h15q3hyfN4KwDn
         u2DKcQ8ZcH7H/WsfsZ3ng+W4HaxLywcEH13ExOeyZT2w+vAcC1Tgw+UV2WbQLPg+icyG
         O5DQ==
X-Gm-Message-State: ANoB5plLBitpnzgAz84Ed+GTxaCg2LSoGTvr94Jyo775f/1i/hsVx8Db
        Ni/Uueswbov3iYeQ7SvYC1f+UZ+owVEBF5ztJRkcmfWbFhzMggea7jRtz1NQKI7Ahy7cB1ScEV/
        u9jr9ZGO0Y+9SQ1yfX/5pgw==
X-Received: by 2002:a05:600c:3d19:b0:3c6:edc0:5170 with SMTP id bh25-20020a05600c3d1900b003c6edc05170mr14313820wmb.25.1670886702689;
        Mon, 12 Dec 2022 15:11:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lDfiYN0rE6YVEbmBF7N8YZEpLr9T7uo4Q3R+sKGlV+dcjnOy985UIqQQiqS+aPBilidYnPg==
X-Received: by 2002:a05:600c:3d19:b0:3c6:edc0:5170 with SMTP id bh25-20020a05600c3d1900b003c6edc05170mr14313790wmb.25.1670886702453;
        Mon, 12 Dec 2022 15:11:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003c6f3f6675bsm11712338wmq.26.2022.12.12.15.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 15:11:41 -0800 (PST)
Message-ID: <48f4df00-8ef6-042f-c9ae-4023c4f70058@redhat.com>
Date:   Tue, 13 Dec 2022 00:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     David Matlack <dmatlack@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-3-dmatlack@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 02/37] KVM: MMU: Move struct kvm_mmu_page_role into
 common code
In-Reply-To: <20221208193857.4090582-3-dmatlack@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/8/22 20:38, David Matlack wrote:
> +/*
> + * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
> + * also includes TDP pages) to determine whether or not a page can be used in
> + * the given MMU context.
> + */
> +union kvm_mmu_page_role {
> +	u32 word;
> +	struct {
> +		struct {
> +			/* The address space ID mapped by the page. */
> +			u16 as_id:8;
> +
> +			/* The level of the page in the page table hierarchy. */
> +			u16 level:4;
> +
> +			/* Whether the page is invalid, i.e. pending destruction. */
> +			u16 invalid:1;
> +		};
> +
> +		/* Architecture-specific properties. */
> +		struct kvm_mmu_page_role_arch arch;
> +	};
> +};
> +

Have you considered adding a tdp_mmu:1 field to the arch-independent 
part?  I think that as long as _that_ field is the same, there's no need 
to have any overlap between TDP MMU and shadow MMU roles.

I'm not even sure if the x86 TDP MMU needs _any_ other role bit.  It 
needs of course the above three, and it also needs "direct" but it is 
used exactly to mean "is this a TDP MMU page".  So we could have

union {
	struct {
		u32 tdp_mmu:1;
		u32 invalid:1;
		u32 :6;
		u32 level:8;
		u32 arch:8;
		u32 :8;
	} tdp;
	/* the first field must be "u32 tdp_mmu:1;" */
	struct kvm_mmu_page_role_arch shadow;
};

Paolo

