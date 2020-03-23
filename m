Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E687018F4FB
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 13:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgCWMss (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Mar 2020 08:48:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32352 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728262AbgCWMss (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Mar 2020 08:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584967727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wF/Z91rii7js9BxWiPX/IJSf6cOn716YQpoQOgnhvlY=;
        b=YUzEAw5odvtGgwnsXrh8keojEDtlxHkVerI8Dfyb6mVPl1BcVoPgIxD+Oei3OxIdg080Lj
        5/O0ewihSHfmeEUPLl9NCQ0hS20Sg4uVCv8Ubx1d+mPT+HR8hBfiQ4Y3gF+jHU/y1hnr1c
        T2yHrYRfihu1EVQlZoClXI/YTSXqQj0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-cuk6OhyzPfqo22oar_jeaA-1; Mon, 23 Mar 2020 08:48:45 -0400
X-MC-Unique: cuk6OhyzPfqo22oar_jeaA-1
Received: by mail-wm1-f70.google.com with SMTP id y1so1989801wmj.3
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2020 05:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=wF/Z91rii7js9BxWiPX/IJSf6cOn716YQpoQOgnhvlY=;
        b=m8jn57uNSib3E0nvLbYphPcJQO6Zb+xmDu4oFifP4MyM7mmIKvD2zzY5ADBotHPoUf
         B+JGDUkRIwzUPhz50CoF9wsPAA3AeymSJkBmNE9Yj5nDYObjkd1LGlnqlRa+g8NiMLeC
         c90ROUvqRZuLQ8oc2pEeB3rnFf6x5CGWCxci8K5wZJwn/7ZLKu67ADm87T6wNFfjPE+j
         YkTwHx/SkruvIo2Fx1ZVDi8d5dRbUPaKz72Syj2SshqFc+w55mVCCJsKhBtg/nqCHvme
         ycqNx4xYHurUNcB5IG9R3x6qu2yD5a3CVgNfdYRBcTXAXt1r4mPuMMS16ToMFapVjYVd
         X8bA==
X-Gm-Message-State: ANhLgQ1dhnUq61+1dzy+va1wjFpL7Urc8MpEtwShDC15jB3waGl8WjE2
        Ej62n7H443O29pm4JfZ3DdLVXUH6LnkwiyK995DaqBrbtNvzNVL+oTzwVv3umHbziE7d5qzZlw6
        VaIrii4mCxwT/SD+mVXk8AA==
X-Received: by 2002:a1c:5544:: with SMTP id j65mr25700705wmb.60.1584967724307;
        Mon, 23 Mar 2020 05:48:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsE+BwUdC/3N3MhWCg3gX3gw8CdW/xveukJtA9Qqd5DxMyzUeCK03I5juokdRkfNo1dgo0DkQ==
X-Received: by 2002:a1c:5544:: with SMTP id j65mr25700677wmb.60.1584967724024;
        Mon, 23 Mar 2020 05:48:44 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id j39sm24686004wre.11.2020.03.23.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:48:43 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] KVM: SVM: Annotate svm_x86_ops as __initdata
In-Reply-To: <20200321202603.19355-10-sean.j.christopherson@intel.com>
References: <20200321202603.19355-1-sean.j.christopherson@intel.com> <20200321202603.19355-10-sean.j.christopherson@intel.com>
Date:   Mon, 23 Mar 2020 13:48:41 +0100
Message-ID: <874kuf9qza.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sean Christopherson <sean.j.christopherson@intel.com> writes:

> Tag svm_x86_ops with __initdata now the the struct is copied by value to

Same typo, "now that the struct".

> a common x86 instance of kvm_x86_ops as part of kvm_init().
>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  arch/x86/kvm/svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index b61bb306602b..ab2a1cf6c188 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -7350,7 +7350,7 @@ static void svm_pre_update_apicv_exec_ctrl(struct kvm *kvm, bool activate)
>  	avic_update_access_page(kvm, activate);
>  }
>  
> -static struct kvm_x86_ops svm_x86_ops __ro_after_init = {
> +static struct kvm_x86_ops svm_x86_ops __initdata = {
>  	.hardware_unsetup = svm_hardware_teardown,
>  	.hardware_enable = svm_hardware_enable,
>  	.hardware_disable = svm_hardware_disable,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

