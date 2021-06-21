Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE7F3AF97C
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 01:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhFUXiM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Jun 2021 19:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44794 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231926AbhFUXiL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Jun 2021 19:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624318556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y4rj5S7DFpUC+3DesUoe15Y9dUe8dzdqWSEsCDEqvgA=;
        b=T+Z79HYAGyLoA3stsgJll/X1vp3Jtrq0EMnhdtOlSUqEimm68v6Zfj0Yv/eTfRMxRxDMRi
        R+TAAlAHJ0fq4d+Vi0AjdDXU7z/FSbpi9WSkpWHlDbDVzfBdGWLREW+qjZJx6Uq08xNurC
        ou8F2P3JxDRoNxdz6Vdy296Qbk11/mU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-1hYhr09-PmmEUZqamMqp8Q-1; Mon, 21 Jun 2021 19:35:54 -0400
X-MC-Unique: 1hYhr09-PmmEUZqamMqp8Q-1
Received: by mail-wm1-f70.google.com with SMTP id o3-20020a05600c5103b02901aeb7a4ac06so122928wms.5
        for <linux-mips@vger.kernel.org>; Mon, 21 Jun 2021 16:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y4rj5S7DFpUC+3DesUoe15Y9dUe8dzdqWSEsCDEqvgA=;
        b=i6QThXd8+cVa09sb2Yysr0Th4Umw9E2CIueJJ1nPAI8t1Ehx/FVBvmF+s5Q8+hDvfW
         dFG0OFc+v7y0eNW7az+364IrClV0J0ht+8NlD8ju4RZqnM57Mnm4rth5TYHjh8bpNnYy
         HwHjwOh3RrbooyKiAPZcMsDrgvJJ+N171elr5bwzEjed3F47yciYJdbHU7cKuqZaGxJP
         cYVkEzGeGlO3cUnD+ifllvZzL1WfRN8B+uzVWqDel4gxXStOIPDGhKgbbgYlOjK+bQ6G
         MGuJv6A1jShjeRNVXAflDWGFvNTi8JMq82YBc2y1UThDGOzCExIoMYViEmSCpOQj6NTd
         8cgg==
X-Gm-Message-State: AOAM533vcn7UdV7XegKULZFXOx5Nqdphjii9R9dURV3PSTDiHGTs1EOt
        LepWp9NSae6kSoNxq3Ez+62R4+54izKnE/Y21A9Meun+NmWzk+GYKu54l9oqiO3sNSvcLkkUkjl
        5QzZjmqT1MHFHUJ8mC4meCg==
X-Received: by 2002:a05:6000:1c5:: with SMTP id t5mr1064344wrx.71.1624318553282;
        Mon, 21 Jun 2021 16:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhLPASIEPgENpXabVu2lLjBJcoZDTjIn3uO5++5JKzeF1Zgk0yuFtAQij55J0dmy/ecQX5WA==
X-Received: by 2002:a05:6000:1c5:: with SMTP id t5mr1064334wrx.71.1624318553129;
        Mon, 21 Jun 2021 16:35:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id u15sm458337wmq.48.2021.06.21.16.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:35:52 -0700 (PDT)
Subject: Re: [PATCH v12 2/7] KVM: stats: Add fd-based API to read binary stats
 data
To:     Jing Zhang <jingzhangos@google.com>
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
        Fuad Tabba <tabba@google.com>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20210618222709.1858088-1-jingzhangos@google.com>
 <20210618222709.1858088-3-jingzhangos@google.com>
 <0cde024e-a234-9a10-5157-d17ba423939e@redhat.com>
 <CAAdAUtiL6DwJDWLLmUqct6B6n7Zaa2DyPhpwKZKb=cpRH+8+vQ@mail.gmail.com>
 <aa1d0bd9-55cf-161a-5af9-f5abde807353@redhat.com>
 <CAAdAUti1MreOnAXtA+jBEaq+AixmqvBEByi9G4EgDpfu63spHA@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c639c557-0e16-6938-2da5-46400ee2dd14@redhat.com>
Date:   Tue, 22 Jun 2021 01:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAdAUti1MreOnAXtA+jBEaq+AixmqvBEByi9G4EgDpfu63spHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/06/21 00:58, Jing Zhang wrote:
>> Pass it as an argument?
> The num_desc can only be initialized in the same file that defines the
> descriptor array.
> Looks like we have to have a global variable to save that. The
> solution would be similar
> to have a statically defined header for each arch.
> So, keep the header structure for each arch?

Oh, sorry.  I missed that there's only one call to kvm_stats_read and 
it's in common code.  The remaining comments are small enough that I can 
apply them myself.  Thanks!

Paolo

