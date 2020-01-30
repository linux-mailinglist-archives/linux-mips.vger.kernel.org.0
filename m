Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B768914D636
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 06:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgA3FoQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 00:44:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24047 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725847AbgA3FoP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jan 2020 00:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580363054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b8PEF8AVAWODPDupJea+4sWEJHHfwQkjaA/7qcZmag4=;
        b=Y6R00qTGMkNZUDTi9Bjzix9BllX0aNbcel38FTI/KrI0Gy8ohOqOO1Bo+f8ANxQ1udmsI+
        9gc93iPBE/sR02iBoU12Jc/3Qc6eX62uUl1dMn9j+vUyG+JNRIzIuJRkCkDUz+nQ7AQlt3
        2i8of8hMPtwPYKMTBmpP5X7h+dsdlcs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-SO09_xHlPq2gvNWFY_uukQ-1; Thu, 30 Jan 2020 00:44:12 -0500
X-MC-Unique: SO09_xHlPq2gvNWFY_uukQ-1
Received: by mail-wm1-f71.google.com with SMTP id m21so663144wmg.6
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2020 21:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b8PEF8AVAWODPDupJea+4sWEJHHfwQkjaA/7qcZmag4=;
        b=N+X9WeY4MKRijbk60wSMovZXYgs3itNLcRBim4AVsTOZbRAeKds/NUair/gjT62F1B
         aFjtThCREE6B45f14eyHdJc2DIKiZIGJ9NgPcL0+b9RGRYqNfcnAFS4A41KPzToZMC3L
         WJZrDG2gMiWb+CdtM1gQdzULHEXvEjlstm4vMkzLOBdY0ruaFc2aIQV379Bn14ta9qGQ
         TV2kL2mVSzF0tscyvlAOydGdOZJEY4NQbnLdUvopQJpMNxKTbw2ckgiTCjxhkYEY9wvI
         gGWlg3bW5DYpW+rG5mEFfqOI92qFDQDetQrvtaiH5vGBnr4Xc5kE7cU4zUmOLamf39PD
         7N9g==
X-Gm-Message-State: APjAAAXENN13CzP87SfXhZjSnPTv53BNqYJVYki1HhePZMYYZOjnNXKh
        fBDxb1xbRdPYFgSQOJcWCZyKiGihuB37X87Qf6x/IwMfpAl0uLautnUOCqyLoSdfYSoWlQebR7x
        JJCBvIuBAxykgSd3fi0IuFg==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr3175373wmi.21.1580363051236;
        Wed, 29 Jan 2020 21:44:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvrtUyXEqgq8iYKVpAB/LAj4fC31bOc+VOTWRDvsFWxjJ6sWsl8qJGadVTcya+7iE6vbimVA==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr3175335wmi.21.1580363050959;
        Wed, 29 Jan 2020 21:44:10 -0800 (PST)
Received: from [10.1.251.141] ([80.188.125.198])
        by smtp.gmail.com with ESMTPSA id 4sm4795049wmg.22.2020.01.29.21.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 21:44:10 -0800 (PST)
Subject: Re: [PATCH 5/5] KVM: x86: Set kvm_x86_ops only after
 ->hardware_setup() completes
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
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
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org
References: <20200130001023.24339-1-sean.j.christopherson@intel.com>
 <20200130001023.24339-6-sean.j.christopherson@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44e0c550-7dcc-bfed-07c4-907e61d476a1@redhat.com>
Date:   Thu, 30 Jan 2020 06:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200130001023.24339-6-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/01/20 01:10, Sean Christopherson wrote:
> Set kvm_x86_ops with the vendor's ops only after ->hardware_setup()
> completes to "prevent" using kvm_x86_ops before they are ready, i.e. to
> generate a null pointer fault instead of silently consuming unconfigured
> state.

What about even copying kvm_x86_ops by value, so that they can be
accessed with "kvm_x86_ops.callback()" and save one memory access?

Paolo

