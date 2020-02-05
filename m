Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86837153B2A
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 23:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBEWmB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 17:42:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42725 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727307AbgBEWmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 17:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580942521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rH9hapDVBD03GESwcZDF6GjM5sGJp1/0m6Dm+I8b0N0=;
        b=JKpaeC8qIQjFpVjlXNlX2/21hxEqHYk39sWwPq+ppHmQ5CDifyNPrTQ6B6ERs3QIVYK648
        3Uj2Eurn0G68GSbtkKV0BEnXkXBuYv4cPrwHe6L/6DmwMeYJbnmt8CHggi8MoDicZPB1uW
        RgN5g0gtfKORe7QNZvVDSKjq9pF36GU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309--AsFn7N-OxSty1SMGOL7Ig-1; Wed, 05 Feb 2020 17:41:59 -0500
X-MC-Unique: -AsFn7N-OxSty1SMGOL7Ig-1
Received: by mail-qt1-f200.google.com with SMTP id c10so2441985qtk.18
        for <linux-mips@vger.kernel.org>; Wed, 05 Feb 2020 14:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rH9hapDVBD03GESwcZDF6GjM5sGJp1/0m6Dm+I8b0N0=;
        b=HxGIHz5Lt4HMDji9fExZhFDyu0orTlQQ42AIRjfJ7uyvpePkzmDfmgWpAjZPgFUYRt
         qBEI4a5jDGZun5wqbbj5q6G+tdWtuAHfx36C6xsLk8NvbNM7xPEpQ1VhYjYInEh2mKan
         MCE7G9J3Nzw2jmqM/djOvjc3Sk9E5SiP7ixkTH3WPkuVf8cqA2iC5vAI50wXSbiRLLWq
         MiCtAtEy0hW3IT89QywRGWFzqhGswO4DH1elYFgzLO6DhFOaUVRRse/C10fvTXnDr/LM
         ZfQyqKIgFtNQtHLaocMfsCtqp0D5FkM3BBmSMrIhl8JAVkKSyIcWUMlFHdB1vhEgtcV/
         RW8w==
X-Gm-Message-State: APjAAAWQXno4s1UZW+OW6HvjcFO6sOdzqWT9mjFU8cPL4FDxBpQ+Hldk
        NRe5ouxBdMhbTnbC5A5y++brvnxPwq/5UF/vTvkYGazp+tybd/zPmbq/2yk3pVF4VGZLyf9grlr
        32v9yzmp+DVyVvavDol88wg==
X-Received: by 2002:a37:4fc3:: with SMTP id d186mr59907qkb.100.1580942518824;
        Wed, 05 Feb 2020 14:41:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7uhA3CGENCAtqy4g5GvmYMoxE6Qbx+Ub2ume93+vIa38OEJ1jq8Hx/Hw9ZpC1eb3usykd7Q==
X-Received: by 2002:a37:4fc3:: with SMTP id d186mr59892qkb.100.1580942518606;
        Wed, 05 Feb 2020 14:41:58 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id a201sm512222qkc.134.2020.02.05.14.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 14:41:57 -0800 (PST)
Date:   Wed, 5 Feb 2020 17:41:54 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 04/19] KVM: PPC: Move memslot memory allocation into
 prepare_memory_region()
Message-ID: <20200205224154.GG387680@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-5-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-5-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:42PM -0800, Sean Christopherson wrote:
>  static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
> -					struct kvm_memory_slot *memslot,
> -					const struct kvm_userspace_memory_region *mem)
> +					struct kvm_memory_slot *slot,
> +					const struct kvm_userspace_memory_region *mem,
> +					enum kvm_mr_change change)
>  {
> +	unsigned long npages = mem->memory_size >> PAGE_SHIFT;

Only in case if this patch still needs a respin: IIUC we can directly
use slot->npages below.  No matter what:

Reviewed-by: Peter Xu <peterx@redhat.com>

> +
> +	if (change == KVM_MR_CREATE) {
> +		slot->arch.rmap = vzalloc(array_size(npages,
> +					  sizeof(*slot->arch.rmap)));
> +		if (!slot->arch.rmap)
> +			return -ENOMEM;
> +	}
> +
>  	return 0;
>  }

-- 
Peter Xu

