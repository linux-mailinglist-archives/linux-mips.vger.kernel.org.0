Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEA1153B45
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 23:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgBEWsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 17:48:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31007 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727355AbgBEWsQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 17:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580942894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2cHEFoE8jbw7EqsKmYikm9pxnEO2ox+NzDcqYlTv6MQ=;
        b=VSw79z8S341pkxkeT52ZgajjfhnCKGJj2CDIswp+dYrzGvE8kT5tgD6jgkByy2xUHXNsjW
        C/Cor0QnOvXuf9izYiwcG7tJRQBHl+sWp9zlT5t1kK/7J4Al5WkcE41kIImGNKoUTlSQfs
        3nnpxGmBFTg42/EIITMIZQ0T2TISTFg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-s3BI_nAxPiat1E8mQRNasg-1; Wed, 05 Feb 2020 17:48:13 -0500
X-MC-Unique: s3BI_nAxPiat1E8mQRNasg-1
Received: by mail-qt1-f199.google.com with SMTP id d9so2470053qtq.13
        for <linux-mips@vger.kernel.org>; Wed, 05 Feb 2020 14:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2cHEFoE8jbw7EqsKmYikm9pxnEO2ox+NzDcqYlTv6MQ=;
        b=KESkRHzoGsEfZegXBugCmG4KnLJ3eRJnXo530J6oG/tMi8TWX+ly62DCXtlEQDRVXP
         lXHGAxm3urQBGxdQIeO5XkqnWO+mnrqjgdqFtd8a4N93C3WQMpQCvZjdQXQapnfh9d4m
         gg6JeVlEAHMFsqyufebc1sJ8pj6GcabEmEHNYPZTztaTwUPdnUT1RQbxBcGRDLiXpk0W
         E1Gp/f8DkwxRm1koblxq7t2cmDH+7nXISh9s0ZjzpZcbYKPVngcewEGJPKnWQDspWQyy
         0qixY55OKGTB/9vVwSdUSJBXnwARd69SLvt18IkhoFmuPM3f+j33v3bxsMmP1LYB55TD
         n9kA==
X-Gm-Message-State: APjAAAWRuO+Cb1U4zY5jR8cDDdRfhUWNQlqmozejZ189jWWPlsd48XX1
        G6NicpJG57xsjCSAqIZoglkaaCn1rUopap9AA4YuL35kduN5xJi0tj3XJwVDSdWm54EVg0aLHEi
        x24fskaSaHTqRnRpUEiCseA==
X-Received: by 2002:ac8:718e:: with SMTP id w14mr82094qto.266.1580942892810;
        Wed, 05 Feb 2020 14:48:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzidgvMzifyXKMl5xyBUEvf76nUThQJ4Vf+I9H3f+5mpj/6PKciWyQRPVlUWOeD9yt6R/onsg==
X-Received: by 2002:ac8:718e:: with SMTP id w14mr82077qto.266.1580942892562;
        Wed, 05 Feb 2020 14:48:12 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id s67sm562392qke.1.2020.02.05.14.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 14:48:11 -0800 (PST)
Date:   Wed, 5 Feb 2020 17:48:09 -0500
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
Subject: Re: [PATCH v5 08/19] KVM: Refactor error handling for setting memory
 region
Message-ID: <20200205224809.GI387680@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-9-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200121223157.15263-9-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:46PM -0800, Sean Christopherson wrote:
> Replace a big pile o' gotos with returns to make it more obvious what
> error code is being returned, and to prepare for refactoring the
> functional, i.e. post-checks, portion of __kvm_set_memory_region().
> 
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

