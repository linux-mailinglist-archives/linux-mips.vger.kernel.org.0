Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EE616854C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 18:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgBURnl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 12:43:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27082 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726150AbgBURnl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 12:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582307020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DRklp/EGbzKFbnLcWYfCTJYwspK96XjQokoDYirC2jo=;
        b=CwEu5SNqPbnkKVYFS1f81c12pLL0xamgYlmINLUdYLySmeTvlbmyI5TffrgHlVYMlz86Ag
        VCE9AE813HFBsv2MJwvjjPBVf9huudGTtteQe12aNVhkl98tXK6RsRMmJN064X0AA6a5Lr
        2a5YU0XoiWgLa0XlDHjaJ7RXQSDu5Ww=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-eY_DlmDBOI27JdFq4QqiMQ-1; Fri, 21 Feb 2020 12:43:38 -0500
X-MC-Unique: eY_DlmDBOI27JdFq4QqiMQ-1
Received: by mail-wr1-f69.google.com with SMTP id u18so1320804wrn.11
        for <linux-mips@vger.kernel.org>; Fri, 21 Feb 2020 09:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DRklp/EGbzKFbnLcWYfCTJYwspK96XjQokoDYirC2jo=;
        b=XjDug160qZBRyQQdliKgFDA4+J8hgv5/a98XT9Tt7ORwAxJZ/mGoP0p+4WP/4BF1PD
         Xn+Z+6xqj03LWgaUa/OarPfXmy0PW+X++jRdrCqzYP+JWDK/IhQovwF9ja0dhSRTFoRB
         i534P1SEZhHuT66bMlIGUNi5TOvzh5u/nmkCcBRCtsRJzoO4eQWTmlPF6A9QjoIigwDo
         IIKx6zrOVJdNg1vADJKc85pvLKbYoHBDomMxgVze/9GJECIq8Z+IDKMWFajCC3Fl83km
         mqi8I2aOTzY5CWhJ1Fhifz2RhD99eZt5m7FRTj9SsCV+KOPJR3s2ccQWgA1bLL0SJM3I
         JfCg==
X-Gm-Message-State: APjAAAUdA6UFN7/8WMIQJxEa/ll43wSw7cF07DahVlnlEMrR3HRu/CHP
        tnMbZYS+3eJ9Nceg6wlmfkVQmwdj6zOhVoxgZO4kOdorsiJItzpIHjcQJLH9I76rCbAVGo915xm
        RxzXHWYNTt3d1wdIAY91HXA==
X-Received: by 2002:a5d:4289:: with SMTP id k9mr51196987wrq.280.1582307017029;
        Fri, 21 Feb 2020 09:43:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2hj716qxeeRUnhWk7oLWJU5fIlTs2+zZOl+uuyj1LRQkzfullhSLke4OG8g9MBweopRblWg==
X-Received: by 2002:a5d:4289:: with SMTP id k9mr51196974wrq.280.1582307016828;
        Fri, 21 Feb 2020 09:43:36 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
        by smtp.gmail.com with ESMTPSA id l131sm4908318wmf.31.2020.02.21.09.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 09:43:36 -0800 (PST)
Subject: Re: [PATCH v6 14/22] KVM: Clean up local variable usage in
 __kvm_set_memory_region()
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
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Peter Xu <peterx@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200218210736.16432-1-sean.j.christopherson@intel.com>
 <20200218210736.16432-15-sean.j.christopherson@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1467b8cd-3631-b5da-b285-dbdf31b75af7@redhat.com>
Date:   Fri, 21 Feb 2020 18:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200218210736.16432-15-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/02/20 22:07, Sean Christopherson wrote:
> -sorted by update_memslots(), and the old
>  	 * memslot needs to be referenced after calling update_memslots(), e.g.
> -	 * to free its resources and for arch specific behavior.
> +	 * to free its resources and for arch specific behavior.  Kill @tmp
> +	 * after making a copy to deter potentially dangerous usage.
>  	 */
> -	old = *slot;
> +	tmp = id_to_memslot(__kvm_memslots(kvm, as_id), id);
> +	old = *tmp;
> +	tmp = NULL;
> +

Also: old = *id_to_memslot(...).

Paolo

