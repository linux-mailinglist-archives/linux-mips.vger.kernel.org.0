Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF9112A3E0
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 19:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfLXSTj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 13:19:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58888 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726322AbfLXSTj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Dec 2019 13:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577211577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=10oE3mcJxbSPeGAikLZZiyP7ObdJq49Q5FPmOfsO/dc=;
        b=P86DIBmGyPgpOjyRRZhx7ZTs/5DHhp5oPnLyHirXqgsyiEY6f607XhxDx8vJi5WdOZ5eHd
        doqBDVwFveUrFINEHFmjpzOgpfofIs+nSIhmjIWfqAj5g3gPUs2eDxSfJpTbbhmmFt/HhU
        gX//HiHzN6GB/308BbgBTogWUbyE2pE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-BsLt9Ac3PRunIS2N6ZGFLQ-1; Tue, 24 Dec 2019 13:19:34 -0500
X-MC-Unique: BsLt9Ac3PRunIS2N6ZGFLQ-1
Received: by mail-qv1-f71.google.com with SMTP id k2so13578865qvu.22
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 10:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=10oE3mcJxbSPeGAikLZZiyP7ObdJq49Q5FPmOfsO/dc=;
        b=BcXRWnUjKncfGMMBmjGd/I+6Qzhx6bsxkjAMtqyltswHo7VXqDVH7dPac4E3BNHAHc
         EpgSGI/E+F7UAzwUrKBBSb0uKNtEy2jOqobP60d9xPBZ7yISbL0UWCj9yZntoiPO8hiP
         NL+nvzezm6ROj5TXxq1yJscWe6dc0rZTx2EnC7ryn48Vb68xnpjmlw2bprfh2HqvCfrI
         9cZUm4OHRlKxzO+9cqGlbLQcRA+1xiaf5GZXPY1VDxltqkblCBb5O/hzrQ3ZOHKxw1wD
         kq9Frcm+iTyj/+B7hG443sbAytPHx/aBVyItRFIYqjnl5TNzberoGRUP6V/cRVxRy8Ll
         UIow==
X-Gm-Message-State: APjAAAUuiyjg5ye595oSSvAdD4VKBWrAMojoQO5+nODQQuIijqET9Owg
        leGXLheZMdNbBc+X4AyCkMpwPu5vXAhgLepJDIy+qqtMtHM9UVYbIfZHOJdvaOOsjVELYGGxc2y
        78FnPuCLz44ZWOMeNCLlrfQ==
X-Received: by 2002:a37:de16:: with SMTP id h22mr32000507qkj.400.1577211573642;
        Tue, 24 Dec 2019 10:19:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPlDOvamAwfkQQCQ/yrbEZ/IdA8BxSZxEa3M38XxUFXj9DeSRjaR1EpPHTj42i4TNzDYXwVw==
X-Received: by 2002:a37:de16:: with SMTP id h22mr32000473qkj.400.1577211573294;
        Tue, 24 Dec 2019 10:19:33 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c0:3f::2])
        by smtp.gmail.com with ESMTPSA id 63sm7087025qki.57.2019.12.24.10.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 10:19:32 -0800 (PST)
Date:   Tue, 24 Dec 2019 13:19:30 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Wanpeng Li <wanpengli@tencent.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Joerg Roedel <joro@8bytes.org>,
        Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        kvmarm@lists.cs.columbia.edu, Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v4 16/19] KVM: Ensure validity of memslot with respect to
 kvm_get_dirty_log()
Message-ID: <20191224181930.GC17176@xz-x1>
References: <20191217204041.10815-1-sean.j.christopherson@intel.com>
 <20191217204041.10815-17-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191217204041.10815-17-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 17, 2019 at 12:40:38PM -0800, Sean Christopherson wrote:
> +int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
> +		      int *is_dirty, struct kvm_memory_slot **memslot)
>  {
>  	struct kvm_memslots *slots;
> -	struct kvm_memory_slot *memslot;
>  	int i, as_id, id;
>  	unsigned long n;
>  	unsigned long any = 0;
>  
> +	*memslot = NULL;
> +	*is_dirty = 0;
> +
>  	as_id = log->slot >> 16;
>  	id = (u16)log->slot;
>  	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
>  		return -EINVAL;
>  
>  	slots = __kvm_memslots(kvm, as_id);
> -	memslot = id_to_memslot(slots, id);
> -	if (!memslot->dirty_bitmap)
> +	*memslot = id_to_memslot(slots, id);
> +	if (!(*memslot)->dirty_bitmap)
>  		return -ENOENT;
>  
> -	n = kvm_dirty_bitmap_bytes(memslot);
> +	kvm_arch_sync_dirty_log(kvm, *memslot);

Should this line belong to previous patch?

> +
> +	n = kvm_dirty_bitmap_bytes(*memslot);
>  
>  	for (i = 0; !any && i < n/sizeof(long); ++i)
> -		any = memslot->dirty_bitmap[i];
> +		any = (*memslot)->dirty_bitmap[i];
>  
> -	if (copy_to_user(log->dirty_bitmap, memslot->dirty_bitmap, n))
> +	if (copy_to_user(log->dirty_bitmap, (*memslot)->dirty_bitmap, n))
>  		return -EFAULT;
>  
>  	if (any)
> -- 
> 2.24.1

-- 
Peter Xu

