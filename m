Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF4415491A
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 17:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBFQ0r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 11:26:47 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48530 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727775AbgBFQ0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 11:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581006405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H3nLSU6aNBKxxlwzEldmN2l97fU6AU4NrctqbL5/r9Q=;
        b=gn4MDNjTmTpfeJjdxoddze1SdOSY1oYCyvksA+OiIHFL+DUb5toFOXhTyBShhGAej2fba1
        e5V1DHJI/gzfarbvX9ImQgl0wQKO4+xqhPjwynhMuwCvjFjM1tpy3vc+d7a5UrWi41fjMW
        7lk1IxTLtUFZPsXhaZQPQPyNyH9RQVc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-onJvIKOlNeGQ95v7PA3wUw-1; Thu, 06 Feb 2020 11:26:44 -0500
X-MC-Unique: onJvIKOlNeGQ95v7PA3wUw-1
Received: by mail-qv1-f70.google.com with SMTP id g6so4033604qvp.0
        for <linux-mips@vger.kernel.org>; Thu, 06 Feb 2020 08:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H3nLSU6aNBKxxlwzEldmN2l97fU6AU4NrctqbL5/r9Q=;
        b=nMoFPXA4OCfWIE6LhfbG3v3eFsEt8XO4wO9NUqWX9PHGgroD/Hfdjx7OpHYfTqdsrA
         T5O23OQcEgR8FZ3iaaE2/ClLr+LJUXllnu5wU/K01jtUN7SMcs8xjwlEz4qD2fXyGEVr
         QYYUOkrer3xjQ1ymCm8JHHxtfOkCO70XOXQCofoaDDmWqbSKw6D6OyIOODA/MH+AffYd
         sOfm0pl98ZC0tm6LCW7gNcqvQqB/7WuIohP+QXekC4g4Gro536wqWfIA9/+ba3Ckp/TC
         jPBUPOIJkKtUzPchqzuMYBsKMX52O8UYk3hzd0Lrw+iCAELedmuBRQeOH1nwfm3iW3K3
         QtwA==
X-Gm-Message-State: APjAAAU4ajZF6alK8oQw2b0kYPGxab2iIy86Ren5VYblk42MEgmhzMe6
        zoN+VyE82zs625XZfhnh4Yf+WOtifft2UrlaJ02gZ1LUMjwkUeKIhQIjVe0OsRyDhIIXmuuWcDj
        jDB21c1CE9OeUbO0gcQm/Iw==
X-Received: by 2002:ac8:1e08:: with SMTP id n8mr3297387qtl.175.1581006403787;
        Thu, 06 Feb 2020 08:26:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQlIJcJ9283T0k3SJBUCagGgD/4X0S4VFGYxAKtPxVCA909nX5ytULcXgwNYLmQcG3Ogy1yQ==
X-Received: by 2002:ac8:1e08:: with SMTP id n8mr3297351qtl.175.1581006403586;
        Thu, 06 Feb 2020 08:26:43 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id q7sm1618375qkc.43.2020.02.06.08.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 08:26:42 -0800 (PST)
Date:   Thu, 6 Feb 2020 11:26:39 -0500
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
Subject: Re: [PATCH v5 10/19] KVM: Drop "const" attribute from old memslot in
 commit_memory_region()
Message-ID: <20200206162639.GC695333@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-11-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-11-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:48PM -0800, Sean Christopherson wrote:
> Drop the "const" attribute from @old in kvm_arch_commit_memory_region()
> to allow arch specific code to free arch specific resources in the old
> memslot without having to cast away the attribute.  Freeing resources in
> kvm_arch_commit_memory_region() paves the way for simplifying
> kvm_free_memslot() by eliminating the last usage of its @dont param.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

