Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6642B453338
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 14:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbhKPNwh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 08:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48070 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236892AbhKPNwa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Nov 2021 08:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637070573;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w00cP//oO+88K/Y2lFYbKr4Ng9e/d98pV+/20CZ3Uq4=;
        b=WdqAsPI13Z0C6CbcYh0xJxD5pb0xZt8GAUnj2trZQ87AsBBvckSHbjVYE9aFjwrl/5Qxl3
        JnPq+78udFR8NXrhsjWjXxAtSGij96xxB5dkblAIx6+cPIFTozcMQ1ANoUDcFkJigsRu3m
        A2F727oWVBQZcD/R+EskGCQlg2uU2yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-CYdHIWN-MYyQSKOSjn05jw-1; Tue, 16 Nov 2021 08:49:29 -0500
X-MC-Unique: CYdHIWN-MYyQSKOSjn05jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C7B1922038;
        Tue, 16 Nov 2021 13:49:27 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 711601970E;
        Tue, 16 Nov 2021 13:49:09 +0000 (UTC)
Message-ID: <02c44f36-5467-4dce-b0f9-af96d6286e20@redhat.com>
Date:   Tue, 16 Nov 2021 14:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/5] KVM: Move wiping of the kvm->vcpus array to common
 code
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>,
        Sean Christopherson <seanjc@google.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Juergen Gross <jgross@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-2-maz@kernel.org> <YYWQHBwD4nBLo9qi@google.com>
 <87o86xednu.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87o86xednu.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/6/21 12:17, Marc Zyngier wrote:
> 
> If you too believe that this is just wrong, I'm happy to drop the
> locking altogether. If that breaks someone's flow, they'll shout soon
> enough.

Yes, it's not necessary.  It was added in 2009 (commit 988a2cae6a3c, 
"KVM: Use macro to iterate over vcpus.") and it was unnecessary back 
then too.

Paolo

