Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01FE3AA22D
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jun 2021 19:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhFPROc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Jun 2021 13:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36282 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231320AbhFPROa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Jun 2021 13:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623863544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9dwXJG+e2J+zj861tULnfcQYsx7+UyssMsGTwpLEmFo=;
        b=bG6E4okBXecFxsF2clBs6gpW1RD9cBNDbunvAbBoYLRSxjmW+ATv0FlEsjjTIoiQpOvcBJ
        xsrRounB4jRskiql+OMr29PbVtURozUZJjGHH2oB7H3U4Ek7gn7hoZ+0Tiq4sEWW9eO+wT
        n9N5VmMFYOntWLJc+fpy2oZK5/Cwyok=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-_qzn_wo7P_y3M_S1I_19aw-1; Wed, 16 Jun 2021 13:12:22 -0400
X-MC-Unique: _qzn_wo7P_y3M_S1I_19aw-1
Received: by mail-ej1-f72.google.com with SMTP id a25-20020a1709064a59b0290411db435a1eso1225541ejv.11
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 10:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9dwXJG+e2J+zj861tULnfcQYsx7+UyssMsGTwpLEmFo=;
        b=VAXISoxEXXJ/RSHtMLgTe+4Z05ioYhmPHh0kSTnw70O0vTJ2DlVtnrQUhoDe2WvYgg
         Ku2Wg+3JyoNMUSbklc+qtuP2knaG9mhseB6hzMBoN/HDsKFQqZG2DD7cZcKIYtfZW+6y
         4dBoUNtfu1xQgmIi00c4Ht6IuDtpFk7gpsqBvEGrZy9m1icECdpK7SfzdoLoiFc94lwY
         9QwjOYjUY/u/XH3csrqy+NkhLqXc0YJJnT91sU5IAKLFQ6gsZbtETdxAFBYr3yHoUdiw
         +Hv0UeShezsnxZKQCSR31bPzCJ5mpFKzlCSa7/KhTVHkuSmwhSCza2YPSEjNlImuFnxu
         0uHA==
X-Gm-Message-State: AOAM533GxOZ+J7GjuKpxf9A1MTIowD9W07zG51eY4cfjsts9JclKhiqB
        jCtU8fBw1T6gU8W5Qp5KUVvxDnKB7eId36oTJH2d1i5PyJRyBmUObpjdarFp1kOeiaz6zCoHreQ
        jA+Pk6r6fJ+d84Zv2+PGIiw==
X-Received: by 2002:a17:906:63d2:: with SMTP id u18mr605529ejk.186.1623863541105;
        Wed, 16 Jun 2021 10:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTKt1qnrMXcwrhxVgt67u44Y8CuaXLcDbu0P6sbQSAbP+DQ5wAsoiwPjVbuTt+umuJCe/+bA==
X-Received: by 2002:a17:906:63d2:: with SMTP id u18mr604976ejk.186.1623863534799;
        Wed, 16 Jun 2021 10:12:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id n2sm2261519edi.32.2021.06.16.10.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:12:13 -0700 (PDT)
To:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Fuad Tabba <tabba@google.com>
References: <20210614212155.1670777-1-jingzhangos@google.com>
 <20210614212155.1670777-3-jingzhangos@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v9 2/5] KVM: stats: Add fd-based API to read binary stats
 data
Message-ID: <60b0d569-e484-f424-722b-eb7ba415e19b@redhat.com>
Date:   Wed, 16 Jun 2021 19:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614212155.1670777-3-jingzhangos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/06/21 23:21, Jing Zhang wrote:
> +	/* Copy kvm stats values */
> +	copylen = header->header.data_offset + size_stats - pos;
> +	copylen = min(copylen, remain);
> +	if (copylen > 0) {
> +		src = stats + pos - header->header.data_offset;
> +		if (copy_to_user(dest, src, copylen))
> +			return -EFAULT;
> +		remain -= copylen;
> +		pos += copylen;
> +		dest += copylen;
> +	}

Hi Jing,

this code is causing usercopy warnings because the statistics are not 
part of the vcpu slab's usercopy region.  You need to move struct 
kvm_vcpu_stat next to struct kvm_vcpu_arch, and adjust the call to 
kmem_cache_create_usercopy in kvm_init.

Can you post a new version of the series, and while you are at it 
explain the rationale for binary stats in the commit message for this 
patch?  This should include:

- the problem statement (e.g. frequency of the accesses)

- what are the benefits compared to debugfs

- why the schema is included in the file descriptor as well

You can probably find a lot or all of the information in my emails from 
the last couple days, but you might also have other breadcrumbs from 
Google's internal implementation of binary stats.

Thanks,

Paolo

