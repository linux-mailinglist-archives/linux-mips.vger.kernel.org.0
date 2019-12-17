Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E77123A22
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 23:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLQWhj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 17:37:39 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44956 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725812AbfLQWhj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Dec 2019 17:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576622257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4AxsEtCek/f0aziPe+wCZz9Hjxg7TgpaT9NrNyuqheA=;
        b=BatrOPaVjML0/vaIPnEkp6q+ChBwlBt4lQKCInNdJperUZtLuZKH3e+IGO/aOb4JGDTUb/
        8A8OQ9tB99uCQOnbu3obUhIceDOcQp/5P9xNWeO8+dpKgr4EDQePoWVem3fyxHEr0xmF0e
        ZqnNh/QtFVLVwayavNNDOgM5a4SYFGU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-bElv6kM7Mz-RPrVcz3DlFg-1; Tue, 17 Dec 2019 17:37:36 -0500
X-MC-Unique: bElv6kM7Mz-RPrVcz3DlFg-1
Received: by mail-qv1-f70.google.com with SMTP id v5so121389qvn.21
        for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2019 14:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4AxsEtCek/f0aziPe+wCZz9Hjxg7TgpaT9NrNyuqheA=;
        b=GczUkotCHq0JJdc1XYK1Ruv9+yMZokSqNduzRg3ZKSmD9D+CZL5d1eTA1WqtVU0tOh
         SBXuerAYCcqhVtPAKcC9tHLdynx2nqUaNmxGSBtLLgW51wxefHt5k2s4nSbcDIsu5jQF
         9MxTk5XKIHbGhKB/uj132hHxuPiz2d+LgNGzK48bhxNVgoMgadMKTybEUMgygHmeuWLB
         hi3nQQjXNcdQG7Ky/dHpx63hkQEWwnleMWJVGH55aDIs2aPabtvLEFp3sisChAFqPb9G
         78fxE8WpPd0lbEPgWyxypztMuvU/JTb8N5+B7du/9aA4QwZAGz5zcELv5n1yTN9Ts2PG
         OWqg==
X-Gm-Message-State: APjAAAUNUaUFDbIT1K7prBslVfwu53gAQ+Fq0Rdf9Sj5XNRLpynoVib/
        /6geH6rbP6bjzEcsDGtF5b40taX8ias+peOm/kWtH/30fIpjDybJg3qU+iUD8RMfz2XK9/uhEMM
        aP9SkHFmkAfKIRccuu1gzZA==
X-Received: by 2002:a37:4d45:: with SMTP id a66mr374440qkb.65.1576622256393;
        Tue, 17 Dec 2019 14:37:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxl93uuG9B4gn7WP+rric6T9Je7Dj1Ol6DxMKHs7+zQRPC1qeoFeX2QtpGDhXhtHyWXATL+iw==
X-Received: by 2002:a37:4d45:: with SMTP id a66mr374408qkb.65.1576622256150;
        Tue, 17 Dec 2019 14:37:36 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
        by smtp.gmail.com with ESMTPSA id g62sm11961qkd.25.2019.12.17.14.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 14:37:35 -0800 (PST)
Date:   Tue, 17 Dec 2019 17:37:34 -0500
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
        kvmarm@lists.cs.columbia.edu, Jim Mattson <jmattson@google.com>,
        David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 01/19] KVM: x86: Allocate new rmap and large page
 tracking when moving memslot
Message-ID: <20191217223734.GL7258@xz-x1>
References: <20191217204041.10815-1-sean.j.christopherson@intel.com>
 <20191217204041.10815-2-sean.j.christopherson@intel.com>
 <20191217215640.GI7258@xz-x1>
 <20191217222058.GD11771@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191217222058.GD11771@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 17, 2019 at 02:20:59PM -0800, Sean Christopherson wrote:
> > For example, I see PPC has this:
> > 
> > struct kvm_arch_memory_slot {
> > #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> > 	unsigned long *rmap;
> > #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> > };
> > 
> > I started to look into HV code of it a bit, then I see...
> > 
> >  - kvm_arch_create_memslot(kvmppc_core_create_memslot_hv) init slot->arch.rmap,
> >  - kvm_arch_flush_shadow_memslot(kvmppc_core_flush_memslot_hv) didn't free it,
> >  - kvm_arch_prepare_memory_region(kvmppc_core_prepare_memory_region_hv) is nop.
> > 
> > So Does it have similar issue?
> 
> No, KVM doesn't allow a memslot's size to be changed, and PPC's rmap
> allocation is directly tied to the size of the memslot.  The x86 bug exists
> because the size of its metadata arrays varies based on the alignment of
> the base gfn.

Yes, I was actually thinking those rmap would be invalid rather than
the size after the move.  But I think kvm_arch_flush_shadow_memslot()
will flush all of them anyways... So yes it seems fine.

Thanks,

-- 
Peter Xu

