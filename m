Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4AC4D958D
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 08:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345617AbiCOHr7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 03:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345615AbiCOHr6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 03:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C6F54B862
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647330406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jWeRmNoHqA79eh4aTLJgqBLVAPL7D60jcq/uE/nVP+g=;
        b=N9+Wuu2666HEX3UqTiKtRHbYPSm/FnRO1maniq8E6CvcJVzNUK4/C7btB6zyWMhpNIXRWu
        KgenoJCGecJjchgi+QfYZBN7T1ws1haDqvNZchObYpTcYAD2Fz0DppRTLsRSTNuQTvoq2n
        HH9Uf3PP7tpf+x4kQIO+9VgPiY8682A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-xHpYl8_1NhG0OFdmJqCU5g-1; Tue, 15 Mar 2022 03:46:44 -0400
X-MC-Unique: xHpYl8_1NhG0OFdmJqCU5g-1
Received: by mail-pj1-f72.google.com with SMTP id p5-20020a17090a748500b001bee6752974so1398033pjk.8
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 00:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jWeRmNoHqA79eh4aTLJgqBLVAPL7D60jcq/uE/nVP+g=;
        b=kwFcP/DOf6pTOUu9EanESfij4ZMGSP4msZN82fqJ+AFh79JG7CvQQdOHbP6Q+wTTbB
         j+NzcBSZr/gG9SfTqBptJJHPYfwFcoTF1VPG7xDkvHf7p9syuZwMxUsPnIFts1OEbWd8
         O1lYgjOsv71gdCCXD37aQ8HDVApFZo4LO32ZmZAg1R5UpKDhhDYdyfA8S4Ef81XgwiS0
         oW2p4WMH0J9NmXlaGq6dZezs1bIRjeX28vYu2XZDSxOJhbPo9WrkP3Pdh41KPD/LjcRD
         zif29bWPv4LSoxZRzgay72E5T/Frb36HcA5aC1AQPTP0LaxG/AGU/YHR607e7Va/cgjE
         AaSg==
X-Gm-Message-State: AOAM533WTA6tSWaJ+P40/zexXqQBJLWB105LIZqwrdy9Um9RSxxqMtTu
        yHxmtxXzvbeA2QLPkoINItF8XCtIhyZmTcJlcg0Ny+1C+KCWT/aYF+ivuO1WHBrVg9yPw5Zi3jq
        MymM8fgsUOhLyDfl4ud7JrA==
X-Received: by 2002:a17:90b:3a81:b0:1c2:bf38:b57a with SMTP id om1-20020a17090b3a8100b001c2bf38b57amr3181536pjb.172.1647330403431;
        Tue, 15 Mar 2022 00:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7FLPnde4MmAng4UXgI9r1HTOD3VSQ8zmxvVJmWLA5YqMaBNH24gOlC5XFnQFle7qC0BS3aA==
X-Received: by 2002:a17:90b:3a81:b0:1c2:bf38:b57a with SMTP id om1-20020a17090b3a8100b001c2bf38b57amr3181502pjb.172.1647330403166;
        Tue, 15 Mar 2022 00:46:43 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id s30-20020a056a001c5e00b004f75773f3fcsm22480075pfw.119.2022.03.15.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 00:46:42 -0700 (PDT)
Date:   Tue, 15 Mar 2022 15:46:34 +0800
From:   Peter Xu <peterx@redhat.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v2 02/26] KVM: x86/mmu: Use a bool for direct
Message-ID: <YjBEWm3YsuSKj+ES@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-3-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-3-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:04AM +0000, David Matlack wrote:
> The parameter "direct" can either be true or false, and all of the
> callers pass in a bool variable or true/false literal, so just use the
> type bool.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

If we care about this.. how about convert another one altogether?

TRACE_EVENT(kvm_hv_stimer_expiration,
	TP_PROTO(int vcpu_id, int timer_index, int direct, int msg_send_result),
	TP_ARGS(vcpu_id, timer_index, direct, msg_send_result),

Thanks,

-- 
Peter Xu

