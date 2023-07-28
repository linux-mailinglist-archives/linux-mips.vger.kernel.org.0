Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A77D7668D9
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jul 2023 11:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbjG1J22 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Jul 2023 05:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235496AbjG1J2E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Jul 2023 05:28:04 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD3955B7
        for <linux-mips@vger.kernel.org>; Fri, 28 Jul 2023 02:25:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5221e487e08so2755982a12.0
        for <linux-mips@vger.kernel.org>; Fri, 28 Jul 2023 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690536327; x=1691141127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=m+mhI0NZwNXFLmeCW784wnrdlo7gOrU+D/C4iPfRD1TMCuqNZae1oeBr/g+EkFc6ed
         2FR6sdT7liI7oc/Nx/gS/Z8eWwdwSKmODJDoS0aScY9GmmtQ1R6KQ/3YuwG3WGpWkfkS
         M6FnUhNilBoLqxChwhgvpwKR1vJB3R4km1sVmyxqao0RMkT0Hwiu4emarHKTiiX2RSDF
         e8RDCIB0BR9/iMl3YthUv9fqK/yrjd9iS92TDbsPif7MWlX44pRNXipYO6YR1dTHbbXo
         yVmzIkj40+i5P/c3glLd7489EoEvWP1rhhbx2ishplr6sN8lzHGqDpW9FasLSZ4RybL4
         A0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690536327; x=1691141127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=iUs9R8IYSVy55mzvuC2X6uqvMzkPRcIAO38IT8PBffTKFtV0Z9Uo3ZxmHSIJqsKWpC
         fvsYinYTTz77VJ7gOOSkyuFrgO9nAXZpdSepZUXbkmfbB3s4S6EvOI3L/Fdn7Y2uO3oY
         sO1ZSpFohhLkAhdB1pCTl2CnAxkwt+Q+3xpxptAlePd3UFpmsJcCPhezi32EcJZfpXOY
         zGeky6NVIJyrRm5QTbbNDbi6lW+D99KMYQ09lpAPUVCjWUjIE93r/ZUnuDk1xDSa5Gfo
         vBA/NBFfx5VjuIFGBu4jdZBz7swkx2Np0/HSz5DvlcxKvM2ut4/59WZYr7QwYl1VoXA5
         ISSw==
X-Gm-Message-State: ABy/qLbMLl9PyhxHX1eOtsqa4REOQY7XAwaoiDCcmRetBww98g6rVlBy
        DBZyGpQYL3Y8dJFduaS2aafapw==
X-Google-Smtp-Source: APBJJlG4DNtaaix3llwTkCcLiQNG9ALlnJv6ynH+2HDeVn6HzB3Xx8i5ieUEd323eDEBkV9C48RmSw==
X-Received: by 2002:a17:906:8454:b0:994:1fee:3065 with SMTP id e20-20020a170906845400b009941fee3065mr1975862ejy.15.1690536326590;
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906688c00b00992c92af6f4sm1857653ejr.144.2023.07.28.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Date:   Fri, 28 Jul 2023 09:25:22 +0000
From:   Quentin Perret <qperret@google.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <ZMOJgnyzzUNIx+Tn@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-7-seanjc@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>  
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];

Should we replace that pad[16] with:

	__u64 size;

where 'size' is the size of the structure as seen by userspace? This is
used in other UAPIs (see struct sched_attr for example) and is a bit
more robust for future extensions (e.g. an 'old' kernel can correctly
reject a newer version of the struct with additional fields it doesn't
know about if that makes sense, etc).
