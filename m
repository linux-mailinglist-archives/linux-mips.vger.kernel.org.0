Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5936064AA3D
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbiLLW2X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbiLLW2N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:28:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BE61AA10
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670884034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zeSZwvHmFeU5UUDXCwOByZegtobcOblZc96Ym35chsE=;
        b=UEy2Pmeca3g3QcvXgvN9lYG/Jy7cCPGJnkvAgyriIY6Q6At1pmrgRQpRNzS953/LY/9LDQ
        qkvfWuE9PZJI9vNV5o5iHLk6EizEEdhqGVSa34j9C0sJa9J2/zMG1QqaTVPopnEV3lS2aK
        pxCHYqHjcjaYukT3Ir69MMrc8Y7oxHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-fH2-BPTsMN6ZDVfOhCcA9Q-1; Mon, 12 Dec 2022 17:27:11 -0500
X-MC-Unique: fH2-BPTsMN6ZDVfOhCcA9Q-1
Received: by mail-wm1-f71.google.com with SMTP id c187-20020a1c35c4000000b003cfee3c91cdso3959831wma.6
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeSZwvHmFeU5UUDXCwOByZegtobcOblZc96Ym35chsE=;
        b=vlNrvbUJyFWKUO16XBVcHE6AR4sz1QDiDqMxqBg1RJd0BvetdyxNpQIFGYp1EjiXQ5
         afYefP2o0YKV6YQCfJzgPL1iszZQPE4FJ2rm8T9bWkCEnym1wI8SbZkSgboudviLI0Z/
         e8vmL85gjbb+MisNXyi/LdsuQ973tvyfnsbIiIz3DtHhbCb5ycUg0ezpj/FXypWq4p30
         kRTUi4mgsNEqakIMPDtjKxv7w1PSl0dBoqZREwxXRyPi9jLDEYcC9JyWgYEKRKIxmqT1
         4FyntyBSVOf+dOIsgQ5gbQoD94i3Mz/gyBWJE6gAiCLKela40iDdcEo41wC6SPVdJwce
         C/2Q==
X-Gm-Message-State: ANoB5pnOuCuXgZbIm4hSeMIbLPDoP7yKCTI3FWYilsvzXYtuFt++TCJX
        3Jrj0Cm0TzhW/hFSpEKg1tJ3bNPH5QN0h7Ouph0LLOVeUxCxDp4HGEV2+w2oi2pBSgFLwSXqnhV
        FF0KwkNQAPAM/G03vY5ZaUQ==
X-Received: by 2002:a05:600c:35cb:b0:3cf:360e:f37d with SMTP id r11-20020a05600c35cb00b003cf360ef37dmr14411546wmq.22.1670884030400;
        Mon, 12 Dec 2022 14:27:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dJ0ARaW77iY6LzN30Dnbz5ebYPZeA9S1gDChcfg6ar2i9lvJt/8ICiG48/nDxEpBydsoLBw==
X-Received: by 2002:a05:600c:35cb:b0:3cf:360e:f37d with SMTP id r11-20020a05600c35cb00b003cf360ef37dmr14411523wmq.22.1670884030137;
        Mon, 12 Dec 2022 14:27:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l8-20020a05600c4f0800b003cf54b77bfesm11143797wmq.28.2022.12.12.14.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:27:09 -0800 (PST)
Message-ID: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
Date:   Mon, 12 Dec 2022 23:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common
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
 <20221208193857.4090582-11-dmatlack@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-11-dmatlack@google.com>
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
> +
> +	/* Derived from mmu and global state.  */
> +	const bool is_tdp;

I think this could stay in the architecture-independent part.

Paolo

