Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF08443976B
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 15:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhJYNYc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 09:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32845 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhJYNYb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 09:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635168129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=48+IikSlKyqTNmxyr4q4VEcqSYZJGRNhdXCK/IFcjJk=;
        b=KE/riBNfAXvmdioUpEupdNXCo16fRq3CU6y433SjTnpscTb3trlrymitszXrkgp+SEiGpy
        IGGDdOs7tgVpF7D1koLvgvjkFQKxcb+ae8BAvfZAtAiPQnnSY7t0w4DQ9M14UID9quLJ6O
        qMkZ0+yPB8SV6/WH/73VfrMRwVbUjyY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-eDXD6gsfP7asdDRO3bTLbA-1; Mon, 25 Oct 2021 09:22:08 -0400
X-MC-Unique: eDXD6gsfP7asdDRO3bTLbA-1
Received: by mail-ed1-f70.google.com with SMTP id f21-20020a0564021e9500b003dd77985601so561965edf.9
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=48+IikSlKyqTNmxyr4q4VEcqSYZJGRNhdXCK/IFcjJk=;
        b=Czv5kmWVOIOj9YVTgukc+k+KSt9tUXbjCzNGWPlwZfpZENRjQNVDIXQrznCcnB9Iqp
         QD4T4vD8yl9sQHIOLRSkfB+ilHJiheIG2Ajukhp2zUfZN4YyjuaKzn69sGNLGf+5ADON
         mRKqKyocyOTWObRHG9x3XnUQubg7RxPkbX9bREqeCNUBCJ+V8aPhfaX7Krj+18L2bv+u
         bd2fPKd7ejddDO0UrzKtEeckbQyhzBRk13cIuq+bUK2/AIjC+uhYs8lO98/CI+GlwFaD
         APTrOshlCGg0IWlk9dVy53c0k6o+xUoaBgS3Ak3VVNevrGvQaAWlJwraUwcNSy/Ydf0r
         yoeg==
X-Gm-Message-State: AOAM531uwI7scs5wEmnhYRQv/y7+7+deNtELNcgfTfuA1GXog+0KSG96
        HwUMmA39QL9oPokbjioQGoB3tGW/gJb7auLXGSiYtuRPQd4+WDawEuhA4yeBK+wC9qHaWDuSbd1
        phQ2+XDP9cibYGMamR/cSmw==
X-Received: by 2002:a50:d783:: with SMTP id w3mr20253049edi.380.1635168126979;
        Mon, 25 Oct 2021 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfRKsXz9JGMpnMaISmnOtZN3rndX1G8rsIOCD7EyDtzp44dz76SyjuCafVUoIKeNPaL6dxIA==
X-Received: by 2002:a50:d783:: with SMTP id w3mr20253015edi.380.1635168126752;
        Mon, 25 Oct 2021 06:22:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id j15sm9152968edl.34.2021.10.25.06.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 06:22:06 -0700 (PDT)
Message-ID: <e360d085-8fba-e8de-b65e-fc7a4e13ad7b@redhat.com>
Date:   Mon, 25 Oct 2021 15:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-3-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:11, Sean Christopherson wrote:
> +		 * point, which could result in signalling the wrong/previous
> +		 * pCPU.  But if that happens the vCPU is guaranteed to do a
> +		 * VMRUN (after being migrated) and thus will process pending
> +		 * interrupts, i.e. a doorbell is not needed (and the spurious)

... one is harmless, I suppose.

Paolo

