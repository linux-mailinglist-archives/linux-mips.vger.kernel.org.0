Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A85154DDD
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 22:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbgBFVYi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 16:24:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25944 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727441AbgBFVYi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 16:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581024277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mpppjCJmC0FyN5SMr7bSEAaCj98EBVmwQP8+IcdCU94=;
        b=P8d02Ph+LnLRpaB0yMM3aJBxMYy1FsnmZyD8D0aigINYNL/pAqcQJdX0Ce1aCKbJf4yIC9
        Uo5dyz1B55y6hsL3gSfecgRBuWanIDfOA1EvjXdlFJ318vMnLGk952pebgV1NVTmYRDCB8
        0KhVbVTUDNlrbBOa+JfSQ9Tf2iUoHyI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-zKN4_pgoMQSZZtOMJeCPKA-1; Thu, 06 Feb 2020 16:24:35 -0500
X-MC-Unique: zKN4_pgoMQSZZtOMJeCPKA-1
Received: by mail-qt1-f200.google.com with SMTP id e37so149119qtk.7
        for <linux-mips@vger.kernel.org>; Thu, 06 Feb 2020 13:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mpppjCJmC0FyN5SMr7bSEAaCj98EBVmwQP8+IcdCU94=;
        b=ou0k6xoxq89mEbNN+Yx98EdXAhcsDwjCtGrtdC2q3jtahTXHGd6o3Oy9/eYOO/DOP/
         kAO2PNxfDiKYuzBVJXn5/yEV4myNtWXk3mzV2byHYitRQ3+8O7IUgV0g+NuuBssIVPXu
         JL+q7idlA2g/+X1D9tDoNaWBzBwbk8EBeYBSRMhtwLFq0X/hCjxX/XuNTOrkF+TbM3AT
         M6jur+E3t1pO69XoNvT1SCsdb0XZQhJAG9o645jiWeAO2ac83st4dHVn3cu/b8XmICFm
         0dgceqJn479BruNMkmujLioDTLmX2LjTXyICRsPNrk5Yh3QxiQs915DNeD9iQWNNZs7X
         b4VA==
X-Gm-Message-State: APjAAAVTgYn6r5hd2OeGY5PZYktPRD0Nlx5Lt4qTka4GoForVPA9MRAB
        Fiq/9jOILFBo4FsdOsj3YTtVbZEkzZ7h07uPObdaPdzPMCq1mgyySSnBOfehHhjjZtX9zCszB54
        4xM1FqBjpLO/fDdKYyvK2NA==
X-Received: by 2002:ae9:ebd8:: with SMTP id b207mr4580006qkg.353.1581024275410;
        Thu, 06 Feb 2020 13:24:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5VOLMiLzF1LhwmvuD3bg8z0IeFMhpmxCeKGC9RcbBKEXcR3SRyFUKynAlxMw185+NrKLCqw==
X-Received: by 2002:ae9:ebd8:: with SMTP id b207mr4579963qkg.353.1581024275206;
        Thu, 06 Feb 2020 13:24:35 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id v78sm278695qkb.48.2020.02.06.13.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:24:34 -0800 (PST)
Date:   Thu, 6 Feb 2020 16:24:31 -0500
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
Subject: Re: [PATCH v5 15/19] KVM: Provide common implementation for generic
 dirty log functions
Message-ID: <20200206212431.GF700495@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-16-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-16-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:53PM -0800, Sean Christopherson wrote:

[...]

> @@ -1333,6 +1369,7 @@ int kvm_clear_dirty_log_protect(struct kvm *kvm,
>  	unsigned long i, n;
>  	unsigned long *dirty_bitmap;
>  	unsigned long *dirty_bitmap_buffer;
> +	bool flush;
>  
>  	as_id = log->slot >> 16;
>  	id = (u16)log->slot;
> @@ -1356,7 +1393,9 @@ int kvm_clear_dirty_log_protect(struct kvm *kvm,
>  	    (log->num_pages < memslot->npages - log->first_page && (log->num_pages & 63)))
>  	    return -EINVAL;
>  
> -	*flush = false;
> +	kvm_arch_sync_dirty_log(kvm, memslot);

Do we need this even for clear dirty log?

> +
> +	flush = false;
>  	dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
>  	if (copy_from_user(dirty_bitmap_buffer, log->dirty_bitmap, n))
>  		return -EFAULT;

-- 
Peter Xu

