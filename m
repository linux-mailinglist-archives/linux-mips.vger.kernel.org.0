Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B10E153AB1
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 23:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgBEWI3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 17:08:29 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60842 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727165AbgBEWI3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 17:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580940508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6bIsTUAiuk9WkuPnamAI4/KWATTYkjxm0pqVjMTg08w=;
        b=bKf1AqmHUFtCPg2m+npOgldfaxMNPunbYteHHWlRv6hayISOdCA3hWCx0af+epd8YFkPMI
        eX64I3AbDsHOUWbnU6WK/Rm2Oaw050NIuyVGQOy2VXUdRDkAXNrQD+NMp7ylI+Kk1rnu8C
        +SG0JLW4nn/cYcMYCGYWPbe5rBlGOmc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-kexW7NphP6yA6j03MemNXA-1; Wed, 05 Feb 2020 17:08:27 -0500
X-MC-Unique: kexW7NphP6yA6j03MemNXA-1
Received: by mail-qk1-f198.google.com with SMTP id p3so2284538qkd.11
        for <linux-mips@vger.kernel.org>; Wed, 05 Feb 2020 14:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bIsTUAiuk9WkuPnamAI4/KWATTYkjxm0pqVjMTg08w=;
        b=Awz/qlPKK9DCPfh0ihCnaqeDyOT7yrmeqF2d7q9DZpO0gNv3T0m5bXlwwOtnLzLQC0
         dJDRJzdlu87lk6+8p9PJ4zZBPMBUvBhP43ny24cBWQBbvO3pIWgSvWizbzLZsMF21gLc
         dRXOl/1Ig/s/tT9GISLyZ3ykF4alcSjrI1pmD4vBmdZ2ShBKSX65Jvs1xOoqCD7CxhdS
         Lqk2k/oIn/oCsbfNyrm9tAmTFlsOKINB0wqOed6afTouohn0g33CkKBr2g927HEgKDXN
         WbsUhrnbt0cxKGxqar5yeVFc/0ENhIQLoUNa/A7y2AGINL6XcL8BnHe0kspbZxMMpHX/
         sPTg==
X-Gm-Message-State: APjAAAVoZXTSdVjtEMY658gEUL8L0vSSqa0dSHYZEA/bgh2R3mX2C4Ij
        cptGEcea8mrBSpXQQxtNfnE9xnjLAxkw7y5dkKq9/RUAz/u2inpMNS5wF+BW/SsM2EgW1VsvyWq
        v85pNpkr4QfBhKiqgX7ZLvA==
X-Received: by 2002:ac8:4e94:: with SMTP id 20mr35228160qtp.335.1580940506681;
        Wed, 05 Feb 2020 14:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhvNH1iy5q/tis+s7hwuGT0ebc3dkr1uSM1KA4FQeWbspaaAJT384pUzbSiV9AUE83qayDAQ==
X-Received: by 2002:ac8:4e94:: with SMTP id 20mr35228131qtp.335.1580940506464;
        Wed, 05 Feb 2020 14:08:26 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id t16sm458993qkg.96.2020.02.05.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 14:08:25 -0800 (PST)
Date:   Wed, 5 Feb 2020 17:08:22 -0500
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
Subject: Re: [PATCH v5 02/19] KVM: Reinstall old memslots if arch preparation
 fails
Message-ID: <20200205220822.GE387680@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-3-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-3-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:40PM -0800, Sean Christopherson wrote:
> Reinstall the old memslots if preparing the new memory region fails
> after invalidating a to-be-{re}moved memslot.
> 
> Remove the superfluous 'old_memslots' variable so that it's somewhat
> clear that the error handling path needs to free the unused memslots,
> not simply the 'old' memslots.
> 
> Fixes: bc6678a33d9b9 ("KVM: introduce kvm->srcu and convert kvm_set_memory_region to SRCU update")
> Reviewed-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

