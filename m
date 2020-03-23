Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B281818F4F6
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 13:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgCWMsM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Mar 2020 08:48:12 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:41185 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727840AbgCWMsM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Mar 2020 08:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584967691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oZZMumaLZJu5X3TxC1ggPEB/siyDp674fd3PHOwNKOk=;
        b=USfXImCFJKadRb001iHR6e1rBoAlfR0GSqjryUxPGTwN1Z1W3SiA6dtMbnEGioY+uGKXYv
        ZlZ4pJQvOkAdc7zn9QpSqdIPTLChLZJpr2MXq4AYt0Qy2OSBD7TttHrL9tpWTAiHHBTuP8
        tfCJbqdZHmruWzxehVs9raf6VVKeP5Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-Ep1GgkzNPhaqu49hH3LCzQ-1; Mon, 23 Mar 2020 08:48:09 -0400
X-MC-Unique: Ep1GgkzNPhaqu49hH3LCzQ-1
Received: by mail-wr1-f72.google.com with SMTP id q18so7317925wrw.5
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2020 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=oZZMumaLZJu5X3TxC1ggPEB/siyDp674fd3PHOwNKOk=;
        b=RCiVroPmE5hCutTKuugzch95Plg5novc4n6Ukp+CJ35xwiwTKodG5xa4aoHuws5mm3
         8WbR3xc4dl88rNu3uYGKlho9hxq+ErWqwOifsRU5QFIJIYP41ozXQL0Bi2suqcYqUzfm
         r6ycZzPyUkh4wryBct0PylRMHts4hnqSCmnadW3/ht6rZY+p62hqASujuNRKBGitkAoB
         zxaGAypc2CW5wZNhkZcMtcNIHn8zh9F+eAsQdL7hDk21pVm5uGX+kCQIs238xwgk6yc3
         96LaDkwyBonLJqsNF5hbnXrDmCXLjmVF1MvBE5YE7biXPoO57UyrT6KA3vVL6a63Yk3x
         +HxQ==
X-Gm-Message-State: ANhLgQ3Uwj29ub/o0CbRTmc4M1v5IPQRqt906BCsh5aJjMoLdVU24S1t
        3u+QLhFfDY/IBHY5eeYG7AAbFRVhf6XBC0GlXBo6S4ruIkTxY20O8hZgcJdohsdbtDlgl5uztWP
        xyan2uu0Xgw+nBDqgWug66Q==
X-Received: by 2002:adf:decf:: with SMTP id i15mr26153358wrn.277.1584967688272;
        Mon, 23 Mar 2020 05:48:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtzfkKiGqY46hQmyiE1uEEqN2+GnJhVE7scycSa3L2yRyeY3La61RQMFCIJXOpzJGHNoWPMLQ==
X-Received: by 2002:adf:decf:: with SMTP id i15mr26153331wrn.277.1584967688007;
        Mon, 23 Mar 2020 05:48:08 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id m12sm15324212wmi.3.2020.03.23.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:48:07 -0700 (PDT)
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
Subject: Re: [PATCH v3 8/9] KVM: VMX: Annotate vmx_x86_ops as __initdata
In-Reply-To: <20200321202603.19355-9-sean.j.christopherson@intel.com>
References: <20200321202603.19355-1-sean.j.christopherson@intel.com> <20200321202603.19355-9-sean.j.christopherson@intel.com>
Date:   Mon, 23 Mar 2020 13:48:05 +0100
Message-ID: <877dzb9r0a.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sean Christopherson <sean.j.christopherson@intel.com> writes:

> Tag vmx_x86_ops with __initdata now the the struct is copied by value

Typo, "now that the struct".

> to a common x86 instance of kvm_x86_ops as part of kvm_init().
>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index fac22e316417..eae90379d0d1 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7668,7 +7668,7 @@ static bool vmx_check_apicv_inhibit_reasons(ulong bit)
>  	return supported & BIT(bit);
>  }
>  
> -static struct kvm_x86_ops vmx_x86_ops __ro_after_init = {
> +static struct kvm_x86_ops vmx_x86_ops __initdata = {
>  	.hardware_unsetup = hardware_unsetup,
>  
>  	.hardware_enable = hardware_enable,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

