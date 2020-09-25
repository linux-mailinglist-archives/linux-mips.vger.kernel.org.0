Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8102792E9
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 23:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgIYVFz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 17:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29738 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbgIYVFz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Sep 2020 17:05:55 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601067954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KYytt9bssGAEWyPGrn3z2bXHN59vb0kbWX+R/SRNIRg=;
        b=TX7Q8T6sVFtwfq78r5EdF1L6EAL5m2Ke41+zAPZwzoxR0m4WpRFYhas+kBqagLvVsWRvwY
        HD36eduovl4FT+XFgGAjsMf7tDQnkus2V0Fti6u0r5yJ23m935yDatrxMAMMZUx1YsyJiG
        0rDG6ZT7TMBHP8BkZgFMQmKEDXD3gWY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-JG5e6RjaNM2QRNeuh0RcJA-1; Fri, 25 Sep 2020 17:05:52 -0400
X-MC-Unique: JG5e6RjaNM2QRNeuh0RcJA-1
Received: by mail-wr1-f71.google.com with SMTP id w7so1570338wrp.2
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2020 14:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KYytt9bssGAEWyPGrn3z2bXHN59vb0kbWX+R/SRNIRg=;
        b=BYNW166LpUtI/necRw/AQs9Yq4ANLga+GGmCrXeOYoQ/4YaOB25YnqC/CT7s+SZZ3M
         bQrM79l5dxiLln9ejH52b502ZV3NP/vKCWEQCIB9oMCkOILs1jfkwArKgsrokMwpGUmv
         ZWkX9sZWZQOv7U9eRC2Etq//1ih3NbASTRSk4j4bHjFNQGBJ0KVLkAkDiL8qtMeE/ntO
         VQEXX2X3N1fOAVoM/NJ3jCAzno9n3d+W7GzHbGb0ieuZbqMgmsuZVLGZ1JYbsSHSqkfv
         gJ0EFu+IH/+ZPS+XhDE0x5kDy9+MOULySlj7eoFmqUJN02vmhRNM7riQQ7/ObUF9OgQK
         4tSQ==
X-Gm-Message-State: AOAM531jCKTWyBRdH0lNBZhpIATsGfT7ARaM3yGq8NQJ+lCq/T+/sjFm
        7unszpJQC651inoRyI3Zhqe0JpqtWf2NEG3gdaOhKODFCaBCwiuKKdTX1wJQoqxGvJ98gWZIJ9N
        3VaKjhXtB3Mdk+O+pRdNN/g==
X-Received: by 2002:a05:600c:228e:: with SMTP id 14mr457082wmf.17.1601067950954;
        Fri, 25 Sep 2020 14:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXVvhHeab8ly63BYQtucuJlTvz3AS/Mr+Hmurwb2UpVZ7QkUFAEARwgGqla0VJ1OcRKIUZ6A==
X-Received: by 2002:a05:600c:228e:: with SMTP id 14mr457065wmf.17.1601067950750;
        Fri, 25 Sep 2020 14:05:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec9b:111a:97e3:4baf? ([2001:b07:6468:f312:ec9b:111a:97e3:4baf])
        by smtp.gmail.com with ESMTPSA id a15sm4540071wrn.3.2020.09.25.14.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 14:05:50 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] KVM: Introduce "VM bugged" concept
To:     Marc Zyngier <maz@kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvm-ppc@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20200923224530.17735-1-sean.j.christopherson@intel.com>
 <874knlrf4a.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <100a603f-193c-5a46-d428-cfc0ce0a8fe4@redhat.com>
Date:   Fri, 25 Sep 2020 23:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <874knlrf4a.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/09/20 18:32, Marc Zyngier wrote:
> I'm quite like the idea. However, I wonder whether preventing the
> vcpus from re-entering the guest is enough. When something goes really
> wrong, is it safe to allow the userspace process to terminate normally
> and free the associated memory? And is it still safe to allow new VMs
> to be started?

For something that bad, where e.g. you can't rule out future memory
corruptions via use-after-free bugs or similar, you're probably entering
BUG_ON territory.

Paolo

