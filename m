Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24014D9896
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 11:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343729AbiCOKTV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 06:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245378AbiCOKTV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 06:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9ABB214083
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647339487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8aKmgpWQOn5fy2pFZJV3AASa7qkUAzElx68DLyF1Rv8=;
        b=dj2q8g1E+JZCqY2jQ0XumLOy7N2J60FG++aX5Q8kQldpFSHCWmY8+SEvJTxjmAX2Pinwdx
        9Of/KgOFpRB0kDqAd6A65yN/OL1yvEQUyI791bzzS7TNBLk2qqZI6nqSb6gEgUq7kGzIIP
        C6iqY21IDHJG/Rar336oPo9aE9qljg0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-ky84zn2GOL6YeZHR0ZD61A-1; Tue, 15 Mar 2022 06:18:06 -0400
X-MC-Unique: ky84zn2GOL6YeZHR0ZD61A-1
Received: by mail-pl1-f200.google.com with SMTP id q4-20020a170902dac400b0015359dbf896so2865682plx.17
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 03:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8aKmgpWQOn5fy2pFZJV3AASa7qkUAzElx68DLyF1Rv8=;
        b=Lz1ocgQgBJwksooAaKUo5bz0Pz2FOIiqADVIVTNXyxZse7BwDQG6VPTiVy+fbKvPit
         s63MjCjJGLjMM34wouEQghbB3R8ncgfdFgwRX/eBroiw4SZ6smR2sT2qVvzmWSRp+hNC
         iTM31i5zVko+uK0RnHCAEWYba0bFWfJuIO/sIyB5f9ufHDJTsJpSpK//IaSF9qFtmSel
         7aRnyBpiMcZh04xm0okHZkKEamb332Y18l9HvPRUL30hpvbCUz+2q6dmPtSdVOokThwV
         hz9W6BC2GpMIyqCgqLGWo+X00xR3qboSmeLzQOJWoEtWD1sWUPIg9KWvwOnqOR/oW42f
         Ko0A==
X-Gm-Message-State: AOAM531iCYbIQ8LNXHdqrqnolvS8asLfHl6uI1zHBJOvxHrkQPQRXAM8
        rb59R+iYQ7ndWpKw5fF4+DodHGN8CbSuCG6OSXHdKhq0oX8NbkqlxvdGNUQ4WmK1zL6/PGu5tUN
        fR9Ll9jzo+HbtGS9Lor7HBA==
X-Received: by 2002:a62:7b55:0:b0:4f6:adc7:c306 with SMTP id w82-20020a627b55000000b004f6adc7c306mr27924595pfc.29.1647339485499;
        Tue, 15 Mar 2022 03:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+jS23UzOASPRoyKYjAv3PS8/jYIxosAR15TYCR7wHvt7VgBXKlwPyxZv5RL8fbxTjQ3li9A==
X-Received: by 2002:a62:7b55:0:b0:4f6:adc7:c306 with SMTP id w82-20020a627b55000000b004f6adc7c306mr27924572pfc.29.1647339485245;
        Tue, 15 Mar 2022 03:18:05 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.43])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm25052836pfk.179.2022.03.15.03.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 03:18:04 -0700 (PDT)
Date:   Tue, 15 Mar 2022 18:17:55 +0800
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
Subject: Re: [PATCH v2 09/26] KVM: x86/mmu: Move huge page split sp
 allocation code to mmu.c
Message-ID: <YjBn0w54kLk1eDT/@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-10-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311002528.2230172-10-dmatlack@google.com>
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 11, 2022 at 12:25:11AM +0000, David Matlack wrote:
> Move the code that allocates a new shadow page for splitting huge pages
> into mmu.c. Currently this code is only used by the TDP MMU but it will
> be reused in subsequent commits to also split huge pages mapped by the
> shadow MMU.
> 
> While here, also shove the GFP complexity down into the allocation
> function so that it does not have to be duplicated when the shadow MMU
> needs to start allocating SPs for splitting.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

