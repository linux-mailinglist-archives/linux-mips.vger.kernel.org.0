Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909A8747ACD
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jul 2023 02:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjGEAwS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jul 2023 20:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGEAwR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jul 2023 20:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA4D10D9
        for <linux-mips@vger.kernel.org>; Tue,  4 Jul 2023 17:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688518293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=05Y7FRqpionSiuOM6vbmN3tWEYWnCWQeWHLoVh2gOCU=;
        b=XyB3X2aL5Qt4DeRDUQUvoerQ91jTObOkxF+6VfzkfhmedqCUDlQfVlqjhe9Y/qGrAkg5kQ
        Gkbmh8geFn3lSd7bJ2qfGo/McGUpg3+XrFDXhBBJYzTaMbgzfvSudhML2cMFask9WvcUxv
        43BT52QdVWtZMaI/yqNBk5ChAQbieOU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-BBp4T04NPoq0OWrE_LgEQg-1; Tue, 04 Jul 2023 20:51:29 -0400
X-MC-Unique: BBp4T04NPoq0OWrE_LgEQg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-56942442eb0so66349327b3.1
        for <linux-mips@vger.kernel.org>; Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688518289; x=1691110289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05Y7FRqpionSiuOM6vbmN3tWEYWnCWQeWHLoVh2gOCU=;
        b=GV43gvUIKa0lu2VFCqZuKWM3DqSPNPdxraLIbl0TZ5n0e2AOJivP3/0LailKe0uHqM
         crHgLcdpyBFPogcnXAM6PnVeMYW93WGBlJAp4rMxDnug1fHnAO/T1FImpJa3s9ireDbF
         WYeJYdm51Jd08yG8Xy6zvzuisi89Qg35fBJWjBOKoc5iSzrE88rwbnpvrphTlTADDPDp
         iEWmxsFiX/merW3BIJIjlTkI9MbgTmRzu55BkdxVgKC1AXdNNAsWFU9RaILbUzmUjyJo
         jVU+wj47ny+Jz76jOJPMrL/uE6nZwJRE4VWA1//Nq8jVI8Br0PfjvtxiNXqfCfi8rdiY
         zT9Q==
X-Gm-Message-State: ABy/qLZTmpItjfoHxI6TYkKEmgtgrX/c3i5+WrMYubf+92IxhWrb0m2L
        NNssjQXvYFV3NZnP+GFdakc4y6Tq3C3Z7G7QzV9C0D7YTlGb3+ENybyLNsQZ5csbhcT3Dmthu/H
        aRewqxVIAAxysXFz6cvWo8g==
X-Received: by 2002:a81:6643:0:b0:573:592a:6f7e with SMTP id a64-20020a816643000000b00573592a6f7emr15236900ywc.19.1688518289389;
        Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGNQHLeMCWSeIz0qJufd+RXKyUWMQNzzlL6WDmNr44iY2x5LiPzRok2Cx6uzmegN+Hqo8Q60A==
X-Received: by 2002:a81:6643:0:b0:573:592a:6f7e with SMTP id a64-20020a816643000000b00573592a6f7emr15236876ywc.19.1688518289160;
        Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78dd9000000b006687b4f2044sm16074713pfr.164.2023.07.04.17.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:51:28 -0700 (PDT)
Message-ID: <fa99d4ea-7390-906e-b691-9fa838df2788@redhat.com>
Date:   Wed, 5 Jul 2023 10:51:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 10/11] KVM: arm64: Invalidate the table entries
 upon a range
Content-Language: en-US
To:     Raghavendra Rao Ananta <rananta@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-11-rananta@google.com>
From:   Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-11-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 6/22/23 03:50, Raghavendra Rao Ananta wrote:
> Currently, during the operations such as a hugepage collapse,
> KVM would flush the entire VM's context using 'vmalls12e1is'
> TLBI operation. Specifically, if the VM is faulting on many
> hugepages (say after dirty-logging), it creates a performance
> penalty for the guest whose pages have already been faulted
> earlier as they would have to refill their TLBs again.
> 
> Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
> If the system supports it, only the required range will be
> flushed. Else, it'll fallback to the previous mechanism.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index df8ac14d9d3d4..50ef7623c54db 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -766,7 +766,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * value (if any).
>   	 */
>   	if (kvm_pte_table(ctx->old, ctx->level))
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +		kvm_tlb_flush_vmid_range(mmu, ctx->addr,
> +					kvm_granule_size(ctx->level));
>   	else if (kvm_pte_valid(ctx->old))
>   		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
>   

