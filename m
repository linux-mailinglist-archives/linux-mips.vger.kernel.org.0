Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2779C154930
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 17:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgBFQ3d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 11:29:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56773 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727773AbgBFQ3b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 11:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581006569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BT971wG6wPhX7VJFd1sOcOxmL5huobHf2O2WL2kB92A=;
        b=HjB+cgClaC8n76/hjMlGlSCnRL9WZRwtpM4ScwsJ2AzcbCYgO1PJrB5tDF3DWCw0voXFd4
        AUuxeTa1qMhs65/3Zh7KtjdsI0TQCY71IgYgpnG3XtDVMHs7fN7O5QsmNhY/YIrNdkuvAT
        qxR8UJKk/G2zqM+YuuEZXWCipn2cS9E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-bvwmBlXRPNicGxIKYus1sA-1; Thu, 06 Feb 2020 11:29:27 -0500
X-MC-Unique: bvwmBlXRPNicGxIKYus1sA-1
Received: by mail-qt1-f197.google.com with SMTP id k27so4189776qtu.12
        for <linux-mips@vger.kernel.org>; Thu, 06 Feb 2020 08:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BT971wG6wPhX7VJFd1sOcOxmL5huobHf2O2WL2kB92A=;
        b=bRHRgRLjqXgFC7OV02r6sHxem4Rsyvb8MntXTHIk1fKeZ5rILqV2hYAyehEpc8d/CB
         5S4WStm18k5SdE6pfUvlNvZqFoj8yn8IBnlEX5HMVVlUnCxv5UU2btNhSQkqcHCjIfO6
         1W6MtE8bFubEUjgxd3sg+0nF0pGVVJSfXxOy3Sa2wwQ0euTezz8ug1sriNEihVxHwOVg
         6R5CQeLRfpdD5GCjIcHLrZAb6zax6WBcdQ5B/PG0VWU8P9OhiYVNDxx207VVfBfsjz9Q
         +eip9SgVGuqkWZuafu4myc3vmxQBgg2iqz9WWwZ7ZbPvi8YCUvFpwCR3JNz1U4sLLAtC
         NrPg==
X-Gm-Message-State: APjAAAVDCYDRyWsmuK6ICmdxtL5koFuh/q9+7oNPCdAsLiSxWutCaAl7
        ftJVlsE+WkG/BsZufgga1BuqohsChY/w66YhIc3Sx2iBnpJK3AGO+lL6p3+8vb39Ualyyyd7pZf
        Uqw0F8GUtp+GbgATr/Fymjg==
X-Received: by 2002:a37:94d:: with SMTP id 74mr3342073qkj.352.1581006566409;
        Thu, 06 Feb 2020 08:29:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqw79o/OSwP8qcG9zRkYGvX/+TD2xb8/Jp5SJeC8yu8obGrRcXecqs/KUsVKwfDvaLoqKhSpHg==
X-Received: by 2002:a37:94d:: with SMTP id 74mr3342054qkj.352.1581006566202;
        Thu, 06 Feb 2020 08:29:26 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id o55sm1966271qtf.46.2020.02.06.08.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 08:29:25 -0800 (PST)
Date:   Thu, 6 Feb 2020 11:29:22 -0500
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
Subject: Re: [PATCH v5 13/19] KVM: Simplify kvm_free_memslot() and all its
 descendents
Message-ID: <20200206162922.GD695333@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-14-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-14-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:51PM -0800, Sean Christopherson wrote:
> Now that all callers of kvm_free_memslot() pass NULL for @dont, remove
> the param from the top-level routine and all arch's implementations.
> 
> No functional change intended.
> 
> Tested-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

