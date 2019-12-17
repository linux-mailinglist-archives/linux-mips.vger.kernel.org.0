Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B413A123917
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 23:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfLQWHZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 17:07:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46888 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726387AbfLQWHZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 17:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576620443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=slGVCNmnwx0F1K+nCa+cID8Tdy/RHxQkOhSUfY0VX6I=;
        b=CX0x0e6HVeTxGXIkedJwytxVeqMF8bXkTPMZfNXdt5IzzzUHj0e3SpRy0EF0yW8qlz5LZY
        lNDJk0Nkp4E5PoVlcdFdqgHHDQdN+LSbOV8K0lU+71sz1cfEOy2uvQI9C3f4qZ2foQBB31
        amuOGYhpkmqxwRjYrj5Vyx7A/ycpPbY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-UdKm8m_UPQW4hOkYSpOT8A-1; Tue, 17 Dec 2019 17:07:22 -0500
X-MC-Unique: UdKm8m_UPQW4hOkYSpOT8A-1
Received: by mail-qv1-f70.google.com with SMTP id e14so91427qvr.6
        for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2019 14:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=slGVCNmnwx0F1K+nCa+cID8Tdy/RHxQkOhSUfY0VX6I=;
        b=aR8HhCqZjk4kFzpLDujnlNPmtYN2AZOINSNb+vuIUDSW7V+BJTDlu5dc5MUqaj6gtT
         /rJV9BSYswzXZ3JgL6gp3QvbAU8ShFiSm+dELVXLSI1yVb2YktYJx2y2D+Uiu87zSwjY
         mDAEagru3NtGa3fCNQUmbdUnURCE8LRtDPfb7Entn9kd+ELZSCvEu+paszvUu0K7SWhC
         qDOoBNQsBGJfmCr1DegrOFu4IzHlcDh1/DEYBoIAd7BgJzz5hrdO3Ouvck6nPJ4hijUy
         nJ5HM7OiHHJteLkWEYyLsOJ+911d3858cUCPgF+TtTroP6dqVbHxr2pDkv0W4sMBT5Iq
         6mrQ==
X-Gm-Message-State: APjAAAUXZZQxO68Lovg1fucQ7F+293p+pO2rbBQN7JDfvqUmfTfSXvd6
        Kfm4s6eDBYSKhUU8vPAgNk1HVKs/3ildZB2uA2VYZKQvcXZuw7lri59kfTEsuNtHhl2GwbNXpHn
        JD+cCiMAYlbMzw7sy2RUK/Q==
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr6885117qvn.79.1576620441552;
        Tue, 17 Dec 2019 14:07:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYYchEVtwDwgk4Pr56pOeSJtWkuin1D2pVTuKZ433b4vaBfoHv6+mbPiSSnU54NveRu8NnwQ==
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr6885088qvn.79.1576620441243;
        Tue, 17 Dec 2019 14:07:21 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
        by smtp.gmail.com with ESMTPSA id o9sm7592950qko.16.2019.12.17.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 14:07:20 -0800 (PST)
Date:   Tue, 17 Dec 2019 17:07:18 -0500
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
Subject: Re: [PATCH v4 05/19] KVM: x86: Allocate memslot resources during
 prepare_memory_region()
Message-ID: <20191217220718.GJ7258@xz-x1>
References: <20191217204041.10815-1-sean.j.christopherson@intel.com>
 <20191217204041.10815-6-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191217204041.10815-6-sean.j.christopherson@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 17, 2019 at 12:40:27PM -0800, Sean Christopherson wrote:
> Allocate the various metadata structures associated with a new memslot
> during kvm_arch_prepare_memory_region(), which paves the way for
> removing kvm_arch_create_memslot() altogether.  Moving x86's memory
> allocation only changes the order of kernel memory allocations between
> x86 and common KVM code.
> 
> No functional change intended.

(I still think it's a functional change, though...)

> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

