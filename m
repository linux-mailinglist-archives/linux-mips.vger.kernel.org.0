Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3D43AB2A7
	for <lists+linux-mips@lfdr.de>; Thu, 17 Jun 2021 13:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhFQLgO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Jun 2021 07:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39734 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231250AbhFQLgN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Jun 2021 07:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623929646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eFNQaz+UBr3+VeZ6q7OSgOqHodPl71Dh+9dEuoGcM+Q=;
        b=X5h/oeCAI8KRRy4Ex5oWRMnZDuesw1Sm6Gy2/17xW5kGa2gfOFGLqhpOIl2daBPrN8MQSM
        SipPCYm0e0KmuciNbz36CZSZvD5gPbRvgcbWWh6T3kxwfCKHNApXWmMPz8D2369MV2LP1j
        TRM8qsXIxBThVUH220dTPLxM7gA4IvM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-myHHp7BzPzCJ6sEaAlyz_A-1; Thu, 17 Jun 2021 07:34:04 -0400
X-MC-Unique: myHHp7BzPzCJ6sEaAlyz_A-1
Received: by mail-ed1-f71.google.com with SMTP id v12-20020aa7dbcc0000b029038fc8e57037so1359203edt.0
        for <linux-mips@vger.kernel.org>; Thu, 17 Jun 2021 04:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eFNQaz+UBr3+VeZ6q7OSgOqHodPl71Dh+9dEuoGcM+Q=;
        b=cBIRhtx0TQZxI8fjRT1UsngaXN6IiY+syIoU6rDGHS7RXyWhV0NakmfSdkM/4j6F2e
         4JMhrpjXpBSDdlnlg18h2BAPd0YrnTPvlzFsL6MshWOGeK52Du/F1JMVTyozv3oJSUvB
         0mDAoo+JbdFi8ObBDQ2yssJKAmgEI41j71IpTqkb3wvh8Oms17bpM7MdqvDEYxX0vgbf
         1tQJbdyQipKUdac/bICariH9v+Rv93q9La9o8bqhzWMSuMYjXJ1ghHGiqobbyW2l/LN6
         rOK6Nr2LiMfdJiOxK6tDmFAvd4XCosjJ8Qa/52Mc7nTZIarUwm3qeYkhP0aSk57nahFs
         n0LA==
X-Gm-Message-State: AOAM531Xj017XkgnUaFL3wm518IqY+knRwAlDyDJSmuPkjKQ7B2y0NX5
        kWHXbl2MNu9CzvPvngb60aNYL+bEN18Pgp0vd+i2SD8Hrm5YmjM9KjkLXUrPEBjfq4Cen5RlxJJ
        IqwmlRmm2C1ZmU7hwtRoGRA==
X-Received: by 2002:a17:906:ca4a:: with SMTP id jx10mr4731043ejb.200.1623929246063;
        Thu, 17 Jun 2021 04:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw32CbI/7oXViDiR3/KwQ1e7FS2cEfJU4e5y3PkNkTiAFxV1nv9UNltBlc/li58ogeNN1nAkA==
X-Received: by 2002:a17:906:ca4a:: with SMTP id jx10mr4730994ejb.200.1623929245836;
        Thu, 17 Jun 2021 04:27:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id s5sm4131010edi.93.2021.06.17.04.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 04:27:25 -0700 (PDT)
Subject: Re: [PATCH v10 2/5] KVM: stats: Add fd-based API to read binary stats
 data
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jing Zhang <jingzhangos@google.com>
Cc:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
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
References: <20210617044146.2667540-1-jingzhangos@google.com>
 <20210617044146.2667540-3-jingzhangos@google.com>
 <YMr4rArKvj3obDEM@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b9cc4df4-a502-31ec-0f5d-32a53c372f06@redhat.com>
Date:   Thu, 17 Jun 2021 13:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMr4rArKvj3obDEM@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/21 09:24, Greg KH wrote:
>> Provides a file descriptor per VM to read VM stats info/data.
>> Provides a file descriptor per vCPU to read vCPU stats info/data.
> Shouldn't this be two separate patches, one for each thing as these are
> two different features being added?

They share a lot of code.  We could have three patches though:

- add common code for binary statistics file descriptor

- add VM ioctl to retrieve a statistics file descriptor [including the 
definition of VM stats descriptors]

- add VCPU ioctl to retrieve a statistics file descriptor [again 
including the definitions of VCPU stats].

Paolo

