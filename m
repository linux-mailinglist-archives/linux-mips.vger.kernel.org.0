Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0887DBDD2
	for <lists+linux-mips@lfdr.de>; Mon, 30 Oct 2023 17:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjJ3Q2s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Oct 2023 12:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbjJ3Q2r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Oct 2023 12:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884DADF
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698683277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=QJRzUGi0crPAdF+PsGr4fd82XBsUf26/RqsTLoK6Cc8=;
        b=PzDdow5/Wb2YXgvu5Iime0LPp5xVYoWEfI6LnNKBDrY+fgcjqDnTNtER1Q/TyOIzW17SX3
        Yav9ta0/6t1/oXJAQge7v3G2ijuel5JQUxYw7eI0+amUFBm1xBuQwrlMh5bz2aY0AVsbs4
        MgBsNJZedzOvLJQo+UJjGD6yqyCJ4sk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-SLNBGUyDN6mGij9Xn2qZAQ-1; Mon, 30 Oct 2023 12:27:56 -0400
X-MC-Unique: SLNBGUyDN6mGij9Xn2qZAQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4083c9b426fso32475395e9.2
        for <linux-mips@vger.kernel.org>; Mon, 30 Oct 2023 09:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683275; x=1699288075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJRzUGi0crPAdF+PsGr4fd82XBsUf26/RqsTLoK6Cc8=;
        b=idRWEDlKD1RoUjkt+REzL9ovd8Yp2UBQhHBoEtxv/yV0HGOI2chFp5Cn021XKron0b
         QSAOc1OyfgI2jg1WSFJ5xBXYATEpe7SdZgr2iNM4Lzqr/YluGk1kMGcdiRnMfF4sHa2n
         eYOUvdF4BMM/qvmJqpPhzu0+0Xd5+bYUhw4Q5jnZcO0ee8+asInmwD0a03eFwtG69WHj
         BSLp0qqYMrLRAkmhK1ubSyxyrrGvpORPTbnifzxovd3eYsZJ4IHcndhCAuDXQiOeGuZI
         jnFlHZy5auU4zIbjDoIMuxzMSY0yLpGC0YTAbcpCUUqsid9F6e1zsDb/mQ2LfRDB7iqC
         nVLg==
X-Gm-Message-State: AOJu0Yw8260hdRSnRn+lqZx7jfR9H7yW3sp//WwzUTiUxRqppOtp3eFD
        aS+oN1nm52cCZmCVUIc+yEZKX/dP0LCcpTyVJKEW5Wcwa8I4OEL6C8y7cvGvcGxvzzmOgjI+WVx
        0gFmhYxKeS2cQpvDL79dZm+TM20YAOw==
X-Received: by 2002:a05:600c:5204:b0:408:3f61:cb4f with SMTP id fb4-20020a05600c520400b004083f61cb4fmr7847791wmb.23.1698683274959;
        Mon, 30 Oct 2023 09:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfa0KyfT9rBRGOGCePk10CmFCQx85iYerXM1uRezmX93sdvp3R2tcV7yoRdLLu5R9pLdpikw==
X-Received: by 2002:a05:600c:5204:b0:408:3f61:cb4f with SMTP id fb4-20020a05600c520400b004083f61cb4fmr7847757wmb.23.1698683274613;
        Mon, 30 Oct 2023 09:27:54 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id u18-20020a05600c19d200b00401b242e2e6sm13160177wmq.47.2023.10.30.09.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 09:27:53 -0700 (PDT)
Message-ID: <ac502d11-1fe8-45ec-bb91-02c94dbcd16d@redhat.com>
Date:   Mon, 30 Oct 2023 17:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 02/35] KVM: Assert that mmu_invalidate_in_progress
 *never* goes negative
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-3-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/27/23 20:21, Sean Christopherson wrote:
> Move the assertion on the in-progress invalidation count from the primary
> MMU's notifier path to KVM's common notification path, i.e. assert that
> the count doesn't go negative even when the invalidation is coming from
> KVM itself.
> 
> Opportunistically convert the assertion to a KVM_BUG_ON(), i.e. kill only
> the affected VM, not the entire kernel.  A corrupted count is fatal to the
> VM, e.g. the non-zero (negative) count will cause mmu_invalidate_retry()
> to block any and all attempts to install new mappings.  But it's far from
> guaranteed that an end() without a start() is fatal or even problematic to
> anything other than the target VM, e.g. the underlying bug could simply be
> a duplicate call to end().  And it's much more likely that a missed
> invalidation, i.e. a potential use-after-free, would manifest as no
> notification whatsoever, not an end() without a start().

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 0524933856d4..5a97e6c7d9c2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -833,6 +833,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
>   	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
>   	 */
>   	kvm->mmu_invalidate_in_progress--;
> +	KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
>   }
>   
>   static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
> @@ -863,8 +864,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
>   	 */
>   	if (wake)
>   		rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
> -
> -	BUG_ON(kvm->mmu_invalidate_in_progress < 0);
>   }
>   
>   static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,

