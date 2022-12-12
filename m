Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5178964AA57
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbiLLWdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbiLLWdg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4915E2DE1
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670884360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BHhE1QP3jUCpk1cxLuQ6KAYvI1S2lfEsXBvTRJ9YN5A=;
        b=F6sM0inhhakwBBTX5N/jZ6Bini7lCXbRRoA1HcHGPYCOcWkgTW5gcK30YbLEA2wITfXQFh
        aT5WPqf8TLPZPl779hZCwNw+5pJb5cWP7jR32D4FzM7aktT+ebUONIbHcomGjWQE42scxt
        VqkpB3Cfs8fjjHb2hIXr6IetlReIuR4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-B5wra8GHPGCAm_PAyE34iw-1; Mon, 12 Dec 2022 17:32:38 -0500
X-MC-Unique: B5wra8GHPGCAm_PAyE34iw-1
Received: by mail-wm1-f71.google.com with SMTP id r129-20020a1c4487000000b003d153a83d27so3987953wma.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHhE1QP3jUCpk1cxLuQ6KAYvI1S2lfEsXBvTRJ9YN5A=;
        b=z9NsWmoKOEnhCcYOxR1+X8VPvmDOTRLlsJ+z23oI1Y087cHjk/oEhRjqpnGmuByRS2
         WdHqb4KCbjRaC4Xjq4fouhLwvY6T9UmOQQt2poIXl433EI3HT1tTHJucXtyu/sdwhdv6
         VeYm1kDkT3E2tf+FTubQe5lq7RbUnMUTkG50vdX5xvhcO3+3gPl02F1thabyUNZKM63l
         B2oeSbn8YhlfDPC2KVSKg0YsnDqvzvmixkqwwFNMa/ENPtvMoXIpomaHvl/TnU44fhhy
         Q2e5d/efIUW5rVRJUeqCroDDG7VOAjSn0wbuUcch9s38Kw32CkVXNwIiVOhSDsZLE9mv
         mFpg==
X-Gm-Message-State: ANoB5pkmlae0Ly1WwSzUSfzVZ0ZLFmc+wWxcob0e54yCA56kEwd95lFZ
        ritASfKfRG2+gJ4cbvRgBmMnGLrHB1sL5/e3SpluRpMI4IOqQ4m9ps7Q7iGx2FZRdFaYyoh46tJ
        AWP1PhJbGB0OmStG/VjOU/g==
X-Received: by 2002:a05:600c:3d8f:b0:3c6:e62e:2e74 with SMTP id bi15-20020a05600c3d8f00b003c6e62e2e74mr13978219wmb.15.1670884357780;
        Mon, 12 Dec 2022 14:32:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5rK2wuh16AKn0g4El+6pmLN9CiGHMIzRy1p4C+zNER/+4S5U+s8UBV98mPUqtRVzVGakI9Nw==
X-Received: by 2002:a05:600c:3d8f:b0:3c6:e62e:2e74 with SMTP id bi15-20020a05600c3d8f00b003c6e62e2e74mr13978185wmb.15.1670884357516;
        Mon, 12 Dec 2022 14:32:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id o5-20020a05600c510500b003cfa3a12660sm186503wms.1.2022.12.12.14.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:32:36 -0800 (PST)
Message-ID: <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
Date:   Mon, 12 Dec 2022 23:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 06/37] KVM: MMU: Move struct kvm_mmu_page to common
 code
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
 <20221208193857.4090582-7-dmatlack@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-7-dmatlack@google.com>
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
> This commit increases the size of struct kvm_mmu_page by 64 bytes on
> x86_64 (184 bytes -> 248 bytes). The size of this struct can be reduced
> in future commits by moving TDP MMU root fields into a separate struct
> and by dynamically allocating fields only used by the Shadow MMU.

I think it's already possible to use a union like

	union {
		struct kvm_mmu_page_arch arch;
		struct {
			struct work_struct work;
			void *data;
		};
	};

Paolo

